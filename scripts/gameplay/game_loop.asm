;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; performs logic for game mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
game_logic:
        call quit_to_title                                                        ;see if we want to get back to title screen


        call player_one_movement                                        ;control player 

      
        ld a, (player_moving)
        jp m, notMoving

        call sfx_walk


notMoving:

        call player_crystal
        call droid_update
        call laser_update
     
        ;display work
        call show_lives                                                               ;displays timer
        call show_score  

    
                                                              ;displays player and high score


        jp wait                                                                                ;finished setup goto wait section


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; checks to see if player pressed p2 start so they can get
; quickly back to title screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
quit_to_title:
        ld a,(start_state)                                                        ;get state
        and inp_chk_p2st                                                        ;examine p2 start
        cp inp_p2_presd                                                                ;check for pressed 
        jp z,start_title_mode                                                ;0 means pressed so quit to title mode


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; checks to see if whole second has passed
; if so reduces time, if it's zero goes to game over
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
time_tick:
        ld a,(frame_number)                                                        ;get frame number
        and a                                                                                ;see if it is zero
        ret nz                                                                                ;if not then second is not up yet


        ld a,(game_time)                                                        ;get game time
        dec a                                                                                ;reduce by one
        daa                                                                                        ;correct for bcd
        ld (game_time),a                                                        ;store new time
        ret nz          