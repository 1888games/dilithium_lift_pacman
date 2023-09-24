
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; data to be held in ram defined here                                 ;
; allocation of bytes for ram area assembler calculates                              ;
; addresses based on org statement and user_ram_start ($4c00)                  ;
; these are in affect our variables                                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; db define byte (8 bit value) creates space and sets value
; dw define word (16 bit value) creates space and sets value
; ds declares space for a number of bytes (often specified using a calculation for the assembler)
; defm defines a byte
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


        org user_ram_start                             ;allocate this data at user_ram_start $4c00

waitvsync:                      db 0                   ;if 1 then interrupt is finished and main loop can continue 
frame_counter:                  db 255                  ;value that increments every frame for stable animation and frame counts - doesn't reset just wraps so mods work consistently
frame_number:                   db 0                      ;holds a frame number in lsB and second counter in msB 60 to 0 resets to 60 when gets to zero 
seconds_counter:                db 0                      ;quick ref to seconds part


full_tile:                      db 0                    ;tile to use by bitmap renderer
save_reg:                       db 0                   ;temp storage for an 8 bit register
save_sp:                        dw 0                    ;storage area for stack when messing about with it
joystick_state:                 db 0                     ;holds previous state in upper nibble and current state in lower nibble  IN1 $5000
start_state:                    db 0                         ;holds current state of input byte IN1 - player 2 joystick and start buttons $5040
flip_screen:                    db 0                       ;holds status of flip screen (as i think the location $5003 is write only - it always reads back as ff)
sprite_data:                    ds 4*6 + 2*6 + 2*6 + 2*6                        ;space for the 6 sprites to store their sprite data 
                                                            ;4 bytes for sprite, pallete, x and y
                                                            ;2 bytes for x and y velocity
                                                            ;2 bytes for tile addr (not used)
                                                            ;2 bytes for tilex and tiley
                                                            ;60 bytes in total for this data


msg_top_addr                    dw 0                    ;holds address of top changing display text 
msg_one_pos:                    dw 0                     ;start addr of top text
msg_bot_addr:                   dw 0                     ;holds index of in bottom_list text to display at bottom of screen
bot_counter:                    db 0                     ;counter for bottom scrolling message display


mode:                           db 0                      ;what mode is the system in 1 - title screen, 2 is game, 4 is end of game
high_score:                     ds 4                      ;current high score (again 4 bcd bytes)
current_score:                  ds 4                       ;space for current players score 4 bytes in bcd format (8 digits)
game_time:                      db 0                       ;holds the game time

current_grid_byte               db 0

player_moving:                         db 255
target_move:                    db 255

player_tile_x:                  db 9
player_tile_y:                  db 14
player_frame:                   db 0
player_start_frame:             db 0
player_lives:					db 0 
player_screen_location:          ds 2

droid_screen_location:			ds 8

droid_position:					ds 2
droid_counter:					ds 2
droid_laser_location:           ds 8

total_dilithium:				ds 1

life_lost_counter:				ds 1
current_level:					ds 1

rand_data:						ds 2

                                                            ;y flip bit for sprites
sprite0:                                equ sprite_data                                                ;quick reference constants to load index registers with for sprite access
sprite1:                                equ sprite_data + 2
sprite2:                                equ sprite_data + 4
sprite3:                                equ sprite_data + 6
sprite4:                                equ sprite_data + 8
sprite5:                                equ sprite_data + $a
sprite_pos:                             equ sprite_data + spr_x
sprite_vels:                            equ sprite_data + spr_vel_x


 org $4e8c
 
SoundDataStart:


CH1_FREQ0       ds 1   ; 20 bits
CH1_FREQ1      ds 1
CH1_FREQ2       ds 1
CH1_FREQ3       ds 1
CH1_FREQ4      ds 1
CH1_VOL         ds 1
CH2_FREQ1       ds 1    ; 16 bits
CH2_FREQ2       ds 1
CH2_FREQ3       ds 1
CH2_FREQ4      ds 1
CH2_VOL        ds 1
CH3_FREQ1       ds 1    ; 16 bits
CH3_FREQ2      ds 1
CH3_FREQ3       ds 1
CH3_FREQ4       ds 1
CH3_VOL         ds 1

