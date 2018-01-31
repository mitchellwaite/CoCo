/*
 *	C S/SL Processor
 *
 *	Translated from Turing S/SL Processor V3.01
 *	by Rayan Zachariassen, February 1988.
 *
 *	Original code by James R. Cordy,
 *	14 January 1980  (Revised 2 March 1983)
 *
 *
 * Copyright 1979,1980,1981,1983,1988  The University of Toronto 
 *
 * This implementation is freely redistributable with the following
 * two conditions:
 *
 * 1.   This notice, stating the copyright, origin, and conditions on use,
 *      of this software, must be retained at the beginning of this file
 *      and of any derived works.
 *
 * 2.   Any use of S/SL technology should acknowledge that fact, as well as
 *      the University of Toronto as the origin of the S/SL system, and
 *      J.R. Cordy and R.C. Holt as its authors.
 *
 *
 * For information about S/SL, see the paper:
 *
 *      "An Introduction to S/SL: Syntax/Semantic Language"
 *      by R.C. Holt, J.R. Cordy, and D.B. Wortman,
 *      in ACM Transactions on Programming Languages and Systems (TOPLAS),
 *      Vol 4, No. 2, April 1982, Pages 149-178.
 *
 * The authors may be contacted through the Computer Systems Research Institute
 * at the University of Toronto.
 */

/*
 * Note: The structure and feel of this program is that of a Pascal
 * program because it was transliterated from the Turing version of
 * the Pascal S/SL Processor.
 *
 *
 * This program is the processor for Syntax/Semantic Langauge programs.
 * An S/SL program must be processed by this program, which will output
 * C declarations for the constants defining the input tokens, output 
 * tokens, error codes, type values and semantic operation codes used in
 * the S/SL program and an array constant declaration for the S/SL table
 * for the program.  These declarations must be merged into the global
 * declarations C S/SL Walker.		
 *
 * Input files:
 *   sourcefp - the S/SL program source	
 *
 * Output files:
 *   headerfp - the output constant definitions
 *		 for the program
 *   tablefp - the output S/SL table file for 
 *		 the program
 *   listFile -   a listing of the S/SL source 
 *		 program with table coordinates 
 *		 in the left margin (if requested) 
 *
 * The following are recognized options:
 *
 *  l - produce a listing of the S/SL source
 *	program with table coordinates in the 
 *	left margin in listfp
 *  s - summarize usage of symbol and output 
 *	tables
 *  T - trace S/SL processor execution		
 *
 */

#include <stdio.h>
#include <ctype.h>
#include <sys/types.h>

#ifndef	SELFCONTAINED
#include "ssl:sst.h"
#endif
/* The S/SL table file produced by the S/SL Processor */
#include "ssl:sst.c"

#define	true	1
#define	false	0

#define	assertionFailure	abort()

#define	xSymbolClass(X)		X = symClass[symIndex]
#define	SymbolValue(X)		X = symValue[symIndex]
#define	CurrentSymbolIndex(X)	X = symIndex
#define	ClassOfChoice(X)	X = choiceClass[choiceTop]
#define	CurrentClass(X)		X = symCurrentClass
#define	SymbolParameterClass(X)	X = symParmClass[symIndex]
#define	SymbolResultClass(X)	X = symResultClass[symIndex]
#define	CycleDepth(X)		X = cycleTop
#define	CycleExits(X)		X = exitTop - cycleExitIndex[cycleTop]
#define	EndRules(X)		/*(void)0*/
#define	StartRules(X)		/*(void)0*/
#define	BeginRule(X)		/*(void)0*/
#define	SaveRule(X)		/*(void)0*/

char *machineOpNames[] = { "oCall", "oReturn", "oRuleEnd", "oJump", "oInput",
	"oInputAny", "oInputChoice", "oEmit", "oError", "oChoice", "oChoiceEnd",
	"oSetParameter", "oSetResult", "oSetResultFromInput", 0 };

char *errorCodeNames[] = { "eNoError", "eSyntaxError",
	"ePrematureEndOfFile", "eExtraneousProgramText", 0 };

#ifdef	SELFCONTAINED
/*
 * Primitive S/SL Table Operations:
 * These will remain the same independent of the
 * pass and form the fundamental table operations. 
 */

typedef enum {
	oCall = 0,					/* 0 */
	oReturn,					/* 1 */
	oRuleEnd,					/* 2 */
	oJump,						/* 3 */
	oInput,						/* 4 */
	oInputAny,					/* 5 */
	oInputChoice,					/* 6 */
	oEmit,						/* 7 */
	oError,						/* 8 */
	oChoice,					/* 9 */
	oChoiceEnd,					/* 10 */
	oSetParameter,					/* 11 */
	oSetResult,					/* 12 */
	oSetResultFromInput,				/* 13 */

/*
 * Pass Dependent Semantic Operations:
 * These will be different for each pass.  The
 * semantic operations are implemented by the
 * Semantic Mechanisms of the pass.
 * There are two basic kinds of semantic operations:
 * Update operations, which cause an update to the
 * Semantic Mechanism, and Choice operations, which
 * return a value based on the state of the Semantic
 * Mechanism which is then used as the tag in a semantic
 * choice.  Both Update and Choice operations may be
 * parameterized by a single constant value.		
 */

	oEnterCall,					/* 14 */
	oEmitNullCallAddress,				/* 15 */
	oResolveCalls,					/* 16 */
	oSetClass,					/* 17 */
	oSetClassFromSymbolClass,			/* 18 */
	oxSetClassFromSymbolValue,			/* 19 */
	oySetClassFromSymbolResultClass,		/* 20 */
	ozSetClassFromSymbolParameterClass,		/* 21 */
	ovSetClassFromChoiceClass,			/* 22 */
	oChooseClass,					/* 23 */
	oSetClassValue,					/* 24 */
	owSetClassValueFromSymbolValue,			/* 25 */
	oIncrementClassValue,				/* 26 */
	oEnterNewSymbol,				/* 27 */
	oLookupSymbol,					/* 28 */
	oChangeSymbolClass,				/* 29 */
	oChooseSymbolClass,				/* 30 */
	oVerifySymbolClass,				/* 31 */
	oxEnterNewSymbolValue,				/* 32 */
	oEnterSecondNewSymbolValue,			/* 33 */
	oEnterSymbolValueFromAddress,			/* 34 */
	oxChooseSymbolValue,				/* 35 */
	oEmitSymbolValue,				/* 36 */
	oxVerifySymbolClassValue,			/* 37 */
	oxEnterSymbolParameterClass,			/* 38 */
	oyEnterSymbolResultClass,			/* 39 */
	oyChooseSymbolResultClass,			/* 40 */
	oSaveEnclosingSymbol,				/* 41 */
	oRestoreEnclosingSymbol,			/* 42 */
	oSaveCurrentSymbol,				/* 43 */
	oRestoreCurrentSymbol,				/* 44 */
	oPushCycle,					/* 45 */
	oPopCycle,					/* 46 */
	oChooseCycleDepth,				/* 47 */
	oEmitCycleAddress,				/* 48 */
	oEnterCycleExit,				/* 49 */
	oResolveCycleExits,				/* 50 */
	oxChooseCycleExits,				/* 51 */
	oPushChoice,					/* 52 */
	oPopChoice,					/* 53 */
	oChangeChoiceClass,				/* 54 */
	oChooseChoiceClass,				/* 55 */
	oVerifyChoiceSymbolLabel,			/* 56 */
	oEnterChoiceSymbolLabel,			/* 57 */
	oxEnterChoiceMerge,				/* 58 */
	oResolveChoiceMerges,				/* 59 */
	oEmitChoiceTable,				/* 60 */
	oxResolveChoiceTableAddress,			/* 61 */
	oEmitFirstChoiceValue,				/* 62 */
	oxEmitFirstChoiceAddress,			/* 63 */
	oStartRules,					/* 64 */
	oBeginRule,					/* 65 */
	oSaveRule,					/* 66 */
	oEndRules,					/* 67 */
	oGenerateDefinitions,				/* 68 */
	oGenerateTable,					/* 69 */
	oEmitValue,					/* 70 */
	oEmitNullAddress				/* 71 */
} TableOperation;
#endif	/* SELFCONTAINED */

/* S/SL Table Size */
#define	sslTableSize	30000	/* Maximum */

/* The S/SL Rule Call Stack Size */
#define	sslStackSize	127

#ifdef	SELFCONTAINED
/* Operation Result Values */
typedef enum {
	invalid,
	valid
} Validity;
#endif	/* SELFCONTAINED */

/* Maximum Source Lines */
#define	maxLineNumber	9999

