#include <stdio.h>

#define STATIC	static

#include "sslskel.sst.h"
STATIC		/* This will apply to the array in the .sst file */
#include "sslskel.sst.c"

/* Table Walker State */
STATIC int	processing = 1;		/* are we running the table walker? */
STATIC int	sslPointer = 0;		/* index into S/SL table */
STATIC TableOperation	operation;	/* the current operation */

/* Tracing Control */
STATIC FILE	*tracefp = NULL;	/* if non-null, trace output here */

/* Abort flag */
STATIC int	aborted = 0;

/*
 * The Rule Call Stack implements Syntax/Semantic Language rule call and return.
 * Each time an oCall operation is executed, the table return address is pushed
 * onto the Rule Call Stack.  When an oReturn is executed, the return address
 * is popped from the stack.  An oReturn executed when the Rule Call Stack is
 * empty terminates table execution.
 */

STATIC int	sslStack[127];		/* The S/SL Rule Call Stack */
#define	sslStackSize	(sizeof sslStack/sizeof sslStack[0])
STATIC int	sslTop = 0;

/*
 * Set by the Choice Handler to indicate whether a match was made or the
 * otherwise path was taken.  Set to true if a match was made and false
 * otherwise.  This flag is used in input choices to indicate whether the
 * choice input token should be accepted or not.
 */

STATIC int	choiceTagMatched;	/* Choice Match Flag */

/*
 * These are used to hold the decoded parameter value to a parameterized
 * semantic operation and the result value returned by a choice semantic
 * operation or rule respectively.					 
 */

STATIC int	parameterValue;		/* Parameter for Semantic Operation */
STATIC int	resultValue;		/* Result from Semantic Operation */

/* S/SL System Failure Codes */

typedef enum {
	fSemanticChoiceFailed,			/* 0 */
	fChoiceRuleFailed			/* 1 */
} FailureCodes;				/* S/SL System Failure Code Type */


#define	maxErrors	20
STATIC int	noErrors = 0;		/* Error Counter */
STATIC ErrorCodes	firstFatalErrorCode = eSslStackOverflow;  /* fix */

/* Input Tokens */

/* Compound Input Tokens */
#define	firstCompoundToken	tInteger	/* fix */
#define	lastCompoundToken	tInteger	/* fix */

/* Input Interface */
STATIC FILE	*infp;
STATIC InputTokens	nextInputToken = tNewLine;
STATIC InputTokens	savedToken;

/*
 * The Compound Input Token Buffer:
 * When a compound input token is accepted from the input stream, its
 * associated value is saved in the compound token buffer for use by
 * the Semantic Mechanisms of the pass.
 */

STATIC InputTokens	compoundToken;	/* Last compound input token accepted */
STATIC int	compoundValue;	/* Its associated value; often a union (fix) */
STATIC char	*compoundText;	/* ... or textual ditto (fix) */

/* Line Counters */

STATIC int	nextLineNumber = 0;
STATIC int	lineNumber = 0;

/* Output Interface */
STATIC FILE	*outfp;

/* Variables Used in Syntax Error Recovery */
STATIC int	newInputLine = 0;
STATIC InputTokens	savedInputToken;


/* This procedure emits the error message associated with errCode */

STATIC void
Error(errCode)
	ErrorCodes errCode;
{
	char *msg;

	if (errCode == eNoError)
		abort();

	switch (errCode) {
	case eSyntaxError:
		msg = "Syntax error";
		break;
	case ePrematureEndOfFile:
		msg = "Unexpected end of file";
		break;
	case eExtraneousProgramText:
		msg = "Extraneous program text";
		break;
	case eSslStackOverflow:
		msg = "Nesting too deep";
		break;
	}
	if (errCode == eSyntaxError)
		/* Syntax errors are in the lookahead token */
		printf("Line %d: %s\n", nextLineNumber, msg);
	else
		/* Semantic errors are in the accepted token */
		printf("Line %d: %s\n", lineNumber, msg);

	++noErrors;

	if ((int)(errCode) >= (int)(firstFatalErrorCode)
	    || noErrors == maxErrors) {
		printf("*** Processing aborted\n");
		aborted = 1;
		processing = 0;
	}
}

/*
 * This procedure provides the interface to the previous pass.
 * It is reponsible for handling all input including line number
 * indicators and the values and text associated with input tokens.  
 */

