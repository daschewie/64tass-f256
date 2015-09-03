SHELL = /bin/sh
CC = gcc
OBJ = 64tass.o opcodes.o misc.o avl.o my_getopt.o eval.o error.o section.o encoding.o ternary.o file.o values.o variables.o mem.o isnprintf.o macro.o obj.o floatobj.o addressobj.o codeobj.o strobj.o listobj.o boolobj.o bytesobj.o intobj.o bitsobj.o functionobj.o instruction.o unicode.o unicodedata.o listing.o registerobj.o dictobj.o namespaceobj.o operobj.o gapobj.o typeobj.o noneobj.o longjump.o
LIBS = -lm
LANG = C
REVISION := $(shell svnversion | grep "^[1-9]" || echo "992?")
CFLAGS = -pipe -O2 -W -Wall -Wextra -Wwrite-strings -Wshadow -fstrict-aliasing -DREVISION="\"$(REVISION)\"" -g -Wstrict-aliasing=2 -Werror=missing-prototypes
LDFLAGS = -g
CFLAGS += $(LDFLAGS)
TARGET = 64tass
PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin

.SILENT:

all: $(TARGET) README

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LIBS)


README: README.html
	-sed -e 's/&larr;/<-/g;s/&hellip;/.../g;s/&lowast;/*/g;s/&minus;/-/g;s/&ndash;/-/g;' README.html | w3m -T text/html -dump -no-graph | sed -e 's/\s\+$$//' >README

64tass.o: 64tass.c 64tass.h inttypes.h wait_e.h error.h errors_e.h \
 libtree.h obj.h opcodes.h misc.h eval.h values.h section.h mem.h \
 encoding.h file.h variables.h macro.h instruction.h unicode.h \
 unicodedata.h listing.h listobj.h codeobj.h strobj.h floatobj.h \
 addressobj.h boolobj.h bytesobj.h intobj.h bitsobj.h functionobj.h \
 namespaceobj.h operobj.h gapobj.h typeobj.h noneobj.h
addressobj.o: addressobj.c addressobj.h obj.h inttypes.h values.h error.h \
 errors_e.h libtree.h eval.h variables.h boolobj.h strobj.h intobj.h \
 operobj.h typeobj.h noneobj.h
avl.o: avl.c libtree.h
bitsobj.o: bitsobj.c bitsobj.h obj.h inttypes.h eval.h variables.h \
 unicode.h unicodedata.h encoding.h libtree.h errors_e.h boolobj.h \
 values.h floatobj.h codeobj.h error.h strobj.h bytesobj.h intobj.h \
 listobj.h operobj.h typeobj.h noneobj.h
boolobj.o: boolobj.c eval.h obj.h inttypes.h boolobj.h values.h \
 floatobj.h strobj.h error.h errors_e.h libtree.h bytesobj.h bitsobj.h \
 intobj.h operobj.h typeobj.h variables.h
bytesobj.o: bytesobj.c bytesobj.h obj.h inttypes.h eval.h unicode.h \
 unicodedata.h encoding.h libtree.h errors_e.h variables.h boolobj.h \
 values.h floatobj.h codeobj.h intobj.h strobj.h bitsobj.h listobj.h \
 operobj.h typeobj.h noneobj.h error.h
codeobj.o: codeobj.c codeobj.h obj.h inttypes.h values.h eval.h mem.h \
 64tass.h wait_e.h section.h libtree.h variables.h error.h errors_e.h \
 boolobj.h floatobj.h namespaceobj.h listobj.h intobj.h bitsobj.h \
 bytesobj.h operobj.h gapobj.h typeobj.h noneobj.h
dictobj.o: dictobj.c dictobj.h obj.h inttypes.h values.h libtree.h eval.h \
 error.h errors_e.h variables.h intobj.h listobj.h strobj.h boolobj.h \
 operobj.h typeobj.h noneobj.h
