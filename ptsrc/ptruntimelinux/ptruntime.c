/* 
   PT x86 Runtime Monitor Ver. 1.00,
   after PT SPARC Runtime Monitor Ver. 2.00,
   identical to PT MIPS Runtime Monitor Ver. 1.00,
   after PT VAX Runtime Monitor  Ver. 1.04
   after PT PDP-11 Runtime Monitor  Ver. 1.01

   Author:  J.A. Rosselet, University of Toronto
	    VAX, MIPS, x86 conversions by J.R. Cordy, Queen's University at Kingston
	    Sparc conversion by T.R. Dean, Queen's University at Kingston

   Date 30 Jun 1980
	 (Updated 12 Feb 1981)
	 (VAX conversion 30 Aug 1985)
	 (MIPS conversion 1 Sept 1996)
	 (revised 6 December 2009)
	 (x86 conversion 6 Jan 2011)
	 (Quby additions 5 Jan 2018)
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* Safe string duplicates */
char * NewStr(); 

#define BLANK ' '
#define ERROR -1
#define BYTE 1
#define WORD 4
#define MAXFILES 15
#define READ 1
#define WRITE 2

/* error codes */
#define PROGARG 0
#define PROGOPEN 1
#define PROGERR 2
#define ARGCOUNT 3
#define PROGSIZE 4
#define RESET 5
#define REWRITE 6
#define FILEEOF 7
#define NORESET 8
#define NOREWRITE 9
#define NONINT 10
#define FILECOUNT 11

/* global variables */
char **argument;
int   errcond, argcount;
struct fileStreams 
    {
	int mode;
	FILE *fileFile;
	char *fileName;
    }; 
struct fileStreams fileStreams[MAXFILES] = 
    {
	READ,	0, "stdin",
	WRITE,	0, "stdout"
    };

FILE * OpenTest ();


/* Main entry point and program startup */

void main (argc, argv)
    int  argc;
    char *argv[];
    {
	int i;
	/* initialize arguments for PT */
	argcount = argc += 1;	/* -1 for progname, +2 for stdin/out */
	argv -= 2;
	argument = argv;	/* so names correspond to fileStreams */
	/* uninitialize file streams */
	fileStreams[0].fileFile = stdin;
	fileStreams[1].fileFile = stdout;
	for (i=3; i<MAXFILES; i++) {
	    struct fileStreams *fs;
	    fs = &fileStreams[i-1];
	    fs -> mode = 0;
	    fs -> fileFile = NULL;
	    if (i <= argcount)
		fs -> fileName = argument[i];
	    else
		fs -> fileName = NULL;
	}
	errcond = 0;
	/* call the PT program */
	ptmain ();
    }


/* PT run time system trap routines */

pttrap0 ()	/* halt */
    {
	exit (errcond);
    }

pttrap1 (fileNumber)	/* reset */
    int fileNumber;
    {
	Open (fileNumber, READ);
    }

pttrap2 (fileNumber)	/* rewrite */
    int  fileNumber;
    {
	Open (fileNumber, WRITE);
    }

pttrap3 (valueLength, valueRef, fileNumber)	/* read */
    int  fileNumber;
    int valueLength;
    char *valueRef;
    {
	FILE *f;
	f = OpenTest (fileNumber, READ);
	if (valueLength == WORD)
	    *((int *) valueRef) = getw (f);
	else
	    *valueRef = getc (f);
	if (feof (f))
	    Error (FILEEOF, fileNumber);
    }

pttrap4 (fileNumber)	/* readln */
    int  fileNumber;
    {
	FILE *f;
	int letter;
	f = OpenTest (fileNumber, READ);
	do
	    {
		if ( (letter = getc (f)) == EOF)
		    Error (FILEEOF, fileNumber);
	    }
	while (letter != '\n');
    }

pttrap5 (valueLength, value, fileNumber)	/* write */
    int  fileNumber;
    int valueLength;
	int value;
    {
	FILE *f;
	f = OpenTest (fileNumber, WRITE);
	if (valueLength == WORD)
	    putw (value, f);
	else
	    putc (value, f);
    }

pttrap6 (fileNumber)	/* writeln */
    int  fileNumber;
    {
	pttrap9 (1, '\n', fileNumber);
    }

pttrap7 (fieldWidth, string, fileNumber)	/* write string */
    char  *string;
    int  fieldWidth;
    int fileNumber;
    {
	PutStr (OpenTest (fileNumber, WRITE), strlen (string), 
 	    string, fieldWidth);
   }

pttrap8 (fieldWidth, value, fileNumber) 	/* write integer */
    int  fileNumber;
    int fieldWidth, value;
    {
	PutInt (OpenTest (fileNumber, WRITE), value, fieldWidth);
    }

