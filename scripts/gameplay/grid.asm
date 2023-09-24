

draw_level:

	; a = levelID, level pointers a table of words

	rla
	ld l, a
	ld h, 0
	ld de, levels
	add hl, de

	ld a, 0
	ld (total_dilithium), a

	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a

	ld ixl, 0
	ld bc, current_grid_byte 

row_loop:

	ld de, tile_ram_start + row_2 + column_4

	ld a, ixl
	add a,e
	ld e, a

	ld a, d
	add a, 0
	ld d, a

	ld iyh, 0

	ld iyl, 8 
	call byte_loop

	ld iyl, 8 
	call byte_loop

	ld iyl, 3
	call byte_loop

	ld a, grid_rows - 1
	cp ixl
	jp nz, not_last_row

	ld a, tile_grid_last
	jp draw_tile


not_last_row:
	
	ld a, tile_grid_right

draw_tile:

	ld (de), a

	inc ixl

	ld a, grid_rows
	cp ixl

	jp nz, row_loop

	ret


byte_loop:
	
	ld a, (hl)
	ld (bc), a 
                                                                               
bit_loop:
		
	ld a, grid_rows - 1
	cp ixl
	jp nz, not_last

	ld a, tile_grid_bottom
	jp UseBlankTile

not_last:
	ld a, (bc)
	rla
	ld (bc), a

	ld a, tile_grid
	jp nc, UseBlankTile

	ld a, (total_dilithium)
	inc a
	ld (total_dilithium), a

	ld a, tile_dilithium

UseBlankTile:

	ld (de), a

MoveRightOneTile:

	ld   a,e                                                                             
    sub  32                                                                               
    ld   e,a

    ld   a,d                                                                              
    sbc  a,0                                                                               
    ld   d,a 

	dec iyl

	jp nz, bit_loop

	inc hl

	ret
