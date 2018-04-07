# Makefile for PT and S/SL 
# Usage:  make 

all:
	cd cmd; make $(ACTION)
	cd parser; make $(ACTION)
	cd semantic; make $(ACTION)
	cd coderlinux; make $(ACTION)
	cd ptruntimelinux; make $(ACTION)
# Don't make PT interpreter as it's not part of the project.
#	cd ptam; make $(ACTION)          

scanner:
	cd cmd; make $(ACTION)
	cd parser; make scanner

semant:
	cd cmd; make $(ACTION)
	cd parser; make
	cd semantic; make

install: 
	make all ACTION=install

clean:
	make all ACTION=clean
	/bin/rm -f bin/pt* lib/pt/* 