STATIC void
AcceptInputToken()
{
	InputTokens	acceptedToken;
	int	inputInt;

	if (nextInputToken == tEndOfFile)
		abort();

	/* Accept Token */
	acceptedToken = nextInputToken;
	lineNumber = nextLineNumber;

	/* If the token is a compound token, read its associated value */
	if ((int)(acceptedToken) > (int)(firstCompoundToken)
	    && (int)(acceptedToken) < (int)(lastCompoundToken)) {
		compoundToken = acceptedToken;
		compoundValue = getw(infp);		/* fix */
	}

	/* Update Line Number */
	lineNumber = nextLineNumber;

	/* Read Next Input Token */
	newInputLine = 0;
	do {
		inputInt = getw(infp);
		nextInputToken = (InputTokens)inputInt;

		if (nextInputToken == tNewLine) {
			/* Update Line Counter and Set Flag */
			newInputLine = 1;
			++nextLineNumber;
		}
	} while (nextInputToken == tNewLine);

	/* Trace Input */
	if (tracefp)
	    printf("Input token accepted %d  Line %d  Next input token %d\n",
			acceptedToken, lineNumber, nextInputToken);
}

/* Emit an output token to the output stream */

STATIC void
EmitOutputToken(emittedToken) 
	OutputTokens	emittedToken;
{
	putw(emittedToken, outfp);

	/* Trace Output */
	if (tracefp)
		printf("Output token emitted %d\n", emittedToken);
}


/*
 * The constants, variables, types, modules and procedures used in
 * implementing the Semantic Mechanisms of the pass go here.  These
 * implement the facilities used in the semantic operations.
 */

/* Syntax Error Handling */

STATIC void
SslGenerateCompoundInputToken(expectedToken)
	InputTokens	expectedToken;
{
	if (nextInputToken != tSyntaxError && nextInputToken != tEndOfFile)
		abort();

	compoundToken = expectedToken;
	compoundValue = 0;

	switch (expectedToken) {
	case tInteger:
		compoundText = "0";
		break;
	case tString:
		compoundText = "'?'";
		break;
	case tIdent:
		compoundText = "IL";
		break;
	}
}

/*
 * This procedure handles syntax errors in the input to the Parser pass,
 * for Semantic passes this procedure will simply assert false since a
 * syntax error in input would indicate an error in the previous pass.
 *
 * Syntax error recovery:
 * When a mismatch occurs between the the next input token and the syntax
 * table, the following recovery is employed.
 *
 * If the expected token is tNewLine then if there has been no previous
 * syntax error on the line, ignore the error.  (A missing logical new line
 * is not a real error.)
 *
 * If the expected token is tNewLine or tSemicolon and a syntax error has
 * already been detected on the current logical line (flagged by
 * nextInputToken == tSyntaxError), then flush the input exit when a new
 * line or end of file is found.
 *
 * Otherwise, if this is the first syntax error detected on the line
 * (flagged by nextInputToken != tSyntaxError), then if the input token is
 * tEndOfFile then emit the ePrematureEndOfFile error code and terminate
 * execution.  Otherwise, emit the eSyntaxError error code and set the
 * nextInputToken to tSyntaxError to prevent further input exit when the
 * expected input is tSemicolon or tNewLine.
 *
 * If the expected token is not tSemicolon nor tNewLine and a syntax error
 * has already been detected on the current line (flagged by nextInputToken ==
 * tSyntaxError), then do nothing and continue as if the expected token had
 * been matched.
 */

STATIC void
SslSyntaxError()
{
	if (operation != oInput && operation != oInputAny)
		abort();

	if (nextInputToken == tSyntaxError) {
		/* Currently recovering from syntax error */
		if (sslTable[sslPointer] == (int)(tNewLine)
		    || sslTable[sslPointer] == (int)(tSemicolon)) {
			/* Complete recovery by synchronizing
			   input to a new line */
			nextInputToken = savedToken;
			newInputLine = 0;
			while (nextInputToken != tSemicolon
			       && nextInputToken != tEndOfFile
			       && !newInputLine)
				AcceptInputToken();
		}
	} else {
		/* First syntax error on the line */
		if (sslTable[sslPointer] == (int)(tNewLine)) {
			/* Ignore missing logical newlines */
		} else if (nextInputToken == tEndOfFile) {
			/* Flag error and terminate processing */
			Error(ePrematureEndOfFile);
			processing = 0;
		} else {
			Error(eSyntaxError);
			savedToken = nextInputToken;
			nextInputToken = tSyntaxError;
			lineNumber = nextLineNumber;
		}
	}

	/* If the expected input token is a compound token,
	   generate a dummy one. */
	if (sslTable[sslPointer] >= (int)(firstCompoundToken)
	    && sslTable[sslPointer] <= (int)(lastCompoundToken))
		SslGenerateCompoundInputToken(sslTable[sslPointer]);
}


