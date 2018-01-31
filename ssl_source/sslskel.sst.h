/* Semantic Operations */

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
} TableOperation;

/* Input Tokens */

typedef enum {
	tSyntaxError = -1,				/* -1 */
	tIdent,						/* 0 */
	tString,					/* 1 */
	tInteger,					/* 2 */
	tSemicolon,					/* 3 */
	tNewLine,					/* 4 */
	tEndOfFile,					/* 5 */
} InputTokens;

/* Output Tokens */

typedef enum {
	aOutputToken = 0,				/* 0 */
} OutputTokens;

/* Input/Output Tokens */


/* Error Codes */

typedef enum {
	eNoError = 0,					/* 0 */
	eSyntaxError,					/* 1 */
	ePrematureEndOfFile,				/* 2 */
	eExtraneousProgramText,				/* 3 */
	eFirstUserError = 10,				/* 10 */
	eSslStackOverflow = 40,				/* 40 */
} ErrorCodes;

/* Type Values */

