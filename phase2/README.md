# TODO List for phase 2 (approximately in order of completion but most is flexible)
* Update the tokens
   * Update parser tokens in parser.ssl with those in scan.ssl
   * add new semantic tokens to parser.ssl and update parser.pt
   * update parser.pt with tokens from parser.def
* Update the rules
   * change the rules in parser.ssl to handle the changes in language structure
* Test cases added for phase 2 with appropriate documentation
* Documentation File
* README for phase 2 updated

BTW: to trace the parser output use
ssltrace "ptc -o2 -t2 -L lib/pt hello.pt" lib/pt/parser.def -e

To compile use "make" NOT "make scanner"

IMPORTANT: Update ddocumentation.txt as you go with exactly what changes you made, example: "Added support for sSelStmt by adding the following in scan.ssl: blah blah".

# Team CoCo - CISC/CMPE 458 Programming Language Processors - Phase 2 Submission
!!!!!!!!!!!!WARNING THE BELOW SECTIONS NEED TO BE UPDATED FOR PHASE 2!!!!!!!!!!!!!!
Phase 1 of the CISC/CMPE 458 project outlines changes to the scanner and screener of the PT Pascal compiler to allow for it to be adapted to the new Quby language. Specifications of the Quby language can be found on the CISC/CMPE 458 website. The changes made to the scanner/screener components of the compiler are described throughout the documentation provided.

## Documentation
### Main documentation file:
./ddocumentation.txt
### A documentation file can also be found for each test case in the corresponding test suite directories. The files have been listed below for convenience.
testSuite/characterClasses/charClassTestCaseDocumentation.txt
testSuite/comments/commentsTestCaseDocumentation.txt
testSuite/keywords/keywordTestCaseDocumentation.txt
testSuite/stringLiterals/stringLiteralsTestCaseDocumentation.txt
testSuite/syntaxTokens/syntaxTokenTestCaseDocumentation.txt

## Directory structure
* phase1
   * ptsrc/ (complete source code including scanner/screener changes)
   * README.MD (this file)
   * ddocumentation.txt (main documentation file)
   * testSuite/
      * characterClasses/ (test suite for character class changes)
      * comments/ (test suite for comment related changes)
      * keywords/ (test suite for keyword related changes)
      * stringLiterals/ (test suite for string literal changes)
      * syntaxTokens/ (test suite for syntax token changes)
      * TestAll (test script to test and verify all changes)

## How to run tests
To run all of the test cases (encompassing the 6 test suites seen above), simply run the bash script provided in the testSuite directory (**testSuite/TestAll**). This script will both **run** all of the tests using the input files provided (testSuite/\*/inputFiles) and place the outputs into "testSuite/\*/outputFiles" and also **verify** the output files against the expected output in "testSuite/\*/expectedOutputFiles.

## Authors
* Group: cisc458n
   * Parv Mital
   * Mitchell Waite
   * Clara Fu
   * Johan Cornelissen

