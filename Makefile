prefix ?= /usr/local
MANDIR?=$(prefix)/share/man/man1
INSTALL_PROGRAM?=install -m 0755
INSTALL_FILE?=install -m 0644

CFLAGS=-W -Wall -O2
LDFLAGS=-lncurses

all: e

debug: CFLAGS=-g -W -Wall -O0
debug: e

e: e.c
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

install: e
	$(INSTALL_PROGRAM) -s e $(prefix)/bin/e
	$(INSTALL_FILE) e.1 $(MANDIR)/e.1

clean:
	rm -rf e
