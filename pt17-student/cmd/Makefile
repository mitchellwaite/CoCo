# Makefile for ptc command

all: install 

ptc:	ptc.c
	cc -w -o ptc ptc.c

install: ptc
	/bin/cp ptc ../bin/

clean:
	/bin/rm -f ptc *.o *.out