pttrap9 (fieldWidth, charVal, fileNumber)	/* write char */
    int  fileNumber;
    int fieldWidth;
    char charVal;
    {
	char charstring[2];
	charstring[0] = charVal;
	charstring[1] = '\0';
	PutStr (OpenTest (fileNumber, WRITE), 1, charstring, fieldWidth);
    }

pttrap10 (intRef, fileNumber)	/* read integer */
    int  fileNumber, *intRef;
    {
	int  sign;
	int letter;
	int value;
	FILE *f;
	f = OpenTest (fileNumber, READ);
	value = 0;
	sign = 0;
	/* skip noise */
	do
	    {
		letter = getc (f);
		if (letter == EOF)
		    Error (FILEEOF, fileNumber);
	    }
	while (letter == BLANK || letter == '\n');

	/* handle sign */
	switch (letter) {
		case '-':	sign--;
				/* Fall through */
		case '+':	letter = getc (f);
				break;
		}

	/* scan ( >= 1 ) integer digits */
	if (letter < '0' || letter > '9')
		 Error (NONINT, fileNumber);
	do
		{
		value *= 10;
		letter -= '0';
		value -= letter;
		letter = getc (f);
		}
	while (letter >= '0' && letter <= '9');

	/* return non-integer character to input */
	if (letter != EOF)
	    ungetc (letter, f);

	if (sign == 0)
	    value = -value;
	*intRef = value;
    }

pttrap11 (charRef, fileNumber)	/* read char */
    int  fileNumber;
    char *charRef;
    {
	int  letter;
	struct fileStreams  *fs;
	fs = &fileStreams[fileNumber-1];
	if (fs->mode == READ)
	    {
		letter = getc (fs->fileFile);
		if (letter == '\n')
		    *charRef = BLANK;
		else if (letter == EOF)
		    Error (FILEEOF, fileNumber);
		else
		    *charRef = letter;
	    }
	else
	    Error (NORESET, fileNumber);
    }

int pttrap12 (fileName, fileNumber)	/* assign */
    char *fileName;
    {
	int i;
	for (i=argcount+1; i<MAXFILES; i++) {
	    if (fileStreams[i-1].fileName == NULL) {
		fileStreams[i-1].fileName = fileName;
		return (i);
	    }
	}
	if (i == MAXFILES) 
	    Error (FILECOUNT, 0);
    }

pttrap13 (lineNum)	/* subscript out of range abort */
    int  lineNum;
    {
	putc ('\n', stdout);
	fprintf (stderr, "line %d: subscript out of range\n", lineNum);
	errcond = ERROR;
	pttrap0 ();
    }

pttrap14 (lineNum)	/* case out of range abort */
    int  lineNum;
    {
	putc ('\n', stdout);
	fprintf (stderr, "line %d: case selector does not match a label\n",
		lineNum);
	errcond = ERROR;
	pttrap0 ();
    }

pttrap15 (fileNumber)	/* eoln function */
    int  fileNumber;
    {
	int letter;
	struct fileStreams  *fs;

	fs = &fileStreams[fileNumber-1];
	if (fs->mode == READ)
	    {
		if ( (letter=getc (fs->fileFile)) == EOF)
		    Error (FILEEOF, fileNumber);
		ungetc (letter, fs->fileFile);
		return (letter == '\n');
	    }
	else
	    Error (NORESET, fileNumber);
    }

pttrap16 (fileNumber)	/* eof function */
    int  fileNumber;
    {
	int  letter;
	struct fileStreams *fs;

	fs = &fileStreams[fileNumber-1];
	if (fs->mode == READ)
	    {
		if ( (letter=getc (fs->fileFile)) == EOF)
		    return (1);
		ungetc (letter, fs->fileFile);
		return (0);
	    }
	else if (fs->mode == WRITE)
	    return (1);
	else
	    Error (NORESET, fileNumber);
    }


/* Quby additions */

pttrap101 (s1, s2)      /* assign string */
    char *s1,*s2;
    {
        /* s1 := s2 */
	strncpy (s1, s2, 1024);
    }

char * pttrap102 (i1)      /* chr string */
    int i1;
    {
        /* chr (i1) */
	char s1 [1024];
	char *s3;
	s1 [0] = i1;
	s1 [1] = '\0';
	s3 = NewStr (s1);
	return (s3);
    }

char * pttrap103 (s1, s2)	/* concatenate */
    char *s1,*s2;
    {
	char *s3;
	s3 = NewStr (s1);
        /* s3 := s1 + s2 */
	strncpy (s3, s1, 1024);
	strncat (s3, s2, 1024);
	return (s3);
    }