/* S/SL System Failure Codes */
typedef enum {
	fSemanticChoiceFailed,			/* 0 */
	fChoiceRuleFailed			/* 1 */
} FailureCodes;			/* S/SL System Failure Code Type */

#ifdef	SELFCONTAINED
/* Error Signal Codes */
typedef enum {
	eNoError = 0,				/* 0 */
	eSyntaxError,				/* 1 */
	ePrematureEndOfFile,			/* 2 */
	eExtraneousProgramText,			/* 3 */

/* Semantic Errors */
	eCycleHasNoExits = 10,			/* 10 */
	eDuplicateLabel,			/* 11 */
	eExitNotInCycle,			/* 12 */
	eIllegalParameterClass,			/* 13 */
	eIllegalResultClass,			/* 14 */
	eIllegalNonvaluedReturn,		/* 15 */
	eIllegalStringSynonym,			/* 16 */
	eIllegalValuedReturn,			/* 17 */
	eSymbolPreviouslyDefined,		/* 18 */
	eUndefinedSymbol,			/* 19 */
	eWrongDeclaredResultClass,		/* 20 */
	eWrongLabelClass,			/* 21 */
	eWrongParameterClass,			/* 22 */
	eWrongResultClass,			/* 23 */
	eWrongSymbolClass,			/* 24 */

/* Non-S/SL Semantic Errors */
	eUnresolvedRule = 30,			/* 30 */
	eSymbolTooLong,				/* 31 */
	eNumberTooLarge,			/* 32 */
	eStringTooLong,				/* 33 */
	eValueOutOfRange,			/* 34 */
	eJumpOutOfRange,			/* 35 */

/* Fatal Errors */
	eSslStackOverflow = 40,			/* 40 */
	eCallStackOverflow,			/* 41 */
	eTooManyTotalSymbolChars,		/* 42 */
	eTooManySymbols,			/* 43 */
	eTableTooLarge,				/* 44 */
	eCyclesTooDeep,				/* 45 */
	eTooManyExits,				/* 46 */
	eChoicesTooDeep,			/* 47 */
	eTooManyLabels,				/* 48 */
	eTooManyMerges,				/* 49 */
	eTooManyCalls,				/* 50 */
	eRuleTooLarge,				/* 51 */
} ErrorCodes;			/* Error Code Type */
#endif	/* SELFCONTAINED */

ErrorCodes firstFatalErrorCode = eSslStackOverflow;

/* Maximum Error Count */
#define	maxErrors	100

#ifdef	SELFCONTAINED
/* Input Tokens */
typedef enum {
/* Nonexistent input token used only in syntax error recovery */
	tSyntaxError = -1,			/* -1 */

/* Compound Input Tokens */
	tIdent = 0,				/* 0 */
	tString,				/* 1 */
	tInteger,				/* 2 */

/* Non-Compound Input Tokens */
	tColon,					/* 3 */
	tSemicolon,				/* 4 */
	tEqual,					/* 5 */
	tQuestionMark,				/* 6 */
	tPeriod,				/* 7 */
	tErrorSignal,				/* 8 */
	tCall,					/* 9 */
	tExit,					/* 10 */
	tReturn,				/* 11 */
	tLeftParen,				/* 12 */
	tRightParen,				/* 13 */
	tCycle,					/* 14 */
	tCycleEnd,				/* 15 */
	tChoice,				/* 16 */
	tChoiceEnd,				/* 17 */
	tComma,					/* 18 */
	tOr,					/* 19 */
	tOtherwise,				/* 20 */
	tInput,					/* 21 */
	tOutput,				/* 22 */
	tError,					/* 23 */
	tType,					/* 24 */
	tMechanism,				/* 25 */
	tRules,					/* 26 */
	tEnd,					/* 27 */
	tNewLine,				/* 28 */
	tEndOfFile,				/* 29 */

/* Special token returned by Input Scanner for garbage */
	tIllegal				/* 30 */
} InputTokens;			/* Input Token Type */
#endif	/* SELFCONTAINED */

InputTokens firstCompoundToken = tIdent;
InputTokens lastCompoundToken = tInteger;
InputTokens firstInputToken = tSyntaxError;
InputTokens lastInputToken = tIllegal;

/* Input Scanner Limits and Parameters */
#define	maxInputTokenLength	100	/* must be <= 127 */
#define	maxIdentLength		maxInputTokenLength
#define	maxStringLiteralLength	maxIdentLength
#define	maxNumberLength		5

/* Character Constants */
#define	newline			'\n'
#define	tab			'\t'
#define	blank			' '
#define	quote			'\''
#define	breakChar		'_'

#ifdef	SELFCONTAINED
/*
 * Output Tokens for the S/SL Processor,
 * these are the primitive operations of S/SL 
 */

typedef enum {
	aCall = oCall,
	aReturn = oReturn,
	aRuleEnd = oRuleEnd,
	aJump = oJump,
	aInput = oInput,
	aInputAny = oInputAny,
	aInputChoice = oInputChoice,
	aEmit = oEmit,
	aError = oError,
	aChoice = oChoice,
	aChoiceEnd = oChoiceEnd,
	aSetParameter = oSetParameter,
	aSetResult = oSetResult,
	aSetResultFromInput = oSetResultFromInput
} OutputTokens;			/* Output Token Type */
#endif	/* SELFCONTAINED */


/* Limits on the Assembled Output S/SL Table */
#define	maxOutputTableSize	30000
#define	nullAddress		-7777

/*
 * Limits and Constants Associated with the
 * Semantic Mechanisms of the S/SL Processor 
 */

/* The Symbol Table */

#ifdef	SELFCONTAINED
/* Classes of Symbols */
typedef enum {
	cNotFound = 0,			/* 0 */
	cInput,				/* 1 */
	cOutput,			/* 2 */
	cInputOutput,			/* 3 */
	cError,				/* 4 */
	cType,				/* 5 */
	cMechanism,			/* 6 */
	cUpdateOp,			/* 7 */
	cParmUpdateOp,			/* 8 */
	cChoiceOp,			/* 9 */
	cParmChoiceOp,			/* 10 */
	cRule,				/* 11 */
	cChoiceRule,			/* 12 */
	maxClasses = 50			/* 50 */
} SymbolClass;
#endif	/* SELFCONTAINED */

SymbolClass firstTypeClass = (SymbolClass)(((int)cChoiceRule) + 1);

/* Symbol Table Limits */
#define	maxSymbolChars	30000	/* Total length of all identifiers */
#define	maxSymbols	1500

/* Symbol index of nonexistent symbol */
#define	notFound	0

/* First values for classes */
ErrorCodes firstUserErrorSignalValue = eCycleHasNoExits;
TableOperation firstUserSemanticOperationValue = oEnterCall;

/* Undefined value  */
#ifdef	SELFCONTAINED
typedef enum {
	zero = 0,
	undefined = -9999
} Integer;
#endif	/* SELFCONTAINED */

#define	nullValue	(int)undefined

/* The Call Table */
#define	maxCalls	2000
#define	maxCallsPlusOne	(maxCalls+1)

/* The Cycle Stack */
#define	maxExits	30	/* Pending resolution */
#define	maxCycles	15	/* Deep */

/* The Choice Stack */
#define	maxMerges	100	/* Pending resolution */
#define	maxLabels	100	/* Active */
#define	maxChoices	15	/* Deep */


/* Assembled S/SL Table Index */
typedef u_int OutputAddress;	/* 0 .. maxOutputTableSize */

/* Types Used in the Semantic Mechanisms of the S/SL Processor */

/* The Symbol Table */
typedef int SymbolIndex;	/* 0 .. maxSymbols */


/* Standard Characters */
#define	newpage		'\f'
#define	endfile		-1

/* The Syntax/Semantic Table */

typedef int boolean;
typedef int sslPointerRange;	/* 0 .. sslTableSize */

/* Table Walker State */
boolean processing = true;
sslPointerRange sslPointer = 0;
TableOperation operation;

/* Abort Flag */
boolean abortflag = false;

/*
 * The S/SL Rule Call Stack:
 * The Rule Call Stack implements Syntax/Semantic
 * Language rule call and return.
 * Each time an oCall operation is executed,
 * the table return address is pushed onto the
 * Rule Call Stack.  When an oReturn is executed,
 * the return address is popped from the stack.
 * An oReturn executed when the Rule Call Stack is
 * empty terminates table execution.		
 */

typedef int sslTableIndex;	/* 0 .. sslTableSize */	/*X: 1 base in turing */
typedef int sslStackIndex;	/* 0 .. sslStackSize */

sslTableIndex sslStack[sslStackSize];
sslStackIndex sslTop = 0;

