
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sets up game screen
; clears screen 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start_game:
        


        ld a, start_lives
        ld (player_lives), a

        ld a, 255
        ld (current_level), a

        ld hl,0                                                                                ;clear
        ld (current_score),hl                                                ;reset player score
        ld (current_score + 2),hl                                        ;reset player score

        jp finishedWaiting

next_level:
        
        ld b, 100

wait_a_bit
        ld        (watchdog),a                       ;reset the watchdog
        halt

        djnz wait_a_bit

finishedWaiting:

        ld a,game_mode                                                                ;pick game mode
        ld (mode),a                                                                        ;and store

        ld a,palette_cyan_pink_yellow                                                               
        call fill_screen_area_colour                               

        call clear_tile_ram

      

       ; ld      a,2      ; load HL with sound register
      ;  ld (CH1_E_NUM), a          ; play credit sound
     
        ;clear old messages
        ld de,msg_blank                                                                ;store text addr for instruction message
        ld hl,tile_ram_top_vis_line2                                ;vram address for 2nd line of tiles
        call borders_blit_text_only                                        ;write text to border
        ld de,msg_blank                                                                ;store text addr for instruction message
        ld hl,tile_ram_bot_vis_line1                                ;vram address for first of bottom line of tiles
        call borders_blit_text_only                                        ;write text to border


        ld de,msg_scoring                                                        ;store text addr for scoring message
        ld hl,tile_ram_top_vis_line1                                ;vram address for first of bottom line of tiles
        ld c,cyan                                                                        ;colour (yellow)
        call borders_blit_text                                                ;write text to border

        ld de,msg_blank                                                        ;store text addr for scoring message
        ld hl,tile_ram_top_vis_line2                              ;vram address for first of bottom line of tiles
        ld c,grey                                                                       ;colour (yellow)
        call borders_blit_text                                                ;write text to border

        call player_initialise
        call droid_initialise
     
        ld hl,spr_initial_game_data                                        ;addr of game sprite data
        call set_sprites                                                        ;do initial transfer of sprite data from rom to ram

        ld a,$60                                                                        ;set game counter to 60 (in bcd)
        ld (game_time),a                                                        ;and store

        call reset_framenumber                                                ;set frame number to 0 so we start at a whole second

        ld a, (current_level)
        inc a  
        ld (current_level), a

  
        and %00000111
        call draw_level

        ld a, (frame_counter)
        ld (rand_data), a

        neg
        ld (rand_data + 1), a

        jp wait                                                                                ;finished setup goto wait section

