.PHONY: all clean

P2AFLAGS=-map -use_map_attributes -use_structs

all: gbcompo23_splash.c blocks.c subdirs

# Recipes
blocks.c: blocks.png
	png2asset blocks.png -spr8x8 -sw 16 -sh 24 -use_map_attributes -use_structs -keep_palette_order -c blocks.c

# Patterns
%.c: %.png
	png2asset $< $(P2AFLAGS) -c $@

%.png: %.aseprite
	aseprite -b $< --save-as $@

# At the moment some of our inputs are .h, so we will have to manage those manually
clean:
	rm -f *.c *.png

# Make subdirectories
.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@