/*
 * Choice Match Flag:
 * Set by the Choice Handler to indicate whether
 * a match was made or the otherwise path was taken.
 * Set to true if a match was made and false otherwise.
 * This flag is used in input choices to indicate
 * whether the choice input token should be accepted or
 * not.							
 */

boolean choiceTagMatched;

/*
 * Parameterized And Choice Semantic Operation Values:
 * These are used to hold the decoded parameter value to
 * a parameterized semantic operation and the result
 * value returned by a choice semantic operation
 * or rule respectively.					 
 */

int parameterValue;
int resultValue;

/* Line Counters */
int nextLineNumber = 0;
int lineNumber;

/* Error Counter */
int noErrors = 0;

typedef char InputText[maxInputTokenLength];

/* Input Interface */
InputTokens nextToken;
int	nextTokenValue;
InputText	nextTokenText;

/*
 * The Compound Input Token Buffer
 * When a compound input token is accepted from
 * the input stream, its associated value is
 * saved in the compound token buffer for use by
 * the Semantic Mechanisms of the pass.		
 */
InputTokens compoundToken;	/* Last compound input token accepted */
int	compoundValue;		/* Its associated value */
InputText	compoundText;

/* Variables Used in Syntax Error Recovery */
boolean newInputLine = false;
InputTokens savedToken;

/* Input Scanner Interface and Tables */

/* Lookahead Character */
int	nextChar;

/* Keyword Token Table */
char *keywordText[] = { "mechanism", "output", "input", "error", "rules",
		"type", "end", "do", "od", "if", "fi"
};

InputTokens keywordToken[] = { tMechanism, tOutput, tInput, tError, tRules,
		tType, tEnd, tCycle, tCycleEnd, tChoice, tChoiceEnd
};

/* Special Symbol Token Table */
int XspecialChar[(int)tIllegal-(int)tSyntaxError];
int *specialChar=XspecialChar-(int)tSyntaxError;

/* First read flag */
boolean firstChar = true;

/* The Assembled Table */
int outputTable[maxOutputTableSize];
OutputAddress outputPointer = 0;

/* The Semantic Mechanism Data Structures of the S/SL Processor */

/* The Symbol Table */
SymbolClass symClass[maxSymbols];
char *symText[maxSymbols];
int symHash[maxSymbols];
int symValue[maxSymbols];
SymbolClass symParmClass[maxSymbols];
SymbolClass symResultClass[maxSymbols];
SymbolIndex symTop = 0;

/*
 * symIndex is the index in the Symbol Table
 * of the symbol last referenced  symIndex = 0 (notFound)
 * indicates the referenced symbol is not present in the table. 
 */
SymbolIndex symIndex = 0;

/*
 * savedSymIndex is used to save the
 * the value of symIndex for later recall 
 */
SymbolIndex savedSymIndex;

/*
 * enclosingSymIndex is used to save the symbol index of the
 * enclosing S/SL rule or type for later recall			
 */
SymbolIndex enclosingSymIndex;

/* Next Symbol Value */
int symNextValue[(int)maxClasses];

/* Current Definition Class */
SymbolClass symCurrentClass = cNotFound;

/* The Call Table */

OutputAddress callAddress[maxCalls];

/*
 * callRule is the SymbolIndex of the called rule and
 * is later resolved to an OutputAddress			
 */
int callRule[maxCalls];
u_int callTop = 0;		/* 0 .. maxCalls */

/* The Cycle Stack */

/* The Cycle Exit Stack */
OutputAddress exitAddress[maxExits];
u_int exitTop = 0;		/* 0 .. maxExits */

/* The Cycle Stack */
OutputAddress cycleAddress[maxCycles];

/*
 * cycleExitIndex is the origin of the
 * portion of the Exit Stack for the cycle 
 */
u_int cycleExitIndex[maxCycles];
u_int cycleTop = 0;

/* The Choice Stack */

/*
 * The Choice Merge Stack:  used to save the addresses
 * of the merge branches following each alternative of a choice 
 */
OutputAddress mergeAddress[maxMerges];
u_int mergeTop = 0;

/*
 * The Choice Label Stack:  used to save the alternative
 * values and corresponding table addresses in a choice 
 */
int labelValue[maxLabels];
OutputAddress labelAddress[maxLabels];
u_int labelTop = 0;

/* The Choice Stack */
SymbolClass choiceClass[maxChoices];
OutputAddress choiceAddress[maxChoices];

/*
 * choiceMergeIndex is the origin of the portion
 * of the Merge Stack for the choice		
 */
u_int choiceMergeIndex[maxChoices];

/*
 * choiceLabelIndex is the origin of the portion
 * of the Label Stack for the choice		
 */
u_int choiceLabelIndex[maxChoices];
u_int choiceTop = 0;

/* Input/Output Streams */

FILE *sourcefp;
FILE *headerfp;
FILE *tablefp;
FILE *listfp;
FILE *entryfp;

extern int optind;
extern char *optarg;

char *progname;

extern void Error(), InitInputScanner(), AcceptInputToken(), Emit();
extern void EmitNullAddress(), EmitNullCallAddress(), EnterNewSymbol();
extern void LookupSymbol(), xEnterNewSymbolValue(), EnterSecondNewSymbolValue();
extern void EnterSymbolValueFromAddress(), xSetCurrentClass();
extern void SetNextValueOfCurrentClass(), IncrementCurrentClassValue();
extern void ChangeSymbolClass(), xEnterSymbolParameterClass();
extern void yEnterSymbolResultClass(), SaveCurrentSymbol();
extern void RestoreCurrentSymbol(), SaveEnclosingSymbol();
extern void RestoreEnclosingSymbol(), InitSymbolTable();
extern void EnterCall(), ResolveCalls(), InitCallTable(), PushCycle();
extern void EnterCycleExit(), ResolveCycleExits(), PopCycle();
extern void EmitCycleAddress(), InitCycleStack(), PushChoice();
extern void EnterChoiceMerge(), ResolveChoiceMerges(), xEnterChoiceLabel();
extern void PopChoice(), xResolveChoiceTableAddress(), EmitChoiceTable();
extern void EmitFirstChoiceAddress(), xEmitFirstChoiceValue();
extern void ChangeChoiceClass(), InitChoiceStack(), GenerateSymbolDefinitions();
extern void GenerateOutputTable(), SslSyntaxError(), SslTrace(), SslFailure();
extern void SslChoice(), GenerateEntryPoints();
extern Validity VerifyChoiceLabel();

boolean tracing;
boolean summarize;

