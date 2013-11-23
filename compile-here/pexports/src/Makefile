LEX=flex
YACC+=

CC=gcc

#CFLAGS=-ansi
CFLAGS=-g
#LDFLAGS=
LDFLAGS=-s

all: pexports.exe

HPARSE = hlex.o hparse.o

PEXPORTS=$(HPARSE) pexports.o str_tree.o

pexports.exe: $(PEXPORTS)
	$(CC) -o $@ $(PEXPORTS) $(LDFLAGS)

pexports.o: pexports.c
str_tree.o: str_tree.c
hlex.o: hlex.c hparse.h
hlex.c: hlex.l 
hparse.o: hparse.c
hparse.h: hparse.c
hparse.c: hparse.y
	bison -d $< -o $@

clean:
	$(RM) *.o *.exe hlex.c hparse.c hparse.h
