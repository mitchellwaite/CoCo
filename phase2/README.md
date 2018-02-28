# Team CoCo - CISC/CMPE 458 Programming Language Processors - Phase 2 Submission
Phase 2 of the CISC/CMPE 458 project outlines changes to the parser of the PT Pascal compiler to allow for it to be adapted to the new Quby language. Specifications of the Quby language can be found on the CISC/CMPE 458 website. The changes made to the parser components of the compiler are described throughout the documentation provided.

## Documentation
### Main documentation file:
./ddocumentation.txt
### A documentation file can also be found for each test case in the corresponding test suite directories. The files have been listed below for convenience.
testSuite/parser/assignmentStatement/assignmentStatementTestCaseDocumentation.txt
testSuite/parser/conditionals/conditionalsTestCaseDocumentation.txt
testSuite/parser/declarations/declarationsTestCaseDocumentation.txt
testSuite/parser/ifStatement/ifStatementTestCaseDocumentation.txt
testSuite/parser/iterativeAssignments/iterativeAssignmentsTestCaseDocumentation.txt
testSuite/parser/modules/modulesTestCaseDocumentation.txt
testSuite/parser/program/programTestCaseDocumentation.txt
testSuite/parser/repStatement/repStatementTestCaseDocumentation.txt
testSuite/parser/routines/routinesTestCaseDocumentation.txt
testSuite/parser/selStatement/selStatementTestCaseDocumentation.txt
testSuite/parser/strings/stringsTestCaseDocumentation.txt

## Directory structure
* phase2
   * ptsrc/ (complete source code including parser changes)
   * README.MD (this file)
   * ddocumentation.txt (main documentation file)
   * testSuite/
      * parser (Automated test suite for testing Quby parser)
	    * assignmentStatement/ (test suite for all assignment operator changes)
        * conditionals/ (test suite for all conditional operator changes)
        * declarations/ (test suite for declaration changes)
        * ifStatement/ (test suite for 'if' statement related changes)
		* iterativeAssignments/ (test suite for Quby's new iterative assignments)
		* modules/ (test suite for Quby's new 'mod' block)
		* program/ (test suite for program syntax changes)
		* repStatement/ (test suite for Quby's new 'rep' block)
		* routines/ (test suite for routine and procedure related changes)
		* selStatement/ (test suite for Quby's new 'sel' block)
		* strings/ (test suite for Quby's string operations)
		* TestAll (Script used to run and verify all parser related tests)
      * scannerScreener (Regression test suite to ensure no scanner functionality has been affected)
        * characterClasses/ (test suite for character class changes)
        * comments/ (test suite for comment related changes)
        * keywords/ (test suite for keyword related changes)
        * stringLiterals/ (test suite for string literal changes)
        * syntaxTokens/ (test suite for syntax token changes)
        * TestAll (test script to test and verify all changes)
		* TestAll (Script used to run and verify all scanner/screener related tests)

## How to run tests
###Parser Automated Test Suite
To run all of the parser related test cases (encompassing the 11 test suites seen above), simply run the bash script provided in the parser testSuite directory (**testSuite/parser/TestAll**). This script will both **run** all of the tests using the input files provided (testSuite/parser/\*/inputFiles) and place the outputs into "testSuite/parser/\*/outputFiles" and also **verify** the output files against the expected output in "testSuite/parser/\*/expectedOutputFiles.
Ssltrace was used for testing without any flags (-e, -i, etc.) to allow for the most rigorous testing including the output of any syntax errors encountered by the parser (which don't exist in the -e output).
###Scanner/Screener Automated Regression Test Suite
To run all of the test cases related to the scanner/screen portion of the compiler, simply run the bash script provided in the scannerScreener testSuite directory (**testSuite/scannerScreener/TestAll**). This script will both **run** all of the tests using the input files provided (testSuite/scannerScreener/\*/inputFiles) and place the outputs into "testSuite/scannerScreener/\*/outputFiles" and also **verify** the output files against the expected output in "testSuite/scannerScreener/\*/expectedOutputFiles.
The regression test suite ensures that all functionality implemented in phase 1 has not regressed (changed). In general regression testing is a quick and simple check to ensure your new changes aren't affecting old functionality.

## Authors
* Group: cisc458n
   * Parv Mital
   * Mitchell Waite
   * Clara Fu
   * Johan Cornelissen