void
main(argc, argv)
	int argc;
	char *argv[];
{
	SymbolClass c, d;
	int ch, errflag;
	int v;
	boolean listing;
	char buf[1024 /* PATH_MAX */], *useEnum, *typeName;
	char *inFile, *tableFile, *headerFile, *listFile, *entryFile;
	extern char *basename();

	progname = argv[0];
	/* Get Run Options */

	/* Default no listing, tracing, summary, Turing tables */
	tracing = false;
	summarize = false;
	listing = false;
	errflag = 0;
	inFile = tableFile = headerFile = listFile = entryFile = NULL;
	typeName = useEnum = NULL;
	sourcefp = tablefp = headerfp = listfp = entryfp = NULL;

	while ((ch = getopt(argc, argv, "TLsi:h:t:l:e:E:D:")) != EOF) {
		switch (ch) {
		case 'T':
			tracing = true;
			break;
		case 'L':
			listing = true;
			break;
		case 'D':
			if (*optarg != '\0')
				typeName = optarg;
			else
				++errflag;
			break;
		case 'E':
			if (*optarg != '\0')
				useEnum = optarg;
			else
				++errflag;
			break;
		case 's':
			summarize = true;
			break;
		case 'i':	/* input S/SL code file */
			if (*optarg != '\0')
				inFile = optarg;
			else
				++errflag;
			break;
		case 'h':	/* output C header file */
			if (*optarg != '\0')
				headerFile = optarg;
			else
				++errflag;
			break;
		case 't':	/* output C S/SL table file */
			if (*optarg != '\0')
				tableFile = optarg;
			else
				++errflag;
			break;
		case 'l':	/* output listing file */
			if (*optarg != '\0')
				listFile = optarg;
			else
				++errflag;
			break;
		case 'e':	/* entry points saved here */
			if (*optarg != '\0')
				entryFile = optarg;
			else
				++errflag;
			break;
		default:
			++errflag;
			break;
		}
	}
	if (errflag || argc < optind + 1) {
		fprintf(stderr, "Usage: %s [-TLs] [-E Name] [-D type] [-h file.sst.h] [-t file.sst.c] [-l file.lst] [-e file.entry] [-i] file.ssl\n", progname);
		exit(1);
	}


	/* Input/Output File Assignments */
	if (inFile == NULL && optind >= argc)
		sourcefp = stdin;
	else {
		if (inFile == NULL)
			inFile = argv[optind++];
		if ((sourcefp = fopen(inFile, "r")) == NULL) {
			fprintf(stderr, "%s: cannot open '%s'\n",
					progname, inFile);
			exit(1);
		}
	}
	if (inFile != NULL && headerFile == NULL)
		(void) sprintf(headerFile = buf, "%s.sst.h", basename(inFile));
	if (headerFile != NULL
	    && (headerfp = fopen(headerFile, "w")) == NULL) {
		fprintf(stderr, "%s: cannot open '%s'\n", progname, headerFile);
		exit(1);
	}
	if (inFile != NULL && tableFile == NULL)
		(void) sprintf(tableFile = buf, "%s.sst.c", basename(inFile));
	if (tableFile != NULL
	    && (tablefp = fopen(tableFile, "w")) == NULL) {
		fprintf(stderr, "%s: cannot open '%s'\n", progname, tableFile);
		exit(1);
	}
	if (inFile != NULL && listFile == NULL && listing)
		(void) sprintf(listFile = buf, "%s.lst", basename(inFile));
	if (listFile != NULL
	    && (listfp = fopen(listFile, "w")) == NULL) {
		fprintf(stderr, "%s: cannot open '%s'\n", progname, listFile);
		exit(1);
	}
	if (inFile != NULL && entryFile == NULL)
		(void) sprintf(entryFile = buf, "%s.entry", basename(inFile));
	if (entryFile != NULL
	    && (entryfp = fopen(entryFile, "w")) == NULL) {
		fprintf(stderr, "%s: cannot open '%s'\n", progname, entryFile);
		exit(1);
	}

	/* Initialize Table Walker State */
	processing = true;
	sslPointer = 0;
	sslTop = 0;
	noErrors = 0;
	abortflag = false;

	/* Initialize Output */
	outputPointer = 0;

	/* Initialize Input */
	InitInputScanner();
	nextToken = tNewLine;
	nextLineNumber = 0;
	newInputLine = false;
	AcceptInputToken();

	/* Initialize Semantic Mechanisms */
	InitSymbolTable();
	InitCallTable();
	InitCycleStack();
	InitChoiceStack();

	/* Walk the S/SL Table */

	while (processing) {
		operation = (TableOperation)sslTable[sslPointer];
		++sslPointer;

		/* Trace Execution */
		if (tracing)
			SslTrace();

		switch (operation) {
		case oCall:
			if (sslTop < sslStackSize) {
				sslStack[++sslTop] = sslPointer + 1;
				sslPointer = sslTable[sslPointer];
			} else {
				Error(eSslStackOverflow);
				processing = false;
			}
			break;
		case oReturn:
			if (sslTop == 0)
				/* Return from main S/SL rule */
				processing = false;
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
			if (sslTable[sslPointer] == (int)nextToken)
				AcceptInputToken();
			else
				/* Syntax error in input */
				SslSyntaxError();

			++sslPointer;
			break;
		case oInputAny:
			if (nextToken != tEndOfFile)
				AcceptInputToken();
			else
				/* Premature end of file */
				SslSyntaxError();
			break;
		case oInputChoice:
			SslChoice(nextToken);

			if (choiceTagMatched)
				AcceptInputToken();
			break;
		case oEmit:
			Emit(sslTable[sslPointer]);
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
			parameterValue = sslTable[sslPointer];
			++sslPointer;
			break;
		case oSetResult:
			resultValue = sslTable[sslPointer];
			++sslPointer;
			break;
		case oSetResultFromInput:
			resultValue = (int)nextToken;
			break;

		/* Semantic Operations of the S/SL Processor */

		/* Call Table Mechanism Operations */
		case oEnterCall:
			EnterCall();
			break;
		case oEmitNullCallAddress:
			EmitNullCallAddress();
			break;
		case oResolveCalls:
			ResolveCalls();
			break;

		/* Symbol Table Mechanism Operations */
		case oSetClass:
			xSetCurrentClass(parameterValue);
			break;
		case oSetClassFromSymbolClass:
			xSymbolClass(c);
			xSetCurrentClass(c);
			break;
		case oxSetClassFromSymbolValue:
			SymbolValue(v);
			xSetCurrentClass(v);
			break;
		case oySetClassFromSymbolResultClass:
			SymbolResultClass(c);
			xSetCurrentClass(c);
			break;
		case ozSetClassFromSymbolParameterClass:
			SymbolParameterClass(c);
			xSetCurrentClass(c);
			break;
		case ovSetClassFromChoiceClass:
			ClassOfChoice(c);
			xSetCurrentClass(c);
			break;
		case oChooseClass:
			CurrentClass(c);
			resultValue = (int)c;
			break;
		case oSetClassValue:
			SetNextValueOfCurrentClass(compoundValue);
			break;
		case owSetClassValueFromSymbolValue:
			SymbolValue(v);
			SetNextValueOfCurrentClass(v);
			break;
		case oIncrementClassValue:
			IncrementCurrentClassValue();
			break;
		case oEnterNewSymbol:
			EnterNewSymbol();
			break;
		case oLookupSymbol:
			LookupSymbol();
			break;
		case oChangeSymbolClass:
			ChangeSymbolClass();
			break;
		case oChooseSymbolClass:
			xSymbolClass(c);
			resultValue = (int)c;
			break;
		case oVerifySymbolClass:
			xSymbolClass(c);
			CurrentClass(d);

			if (c == d)
				resultValue = (int)valid;
			else
				resultValue = (int)invalid;
			break;
		case oxEnterNewSymbolValue:
			xEnterNewSymbolValue();
			break;
		case oEnterSecondNewSymbolValue:
			EnterSecondNewSymbolValue();
			break;
		case oEnterSymbolValueFromAddress:
			EnterSymbolValueFromAddress();
			break;
		case oxChooseSymbolValue:
			SymbolValue(resultValue);
			break;
		case oEmitSymbolValue:
			SymbolValue(v);
			Emit(v);
			break;
		case oxVerifySymbolClassValue:
			SymbolValue(v);
			CurrentClass(c);

			if (v == (int)c)
				resultValue = (int)valid;
			else
				resultValue = (int)invalid;
			break;
		case oxEnterSymbolParameterClass:
			xEnterSymbolParameterClass();
			break;
		case oyEnterSymbolResultClass:
			yEnterSymbolResultClass();
			break;
		case oyChooseSymbolResultClass:
			SymbolResultClass(c);
			resultValue = (int)c;
			break;
		case oSaveEnclosingSymbol:
			SaveEnclosingSymbol();
			break;
		case oRestoreEnclosingSymbol:
			RestoreEnclosingSymbol();
			break;
		case oSaveCurrentSymbol:
			SaveCurrentSymbol();
			break;
		case oRestoreCurrentSymbol:
			RestoreCurrentSymbol();
			break;
		/* Cycle Stack Mechanism Operations */
		case oPushCycle:
			PushCycle();
			break;
		case oPopCycle:
			PopCycle();
			break;
		case oChooseCycleDepth:
			CycleDepth(resultValue);
			break;
		case oEmitCycleAddress:
			EmitCycleAddress();
			break;
		case oEnterCycleExit:
			EnterCycleExit();
			break;
		case oResolveCycleExits:
			ResolveCycleExits();
			break;
		case oxChooseCycleExits:
			CycleExits(resultValue);
			break;
		/* Choice Stack Mechanism Operations */
		case oPushChoice:
			CurrentClass(c);
			PushChoice(c);
			break;
		case oPopChoice:
			PopChoice();
			break;
		case oChangeChoiceClass:
			CurrentClass(c);
			ChangeChoiceClass(c);
			break;
		case oChooseChoiceClass:
			ClassOfChoice(c);
			resultValue = (int)c;
			break;
		case oVerifyChoiceSymbolLabel:
			SymbolValue(v);
			resultValue = (int)VerifyChoiceLabel(v);
			break;
		case oEnterChoiceSymbolLabel:
			SymbolValue(v);
			xEnterChoiceLabel(v);
			break;
		case oxEnterChoiceMerge:
			EnterChoiceMerge();
			break;
		case oResolveChoiceMerges:
			ResolveChoiceMerges();
			break;
		case oEmitChoiceTable:
			EmitChoiceTable();
			break;
		case oxResolveChoiceTableAddress:
			xResolveChoiceTableAddress();
			break;
		case oEmitFirstChoiceValue:
			xEmitFirstChoiceValue();
			break;
		case oxEmitFirstChoiceAddress:
			EmitFirstChoiceAddress();
			break;
		/* Rule Table Operations */
		case oStartRules:
			StartRules();
			break;
		case oBeginRule:
			BeginRule();
			break;
		case oSaveRule:
			SaveRule();
			break;
		case oEndRules:
			EndRules();
			break;
		/* Generate Output Operations */
		case oGenerateDefinitions:
			GenerateSymbolDefinitions();
			break;
		case oGenerateTable:
			GenerateOutputTable(typeName);
			GenerateEntryPoints(useEnum);
			break;
		/* Miscellaneous Output Operations */
		case oEmitValue:
			Emit(compoundValue);
			break;
		case oEmitNullAddress:
			EmitNullAddress();
			break;
		}
	}

	if (nextToken != tEndOfFile && !abortflag)
		Error(eExtraneousProgramText);

	/* Summarize Table Usage if Requested */
	if (summarize)
		printf("%d/%d table entries, %d/%d symbols, %d/%d calls.\n",
			      outputPointer+1, maxOutputTableSize,
			      symTop, maxSymbols, callTop, maxCalls);
	exit(0);
}