CH1_E_NUM       ds 1    ; effects to play sequentially (bitmask)
CH1_E_1         ds 1    ; unused
CH1_E_CUR_BIT   ds 1   ; current effect
CH1_E_TABLE0   ds 1    ; table of parameters, initially copied from ROM
CH1_E_TABLE1    ds 1
CH1_E_TABLE2    ds 1
CH1_E_TABLE3    ds 1
CH1_E_TABLE4    ds 1
CH1_E_TABLE5    ds 1
CH1_E_TABLE6    ds 1
CH1_E_TABLE7    ds 1
CH1_E_TYPE      ds 1
CH1_E_DURATION  ds 1
CH1_E_DIR       ds 1
CH1_E_BASE_FREQ ds 1
CH1_E_VOL       ds 1

CH2_E_NUM       ds 1    ; effects to play sequentially (bitmask)
CH2_E_1         ds 1    ; unused
CH2_E_CUR_BIT   ds 1   ; current effect
CH2_E_TABLE0   ds 1    ; table of parameters, initially copied from ROM
CH2_E_TABLE1    ds 1
CH2_E_TABLE2    ds 1
CH2_E_TABLE3    ds 1
CH2_E_TABLE4    ds 1
CH2_E_TABLE5    ds 1
CH2_E_TABLE6    ds 1
CH2_E_TABLE7    ds 1
CH2_E_TYPE      ds 1
CH2_E_DURATION  ds 1
CH2_E_DIR       ds 1
CH2_E_BASE_FREQ ds 1
CH2_E_VOL       ds 1

CH3_E_NUM       ds 1    ; effects to play sequentially (bitmask)
CH3_E_1         ds 1    ; unused
CH3_E_CUR_BIT   ds 1   ; current effect
CH3_E_TABLE0   ds 1    ; table of parameters, initially copied from ROM
CH3_E_TABLE1    ds 1
CH3_E_TABLE2    ds 1
CH3_E_TABLE3    ds 1
CH3_E_TABLE4    ds 1
CH3_E_TABLE5    ds 1
CH3_E_TABLE6    ds 1
CH3_E_TABLE7    ds 1
CH3_E_TYPE      ds 1
CH3_E_DURATION  ds 1
CH3_E_DIR       ds 1
CH3_E_BASE_FREQ ds 1
CH3_E_VOL       ds 1


CH1_W_NUM       ds 1   ; wave to play (bitmask)
CH1_W_1        ds 1    ; unused
CH1_W_CUR_BIT ds 1    ; current wave
CH1_W_SEL       ds 1 
CH1_W_4         ds 1 
CH1_W_5         ds 1 
CH1_W_OFFSET1   ds 1     ; address in ROM to find the next byte
CH1_W_OFFSET2  ds 1     ; (16 bits)
CH1_W_8         ds 1 
CH1_W_9        ds 1 
CH1_W_A         ds 1 
CH1_W_TYPE      ds 1 
CH1_W_DURATION  ds 1 
CH1_W_DIR      ds 1 
CH1_W_BASE_FREQ ds 1 
CH1_W_VOL       ds 1 

CH2_W_NUM       ds 1   ; wave to play (bitmask)
CH2_W_1        ds 1    ; unused
CH2_W_CUR_BIT ds 1    ; current wave
CH2_W_SEL       ds 1 
CH2_W_4         ds 1 
CH2_W_5         ds 1 
CH2_W_OFFSET1   ds 1     ; address in ROM to find the next byte
CH2_W_OFFSET2  ds 1     ; (16 bits)
CH2_W_8         ds 1 
CH2_W_9        ds 1 
CH2_W_A         ds 1 
CH2_W_TYPE      ds 1 
CH2_W_DURATION  ds 1 
CH2_W_DIR      ds 1 
CH2_W_BASE_FREQ ds 1 
CH2_W_VOL       ds 1 

CH3_W_NUM       ds 1   ; wave to play (bitmask)
CH3_W_1        ds 1    ; unused
CH3_W_CUR_BIT ds 1    ; current wave
CH3_W_SEL       ds 1 
CH3_W_4         ds 1 
CH3_W_5         ds 1 
CH3_W_OFFSET1   ds 1     ; address in ROM to find the next byte
CH3_W_OFFSET2  ds 1     ; (16 bits)
CH3_W_8         ds 1 
CH3_W_9        ds 1 
CH3_W_A         ds 1 
CH3_W_TYPE      ds 1 
CH3_W_DURATION  ds 1 
CH3_W_DIR      ds 1 
CH3_W_BASE_FREQ ds 1 
CH3_W_VOL       ds 1 

SOUND_COUNTER   ds 1    ; counter, incremented each VBLANK
                ds 1


SONG_TABLE_1    EQU     $3bc8
SONG_TABLE_2    EQU     $3bcc
SONG_TABLE_3    EQU     $3bd0
