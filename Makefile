prefix ?= /usr/local
CFLAGS=-W -Wall -O2
LDFLAGS=-lncurses

all: e

debug: CFLAGS=-g -W -Wall -O0
debug: e

e:
	$(CC) $(CFLAGS) $(LDFLAGS) -o e e.c

install: e
	install -s e $(prefix)/bin/e

clean:
	rm -rf e
