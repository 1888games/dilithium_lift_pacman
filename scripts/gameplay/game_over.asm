                                                                                                ;fall through to game over setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; performs logic for game over mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;constants
game_over_top_blank:        equ $42eb                                                        ;address of top blank
game_over_location:                equ $42ec                                                        ;address to draw game over
game_over_bot_blank:        equ $42ed

                                                        ;address of bottom blank
start_game_over:
        ld a,game_over                                                                ;set mode to game over
        ld (mode),a                                                                        ;and store


        ld a,10                                                                                ;load up game over time for 10 seconds
        ld (game_time),a                                                        ;and store, so score is displayed for 10 seconds


        ld a,yellow                                                                        ;set yellow pallette
        call fill_screen_area_colour                                ;and fill screen
        ld a,$8f                                                                        ;full tile is checkerboard
        call fill_screen_area_working_slow                        ;draw tile to screen


        ;hide all sprites
        ld ix,sprite0                                                                ;get first sprite
        ld b,6                                                                                ;gonna do for all 6 sprites

.hide_loop:

        call hide_sprite                                                        ;hide this sprite
        inc ix                                                                                ;move to next sprite
        inc ix                                                                                ;2 bytes along
        djnz .hide_loop                                                                ;if b not zero loop
        pop bc                                                                                ;remove return address from stack as we are aborting the call
        
        ld de,msg_game_over                                                        ;get text addr for game message
        ld hl,game_over_location                                        ;vram address for text
        ld c,red                                                                        ;colour red
        call main_blit_text_and_colour                                ;write text to main game area


        ld de,msg_gameover_blank                                        ;get text addr for blank portion
        ld hl,game_over_top_blank                                        ;vram address for blank
        call main_blit_text_only                                        ;write blank to main game area


        ld de,msg_gameover_blank                                        ;get text addr for blank portion
        ld hl,game_over_bot_blank                                        ;vram address for blank
        call main_blit_text_only                                        ;write blank to main game area


        jp wait                                                                                ;wait for next game loop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; performs logic for game over mode
; just a countdown timer so no other functions needed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
game_over_logic:
        call quit_to_title                                                        ;see if we want to get back to title screen
        call show_lives  

        ld a,(frame_number)                                                        ;get frame number
        and a                                                                                ;see if it is zero
        jp nz,wait                                                                        ;if not then second is not up yet


        ld a,(game_time)                                                        ;get game time
        dec a                                                                                ;reduce by one
        ld (game_time),a                                                        ;store new time
        jp z,start_title_mode                                                ;if zero then go back to title                                



        jp wait                                                                                ;finished setup goto wait section
