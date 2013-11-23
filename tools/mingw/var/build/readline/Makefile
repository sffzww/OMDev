prefix = /mingw
CFLAGS = -O2 -fnative-struct
LDFLAGS = -L. -lreadline
CC = gcc
PACKAGE = readline
SOURCES = bind.c histexpand.c keymaps.c rltty.c tilde.c callback.c \
 histfile.c kill.c savestring.c undo.c complete.c history.c macro.c \
 search.c util.c display.c histsearch.c nls.c shell.c input.c \
 parens.c signals.c vi_mode.c funmap.c isearch.c readline.c \
 terminal.c xmalloc.c compat.c
INSTALLED_HEADERS = readline.h chardefs.h keymaps.h history.h \
 tilde.h rlstdc.h rlconf.h rltypedefs.h
MKDIR = mkdir -p
INSTALL = install

OBJECTS = $(SOURCES:.c=.lo)
TARGETS = lib$(PACKAGE).a lib$(PACKAGE).dll rlversion.exe rltest.exe \
 fileman.exe tilde.exe rl.exe histexamp.exe
DEFS = -I. -DNDEBUG -DHAVE_CONFIG_H

all: $(TARGETS)

clean:
	rm -f $(OBJECTS) *.o *~ $(TARGETS) examples/*.o examples/*~

install: all
	$(MKDIR) $(prefix)/lib $(prefix)/bin $(prefix)/include/readline
	$(MKDIR) $(prefix)/info $(prefix)/man/man3
	$(INSTALL) lib$(PACKAGE).a $(prefix)/lib/
	$(INSTALL) lib$(PACKAGE).dll $(prefix)/bin/
	$(INSTALL) rlversion.exe rl.exe $(prefix)/bin/
	$(INSTALL) $(INSTALLED_HEADERS) $(prefix)/include/readline/
	$(INSTALL) doc/history.info $(prefix)/info/
	$(INSTALL) doc/readline.info $(prefix)/info/
	$(INSTALL) doc/rluserman.info $(prefix)/info/
	$(INSTALL) doc/readline.3 doc/history.3 $(prefix)/man/man3/

lib$(PACKAGE).a: lib$(PACKAGE).dll

lib$(PACKAGE).dll: $(OBJECTS)
	$(CC) $(CFLAGS) -shared -o $@ -Wl,--out-implib=lib$(PACKAGE).a $(OBJECTS)

rlversion.exe: examples/rlversion.o
	$(CC) $(CFLAGS) $(DEFS) -o $@ $< $(LDFLAGS)

rltest.exe: examples/rltest.o
	$(CC) $(CFLAGS) $(DEFS) -o $@ $< $(LDFLAGS)

fileman.exe: examples/fileman.o xmalloc.o
	$(CC) $(CFLAGS) $(DEFS) -o $@ $< xmalloc.o $(LDFLAGS)

histexamp.exe: examples/histexamp.o
	$(CC) $(CFLAGS) $(DEFS) -o $@ $< $(LDFLAGS)

rl.exe: examples/rl.o
	$(CC) $(CFLAGS) $(DEFS) -o $@ $< $(LDFLAGS) -liberty

tilde.exe: tilde.c shell.o xmalloc.o
	$(CC) $(CFLAGS) $(DEFS) -DTEST -o $@ $< shell.o xmalloc.o

%.lo: %.c
	$(CC) $(CFLAGS) $(DEFS) -D__READLINE_EXPORT__ -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) $(DEFS) -DREADLINE_LIBRARY -D__READLINE_IMPORT__ -c $< -o $@

.SUFFIXES: .c .dll .lo .a .o
.PHONY: all clean install