encoding.o: encoding.c encoding.h libtree.h inttypes.h errors_e.h error.h \
 obj.h ternary.h misc.h 64tass.h wait_e.h unicode.h unicodedata.h \
 strobj.h bytesobj.h typeobj.h values.h
error.o: error.c error.h inttypes.h errors_e.h libtree.h obj.h misc.h \
 file.h variables.h 64tass.h wait_e.h macro.h strobj.h unicode.h \
 unicodedata.h addressobj.h values.h registerobj.h namespaceobj.h \
 operobj.h typeobj.h eval.h
eval.o: eval.c eval.h obj.h inttypes.h file.h libtree.h section.h mem.h \
 encoding.h errors_e.h macro.h wait_e.h variables.h 64tass.h misc.h \
 unicode.h unicodedata.h listing.h error.h values.h floatobj.h boolobj.h \
 intobj.h bitsobj.h strobj.h codeobj.h bytesobj.h addressobj.h listobj.h \
 dictobj.h registerobj.h namespaceobj.h operobj.h gapobj.h typeobj.h \
 noneobj.h
file.o: file.c file.h inttypes.h libtree.h misc.h 64tass.h wait_e.h \
 unicode.h unicodedata.h error.h errors_e.h obj.h strobj.h
floatobj.o: floatobj.c floatobj.h obj.h inttypes.h values.h error.h \
 errors_e.h libtree.h eval.h variables.h boolobj.h codeobj.h strobj.h \
 bytesobj.h intobj.h bitsobj.h operobj.h typeobj.h noneobj.h
functionobj.o: functionobj.c isnprintf.h inttypes.h functionobj.h obj.h \
 values.h eval.h misc.h variables.h floatobj.h strobj.h error.h \
 errors_e.h libtree.h listobj.h intobj.h boolobj.h operobj.h typeobj.h \
 noneobj.h
gapobj.o: gapobj.c gapobj.h obj.h inttypes.h error.h errors_e.h libtree.h \
 eval.h variables.h strobj.h operobj.h intobj.h values.h boolobj.h \
 typeobj.h noneobj.h
instruction.o: instruction.c instruction.h inttypes.h opcodes.h obj.h \
 64tass.h wait_e.h misc.h section.h libtree.h mem.h file.h listing.h \
 error.h errors_e.h addressobj.h values.h listobj.h registerobj.h \
 codeobj.h typeobj.h longjump.h
intobj.o: intobj.c intobj.h obj.h inttypes.h values.h unicode.h \
 unicodedata.h encoding.h libtree.h errors_e.h error.h eval.h variables.h \
 boolobj.h floatobj.h codeobj.h strobj.h bytesobj.h bitsobj.h operobj.h \
 typeobj.h noneobj.h
isnprintf.o: isnprintf.c isnprintf.h inttypes.h unicode.h unicodedata.h \
 eval.h obj.h floatobj.h values.h strobj.h intobj.h typeobj.h noneobj.h \
 error.h errors_e.h libtree.h
listing.o: listing.c listing.h inttypes.h file.h libtree.h error.h \
 errors_e.h obj.h 64tass.h wait_e.h opcodes.h unicode.h unicodedata.h \
 misc.h section.h mem.h instruction.h values.h
listobj.o: listobj.c listobj.h obj.h inttypes.h values.h eval.h \
 variables.h boolobj.h error.h errors_e.h libtree.h codeobj.h strobj.h \
 intobj.h operobj.h typeobj.h noneobj.h
longjump.o: longjump.c longjump.h libtree.h inttypes.h section.h mem.h \
 error.h errors_e.h obj.h
macro.o: macro.c macro.h obj.h inttypes.h wait_e.h misc.h file.h \
 libtree.h eval.h values.h section.h mem.h variables.h 64tass.h listing.h \
 error.h errors_e.h listobj.h typeobj.h noneobj.h namespaceobj.h
mem.o: mem.c mem.h inttypes.h error.h errors_e.h libtree.h obj.h file.h \
 misc.h 64tass.h wait_e.h listing.h