char *
basename(s)
	char *s;
{
	char *cp;
	extern char *strsave(), *strrchr();

	if (strlen(s) > 4 && strcmp(s + strlen(s) - 4, ".ssl") == 0) {
		cp = strsave(s);
		*(strrchr(cp, '.')) = '\0';
		return cp;
	}
	return s;
}

char *
strsave(s)
	char *s;
{
	char *cp;
	extern char *malloc();

	cp = malloc(strlen(s)+1);
	(void) strcpy(cp, s);
	return cp;
}

int
hash(s)
	register char *s;
{
	int i;

	for (i = 1; *s != '\0'; ++s, i>>=1)
		i *= *s;
	return i;
}

char *
LowerCase(s)
	register char *s;
{
	static char buf[BUFSIZ];
	char *cp;

	for (cp = buf; *s != '\0'; ++s, ++cp) {
		if (isascii(*s) && isupper(*s))
			*cp = tolower(*s);
		else
			*cp = *s;
	}
	*cp = '\0';
	return buf;
}


/* This procedure Emits the error message associated with errCode */

void
Error(errCode)
	ErrorCodes errCode;
{
	if (errCode == eNoError)
		assertionFailure;

	printf("Line ");

	if (errCode == eSyntaxError) {
		/* Syntax errors are in the lookahead token */
		printf("%d", nextLineNumber);
	} else {
		/* Semantic errors are in the accepted token */
		printf("%d", lineNumber);
	}

	printf(": ");

	switch (errCode) {
	case eSyntaxError:
		printf("Syntax error at '%s'\n", nextTokenText);
		break;
	case ePrematureEndOfFile:
		printf("Unexpected end of file\n");
		break;
	case eExtraneousProgramText:
		printf("Extraneous program text\n");
		break;
	case eSymbolTooLong:
		printf("Symbol too long\n");
		break;
	case eNumberTooLarge:
		printf("Integer value too large (or small)\n");
		break;
	case eStringTooLong:
		printf("String too long\n");
		break;
	case eUndefinedSymbol:
		printf("Symbol '%s' undefined\n", compoundText);
		break;
	case eSymbolPreviouslyDefined:
		printf("Symbol '%s' previously defined\n", compoundText);
		break;
	case eWrongSymbolClass:
		printf("Illegal context for symbol '%s'\n", compoundText);
		break;
	case eUnresolvedRule:
		printf("Rule '%s' undefined\n", compoundText);
		break;
	case eValueOutOfRange:
		printf("Symbol value not in table value range\n");
		break;
	case eJumpOutOfRange:
		printf("Jump distance exceeds table value range\n");
		break;
	case eIllegalStringSynonym:
		printf("Illegal string synonym\n");
		break;
	case eTooManyTotalSymbolChars:
		printf("Too many symbols (chars)\n");
		break;
	case eTooManySymbols:
		printf("Too many symbols\n");
		break;
	case eTableTooLarge:
		printf("Table too large\n");
		break;
	case eRuleTooLarge:
		printf("Rule too large\n");
		break;
	case eTooManyCalls:
		printf("Too many rule calls\n");
		break;
	case eCyclesTooDeep:
		printf("Cycles too deep\n");
		break;
	case eChoicesTooDeep:
		printf("Choices too deep\n");
		break;
	case eTooManyExits:
		printf("Too many cycle exits\n");
		break;
	case eTooManyLabels:
	case eTooManyMerges:
		printf("Too many alternatives\n");
		break;
	case eCycleHasNoExits:
		printf("(Warning) Cycle does not contain a cycle exit\n");
		break;
	case eExitNotInCycle:
		printf("Cycle exit not in cycle\n");
		break;
	case eDuplicateLabel:
		printf("Duplicate alternative label\n");
		break;
	case eIllegalParameterClass:
	case eIllegalResultClass:
		printf("Type name required as parameter or result type\n");
		break;
	case eIllegalNonvaluedReturn:
		printf("Non-valued return in choice rule\n");
		break;
	case eIllegalValuedReturn:
		printf("Valued return in procedure rule\n");
		break;
	case eWrongLabelClass:
		printf("Alternative label is wrong type\n");
		break;
	case eWrongParameterClass:
		printf("Parameter is wrong type\n");
		break;
	case eWrongDeclaredResultClass:
		printf("Result type does not match previous use\n");
		break;
	case eWrongResultClass:
		printf("Result value is wrong type\n");
		break;
	}

	++noErrors;

	if (((int)errCode) >= ((int)firstFatalErrorCode)
	    || noErrors == maxErrors) {
		printf("*** Processing aborted\n");
		abortflag = true;
		processing = false;
	}
}


void
ReadNextChar()
{
	if (listfp) {
		if (firstChar)
			firstChar = false;
		else if (nextChar == newline)
			(void) putc('\n', listfp);
		else if (nextChar != endfile)
			(void) putc(nextChar, listfp);

		if (nextChar == newline) {
			nextChar = getc(sourcefp);
			if (nextChar != EOF)
				fprintf(listfp, "%4d\t", outputPointer);
			return;
		}
	}

	nextChar = getc(sourcefp);
}


void
EvaluateNumber()
{
	if (nextToken != tInteger || nextTokenText[0] == '\0'
	    || (strlen(nextTokenText) > maxNumberLength
		&& (nextTokenText[0] != '-' 
		    || strlen(nextTokenText) > maxNumberLength+1)))
		assertionFailure;

	nextTokenValue = atoi(nextTokenText);
}


void
LookupKeyword()
{
	char *nt;
	int i;

	if (nextToken != tIdent || nextTokenText[0] == '\0')
		assertionFailure;

	nt = LowerCase(nextTokenText);

	/* The keyword table is ordered by length, longest first */

	if (strlen(nt) <= strlen(keywordText[0])) /* the longest */ {
		for (i=0; i < (sizeof keywordText)/(sizeof keywordText[0]); ++i)
			if (strcmp(nt, keywordText[i]) == 0) {
				nextToken = keywordToken[i];
				return;
			}
	}
}


