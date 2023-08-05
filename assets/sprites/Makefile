.PHONY: all clean

P2AFLAGS=-spr8x8 -use_structs -keep_palette_order
SOURCES=$(wildcard *.aseprite)

all: $(SOURCES:.aseprite=.c)

# Patterns
%.c: %.png
	png2asset $< $(P2AFLAGS) -c $@

%.png: %.aseprite
	aseprite -b $< --save-as $@

clean:
	rm -f *.c *.png
