# Makefile for PT Scanner Parser pass  Ver. 4.0
# Usage:  make [scanner | parser]

# (Revised v4.0 - 12 Dec 2017)

PASS = parser
SUFFIXES = .ssl .sst .pt .out
.SUFFIXES: ${SUFFIXES}

all:  parser

install:  parser

parser.out:  parser.pt scan.sst parser.sst scan.consistency parser.consistency
	@echo "ptc parser.pt"
	@ptc parser.pt > parser.err
	@cat parser.err
	-@(grep -v Warning parser.err > parser.err.nowarn || true)
	@if (! cmp -s parser.err.nowarn /dev/null) ; \
	then \
	    rm -f parser.err parser.err.nowarn  ; \
	    exit 1 ; \
	else \
	    rm -f parser.err parser.err.nowarn  ; \
	fi

scanner.out:  parser.pt scan.sst scan.consistency
	@echo "ptc parser.pt"
	@ptc parser.pt > parser.err
	@cat parser.err
	-@(grep -v Warning parser.err > parser.err.nowarn || true)
	@if (! cmp -s parser.err.nowarn /dev/null) ; \
	then \
	    rm -f parser.err parser.err.nowarn  ; \
	    exit 2 ; \
	else \
	    rm -f parser.err parser.err.nowarn  ; \
	    mv parser.out scanner.out ; \
	fi


# S/SL make procedure and dependency analysis

.ssl.sst:  
	@echo "ssl $*.ssl"
	@ssl $*.ssl > $*.err
	@cat $*.err
	-@(grep -v Warning $*.err > $*.err.nowarn || true)
	@if (! cmp -s $*.err.nowarn /dev/null) ; \
	then \
	    rm -f $*.err $*.err.nowarn  ; \
	    rm -f $*.def $*.sst ; \
	    exit 3 ; \
	else \
	    rm -f $*.err $*.err.nowarn  ; \
	fi 

scan.consistency: scan.sst parser.pt
	@ # scanner character classes
	@inconsistent=0 ; \
	defcounts=`cat scan.def parser.pt | grep -e "firstCharClass =" -e "lastCharClass =" -e "lLeftParen =" | expand | sort -u | wc -l` ; \
	if [ ! $${defcounts} -eq  3 ] ; \
	then \
	    inconsistent=1 ; \
	fi ; \
	if [ ! $${inconsistent} -eq 0 ] ; \
	then \
	    echo "ERROR: Scanner character class definitions out of date. Update parser.pt with new definitions from scan.def." ; \
	    exit 4 ; \
	fi
	@ # scanner syntax tokens
	@inconsistent=0 ; \
	defcounts=`cat scan.def parser.pt | grep -e "firstKeywordToken =" -e "lastKeywordToken =" -e "pVar =" -e "firstCompoundInputToken =" -e "lastCompoundInputToken =" -e "pLeftParen =" -e "lastSyntaxToken =" | expand | sort -u | wc -l` ; \
	if [ ! $${defcounts} -eq  7 ] ; \
	then \
	    inconsistent=1 ; \
	fi ; \
	if [ ! $${inconsistent} -eq 0 ] ; \
	then \
	    echo "ERROR: Scanner/parser syntax token definitions out of date. Update parser.pt with new definitions from scan.def." ; \
	    exit 5 ; \
	fi

parser.consistency: scan.sst parser.sst parser.pt
	@ # scanner/parser syntax tokens
	@inconsistent=0 ; \
	defcounts=`cat scan.def parser.def | grep -e "firstKeywordToken =" -e "lastKeywordToken =" -e "pVar =" -e "firstCompoundInputToken =" -e "lastCompoundInputToken =" -e "pLeftParen =" -e "lastSyntaxToken =" | expand | sort -u | wc -l` ; \
	if [ ! $${defcounts} -eq  7 ] ; \
	then \
	    inconsistent=1 ; \
	fi ; \
	if [ ! $${inconsistent} -eq 0 ] ; \
	then \
	    echo "ERROR: Scanner/parser syntax token definitions inconsistent. Update parser.ssl input tokens to match scan.ssl output tokens." ; \
	    exit 6 ; \
	fi
	@ # parser semantic tokens
	@inconsistent=0 ; \
	defcounts=`cat parser.pt parser.def | grep -e "firstSemanticToken =" -e "firstCompoundSemanticToken =" -e "lastCompoundSemanticToken =" -e "sExpnEnd =" -e "sAdd =" -e "lastSemanticToken =" | expand | sort -u | wc -l` ; \
	if [ ! $${defcounts} -eq  6 ] ; \
	then \
	    inconsistent=1 ; \
	fi ; \
	if [ ! $${inconsistent} -eq 0 ] ; \
	then \
	    echo "ERROR: Parser semantic token definitions out of date. Update parser.pt with new definitions from parser.def." ; \
	    exit 7 ; \
	fi
	
parser: parser.out parser.sst parser.def scan.sst scan.def stdIdentifiers
	/bin/cp parser.out parser.sst parser.def scan.sst scan.def stdIdentifiers ../lib/pt/


scanner: scanner.out parser.sst parser.def scan.sst scan.def stdIdentifiers
	/bin/cp scanner.out ../lib/pt/parser.out
	/bin/cp parser.sst parser.def scan.sst scan.def stdIdentifiers ../lib/pt/

clean:
	/bin/rm -f scanner.out parser.out parser.sst parser.def 
	/bin/rm -f scan.sst scan.def
