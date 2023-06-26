#include <stdbool.h>
#include <gb/gb.h>
#include <gb/cgb.h>
#include "assets/gbcompo23_splash.h"

int main() {
    set_bkg_palette(0, gbcompo23_splash.tiles->num_pals, (uint16_t*)gbcompo23_splash.tiles->pals);
    set_bkg_data(0, gbcompo23_splash.tiles->num_frames, gbcompo23_splash.tiles->data);
    VBK_REG = VBK_TILES;
    set_bkg_tiles(0, 0, gbcompo23_splash.width, gbcompo23_splash.height, gbcompo23_splash.data);
    VBK_REG = VBK_ATTRIBUTES;
    set_bkg_tiles(0, 0, gbcompo23_splash.width, gbcompo23_splash.height, gbcompo23_splash.attributes);
    SHOW_BKG;
    enable_interrupts();
    DISPLAY_ON;
    while (true) {
        wait_vbl_done();
        delay(5);
    }
    return 0;
}
