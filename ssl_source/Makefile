DEFS=
SHELL=		/bin/sh
CC=		cc
COPTS=		-g -Bstatic
BIN=	/local/bin
CFLAGS=		$(COPTS) $(DEFS) $(INCL)

ssl:	ssl.c
	$(CC) $(CFLAGS) -I../include -o ssl ssl.c

test:	ssl
	./ssl ssl.ssl
	diff ssl.sst.c ssl:sst.c
	diff ssl.sst.h ssl:sst.h

install:	ssl
	install -s -m 755 ssl $(BIN)

clean:
	-rm -f ssl ssl.sst.c ssl.sst.h ssl.o ssl.entry Makefile.bak