void
GetNextInputToken()
{
	InputTokens t;
	ErrorCodes errCode;
	int i;

	if (maxInputTokenLength < maxIdentLength
	    || maxInputTokenLength < maxStringLiteralLength
	    || maxInputTokenLength < maxNumberLength)
		assertionFailure;

	errCode = eNoError;

	/* Skip blanks and comments */
	while (nextChar == blank || nextChar == tab
	       || nextChar == newpage || nextChar == '%') {
		if (nextChar == '%') {	/* Skip comment */
			do
				ReadNextChar();
			while (nextChar != newline && nextChar != endfile);
		} else
			ReadNextChar();
	}

	/* Scan and set nextToken */
	i = 0;
	nextTokenText[0] = '\0';
	nextTokenValue = 0;

	if (isascii(nextChar) && isalpha(nextChar)) {
		/* Scan identifier */
		do {
			if (i < maxIdentLength)
				nextTokenText[i++] = nextChar;
			else
				errCode = eSymbolTooLong;
			ReadNextChar();
		} while (isalpha(nextChar) && isalnum(nextChar));

		nextToken = tIdent;

		/* Test for Keyword */
		nextTokenText[i] = '\0';
		LookupKeyword();

	} else if (nextChar=='-' || (isascii(nextChar) && isdigit(nextChar))) {
		/* Scan number */
		if (nextChar == '-') {
			nextTokenText[i++] = nextChar;
			ReadNextChar();
		}

		if (maxInputTokenLength <= maxNumberLength+1)
			assertionFailure;

		do {
			if (i < maxNumberLength+2)
				nextTokenText[i++] = nextChar;

			ReadNextChar();
		} while (isascii(nextChar) && isdigit(nextChar));

		nextToken = tInteger;

		if (i > maxNumberLength+1
		    || (nextTokenText[0] != '-' && i > maxNumberLength)) {
			errCode = eNumberTooLarge;
			nextTokenValue = 0;
		} else {
			nextTokenText[i] = '\0';
			EvaluateNumber();
		}

	} else if (nextChar == quote) {
		/* Scan String */
		do {
			if (i < maxStringLiteralLength-1)
				nextTokenText[i++] = nextChar;
			else
				errCode = eStringTooLong;

			ReadNextChar();
		} while (nextChar != quote
			 && nextChar != newline && nextChar != endfile);

		nextTokenText[i++] = quote;
		nextTokenText[i] = '\0';

		if (nextChar == quote)
			ReadNextChar();

		nextToken = tString;

	} else {
		/* Special Symbols */
		if (lastInputToken != tIllegal)
			assertionFailure;
		for (t = firstInputToken; t != lastInputToken;
		     t = (InputTokens)((int)t + 1))
			if (specialChar[(int)t] == nextChar)
				break;

		nextToken = t;
		nextTokenText[0] = nextChar;
		nextTokenText[1] = '\0';
		ReadNextChar();

		if (nextToken == tExit && nextChar == '>') {
			nextToken = tReturn;
			ReadNextChar();
		} else if (nextToken == tIllegal && nextTokenText[0] == '!') {
			/* Alternate for tOr */
			nextToken = tOr;
		}
		if (nextToken == tIllegal) /* XX: fix this later */
			abort();
	}

	if (errCode != eNoError)
		Error(errCode);
}


void
InitInputScanner()
{
	InputTokens t;

	/* Initialize Special Character Table */
	for (t = firstInputToken; ((int)t) <= ((int)lastInputToken);
	     t = (InputTokens)((int)t + 1))
		specialChar[(int)t] = blank;

	specialChar[(int)tColon] = ':';
	specialChar[(int)tSemicolon] = ';';
	specialChar[(int)tEqual] = '=';
	specialChar[(int)tQuestionMark] = '?';
	specialChar[(int)tPeriod] = '.';
	specialChar[(int)tErrorSignal] = '#';
	specialChar[(int)tCall] = '@';
	specialChar[(int)tExit] = '>';
	specialChar[(int)tReturn] = blank;	/* tReturn handled specially */
	specialChar[(int)tLeftParen] = '(';
	specialChar[(int)tRightParen] = ')';
	specialChar[(int)tCycle] = '{';
	specialChar[(int)tCycleEnd] = '}';
	specialChar[(int)tChoice] = '[';
	specialChar[(int)tChoiceEnd] = ']';
	specialChar[(int)tComma] = ',';
	specialChar[(int)tOr] = '|';	/* alternate '!' handled specially */
	specialChar[(int)tOtherwise] = '*';
	specialChar[(int)tNewLine] = newline;
	specialChar[(int)tEndOfFile] = endfile;
	specialChar[(int)tIllegal] = blank;	/* tIllegal handled specially */

	/* Initialize Lookahead */
	nextChar = newline;
	firstChar = true;
}


void
AcceptInputToken()
{
	InputTokens acceptedToken;

	if (nextToken == tEndOfFile)
		assertionFailure;

	/* Accept Token */
	acceptedToken = nextToken;

	if (acceptedToken == tIdent
	    || acceptedToken == tString || acceptedToken == tInteger) {
		compoundToken = acceptedToken;
		(void) strcpy(compoundText, nextTokenText);
		compoundValue = nextTokenValue;
	}

	/* Update Line Number */
	lineNumber = nextLineNumber;

	/* Get Next Input Token */
	newInputLine = false;
	do {
		GetNextInputToken();

		if (nextToken == tNewLine) {
			/* Update Line Counter and Set Flag */
			newInputLine = true;

			if (nextLineNumber < maxLineNumber)
				++nextLineNumber;
			else
				nextLineNumber = 0;
		}
	} while (nextToken == tNewLine);


	/* Trace input */
	if (tracing)
	    printf("Input token accepted %d  Line %d  Next input token %d\n",
		      acceptedToken,  lineNumber, nextToken);
}


/* Emit an output table element to the assembled table */

void
Emit(value)
	int value;
{
	if (outputPointer < maxOutputTableSize) {
		outputTable[outputPointer++] = value;

		/* Trace Table Assembly */
		if (tracing)
			printf("Output emitted at %d: %d\n",
				       outputPointer-1, value);
	} else
		Error(eTableTooLarge);
}


/* Fixup a previously emitted table location to a resolved value */

void
EmitFixup(fixupAddress, value)
	OutputAddress fixupAddress;
	int value;
{
	if (fixupAddress >= outputPointer
	    || outputTable[fixupAddress] != nullAddress)
		assertionFailure;

	outputTable[fixupAddress] = value;

	/* Trace Table Assembly */
	if (tracing)
		printf("Output fixup at %d: %d\n", fixupAddress, value);
}


/* Reserve a table location to be fixed up */

void
EmitNullAddress()
{
	Emit(nullAddress);
}


/* Emit a backward jump address.  Jump addresses are absolute. */

void
EmitJumpAddress(targetAddress)
	OutputAddress targetAddress;
{
	Emit(targetAddress);
}


/* Fixup a forward jump address.  Jump addresses are absolute. */

void
EmitJumpFixup(jumpAddress)
	OutputAddress jumpAddress;
{
	EmitFixup(jumpAddress, outputPointer);
}


void
EmitNullCallAddress()
{
	EmitNullAddress();
}


/*
 * The Symbol Table Mechanism 
 *
 * The Symbol Table is used to keep track of defined symbols
 * in the S/SL program.  It provides facilities to save defined
 * symbols, resolve referenced symbols, and keep track of symbol
 * values and parameter and result types.				
 */

void
EnterNewSymbol()
{
	extern char *strsave();

	if ((compoundToken != tIdent && compoundToken != tString)
	    || strlen(compoundText) == 0)
		assertionFailure;

	/* Enter in the Symbol Table */
	if (symTop < maxSymbols) {
		++symTop;
		symText[symTop] = strsave(compoundText);
		symHash[symTop] = hash(LowerCase(compoundText));
		symClass[symTop] = symCurrentClass;
		symValue[symTop] = nullValue;
		symParmClass[symTop] = cNotFound;
		symResultClass[symTop] = cNotFound;
	} else
		Error(eTooManySymbols);

	symIndex = symTop;
}


/* This procedure looks up a symbol (or string) in the symbolTable */

void
LookupSymbol()
{
	char ct[BUFSIZ];
	int h;

	if (compoundToken != tIdent && compoundToken != tString)
		assertionFailure;


	(void) strcpy(ct, LowerCase(compoundText));
	h = hash(ct);

	symIndex = symTop;

	while (symIndex != notFound
	       && (h != symHash[symIndex]
		   || strcmp(ct, LowerCase(symText[symIndex])) != 0))
		--symIndex;

	/*
	 * symIndex is now the index in the Symbol Table of the 
	 * entry for the symbol if present and notFound otherwise 
	 */
}


void
xEnterNewSymbolValue()
{
	if (symTop < 0)
		assertionFailure;

	symValue[symTop] = symNextValue[(int)symCurrentClass];
}


void
EnterSecondNewSymbolValue()
{
	if (symTop < 2)
		assertionFailure;

	symValue[symTop-1] = symNextValue[(int)symCurrentClass];
}


void
EnterSymbolValueFromAddress()
{
	symValue[symIndex] = outputPointer;
}


void
SetCurrentSymbol(newIndex)
	SymbolIndex newIndex;
{
	symIndex = newIndex;
}


void
xSetCurrentClass(newClass)
	SymbolClass newClass;
{
	int nextOpValue;

	/* Synchronize operation values */
	if (symCurrentClass == cUpdateOp
	    || symCurrentClass == cParmUpdateOp
	    || symCurrentClass == cChoiceOp
	    || symCurrentClass == cParmChoiceOp) {
		nextOpValue = symNextValue[(int)symCurrentClass];
		symNextValue[(int)cUpdateOp] = nextOpValue;
		symNextValue[(int)cParmUpdateOp] = nextOpValue;
		symNextValue[(int)cChoiceOp] = nextOpValue;
		symNextValue[(int)cParmChoiceOp] = nextOpValue;
	}

	/* Synchronize input/output token values */
	if ((symCurrentClass == cInput || symCurrentClass == cOutput) &&
	    symNextValue[(int)symCurrentClass] >symNextValue[(int)cInputOutput])
		symNextValue[(int)cInputOutput] =
			symNextValue[(int)symCurrentClass];

	symCurrentClass = newClass;
}


