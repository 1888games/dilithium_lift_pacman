


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fills an entire row in either the top or
; bottom border with the value in a
; a contains tile/pallete number to write
; b contains number of tiles to fill
; hl contains tile ram or palette
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_border_area_row:
.write                         ld        (hl),a                                                                        ;store value at current address
        dec hl                                                                                ;move right one column
            djnz .write                                                                        ;loop back if we have more to do
        ret
        
clear_tile_ram:

        ld  a,$40                                                                    ;tile number of empty tile
        ld  hl,tile_ram_start                                                ;clear video ram
        ld  de,tile_ram_start + 1
        ld  bc,$3ff                                                                        ;1k of tile ram
        ld  (hl),a                                                                        ;clear (hl), which then gets copied through to de
        ldir     
        ret   


clear_colour_ram:

                                                                       ;pallete 1
        ld  hl,pallete_ram_start                                        ;set all colour ram to palette 1
        ld  de,pallete_ram_start + 1
        ld  bc,$3ff                                                                        ;1k of palette ram
        ld  (hl),a                                                                        ;clear (hl), which then gets copied through to de
        ldir                                                                                ;copy from hl to de, decrementing bc, keep doing until bc = 0

        ret

     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; xor's an entire row in either the top or
; bottom border with the a value
; b contains number of tiles to fill
; c contains value to xor
; hl contains tile ram or palette
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor_border_area_row:
.write                         
        ld a,c                                                                                ;load xor mask
        xor (hl)                                                                        ;xor with current tile/pallete addr contents
        ld        (hl),a                                                                        ;write new value
        dec hl                                                                                ;move right one column
            djnz .write                                                                        ;loop back if we have more to do
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fills the entire screen pallete ram with given pallete number
; a contains pen colour to fill tiles with
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_screen_area_colour:
        ld        hl,pallete_ram_main                                                ;colour ram
            ld        de,pallete_ram_main + 1                                        ;one on from hl so we effectively drag the value at hl through vram
            ld        bc,$37f                                                                        ;all but one address needed as we manually set the first one below
            ld        (hl),a                                                                        ;write first value to hl
            ldir                                                                                ;copy (hl) -> (de), inc hl, inc de, dec bc, loop until bc = 0
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; a contains tile number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_screen_area_working_slow:
        ld        hl,tile_ram_play_area                                        ;tile ram
            ld        de,tile_ram_play_area + 1                                ;one on from hl so we effectively drag the value at hl through vram
            ld        bc,$37f                                                                        ;all but one address needed as we manually set the first one below
            ld        (hl),a                                                                        ;write first value to hl
            ldir                                                                                ;copy (hl) -> (de), inc hl, inc de, dec bc, loop until bc = 0
        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fills a row with given tile/pallete
; hl holds start address to fill
; a holds the tile/palette colour to use
; b holds number of tiles/palettes to draw
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_screen_area_row:
        ld de,-32                                                                        ;skip between columns 32 bytes down to move right
.write_loop:        
        ld (hl),a                                                                        ;store tile/pallete value 
        add hl,de                                                                        ;move right (back 32 bytes)
        djnz .write_loop                                                        ;have we done the correct number of writes?
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; xor's a row with given value - useful for flashing tiles
; hl holds start address to fill
; b holds number of tiles/palettes to draw
; c holds value to xor with tile/pallete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor_screen_area_row:
        ld de,-32                                                                        ;skip between columns 32 bytes down to move right
.write_loop:        
        ld a,c                                                                                ;load c into
        xor (hl)                                                                        ;and xor value at hl with a
        ld (hl),a                                                                        ;store tile/pallete value 
        add hl,de                                                                        ;move right (back 16 bytes)
        djnz .write_loop                                                        ;have we done the correct number of writes?
        ret




random:
        push    hl
        push    de
        ld      hl,(rand_data)
        ld      a,r
        ld      d,a
        ld      e,(hl)
        add     hl,de
        add     a,l
        xor     h
        ld      (rand_data),hl
        pop     de
        pop     hl
        ret