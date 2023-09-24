
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; displays time
; in sensible locations on 2nd row
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;constants
time_location:                equ $43f1                                                                ;address in vram to place time
show_time:
                ld hl,time_location                                                ;vram address to write to
                ld a,(game_time)                                                ;get game time
                ld c,a                                                                        ;byte needs to be in c
                call show_hex                                                        ;use hex display as this is a bcd number (so it just works)
                ret

show_lives:

                ld hl,time_location                                               ;vram address to write to
                dec hl
                ld a,(player_lives)                                                ;get game time
                ld c,a                                                                        ;byte needs to be in c
                ld (hl), a 


                ld hl,time_location + 4                                              ;vram address to write to
                dec hl
                ld a, (current_level)                                                ;get game time
                ld c,a                                                                        ;byte needs to be in c
               // call show_hex                                                        ;use hex display as this is a bcd number (so it just works)
               
                                                                       ;use hex display as this is a bcd number (so it just works)
                ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; displays player score and high score
; in sensible locations on 2nd row
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;constants
hi_score_location:                equ $43e9
show_score:


        ld hl,tile_ram_top_vis_line2                                ;output on start of top line


        ;ld a,(current_score + 3)                                        ;get player score (hi byte first - little endian)
        ;ld c,a
        ;call show_hex                                                                ;output hi byte of score
        ld a,(current_score + 2)                                        ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score
        ld a,(current_score + 1)                                        ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score
        ld a,(current_score)                                                ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score


        ld hl,hi_score_location - 2                                                ;output on right hand side
        ;ld a,(high_score + 3)                                                ;get player score (hi byte first - little endian)
       ; ld c,a
       ; call show_hex                                                                ;output hi byte of score
        ld a,(high_score + 2)                                                ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score
        ld a,(high_score + 1)                                                ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score
        ld a,(high_score)                                                        ;get player score (hi byte first - little endian)
        ld c,a
        call show_hex                                                                ;output hi byte of score


        ret

bot_display_upd:        
        ld hl,(frame_number)                                                ;get frame number see if it's 60
        ld a,l                                                                                ;check frame number
        and a                                                                                ;to see if it's zero
        ret nz                                                                                ;don't update if not frame 0
        
        ld a,(bot_mess_seconds)                                                ;get seconds interval for message change
        and h                                                                                ;and with number of seconds gone by
        ret nz                                                                                ;only update if on a 2 second interval, jump onto top display text
        
        ld hl,(msg_bot_addr)                                                ;get addr of message to display
        ld e,(hl)                                                                        ;remember lo-byte first in memory
        inc hl                                                                                ;move to hi-byte
        ld d,(hl)                                                                        ;place in d
        inc hl                                                                                ;point to next addr in array of addresses
        ld a,d                                                                                ;load hi-byte into for or'ing with the lo-byte
        or e                                                                                ;see if address is zero (if we or we can test full zero easy)
        jp nz,process_text_bot_text                                        ;if it isn't display the message


        ld hl,bottom_list                                                        ;reset to first item and re-load into de
        ld e,(hl)                                                                        ;remember lo-byte first in memory
        inc hl                                                                                ;move to hi-byte
        ld d,(hl)                                                                        ;place in d
        inc hl                                                                                ;point to next addr in array of addresses


process_text_bot_text:
        ld (msg_bot_addr),hl                                                ;store next message to display
        ld        hl,tile_ram_bot_vis_line1                                ;tile address to start writing at
        ld        c,$15                                                                        ;palette 21 (third colour tan)
        call borders_blit_text_only                                        ;write text to border area
        ret

 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; displays a portion of text from a message at the top of the screen
; updates every 8 frames
; address of start position is loaded into hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