STATIC void
SslTrace()
{
	printf("Table index %d  Operation %d  Argument %d\n",
		      sslPointer-1, operation, sslTable[sslPointer]);
}


STATIC void
SslFailure(failCode)
	FailureCodes failCode;
{
	printf("### S/SL program failure:  ");

	switch (failCode) {
	case fSemanticChoiceFailed:
		printf("Semantic choice failed\n");
		break;
	case fChoiceRuleFailed:
		printf("Choice rule returned without a value\n");
		break;
	}

	printf("while processing line %d\n", lineNumber);

	SslTrace();
	abort();
}


/*
 * This procedure performs both input and semantic choices.  It sequentially
 * tests each alternative value against the tag value, and when a match is
 * found, performs a branch to the corresponding alternative path.  If none
 * of the alternative values matches the tag value, sslTable interpretation
 * proceeds to the operation immediately following the list of alternatives
 * (normally the otherwise path).  The flag choiceTagMatched is set to true
 * if a match is found and false otherwise.
 */

STATIC void
SslChoice(choiceTag)
	int choiceTag;
{
	int	numberOfChoices, choicePointer;

	choicePointer = sslTable[sslPointer];
	choiceTagMatched = 0;

	for (numberOfChoices = sslTable[choicePointer++];
	     numberOfChoices > 0;
	     choicePointer += 2, --numberOfChoices) {
		if (sslTable[choicePointer] == choiceTag) {
			sslPointer = sslTable[choicePointer+1];
			choiceTagMatched = 1;
			return;
		}
	}
	sslPointer = choicePointer;
}


void
SslWalker()
{
	/* Initialize Input/Output */
	AcceptInputToken();

	/* Walk the S/SL Table */

	while (processing) {
		operation = (TableOperation)(sslTable[sslPointer++]);

		/* Trace Execution */
		if (tracefp)
			SslTrace();

		switch (operation) {
		case oCall:
			if (sslTop < sslStackSize) {
				sslStack[++sslTop] = sslPointer + 1;
				sslPointer = sslTable[sslPointer];
			} else {
				Error(eSslStackOverflow);
				processing = 0;
			}
			break;
		case oReturn:
			if (sslTop == 0)
				/* Return from main S/SL procedure */
				processing = 0;
			else
				sslPointer = sslStack[sslTop--];
			break;
		case oRuleEnd:
			SslFailure(fChoiceRuleFailed);
			break;
		case oJump:
			sslPointer = sslTable[sslPointer];
			break;
		case oInput:
			if (sslTable[sslPointer] == (int)(nextInputToken))
				AcceptInputToken();
			else
				/* Syntax error in input */
				SslSyntaxError();
			++sslPointer;
			break;
		case oInputAny:
			if (nextInputToken != tEndOfFile)
				AcceptInputToken();
			else
				/* Premature end of file */
				SslSyntaxError();
			break;
		case oInputChoice:
			SslChoice(nextInputToken);

			if (choiceTagMatched)
				AcceptInputToken();
			break;
		case oEmit:
			EmitOutputToken(sslTable[sslPointer]);
			++sslPointer;
			break;
		case oError:
			Error(sslTable[sslPointer]);
			++sslPointer;
			break;
		case oChoice:
			SslChoice(resultValue);
			break;
		case oChoiceEnd:
			SslFailure(fSemanticChoiceFailed);
			break;
		case oSetParameter:
			parameterValue = sslTable[sslPointer++];
			break;
		case oSetResult:
			resultValue = sslTable[sslPointer++];
			break;
		case oSetResultFromInput:
			resultValue = (int)nextInputToken;
			break;

		/* The Following Are Pass Dependent Semantic Mechanisms */

#ifdef	notdef
		case oUpdateOperation:
		    % Execute the Update Semantic Operation
		    % The parameter value for parameterized
		    % operations is in "parameterValue"		

		case oChoiceOperation:
		    % Execute the Choice Semantic Operation
		    % Leave the result value in "resultValue".
		    % The parameter value for parameterized 
		    % operations is in "parameterValue"		 
#endif
		    
		default:
			printf("Unknown operation %d\n", operation);
			abort();
		}
	}

	if (nextInputToken != tEndOfFile && !aborted)
		Error(eExtraneousProgramText);
}
