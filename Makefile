BINARY=game.gbc
SOURCES=main.c SPLASH.c
# Toolchain
CC=lcc

# The total number of flags used by lcc is phenomenal and I'm not sure if it's
# worth all this effort just for Make dependencies

CPPFLAGS=
CFLAGS=-Wf--std-sdcc2x -msm83:gb -autobank -debug -v
#BANKFLAGS=-mbc5 -cartsize -ext=.rel
LDFLAGS=-Wm-yC -Wm-yt5 -debug
LDLIBS=
# Gameboy Color (only), MBC5, auto rom banks, 1 ram bank
#MAKEBINFLAGS=-Z -yC -yt5 -yoA -ya1 -ynGAME

# Dependencies
.PHONY: all clean

all: $(BINARY)

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
