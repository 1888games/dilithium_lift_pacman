;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sprite block offsets organised for easy transfer to sprite registers pos and pal, then pos data, then velocities xy
; offsets to use when indexed addressing - set index register to sprite0, sprite1 etc...
; ld ix,sprite2
; ld a,(ix + spr_x)
; would allow you to access x position of sprite
; this data is cleverly interlaced so sprite number, palettes and xy positions can be easily copied over to the sprite registers each frame
; these equates allow us to access the interlaced elements without having to worry about how they are interlaced using indexing


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
spr_num:                equ $0            ;sprite number from rom 5f most significant 6 bits bit 1 x flip, bit 0 y flip
spr_pal:                equ $1             ;palette for sprite - lower nibble only 
spr_x:                  equ $0c             ;x position of sprite
spr_y:                  equ $0d             ;y position of sprite
spr_vel_x:              equ $18              ;x velocity of sprite
spr_vel_y:              equ $19             ;y velocty of sprite
spr_tile_addr:          equ $24              ;tile address sprite occupies (2 bytes)
spr_tile_x:             equ $30              ;x tile position (0,0) is top right corner
spr_tile_y:             equ $31               ;y tile position (27,31) is bottom left corner
flipx:                  equ 1                                                                ;x flip bit for sprites
flipy:                  equ 0    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; colour pallete constants for pen 3 colour
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
black:               	equ 0;                (hidden)
red:                 	equ 1;                (blinky)
pink:                	equ 3;                (pinky)
cyan:                	equ 5;                (inky)
orange:              	equ 7;                (clyde)
yellow:              	equ 9;                (pac-man)
grey:                	equ $f;                (off-white)
blue:                	equ $10;        (scared ghost)
brown:               	equ $15;        (poo ghost)

;some constants for mode setting
title_mode:                equ $1
game_mode:                equ $2
game_over:                equ $4
life_lost:				equ $8

LEFT:				 equ $0
RIGHT:				 equ $1
UP:					 equ $2
DOWN:				 equ $3	

start_lives:		equ 5	


blank_tile:					equ $40
tile_man: 					equ $23
tile_droid:					equ $22
tile_droid_right:			equ $27
tile_droid_down:			equ $28
tile_droid_up:				equ $29
tile_laser:					equ $21
tile_dilithium:				equ $13
tile_crystal_1:				equ $14
tile_crystal_2:				equ $15
tile_grid:					equ $10
tile_top:				    equ $11
tile_side:					equ $12
tile_dilithium_title:		equ $24
tile_crystal_title:			equ $26
tile_grid_right:			equ $2B
tile_grid_bottom:			equ $2C
tile_grid_last:				equ $2D



palette_white_blue_red 		equ 1
palette_white_blue_pink 	equ 3
palette_white_blue_cyan 	equ 5
palette_white_blue_orange	equ 7
palette_blue_red_yellow		equ 9
palette_white_black_pink	equ 14
palette_red_green_white		equ 15
palette_pink_black_blue		equ 16
palette_green_blue_pink		equ 17
palette_green_white_red		equ 18
palette_red_orange_white	equ 20
palette_orange_green_orange equ 21
palette_yellow_lblue_white  equ 22
palette_dgreen_green_white  equ 23
palette_cyan_pink_yellow	equ 24
palette_white_blue_black 	equ 25

palette_white_pink_red		equ 29
palette_pink_black_white	equ 31


colour_man 			 		equ palette_green_blue_pink
colour_droid_1 			 	equ palette_green_blue_pink
colour_droid_2 			 	equ palette_blue_red_yellow
colour_dilithium			equ palette_cyan_pink_yellow
colour_crystal				equ palette_blue_red_yellow
colour_laser				equ palette_white_blue_cyan


copyright_symbol			equ $5C


column_27					equ $40
column_26					equ $60
column_25					equ $80
column_24					equ $A0
column_23					equ $C0
column_22					equ $E0
column_21					equ $100
column_20					equ $120
column_19					equ $140
column_18					equ $160
column_17					equ $180
column_16					equ $1A0
column_15					equ $1C0
column_14					equ $1E0
column_13					equ $200
column_12					equ $220
column_11					equ $240
column_10					equ $260
column_9					equ $280
column_8					equ $2A0
column_7					equ $2C0
column_6					equ $2E0
column_5					equ $300
column_4					equ $320
column_3					equ $340
column_2					equ $360
column_1					equ $380
column_0					equ $3A0


row_0	equ 0
row_1	equ 1
row_2	equ 2
row_3	equ 3
row_4	equ 4
row_5	equ 5
row_6	equ 6
row_7	equ 7
row_8	equ 8
row_9	equ 9
row_10	equ 10
row_11	equ 11
row_12  equ 12
row_13	equ 13
row_14	equ 14
row_15	equ 15
row_16	equ 16
row_17	equ 17
row_18	equ 18
row_19	equ 19
row_20	equ 20
row_21	equ 21
row_22	equ 22
row_23	equ 23
row_24	equ 24
row_25	equ 25
row_26	equ 26
row_27	equ 27
row_28	equ 28
row_29	equ 29
row_30	equ 30
row_31	equ 31
row_32	equ 32
row_33	equ 33
row_34	equ 34
row_35	equ 35
row_36	equ 36
row_37	equ 37


TS 	equ $80
TI 	equ $81
TM 	equ $82
TO 	equ $83
TN 	equ $84
TC 	equ $85
TB 	equ $86
T1 	equ $87
T9 	equ $88
T8 	equ $89
T3 	equ $8A
T_ equ $8B

title_legend_column 	equ column_10
title_key_column 		equ column_7
title_legend_row		equ 16


grid_rows				equ 29
grid_columns			equ 20


EFFECT_TABLE_1  EQU     EffectTable1    ; channel 1 effects. 8 bytes per effect
EFFECT_TABLE_2  EQU     EffectTable2    ; channel 2 effects. 8 bytes per effect
EFFECT_TABLE_3  EQU     EffectTable3    ; channel 3 effects. 8 bytes per effect

