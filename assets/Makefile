.PHONY: all clean

P2AFLAGS=-map -use_map_attributes -use_structs

all: gbcompo23_splash.c

# Patterns
%.c: %.png
	png2asset $< $(P2AFLAGS) -c $@

%.png: %.aseprite
	aseprite -b $< --save-as $@

# At the moment some of our inputs are .h, so we will have to manage those manually
clean:
	rm -f *.c
