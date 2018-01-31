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
	oEmitNullAddress,				/* 71 */
} TableOperation;

/* Input Tokens */

typedef enum {
	tSyntaxError = -1,				/* -1 */
	tIdent,						/* 0 */
	tString,					/* 1 */
	tInteger,					/* 2 */
	tColon,						/* 3 */
	tSemicolon,					/* 4 */
	tEqual,						/* 5 */
	tQuestionMark,					/* 6 */
	tPeriod,					/* 7 */
	tErrorSignal,					/* 8 */
	tCall,						/* 9 */
	tExit,						/* 10 */
	tReturn,					/* 11 */
	tLeftParen,					/* 12 */
	tRightParen,					/* 13 */
	tCycle,						/* 14 */
	tCycleEnd,					/* 15 */
	tChoice,					/* 16 */
	tChoiceEnd,					/* 17 */
	tComma,						/* 18 */
	tOr,						/* 19 */
	tOtherwise,					/* 20 */
	tInput,						/* 21 */
	tOutput,					/* 22 */
	tError,						/* 23 */
	tType,						/* 24 */
	tMechanism,					/* 25 */
	tRules,						/* 26 */
	tEnd,						/* 27 */
	tNewLine,					/* 28 */
	tEndOfFile,					/* 29 */
	tIllegal,					/* 30 */
} InputTokens;

/* Output Tokens */

typedef enum {
	aCall = 0,					/* 0 */
	aReturn,					/* 1 */
	aRuleEnd,					/* 2 */
	aJump,						/* 3 */
	aInput,						/* 4 */
	aInputAny,					/* 5 */
	aInputChoice,					/* 6 */
	aEmit,						/* 7 */
	aError,						/* 8 */
	aChoice,					/* 9 */
	aChoiceEnd,					/* 10 */
	aSetParameter,					/* 11 */
	aSetResult,					/* 12 */
	aSetParameterFromInput,				/* 13 */
} OutputTokens;

/* Input/Output Tokens */


/* Error Codes */

typedef enum {
	eNoError = 0,					/* 0 */
	eSyntaxError,					/* 1 */
	ePrematureEndOfFile,				/* 2 */
	eExtraneousProgramText,				/* 3 */
	eCycleHasNoExits = 10,				/* 10 */
	eDuplicateLabel,				/* 11 */
	eExitNotInCycle,				/* 12 */
	eIllegalParameterClass,				/* 13 */
	eIllegalResultClass,				/* 14 */
	eIllegalNonvaluedReturn,			/* 15 */
	eIllegalStringSynonym,				/* 16 */
	eIllegalValuedReturn,				/* 17 */
	eSymbolPreviouslyDefined,			/* 18 */
	eUndefinedSymbol,				/* 19 */
	eWrongDeclaredResultClass,			/* 20 */
	eWrongLabelClass,				/* 21 */
	eWrongParameterClass,				/* 22 */
	eWrongResultClass,				/* 23 */
	eWrongSymbolClass,				/* 24 */
	eUnresolvedRule = 30,				/* 30 */
	eSymbolTooLong,					/* 31 */
	eNumberTooLarge,				/* 32 */
	eStringTooLong,					/* 33 */
	eValueOutOfRange,				/* 34 */
	eJumpOutOfRange,				/* 35 */
	eSslStackOverflow = 40,				/* 40 */
	eCallStackOverflow,				/* 41 */
	eTooManyTotalSymbolChars,			/* 42 */
	eTooManySymbols,				/* 43 */
	eTableTooLarge,					/* 44 */
	eCyclesTooDeep,					/* 45 */
	eTooManyExits,					/* 46 */
	eChoicesTooDeep,				/* 47 */
	eTooManyLabels,					/* 48 */
	eTooManyMerges,					/* 49 */
	eTooManyCalls,					/* 50 */
	eRuleTooLarge,					/* 51 */
} ErrorCodes;

/* Type Values */

typedef enum {
	invalid = 0,					/* 0 */
	valid,						/* 1 */
} Validity;

typedef enum {
	zero = 0,					/* 0 */
	undefined = -9999,				/* -9999 */
} Integer;

typedef enum {
	cNotFound = 0,					/* 0 */
	cInput,						/* 1 */
	cOutput,					/* 2 */
	cInputOutput,					/* 3 */
	cError,						/* 4 */
	cType,						/* 5 */
	cMechanism,					/* 6 */
	cUpdateOp,					/* 7 */
	cParmUpdateOp,					/* 8 */
	cChoiceOp,					/* 9 */
	cParmChoiceOp,					/* 10 */
	cRule,						/* 11 */
	cChoiceRule,					/* 12 */
	maxClasses = 50,				/* 50 */
} SymbolClass;

