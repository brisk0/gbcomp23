BINARY=game.gbc
SOURCES=main.c SPLASH.c $(wildcard assets/*.c)
SUBDIRS=assets
# Toolchain
CC=lcc

CPPFLAGS=
CFLAGS=-Wf--std-sdcc2x -msm83:gb -autobank -debug -v
LDFLAGS=-Wm-yC -Wm-yt5 -debug
LDLIBS=

# Dependencies
.PHONY: all clean

all: $(BINARY)

# Make subdirectories
.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

clean:
	rm -f *.d *.o *.asm *.ihx *.lst *.sym *.gbc *.adb *.noi *.map *.cdb

$(BINARY): $(SOURCES:.c=.o)

%.gbc:
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Generate (and regenerate) prerequisites
# https://www.gnu.org/software/make/manual/html_node/Automatic-Prerequisites.html
%.d: %.c
	set -e; rm -f $@
	$(CC) -Wp-MM -c $(CPPFLAGS) $< -o $@
	sed -i 's,\($*\)\.rel[ :]*,\1.o $@ : ,g' $@

include $(SOURCES:.c=.d)
