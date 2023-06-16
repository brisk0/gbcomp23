#include <stdbool.h>
#include <gb/gb.h>
#include <gb/cgb.h>
#include "SPLASH.h"

int main() {
    set_bkg_palette(0, SPLASH_PALETTE_COUNT, SPLASH_palettes);
    set_bkg_data(0, SPLASH_TILE_COUNT, SPLASH_tiles);
    VBK_REG = VBK_TILES;
    set_bkg_tiles(0, 0, SPLASH_MAP_ATTRIBUTES_WIDTH, SPLASH_MAP_ATTRIBUTES_HEIGHT, SPLASH_map);
    VBK_REG = VBK_ATTRIBUTES;
    set_bkg_tiles(0, 0, SPLASH_MAP_ATTRIBUTES_WIDTH, SPLASH_MAP_ATTRIBUTES_HEIGHT, SPLASH_map_attributes);
    SHOW_BKG;
    enable_interrupts();
    DISPLAY_ON;
    while (true) {
        wait_vbl_done();
        delay(5);
    }
    return 0;
}
