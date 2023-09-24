
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; takes a wasteful raw tilemap and copies to tile ram
; hl contains addr of raw tilemap data
; map in this format needs a byte per tile and therefore takes up 896 bytes of rom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_raw_map_to_screen:
            ld        de,tile_ram_play_area                                        ;main draw area of screen
            ld        bc,$380                                                                        ;copy 896 bytes raw
            ldir                                                                                ;(hl) -> (de) inc hl, inc de, dec bc, stop if bc = 0        
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sp contains address +1 to push 2 tiles into
; it's quicker to use stack pointer to push 2 bytes than using (hl) and increment
; de gets destroyed
; b contains full block to use
; a contains bitmap for tiles
; 2 leftmost bits are dropped into carry for testing
; to be used as a block of 4 macro calls to process an entire byte (8 rows)
; need 4 of these blocks to complete an entire column
; 
; Macro's allow us to create unrolled loops, this processes two bits of data
; they have to be populated with local labels as the code is substituted by the assembler
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tile_empty_block:                equ $0f
tile_full_block:                equ $0e


        MACRO DECODE_AND_PUSH_TWO_TILES                                                                                                                                        
        add a                                                                                ;get msb into carry                                                
        jp c,.fullfirst                                                                ;is it a block (1)                                                
        ld d,tile_empty_block                                                ;no so set empty tile                                        
        jp .next                                                                        ;look at next bit                                                
.fullfirst:                ld d,b                                                                                ;set first to a full tile                                


.next:                        add a                                                                                ;get msb into carry for msb                                
        jp c,.fullnext                                                                ;is it a block (1)                                                
        ld e,tile_empty_block                                                ;no sp set set 2nd tile to empty tile        
        jp .pushnow                                                                        ;go and perform the push                                
.fullnext:                ld e,b                                                                                ;set second tile to full tile                        
.pushnow:                push de                                                                                ;store the tiles on screen                                
        ENDM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this draws a column at a time in reverse (bottom to top) to take advantage of stack pushes
; takes a bitmap encoded pixel map and renders to screen in solid tiles
; on entry hl holds address of pixel map
; a holds tile to use in place of block
; $0e is a full block
; $7f is hash and $8f is checker pattern
; uses the macro above 4 times - to process a full byte of data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_pixel_map_to_screen:
        ld (save_sp),sp                                                                ;save stack pointer as we are going to use it to store to tile ram
        ld (full_tile),a                                                        ;save full tile
        ld sp,tile_ram_play_area_last + 1                        ;set stack pointer to end of main video area + 1 - as push will pre decrement the address
        ld b,28 * 4                                                                        ;28 columns of data to process 4 bytes per column
.process_byte:        
        ld a,b                                                                                ;copy a to b to move to ram
        ld (save_reg),a                                                                ;temporarily store b
        ld a,(full_tile)                                                        ;get full tile
        ld b,a                                                                                ;and put in b
        
        ld a,(hl)                                                                        ;load bitmap for next eight blocks from map
        inc hl                                                                                ;move to next bitmap ready for next loop
                                                                                                
                                                                                                ;use 4 copies of the macro to process entire byte
        DECODE_AND_PUSH_TWO_TILES                                        ;process bits 7 and 6
        DECODE_AND_PUSH_TWO_TILES                                        ;process bits 5 and 4
        DECODE_AND_PUSH_TWO_TILES                                        ;process bits 3 and 2
        DECODE_AND_PUSH_TWO_TILES                                        ;process bits 1 and 0
        
        ld a,(save_reg)                                                                ;get saved value
        ld b,a                                                                                ;restore b
        djnz .process_byte                                                        ;loop to process next byte of map if b is not zero
        ld sp,(save_sp)                                                                ;restore stack pointer
        ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; show pacman maze for start of intro
; this is not used but shows how to use a raw map (in this case pac_map_raw:)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;some constants
playerone_txt_pallete:        equ $468c
getready_txt_pallete:        equ $4652
