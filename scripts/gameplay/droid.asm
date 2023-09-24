


droid_move_time:    equ 6


droid_update:
    
    ld ix, sprite1
    ld a, (ix + spr_x)
    cp 0
    jp nz, check_droid_2
    
check_droid_1:

    ld hl, droid_counter
    ld a, (hl)
    cp 0
    jp z, droid_side_ready

    dec (hl)
    jp check_droid_2

droid_side_ready:


    ld a, droid_move_time
    ld (hl), a

    ld de, droid_position
    ld hl, player_tile_y
    ld a, (de)
    sub (hl)
        
    jp z, droid_fire_1
    jp p, player_above

player_below:
    
     ld a, (de)
     inc a
     ld (de), a

     ld de, (droid_screen_location)
     ld a, blank_tile
     ld (de), a

     inc de
     ld (droid_screen_location), de

     ld a, tile_droid
     ld (de), a

     ld de, (droid_screen_location + 2)
     ld a, blank_tile
     ld (de), a

     inc de
     ld (droid_screen_location + 2), de

     ld a, tile_droid_right
     ld (de), a

 
    ret

player_above:

   
     ld a, (de)
     dec a
     ld (de), a

     ld de, (droid_screen_location)
     ld a, blank_tile
     ld (de), a

     dec de
     ld (droid_screen_location), de

     ld a, tile_droid
     ld (de), a

     ld de, (droid_screen_location + 2)
     ld a, blank_tile
     ld (de), a

     dec de
     ld (droid_screen_location + 2), de

     ld a, tile_droid_right
     ld (de), a

  
check_droid_2:
    
    ld ix, sprite3
    ld a, (ix + spr_x)
    cp 0
    ret nz
    

    ld hl, droid_counter + 1
    ld a, (hl)
    cp 0
    jp z, droid_top_ready

    dec (hl)
    jp exit_droid

droid_top_ready:


    ld a, droid_move_time + 1
    ld (hl), a

    ld de, droid_position + 1
    ld hl, player_tile_x
    ld a, (de)
    sub (hl)
        
    jp z, laser_2_fire
    jp p, player_left

player_right:
    
     ld a, (de)
     inc a
     ld (de), a

     ld de, (droid_screen_location + 4)
     ld a, blank_tile
     ld (de), a

     ld a, e
     sub 32
     ld e, a

     ld a, d
     sbc 0
     ld d, a


     ld (droid_screen_location + 4), de

     ld a, tile_droid_down
     ld (de), a

     ld de, (droid_screen_location + 6)
     ld a, blank_tile
     ld (de), a

     ld a, e
     sub 32
     ld e, a

     ld a, d
     sbc 0
     ld d, a
     ld (droid_screen_location + 6), de

     ld a, tile_droid_up
     ld (de), a

 
    ret

player_left:

     ld a, (de)
     dec a
     ld (de), a

     ld de, (droid_screen_location + 4)
     ld a, blank_tile
     ld (de), a

     ld a, e
     add 32
     ld e, a

     ld a, d
     adc 0
     ld d, a

     ld (droid_screen_location + 4), de

     ld a, tile_droid_down
     ld (de), a

     ld de, (droid_screen_location + 6)
     ld a, blank_tile
     ld (de), a

     ld a, e
     add 32
     ld e, a

     ld a, d
     adc 0
     ld d, a
     ld (droid_screen_location + 6), de

     ld a, tile_droid_up
     ld (de), a

exit_droid:
    ret




droid_fire_1:

    

    jp laser_1_fire
    
   

droid_initialise:
	
droid_1_start_row		equ row_22
droid_2_start_column  	equ column_8

	 ld hl, tile_ram_start + column_3 + droid_1_start_row
     ld (droid_screen_location), hl

     ld a, tile_droid
     ld (hl), a

     ld hl, tile_ram_start + column_24 + droid_1_start_row
     ld (droid_screen_location + 2),hl

     ld a, tile_droid_right
     ld (hl), a

     ld hl, tile_ram_start + droid_2_start_column + row_1
     ld (droid_screen_location + 4), hl

     ld a, tile_droid_down
     ld hl, (droid_screen_location + 4)
     ld (hl), a

     ld hl, tile_ram_start + droid_2_start_column + row_31
     ld (droid_screen_location + 6), hl

     ld a, tile_droid_up
     ld (hl), a

     ld de, droid_position
     ld a, 20
     ld (de), a

     inc de
     ld a, 4
     ld (de), a



     ld hl, pallete_ram_start  +column_3 + row_2
     ld de, pallete_ram_start + column_24 + row_2

     ld a, grid_rows - 1
     ld b, a
     ld a, colour_droid_1

colourLoop1:
	 
	 ld (hl), a
	 ld (de), a

	 inc hl
	 inc de

	 djnz colourLoop1
	 

	 ld hl, pallete_ram_start  +column_4 + row_1
     ld de, pallete_ram_start + column_4 + row_31


     ld a, grid_columns - 1
     ld b, a
     ld ixl, colour_droid_2

colourLoop2:

	 ld a, ixl

 	 ld (hl), a
	 ld (de), a

     ld a, l
     sub 32
     ld l, a

     ld a, h
     sbc 0
     ld h, a

     ld a, e
     sub 32
     ld e, a

     ld a, d
     sbc 0
     ld d, a

     djnz colourLoop2



	ret