char * pttrap104 (s, start, end)	/* substring */
    char *s;
    int start,end;
    {
	int count;
	char *s3;
	s3 = NewStr (s);
        /* s3 := s3 :: start .. end */
	count = end - start + 1;
	sprintf(s3, "%.*s", count, s + start - 1);
	return (s3);
    }

int pttrap105 (s1)	/* string length */
    char *s1;
    {
	return (strlen (s1));
    }

int pttrap106 (s1, s2)	/* string index */
    char  *s1, *s2;
    {
	char *x;
	x = strstr (s1, s2);
	if (x == NULL)
	    return (0);
	else
	    return (x - s1 + 1);
   }


int pttrap107 (s1, s2)	/* strings equal */
    char *s1, *s2;
    {
	if (strcmp (s1, s2) == 0) 
	    return (1);
	else
	    return (0);
    }

pttrap108 (string, fileNumber)	/* read string */
    char  *string;
    int   fileNumber;
    {
	GetStr (OpenTest (fileNumber, READ), string);
   }

pttrap109 (fieldWidth, string, fileNumber)	/* write string */
    char  *string;
    int   fieldWidth, fileNumber;
    {
	PutStr (OpenTest (fileNumber, WRITE), strlen (string), 
 	    string, fieldWidth);
   }

/* auxiliary helper routines */

char * NameFile (fileNumber)
    int  fileNumber;
    {
	if (fileNumber == 1)
	    return ("input");
	else if (fileNumber == 2)
	    return ("output");
	else if (fileStreams[fileNumber-1].fileName != NULL)
	    return (fileStreams[fileNumber-1].fileName);
	else
	    return ("<no file>");
    }

Error (errcode, fileNumber)
    int  errcode;
    int  fileNumber;
    {
	static char *errMessages[] =	{
		"no program name argument\n",
		"can't open program file %s\n",
		"error in program file %s\n",
		"wrong number of arguments\n",
		"program too large\n",
		"can't reset file %s\n",
		"can't rewrite file %s\n",
		"read past EOF on file %s\n",
		"read before reset of file %s\n",
		"write before rewrite of file %s\n",
		"integer read failed on file %s\n",
		"too many assigned files\n"
		};
	putc ('\n', stdout);
	fprintf (stderr, errMessages[errcode], NameFile (fileNumber));
	errcond = ERROR;
	pttrap0 ();
    }

FILE * OpenTest (fileNumber, mode)
    int fileNumber, mode;	/* mode is one of READ, WRITE */
    {
	struct fileStreams *fs;
	fs = &fileStreams[fileNumber-1];
	if (fs->mode != mode)
	    Error ( mode==READ ? NORESET : NOREWRITE, fileNumber);
	return (fs->fileFile);
    }

PutStr (f, length, str, width)
	FILE *f;
	int length, width;
	char *str;
    {
	int n;
	if (width < 0) width = -width;
	if ( (n=width-length) > 0) do putc (' ', f); while (--n);
	if ( (n=length) > 0) do fputc (*str++, f); while (--n);
    }

GetStr (f, str)
	FILE *f;
	char *str;
    {
	fgets (str, 1023, f);
	str [strlen (str) - 1] = '\0';
	if (!feof(f)) ungetc ('\n', f); 
    }

Open (fileNumber, mode)
    int  fileNumber;
    int mode;
    {
	struct fileStreams *fs;
	fs = &fileStreams[fileNumber-1];
	if (fs->fileName == NULL)
		Error (mode==READ?RESET:REWRITE, fileNumber);
	if (fs->fileFile != NULL)
		fclose (fs->fileFile);
	fs->fileFile = fopen (fs->fileName, mode==READ?"r":"w");
	if (fs->fileFile == NULL)
		Error (mode==READ?RESET:REWRITE, fileNumber);
	fs->mode = mode;
    }

PutInt (f, value, width)
	FILE *f;
	int value, width;
    {
	static char intBuf[12];
	char *cp;
	int myvalue;
	cp = &intBuf[12];
	/*
	 * We manipulate a negative number so that -32768
	 * doesn't need special help.  This depends on
	 * (n % m) <= 0 for n<0, m>0.
	 */
	if ( (myvalue=value) > 0)	myvalue = -myvalue;
	do	{
		*--cp = '0' - myvalue%10;
		myvalue /= 10;
		}
	while (myvalue != 0);
	if (value < 0)	*--cp = '-';
	PutStr (f, &intBuf[12]-cp, cp, width);
    }

char * NewStr (s)
    char *s;
    {
	char *news;
	news = (char *) malloc (1024);
	strncpy (news, s, 1024);
	return (news);
    }
