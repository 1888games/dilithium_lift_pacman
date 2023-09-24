;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; picks up joystick moves
; sets appropriate sprite for horizontal and vertical movement
; and sets flip bits to show sprite correctly
; also alters sprite position by one pixel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



player_initialise:

        ld a, 9
        ld hl, player_tile_x
        ld (hl), a

        ld a, 14
        ld hl, player_tile_y
        ld (hl), a
     
        ld a, 255
        ld hl, player_moving
        ld (hl), a

        ld hl, tile_ram_start + column_13 + row_16
        ld (player_screen_location), hl

        ret



player_one_movement:

        ld ix, sprite0 
        ld iy, target_move
        ld hl, player_moving
        

        ld a, (hl)
        cp 0
        jp m, .checkJoystick

        ld de, frame_counter
        ld a, (de)
        and %00000011
        jp nz, .canMove    

        ld a, (de)
        and %00000100
        jp nz, .exit

        ld de, player_frame
        ld a, (de)
        inc a
        cp 4
        jp nz, .noWrap

        ld a, 0

.noWrap:
        
        ld (de), a
        ret

.canMove:     
        
        ld de, player_frame
        ld a, (de)
        sla a
        sla a
        ld b, a

        ld de, player_start_frame
        ld a, (de)
        add a, b
        ld (ix), a
       
        ld a, (hl)
        cp 0
        jp z, .movingLeft

        cp RIGHT
        jp z, .movingRight

        cp UP
        jp z, .movingUp

      

.movingDown:
        
        dec (ix + spr_y)    
        dec (ix + spr_y)  

      
        dec (iy)

        jp nz, .exit
 
        ld a, 255
        ld (hl), a

        ld ix,player_tile_y
        inc (ix)

        ld hl, player_screen_location
        ld a, (hl)
        add $1
        ld (hl), a

        ret



.movingUp:
        
        inc (ix + spr_y)    
        inc (ix + spr_y)  

        dec (iy)

        jp nz, .exit
 
        ld a, 255
        ld (hl), a

        ld ix,player_tile_y
        dec (ix)

        ld hl, player_screen_location
        ld a, (hl)
        sub $1
        ld (hl), a

       // ld a, tile_dilithium
      //  ld hl, (player_screen_location)
       // ld (hl), a

        ret


.movingRight:
        
        dec (ix + spr_x)    
        dec (ix + spr_x)  

        dec (iy)

        jp nz, .exit
 
        ld a, 255
        ld (hl), a

        ld ix,player_tile_x
        inc (ix)

        ld hl, (player_screen_location)
        ld   a,l                                                                           
        sub  32                                                                               
        ld   l,a

        ld   a,h                                                                              
        sbc  a,0                                                                               
        ld   h,a

        ld (player_screen_location), hl



        ret

.movingLeft:
                                                                        ;point to sprite0 data block
        inc (ix + spr_x)    
        inc (ix + spr_x)  

        dec (iy)

        jp nz, .exit
 
        ld a, 255
        ld (hl), a

        ld ix,player_tile_x
        dec (ix)


        
        ld hl, (player_screen_location)
        ld   a,l                                                                           
        add  32                                                                               
        ld   l,a

        ld   a,h                                                                              
        adc  a,0                                                                               
        ld   h,a

        ld (player_screen_location), hl



.exit:       
        ret



.checkJoystick:

        ld a,(joystick_state)                                                ;get joystick state
        ld b,a                                                                                ;and save in b
        and inp_chk_left                                                        ;examine left
        and a                                                                                ;check for pressed 
        jp nz,.right                                                                ;not held held 0 means pressed

        ld hl, player_tile_x
        ld a, (hl)
        cp 1
        jp z, .upndown

.doLeft:
        ld a, LEFT
        ld hl, player_moving
        ld (hl), a

        ld a, 4
        ld hl, target_move
        ld (hl), a

        ld a,$4*4        
        ld iy, player_start_frame
        ld (iy),a                                                                        ;set horizontal tank sprite

        ret


.right:                        ld a,b                                                                                ;get state again
        and inp_chk_right                                                        ;examine right
        and a                                                                                ;check if pressed
        jp nz,.upndown                                                                ;it's non zero so isn't pressed


        ld hl, player_tile_x
        ld a, (hl)
        cp 18
        jp z, .upndown

.doRight:

        ld a, RIGHT
        ld hl, player_moving
        ld (hl), a

        ld a, 4
        ld hl, target_move
        ld (hl), a


        ld a,$0*4                                                                        ;horizontal tank *4 to get sprite number in top 6 bits
        ld iy, player_start_frame
        ld (iy),a                                                                        ;set horizontal tank sprite

        ret
   


.upndown:                
        ld a,b                                                                                ;get state again
        and inp_chk_up                                                                ;examine up
        and a                                                                                ;check if pressed
        jp nz,.down                                                                        ;it's non zero so isn't pressed


.doUp:

        ld hl, player_tile_y
        ld a, (hl)
        cp 1
        jp z, .exit

        ld a, UP
        ld hl, player_moving
        ld (hl), a

        ld a, 4
        ld hl, target_move
        ld (hl), a


        ld a,$8*4                                                                        ;vertical tank *4 to get sprite number in top 6 bits                                                                       ;set vertical tank sprite
        ld iy, player_start_frame
        ld (iy),a                                                                        ;set horizontal tank sprite
                                                              ;no flip y - set to 0 - clear
        ret                                                                                        ;don't bother checker down


.down:  ld a,b                                                                                ;get state again
        and inp_chk_down                                                        ;examine down
        and a                                                                                ;check if pressed
        ret nz                                                                                ;it's non zero so isn't pressed so finish

        ld hl, player_tile_y
        ld a, (hl)
        cp grid_rows - 2
        jp z, .exit

.doDown:

        ld a, DOWN
        ld hl, player_moving
        ld (hl), a

        ld a, 4
        ld hl, target_move
        ld (hl), a

        ld a,$0C*4                                                                        ;veritcal tank *4 to get sprite number in top 6 bits

        ld iy, player_start_frame
        ld (iy),a    

     

        ret