misc.o: misc.c misc.h inttypes.h 64tass.h wait_e.h opcodes.h getopt.h \
 my_getopt.h section.h libtree.h mem.h longjump.h encoding.h errors_e.h \
 file.h eval.h obj.h variables.h ternary.h unicode.h unicodedata.h \
 error.h values.h codeobj.h namespaceobj.h
my_getopt.o: my_getopt.c my_getopt.h unicode.h inttypes.h unicodedata.h
namespaceobj.o: namespaceobj.c namespaceobj.h obj.h inttypes.h libtree.h \
 variables.h eval.h intobj.h values.h listobj.h error.h errors_e.h \
 strobj.h operobj.h typeobj.h noneobj.h
noneobj.o: noneobj.c noneobj.h obj.h inttypes.h error.h errors_e.h \
 libtree.h eval.h typeobj.h values.h
obj.o: obj.c variables.h inttypes.h obj.h misc.h section.h libtree.h \
 mem.h 64tass.h wait_e.h eval.h error.h errors_e.h values.h boolobj.h \
 floatobj.h strobj.h macro.h intobj.h listobj.h namespaceobj.h \
 addressobj.h codeobj.h registerobj.h bytesobj.h bitsobj.h functionobj.h \
 dictobj.h operobj.h gapobj.h typeobj.h noneobj.h
opcodes.o: opcodes.c opcodes.h
operobj.o: operobj.c operobj.h obj.h inttypes.h strobj.h typeobj.h
registerobj.o: registerobj.c registerobj.h obj.h inttypes.h values.h \
 error.h errors_e.h libtree.h eval.h opcodes.h variables.h boolobj.h \
 strobj.h intobj.h operobj.h typeobj.h noneobj.h
section.o: section.c unicode.h inttypes.h unicodedata.h section.h \
 libtree.h mem.h error.h errors_e.h obj.h misc.h 64tass.h wait_e.h \
 values.h intobj.h longjump.h
strobj.o: strobj.c strobj.h obj.h inttypes.h eval.h misc.h unicode.h \
 unicodedata.h error.h errors_e.h libtree.h variables.h boolobj.h \
 values.h floatobj.h bytesobj.h intobj.h bitsobj.h listobj.h operobj.h \
 typeobj.h noneobj.h
ternary.o: ternary.c ternary.h unicode.h inttypes.h unicodedata.h error.h \
 errors_e.h libtree.h obj.h
typeobj.o: typeobj.c typeobj.h obj.h inttypes.h variables.h eval.h \
 error.h errors_e.h libtree.h strobj.h operobj.h intobj.h values.h \
 boolobj.h listobj.h noneobj.h
unicodedata.o: unicodedata.c unicodedata.h
unicode.o: unicode.c unicode.h inttypes.h unicodedata.h error.h \
 errors_e.h libtree.h obj.h
values.o: values.c values.h inttypes.h obj.h unicode.h unicodedata.h \
 error.h errors_e.h libtree.h strobj.h typeobj.h noneobj.h variables.h
variables.o: variables.c unicode.h inttypes.h unicodedata.h variables.h \
 obj.h misc.h 64tass.h wait_e.h file.h libtree.h boolobj.h values.h \
 floatobj.h error.h errors_e.h namespaceobj.h strobj.h codeobj.h \
 registerobj.h functionobj.h listobj.h intobj.h bytesobj.h bitsobj.h \
 dictobj.h addressobj.h gapobj.h typeobj.h noneobj.h

.PHONY: all clean distclean install install-strip uninstall

clean:
	-rm -f $(OBJ)

distclean: clean
	-rm -f $(TARGET)

install: $(TARGET)
	install -D $(TARGET) $(BINDIR)/$(TARGET)

install-strip: $(TARGET)
	install -D -s $(TARGET) $(BINDIR)/$(TARGET)

uninstall:
	-rm $(BINDIR)/$(TARGET)