void
SetNextValueOfCurrentClass(newValue)
	int newValue;
{
	symNextValue[(int)symCurrentClass] = newValue;
}


void
IncrementCurrentClassValue()
{
	symNextValue[(int)symCurrentClass] += 1;
}


void
CopySymbolTextToTokenBuffer()
{
	(void) strcpy(compoundText, symText[symIndex]);
}


void
ChangeSymbolClass()
{
	if (symIndex == notFound)
		assertionFailure;

	symClass[symIndex] = symCurrentClass;
}


void
xEnterSymbolParameterClass()
{
	if (symIndex == notFound)
		assertionFailure;

	symParmClass[symIndex] = symCurrentClass;
}


void
yEnterSymbolResultClass()
{
	if (symIndex == notFound)
		assertionFailure;

	symResultClass[symIndex] = symCurrentClass;
}


void
SaveCurrentSymbol()
{
	savedSymIndex = symIndex;
}


void
RestoreCurrentSymbol()
{
	symIndex = savedSymIndex;
}


void
SaveEnclosingSymbol()
{
	enclosingSymIndex = symIndex;
}


void
RestoreEnclosingSymbol()
{
	symIndex = enclosingSymIndex;
}


void
InitSymbolTable()
{
	SymbolClass i;
	char **cpp;

	/* Initialize Symbol Table */
	if (notFound != 0)
		assertionFailure;
	symTop = notFound;
	symClass[notFound] = cNotFound;
	symText[notFound] = "?";

	compoundToken = tIdent;
	/* enter the S/SL machine instructions */
	symCurrentClass = cUpdateOp;
	symNextValue[(int)cUpdateOp] = 0;
	for (cpp = &machineOpNames[0]; *cpp != NULL; ++cpp) {
		(void) strcpy(compoundText, *cpp);
		EnterNewSymbol();
		xEnterNewSymbolValue();
		IncrementCurrentClassValue();
	}
	/* enter the S/SL error signal codes */
	symCurrentClass = cError;
	symNextValue[(int)cError] = 0;
	for (cpp = &errorCodeNames[0]; *cpp != NULL; ++cpp) {
		(void) strcpy(compoundText, *cpp);
		EnterNewSymbol();
		xEnterNewSymbolValue();
		IncrementCurrentClassValue();
	}

	symCurrentClass = cNotFound;

	/* Initialize Next Values */
	symNextValue[(int)cNotFound] = nullValue;
	for (i = (SymbolClass)((int)cNotFound + 1); i != maxClasses;
	     i = (SymbolClass)((int)i + 1))
		symNextValue[(int)i] = 0;

	symNextValue[(int)cError] = (int)firstUserErrorSignalValue;
	symNextValue[(int)cUpdateOp] = (int)firstUserSemanticOperationValue;
	symNextValue[(int)cParmUpdateOp] = (int)firstUserSemanticOperationValue;
	symNextValue[(int)cChoiceOp] = (int)firstUserSemanticOperationValue;
	symNextValue[(int)cParmChoiceOp] = (int)firstUserSemanticOperationValue;
	symNextValue[(int)cType] = (int)firstTypeClass;
}


/* The Call Table Mechanism */

/*
 * The Call Table is used to keep track of calls to rules
 * and provides operations to resolve the call addresses. 
 */

void
EnterCall()
{
	SymbolIndex s;

	if (callTop < maxCalls) {
		++callTop;
		callAddress[callTop] = outputPointer - 1;
		CurrentSymbolIndex(s);
		callRule[callTop] = s;
	} else
		Error(eTooManyCalls);
}


void
ResolveCalls()
{
	u_int i;
	int v;

	i = 0;
	while (i != callTop) {
		++i;
		SetCurrentSymbol(callRule[i]);
		SymbolValue(v);

		if (v != nullValue)
			EmitFixup(callAddress[i], v);
		else {
			CopySymbolTextToTokenBuffer();
			Error(eUnresolvedRule);
		}
	}
}


void
InitCallTable()
{
	callTop = 0;
}


/*
 * The Cycle Stack Mechanism 
 *
 * The Cycle Stack is used to handle the exits and loop
 * jump of the cycle construct.				
 */


/* This procedure processes the beginning of a cycle */

void
PushCycle()
{
	if (cycleTop < maxCycles) {
		++cycleTop;
		cycleExitIndex[cycleTop] = exitTop;
		cycleAddress[cycleTop] = outputPointer;
	} else
		Error(eCyclesTooDeep);
}


/* This procedure processes cycle exits */

void
EnterCycleExit()
{
	if (exitTop < maxExits)
		exitAddress[++exitTop] = outputPointer - 1;
	else
		Error(eTooManyExits);
}


void
ResolveCycleExits()
{
	u_int i;

	if (cycleTop == 0)
		assertionFailure;

	/* Fixup cycle exits */
	for (i = exitTop; i != cycleExitIndex[cycleTop]; --i)
		EmitJumpFixup(exitAddress[i]);
}


void
PopCycle()
{
	if (cycleTop == 0)
		assertionFailure;

	exitTop = cycleExitIndex[cycleTop--];
}


void
EmitCycleAddress()
{
	EmitJumpAddress(cycleAddress[cycleTop]);
}


void
InitCycleStack()
{
	exitTop = 0;
	cycleTop = 0;
}


/*
 * The Choice Stack Mechanism 
 *
 * The Choice Stack is used to handle the labels, merge branches,
 * and choice table of the choice construct.				
 */

/* This procedure processes the beginning of a choice */

void
PushChoice(pushClass)
	SymbolClass pushClass;
{
	if (choiceTop < maxChoices) {
		++choiceTop;
		choiceClass[choiceTop] = pushClass;
		choiceAddress[choiceTop] = outputPointer - 1;
		choiceMergeIndex[choiceTop] = mergeTop;
		choiceLabelIndex[choiceTop] = labelTop;
	} else
		Error(eChoicesTooDeep);
}


void
EnterChoiceMerge()
{
	if (choiceTop == 0)
		assertionFailure;

	if (mergeTop < maxMerges)
		mergeAddress[++mergeTop] = outputPointer - 1;
	else
		Error(eTooManyMerges);
}


/* Resolve the merge jumps for the current top choice */

void
ResolveChoiceMerges()
{
	u_int i;

	if (choiceTop == 0 || mergeTop == 0)
		assertionFailure;

	/* Fix choice merges */
	for (i = mergeTop; i != choiceMergeIndex[choiceTop]; --i)
		EmitJumpFixup(mergeAddress[i]);
}


void
xEnterChoiceLabel(value)
	int value;
{
	if (choiceTop == 0)
		assertionFailure;

	if (labelTop < maxLabels) {
		++labelTop;
		labelValue[labelTop] = value;
		labelAddress[labelTop] = outputPointer;
	} else
		Error(eTooManyLabels);
}


Validity
VerifyChoiceLabel(value)
	int value;
{
	u_int i;

	if (choiceTop == 0)
		assertionFailure;

	for (i = choiceLabelIndex[choiceTop]; i != labelTop;) {
		++i;

		if (labelValue[i] == value) {
			/* Duplicate label */
			return invalid;
		}
	}
	return valid;
}


void
PopChoice()
{
	if (choiceTop == 0)
		assertionFailure;
	mergeTop = choiceMergeIndex[choiceTop];
	labelTop = choiceLabelIndex[choiceTop];
	--choiceTop;
}


void
xResolveChoiceTableAddress()
{
	if (choiceTop == 0)
		assertionFailure;

	EmitJumpFixup(choiceAddress[choiceTop]);
}


void
EmitChoiceTable()
{
	u_int i;

	if (choiceTop == 0)
		assertionFailure;


	/* Emit choice table */
	Emit(labelTop - choiceLabelIndex[choiceTop]); /* Number of entries */
	for (i = choiceLabelIndex[choiceTop]; i != labelTop;) {
		++i;
		Emit(labelValue[i]);
		EmitJumpAddress(labelAddress[i]);
	}
}


void
EmitFirstChoiceAddress()
{
	if (choiceTop == 0)
		assertionFailure;

	EmitJumpAddress(labelAddress[choiceLabelIndex[choiceTop] + 1]);
}


void
xEmitFirstChoiceValue()
{
	if (choiceTop == 0)
		assertionFailure;

	Emit(labelValue[choiceLabelIndex[choiceTop] + 1]);
}


