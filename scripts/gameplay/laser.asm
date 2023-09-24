laser_1_fire:

    
    call sfx_fire

	ld a, 0
    ld b, a

    ld de, droid_position
    ld a, (de)
    add 2
    ld c, a
    ld ix, tile_row_to_sprite_y
    add ix, bc
    ld a, (ix + 0)

    ld iy, sprite1
    ld (iy + spr_y), a
    ld (iy + spr_y + 2), a

    ld a, 4
    ld c, a
    ld ix, tile_column_to_sprite_x
    add ix, bc
    ld a, (ix + 0)
    
    ld (iy + spr_x), a

   ; ld a, (ix + tile_ram_to_sprite_pos_x)

   	add -150
   	ld (iy + spr_x + 2), a

	ret


laser_2_fire:
	   
    call sfx_fire_2

	ld a, 0
    ld b, a


    ld de, droid_position + 1
    ld a, (de)
    add 4
    ld c, a
    ld ix, tile_column_to_sprite_x
    add ix, bc
    ld a, (ix + 0)

    ld iy, sprite3
    ld (iy + spr_x), a
    ld (iy + spr_x + 2), a

    ld a, 2
    ld c, a
    ld ix, tile_row_to_sprite_y
    add ix, bc
    ld a, (ix + 0)
    
    ld (iy + spr_y), a

   ; ld a, (ix + tile_ram_to_sprite_pos_x)

   	add -224
   	ld (iy + spr_y + 2), a

	ret


laser_update:
    
    ld a, (frame_counter)
    and %00001111
    cp 2
    ret c
	ld iy, sprite1

	ld a, (iy + spr_x)
	cp 0
	jp z, NoUpdate1


laser_1:
	
	dec (iy + spr_x)
	dec (iy + spr_x)

	inc (iy + spr_x + 2)
	inc (iy + spr_x + 2)

    ld ix, sprite0
    ld a, (ix + spr_y)
    sub (iy + spr_y)
    add 2
    cp 4
    jp nc, NoHit_1

Hit_1:
    
    ld a, (iy + spr_x)
    sub (ix + spr_x)
    add 2
    cp 4
    jp nc, NoHit_1_L

    jp DidHit


NoHit_1_L:

    ld a, (iy + spr_x + 2)
    sub (ix + spr_x)
    add 2
    cp 4
    jp nc, NoHit_1

    jp DidHit



NoHit_1:


	ld a, (iy + spr_x)
	cp (iy + spr_x + 2)
	jp nc, NoUpdate1


	ld a, 0
	ld (iy + spr_x), a
	ld (iy + spr_x + 2), a



NoUpdate1:
	
	ld iy, sprite3

	ld a, (iy + spr_x)
	cp 0
	ret z

laser2:

	

	dec (iy + spr_y)
	dec (iy + spr_y)

	inc (iy + spr_y + 2)
	inc (iy + spr_y + 2)

    ld ix, sprite0
    ld a, (ix + spr_x)
    sub (iy + spr_x)
    add 2
    cp 4
    jp nc, NoHit_2

Hit_2:
    
    ld a, (iy + spr_y)
    sub (ix + spr_y)
    add 2
    cp 4
    jp nc, NoHit_2_L

    ;call lose_set

    jp DidHit

NoHit_2_L:

    ld a, (iy + spr_y +2)
    sub (ix + spr_y)
    add 2
    cp 4
    jp nc, NoHit_2

    jp DidHit


NoHit_2:


	ld a, (iy + spr_y)
	cp (iy + spr_y + 2)
	ret nc


	ld a, 0
	ld (iy + spr_x), a
	ld (iy + spr_x + 2), a

    ret

DidHit:

    jp lose_set

	