void
ChangeChoiceClass(newClass)
	SymbolClass newClass;
{
	choiceClass[choiceTop] = newClass;
}


void
InitChoiceStack()
{
	mergeTop = 0;
	labelTop = 0;
	choiceTop = 0;
}


/* The Output Definition and S/SL Table Generators */


/* Generates Assembled Constant Definitions for a Class of Symbols */

void
GenerateClass(class, name)
	SymbolClass class;
	char *name;
{
	SymbolIndex s;
	SymbolClass c;
	int flag = 1;
	char buf[BUFSIZ];
	static int lastvalue = -945876;

	for (s = 0; s != symTop;) {
		++s;
		c = symClass[s];

		if ((c == class
		       || (class == cUpdateOp
				 && (c == cParmUpdateOp
				       || c == cChoiceOp
				       || c == cParmChoiceOp)))
		    && symText[s][0] != quote) {
			 /* A real external symbol and not
			  * a string synonym, so output it  */
			if (flag && name != NULL) {
				fprintf(headerfp, "typedef enum {\n");
				flag = 0;
			}
			if (symValue[s] != lastvalue + 1) {
				(void) sprintf(buf, "%s = %d",
						symText[s], symValue[s]);
			} else
				(void) strcpy(buf, symText[s]);
			fprintf(headerfp, "\t%s,%s/* %d */\n",
				buf, "\t\t\t\t\t\t"+(strlen(buf)+1)/8,
				symValue[s]);
			lastvalue = symValue[s];
		}
	}
	if (!flag && name != NULL)
		fprintf(headerfp, "} %s;\n", name);
	lastvalue = -945876;
}


/* Generates Assembled Constant Definitions */

void
GenerateSymbolDefinitions()
{
	SymbolIndex s;
	SymbolClass c;

	fprintf(headerfp, "/* Semantic Operations */\n\n");
	GenerateClass(cUpdateOp, "TableOperation");   /* Does all operations */
	fprintf(headerfp, "\n/* Input Tokens */\n\n");
	GenerateClass(cInput, "InputTokens");
	fprintf(headerfp, "\n/* Output Tokens */\n\n");
	GenerateClass(cOutput, "OutputTokens");
	fprintf(headerfp, "\n/* Input/Output Tokens */\n\n");
	GenerateClass(cInputOutput, "InputOutputTokens");
	fprintf(headerfp, "\n/* Error Codes */\n\n");
	GenerateClass(cError, "ErrorCodes");
	fprintf(headerfp, "\n/* Type Values */\n\n");
	for (s = 0; s != symTop;) {
		++s;
		c = symClass[s];

		if (c == cType) {
			GenerateClass(symValue[s], symText[s]);
			(void) putc('\n', headerfp);
		}
	}
}


/* Generates the Assembled Output Table */

void
GenerateOutputTable(typeName)
	char *typeName;
{
	OutputAddress i;

	/* Generate Syntax/Semantic Table */
	fprintf(tablefp, "/* S/SL table (%d entries) */\n",
			    outputPointer);
	fprintf(tablefp, "\n%s sslTable[] = {\n\t", typeName ? typeName:"int");

	for (i = 0; i < outputPointer;) {
		fprintf(tablefp, "%d, ", outputTable[i++]);
		if (i % 10 == 0)
			fprintf(tablefp, "\n\t");
	}

	fprintf(tablefp, "0\n};\n");
}

void
GenerateEntryPoints(enumName)
	char *enumName;
{
	SymbolIndex s;

	if (entryfp == NULL)
		return;
	fprintf(entryfp, "/* Entry points into S/SL Table */\n\n");
	if (enumName)
		fprintf(entryfp, "typedef enum {\n\tnil%s = -1,\n", enumName);
	for (s = 0; s != symTop;) {
		if (symClass[++s] == cRule) {
			if (enumName)
				fprintf(entryfp, "\t%s = %d,\n",
						symText[s], symValue[s]);
			else
				fprintf(entryfp, "#define\tSSL_%s\t%d\n",
						symText[s], symValue[s]);
		}
	}
	if (enumName)
		fprintf(entryfp, "} %s;\n", enumName);
}

/* Syntax Error Handling */

void
SslGenerateCompoundInputToken(expectedToken)
	InputTokens expectedToken;
{
	if (nextToken != tSyntaxError && nextToken != tEndOfFile)
		assertionFailure;

	compoundToken = expectedToken;
	compoundValue = 0;

	switch (expectedToken) {
	case tInteger:
		(void) strcpy(compoundText, "0");
		break;
	case tString:
		(void) strcpy(compoundText, "'?'");
		break;
	case tIdent:
		(void) strcpy(compoundText, "$NIL");
		break;
	}
}


void
SslSyntaxError()
{
	/*
	 * This procedure handles syntax errors in the input
	 * to the Parser pass, for Semantic passes this procedure
	 * will simply assert false since a syntax error in
	 * input would indicate an error in the previous pass.    

	 * Syntax error recovery:
	 * When a mismatch occurs between the the next input
	 * token and the syntax table, the following recovery
	 * is employed.						

	 * If the expected token is tNewLine then if there
	 * has been no previous syntax error on the line,
	 * ignore the error.  (A missing logical new line
	 * is not a real error.)					

	 * If the expected token is tNewLine or tSemicolon and
	 * a syntax error has already been detected on the
	 * current logical line (flagged by nextToken =
	 * tSyntaxError), then flush the input     exit when a
	 * new line or end of file is found.			

	 * Otherwise, if this is the first syntax error
	 * detected on the line (flagged by nextToken
	 * not = tSyntaxError), then if the input token
	 * is tEndOfFile then emit the ePrematureEndOfFile
	 * error code and terminate execution.  Otherwise,
	 * emit the eSyntaxError error code and set
	 * the nextToken to tSyntaxError to prevent
	 * further input     exit when the expected input is
	 * tSemicolon or tNewLine.				

	 * If the expected token is not tSemicolon nor
	 * tNewLine and a syntax error has already been
	 * detected on the current line (flagged by
	 * nextToken = tSyntaxError), then do nothing
	 * and continue as if the expected token had
	 * been matched.					
	 */

	if (operation != oInput && operation != oInputAny)
		assertionFailure;

	if (nextToken == tSyntaxError) {
		/* Currently recovering from syntax error */
		if (sslTable[sslPointer] == (int)tNewLine
		    || sslTable[sslPointer] == (int)tSemicolon) {
			/* Complete recovery by synchronizing */
			/* input to a new line */ 
			nextToken = savedToken;
			newInputLine = false;
			while (nextToken != tSemicolon
			       && nextToken != tEndOfFile && newInputLine)
				AcceptInputToken();
		}
	} else {
		/* First syntax error on the line */
		if (sslTable[sslPointer] == (int)tNewLine) {
			/* Ignore missing logical newlines */
		} else if (nextToken == tEndOfFile) {
			/* Flag error and terminate processing */
			Error(ePrematureEndOfFile);
			processing = false;
		} else {
			/* Flag error and begin recovery */
			Error(eSyntaxError);
			savedToken = nextToken;
			nextToken = tSyntaxError;
			lineNumber = nextLineNumber;
		}
	}

	/* If the expected input token is a compound */
	/* token, generate a dummy one.	*/
	if (sslTable[sslPointer] >= (int)firstCompoundToken
	    && sslTable[sslPointer] <= (int)lastCompoundToken)
		SslGenerateCompoundInputToken(sslTable[sslPointer]);
}


void
SslTrace()
{
	printf("Table index %d  Operation %d  Argument %d\n",
		      sslPointer-1, operation, sslTable[sslPointer]);
}


void
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
 * This procedure performs both input and semantic
 * choices.  It sequentially tests each alternative
 * value against the tag value, and when a match is
 * found, performs a branch to the corresponding
 * alternative path.  If none of the alternative
 * values matches the tag value, sslTable interpretation
 * proceeds to the operation immediately following
 * the list of alternatives (normally the otherwise
 * path).  The flag choiceTagMatched is set to true
 * if a match is found and false otherwise.		
 */

void
SslChoice(choiceTag)
	int choiceTag;
{
	int numberOfChoices;
	u_int choicePointer;

	choicePointer = sslTable[sslPointer];
	numberOfChoices = sslTable[choicePointer];
	++choicePointer;
	choiceTagMatched = false;

	do {
		if (sslTable[choicePointer] == choiceTag) {
			choicePointer = sslTable[choicePointer+1];
			choiceTagMatched = true;
			numberOfChoices = 0;
		} else {
			choicePointer += 2;
			--numberOfChoices;
		}
	} while (numberOfChoices != 0);

	sslPointer = choicePointer;
}

