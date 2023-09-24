

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; some messages to display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

txt_game_title:         defm           "DILITHIUM LIFT",0
txt_game_author:        defm T_,TS,TI,TM,TO,TN,T_, TC,TO,TB,TB,T_,T1,T9,T8,T3,0
txt_copyright:          defm copyright_symbol, 0

txt_instruct_1:         defm "Move your man to collect",0  
txt_instruct_2:         defm " the Dilithium Crystals",0  
txt_instruct_3:         defm "whilst avoiding the laser",0  
txt_instruct_4:         defm "bolts fired by the Droids",0  
txt_instruct_5:         defm " You can extend the time",0  
txt_instruct_6:         defm "  you have by collecting ",0   
txt_instruct_7:         defm "the flashing red crystals",0

txt_dilithium:          defm "DILITHIUM",0
txt_man:                defm "MAN",0
txt_droid:              defm "DROID",0
txt_laser:              defm "LASER BOLT",0
txt_crystal:            defm "RED CRYSTAL",0


                                           ;0123456789012345678901234567 - for alignment purposes
;msg_instruction:        defm        "WELCOME TO  THIS LITTLE GAME",0
;msg_quit_game:                defm    " 2P START  TO QUIT TO TITLE ",0
msg_debug:                        defm        "DEBUG                       ",0
msg_scoring:                defm        "SCORE      LIVES    HI SCORE",0
msg_game_over:                defm        "  GAME    OVER  ",0
msg_gameover_blank:        defm        "                ",0
msg_blank:                        defm        "                            ",0 ;use this label to also refer to a blank message



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; a list of message width of the screen (28 columns)
; to display
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bot_mess_seconds:        defm 0        ; change every second
bot_mess_1:                        defm        "       PRESS 1P START       ",0
bot_mess_2:                        defm        "      BY ARLASOFT 2023      ",0
                                        ;                 0123456789012345678901234567 - for alignment purposes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this is the addressess of the messages to display (above), 
; the code looks for an address of zero to restart the list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bottom_list:                defw        bot_mess_1,msg_blank,bot_mess_2,msg_blank,0




level_1:
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00111110, %00000111, %11000000
        defm %00100010, %00000100, %01000000
        defm %00100010, %00000100, %01000000
        defm %00100010, %00000100, %01000000
        defm %00111110, %00000111, %11000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00000010, %00000100, %00000000
        defm %00111110, %00000111, %11000000
        defm %00100010, %00000100, %01000000
        defm %00100010, %00000100, %01000000
        defm %00100010, %00000100, %01000000
        defm %00111110, %00000111, %11000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000


level_2:
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000

        defm %00001100, %11110000, %00000000
        defm %00001100, %11110000, %00000000
        defm %00110011, %11111100, %00000000
        defm %00110011, %11111100, %00000000
        defm %00000000, %11001111, %00000000
        defm %00000000, %11001111, %00000000
        defm %00000000, %11111111, %11000000
        defm %00000000, %11111111, %11000000
        defm %00000000, %11111111, %11000000
        defm %00000000, %11111111, %11000000
        defm %00000000, %11001111, %00000000
        defm %00000000, %11001111, %00000000
        defm %00110011, %11111100, %00000000
        defm %00110011, %11111100, %00000000
        defm %00001100, %11110000, %00000000
        defm %00001100, %11110000, %00000000

        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000


level_3:

        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00011111, %11111111, %00000000
        defm %00010000, %01000001, %00000000
        defm %00010000, %10100001, %00000000
        defm %00010000, %10100001, %00000000
        defm %00010001, %00010001, %00000000
        defm %00010010, %00001001, %00000000
        defm %00010010, %00001001, %00000000
        defm %00010100, %00000101, %00000000
        defm %00010100, %00000101, %00000000
        defm %00011000, %00000011, %00000000
        defm %00011000, %00000011, %00000000
        defm %00011000, %00000011, %00000000
        defm %00010100, %00000101, %00000000
        defm %00010100, %00000101, %00000000
        defm %00010010, %00001001, %00000000
        defm %00010010, %00001001, %00000000
        defm %00010001, %00010001, %00000000
        defm %00010000, %10100001, %00000000
        defm %00010000, %10100001, %00000000
        defm %00010000, %01000001, %00000000
        defm %00011111, %11111111, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000

level_4:

        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00010100, %00000010, %10000000
        defm %00101010, %00000101, %01000000
        defm %00010100, %00000010, %10000000
        defm %00101010, %00000101, %01000000
        defm %00010100, %00000010, %10000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %01010000, %00000000
        defm %00000000, %10101000, %00000000
        defm %00000000, %01010000, %00000000
        defm %00000000, %10101000, %00000000
        defm %00000000, %01010000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00010100, %00000010, %10000000
        defm %00101010, %00000101, %01000000
        defm %00010100, %00000010, %10000000
        defm %00101010, %00000101, %01000000
        defm %00010100, %00000010, %10000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00010100, %00000010, %10000000
        

level_5:

      
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000111, %11000000, %00000000
        defm %00001000, %00100000, %00000000
        defm %00001001, %00111000, %00000000
        defm %00001011, %10100100, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001000, %00100001, %00000000
        defm %00000111, %11000000, %10000000
        defm %00001000, %00100001, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001011, %10100100, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001000, %00100001, %00000000
        defm %00000111, %11000000, %10000000
        defm %00001000, %00100001, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001011, %10100100, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001000, %00100001, %00000000
        defm %00000111, %11000000, %10000000
        defm %00001000, %00100001, %00000000
        defm %00001001, %00111010, %00000000
        defm %00001011, %10100100, %00000000
        defm %00001001, %00111000, %00000000
        defm %00001000, %00100000, %00000000
        defm %00000111, %11000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000


level_6:
        
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %11111000, %00000000
        defm %00000011, %11111110, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000111, %11111111, %00000000
        defm %00001111, %11111100, %00000000
        defm %00001111, %11100000, %00000000
        defm %00001111, %00000000, %00000000
        defm %00001111, %11100000, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000011, %11111110, %00000000
        defm %00000000, %11111000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %11111000, %00000000
        defm %00000011, %11111110, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000111, %11111111, %00000000
        defm %00001111, %11111100, %00000000
        defm %00001111, %11100000, %00000000
        defm %00001111, %00000000, %00000000
        defm %00001111, %11100000, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000111, %11111111, %00000000
        defm %00000011, %11111110, %00000000
        defm %00000000, %11111000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000

level_7:

        defm %00000000, %00000000, %00000000
        defm %00001110, %00000111, %00000000
        defm %00010101, %00001010, %10000000
        defm %00100100, %10010010, %01000000
        defm %00111011, %10011101, %11000000
        defm %00100100, %10010010, %01000000
        defm %00010101, %00001010, %10000000
        defm %00001110, %00000111, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %11100000, %00000000
        defm %00000001, %01010000, %00000000
        defm %00000010, %01001000, %00000000
        defm %00000011, %10111000, %00000000
        defm %00000010, %01001000, %00000000
        defm %00000001, %01010000, %00000000
        defm %00000000, %11100000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00001110, %00000111, %00000000
        defm %00010101, %00001010, %10000000
        defm %00100100, %10010010, %01000000
        defm %00111011, %10011101, %11000000
        defm %00100100, %10010010, %01000000
        defm %00010101, %00001010, %10000000
        defm %00001110, %00000111, %00000000
        defm %00000000, %00000000, %00000000

level_8:

        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %01111111, %11111111, %11100000
        defm %01000000, %00000000, %00100000
        defm %01100000, %00000000, %01100000
        defm %01010000, %00000000, %10100000
        defm %01001000, %00000001, %00100000
        defm %01000100, %00000010, %00100000
        defm %01000010, %00000100, %00100000
        defm %01000001, %00001000, %00100000
        defm %01000000, %10010000, %00100000
        defm %01000000, %01100000, %00100000
        defm %01000000, %01100000, %00100000
        defm %01000000, %01100000, %00100000
        defm %01000000, %01100000, %00100000
        defm %01000000, %01100000, %00100000
        defm %01000000, %10010000, %00100000
        defm %01000001, %00001000, %00100000
        defm %01000010, %00000100, %00100000
        defm %01000100, %00000010, %00100000
        defm %01001000, %00000001, %00100000
        defm %01010000, %00000000, %10100000
        defm %01100000, %00000000, %01100000
        defm %01000000, %00000000, %00100000 
        defm %01111111, %11111111, %11100000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000
        defm %00000000, %00000000, %00000000



levels:        defw level_1, level_2, level_3, level_4, level_5, level_6, level_8, level_7
       
        
        

spr_initial_game_data:
        ;sprite number * 4 to but into top 6 bits (0-63) flips then in bit 0 and 1, and pallete byte
        defm $00*4, palette_green_blue_pink ; sprite 0, flipped in x, palette 1
        defm 19*4, cyan ; sprite 1
        defm 19*4, cyan ; sprite 2
        defm 18*4, pink; sprite 3
        defm 18*4, pink ; sprite 4
        defm $3f*4, 0 ; sprite 5                ;bullet sprite invisible
        ;starting positions x,y
        defm 132, 128        ;sprite 0
        defm 0, 200        ;sprite 1
        defm 0, 150        ;sprite 2
        defm 0, 100        ;sprite 3
        defm 0, 50        ;sprite 4
        defm 0, 0        ;sprite 5
        ;sprite velocities x,y
        defm 1,0                ;sprite 0                ;set velocity pointing left for bullet to pick up if stationary at start and shoot
        defm 2,1                ;sprite 1
        defm 1,-1                ;sprite 2
        defm -1,1                ;sprite 3
        defm -2,-1                ;sprite 4
        defm 0,0                ;sprite 5



row_starts:     defw row_0, row_1, row_2



tile_column_to_sprite_x:        
                
               defm 237,229,221,213,205,197,189,181,173,165,157,149,141,133,125,117,109,101,93,85,77,69,61,53,45,37,29,21


tile_row_to_sprite_y:
                
                defm 255,248,240,232,224,216,208,200,192,184,176,168,160,152,144,136,128,120,112,104,96,88,80,72,64,56,48,40,32,24,16,8



EffectTable1:
    
    defm %00100001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %01111111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010111      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment
     

    defm %01100001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %01111111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010111      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0    

    
    defm %11100111      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00010111      //1 : initial base frequency
    defm %00000011   //2 : frequency increment (added to base freq)
    defm %00011111      //3 : upper bit = reverse lower 7 bits = duration
    defm 1              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1           //5 : repeat
    defm %00011101      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment

    defm %00111111      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00110111      //1 : initial base frequency
    defm %11000011   //2 : frequency increment (added to base freq)
    defm %00011111      //3 : upper bit = reverse lower 7 bits = duration
    defm 1              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1           //5 : repeat
    defm %00011101      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment



 //   0 : upper 3 bits = frequency shift, lower 3 bits = wave select
//1 : initial base frequency
//2 : frequency increment (added to base freq)
//3 : upper bit = reverse lower 7 bits = duration
//4 : frequency increment (added to initial base frequency). Used when repeat > 1
//5 : repeat
//6 : upper 4 bits = volume adjust type lower 4 bits = volume
//7 : volume increment


                                    // 1=coin
   // set 1, (hl)                 // 2=background hum
                            // 3=background hum med
                                // 4=background hum high1
                                // 5=background him higher
                                // 6=background hum even higher
                                // 7=extra life ding

                                // 1=endless med chirps
                                // 2=endless low chirps
                                // 3=endless high chirps
                                // 4=four med chirps
                                // 5=rising tone endless
                                // 6=c64 space loop
                                // 7=long tone unused


                                // 1=med blip (good for key?)
                                // 2=eat ghost
                                // 3=quick rising bloop
                                // 4=died
                                // 5=rising tone endless
                                // 6=higher blip
                                // 7=nothing


EffectTable2:

    
    defm %01100011      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00111111      //1 : initial base frequency
    defm %00000111   //2 : frequency increment (added to base freq)
    defm %00000010      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010101      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0    


    defm $59, $01, $06, $08, $00, $00, $02, $00
    defm $59, $01, $06, $09, $00, $00, $02, $00
    defm $59, $02, $06, $0a, $00, $00, $02, $00
    defm $59, $03, $06, $0b, $00, $00, $02, $00
    defm $59, $04, $06, $0c, $00, $06, $02, $00
    defm $24, $00, $06, $08, $02, $00, $0A, $00
    defm $36, $07, $87, $6F, $00, $00, $04, $00
    defm $70, $04, $00, $00, $00, $00, $08, $00

EffectTable3:

    defm %00000001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00011111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010011      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment
     

    defm %00000001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00111111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010111      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment
        

    defm $1C, $70, $8B, $08, $00, $01, $06, $00

    defm %01000111      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00000111      //1 : initial base frequency
    defm %00000011   //2 : frequency increment (added to base freq)
    defm %00011111      //3 : upper bit = reverse lower 7 bits = duration
    defm 1              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1           //5 : repeat
    defm %00011101      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment



  
   
    defm %00000110
    defm %00111000
    defm %11111110
    defm %00010000 //3 : upper bit = reverse lower 7 bits = duration
    defm %11111001
    defm %00000100
    defm %00001111
    defm 251

    defm $36, $38, $FE, $15, $F9, $01, $09, $fb
    defm $26, $38, $FE, $15, $F9, $01, $09, $fb


  
    defm %00000001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00001111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010001      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment
    

    defm $62, $01, $01, $06, $00, $01, $07, $00

    defm %00000001      //0 : upper 3 bits = frequency shift, lower 3 bits = wave select
    defm %00001111      //1 : initial base frequency
    defm %10000111   //2 : frequency increment (added to base freq)
    defm %00000111      //3 : upper bit = reverse lower 7 bits = duration
    defm -2              //4 : frequency increment (added to initial base frequency). Used when repeat > 1
    defm 1          //5 : repeat
    defm %00010011      //6 : upper 4 bits = volume adjust type lower 4 bits = volume
    defm 0              //7 : volume increment
    
    



lookup_3bb0:    defm 01, 02, 04, 08, $10, $20, $40, $80

lookup_3bb8:    defm 00, $57, $5C, $61, $67, $6D, $74, $7B
                defm $82, $8A, $92, $9A, $A3, $AD, $B8, $C3



channel_1_3BC8: defw song_1_ch1, song_2_ch1, song_3_ch1
channel_2_3BCC: defw song_1_ch2, song_2_ch2, song_3_ch2
channel_3_3CD0: defw song_1_ch3, song_2_ch3, song_2_ch3


song_1_ch1:     defm $F1, $02, $f2, $03, $f3, $0f, $f4, $01
                defm $82, $70, $69, $82, $70, $69, $83, $70
                defm $6A, $83, $70, $6A, $82, $70, $69, $82
                defm $70, $69, $89, $8B, $8D, $8E, $FF

song_2_ch1:    defm $F1, $02, $F2, $03, $F3, $0F, $F4, $01

song_2_loop_ch1:
               defm $67, $50, $30, $47, $30, $67, $50, $30

                defm $47, $30, $67, $50, $30, $47, $30, $4B, $10, $4C, $10, $4D, $10, $4E, $10, $67
                defm $50, $30, $47, $30, $67, $50, $30, $47, $30, $67, $50, $30, $47, $30, $4B, $10
                defm $4C, $10, $4D, $10, $4E, $10, $60, $50, $30, $47, $30, $67, $50, $30, $47, $30
                defm $67, $50, $30, $47, $30, $4B, $10, $4C, $10, $4D, $10, $4E, $10, $77, $20, $4E
                defm $10, $4D, $10, $4C, $10, $4A, $10, $47, $10, $46, $10, $65, $30, $66, $30, $67
                defm $40, $70, $F0
                defw song_2_loop_ch1

song_1_ch2:     defm $F1, $00, $F2, $02, $F3, $0F, $F4, $00, $42, $50, $4E, $50, $49, $50, $46, $50
                defm $4E, $49, $70, $66, $70, $43, $50, $4F, $50, $4A, $50, $47, $50, $47, $4A, $70
                defm $67, $70, $42, $50, $4E, $50, $49, $50, $46, $50, $4E, $49, $70, $66, $70, $45
                defm $46, $47, $50, $47, $48, $49, $50, $49, $4A, $4B, $50, $6E, $FF


song_2_ch2:     defm $F1, $01, $F2, $01, $F3, $0F, $F4, $00
song_2_loop_ch2:
                defm $26, $67, $26, $67, $26, $67, $23, $44

                defm $42, $47, $30, $67, $2A, $8B, $70, $26, $67, $26, $67, $26, $67, $23, $44, $42
                defm $47, $30, $67, $23, $84, $70, $26, $67, $26, $67, $26, $67, $23, $44, $42, $47
                defm $30, $67, $29, $6A, $2B, $6C, $30, $2C, $6D, $40, $2B, $6C, $29, $6A, $67, $20
                defm $29, $6A, $40, $26, $87, $70, $F0
                defw song_2_loop_ch2

song_1_ch3:     
song_2_ch3:
//song_3_ch3:     
                defm $FF, 0, 0


pause       equ 16


note_length equ 32




song_3_ch1:     


                defm $F1, $04, $f2, $02, $f3, $0f, $f4, $06

song_3_loop:    
      

round_1:
                defm $f3, $0C
                defm note_length * 4 + 3
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0D
                defm note_length * 4 + 4
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0E
                defm note_length * 4 + 11
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0F
                defm note_length * 4 + 12
                defm $f3, $0
                defm note_length * 4 + pause
                
                defm $f3, $0C
                defm note_length * 4 + 3
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0D
                defm note_length * 4 + 4
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0E
                defm note_length * 4 + 11
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0F
                defm note_length * 4 + 12
                 ;defm $f3, $0
                defm note_length * 4 + 11


                defm $f3, $0C
                defm note_length * 4 + 3
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0D
                defm note_length * 4 + 4
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0E
                defm note_length * 4 + 11
                 defm $f3, $0
                defm note_length * 4 + pause
                 defm $f3, $0F
                defm note_length * 4 + 12
                 defm $f3, $0
                defm note_length * 4 + pause
                
                defm $f3, $0C
                defm note_length * 4 + 3
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0D
                defm note_length * 4 + 4
                defm $f3, $0
                defm note_length * 4 + pause
                defm $f3, $0E
                defm note_length * 4 + 12
                 defm $f3, $0
                defm note_length * 4 + pause
                 defm $f3, $0F
                defm note_length * 4 + 11
                defm note_length * 4 + 10
                
                defm $f0
                defw song_3_ch1

song_3_ch3:     defm $F1, $00, $F2, $03, $F3, $08, $F4, $04
                defm $F0
                defw song_3_loop_2
        
song_3_ch2:     defm $F1, $00, $F2, $02, $F3, $08, $F4, $03
song_3_loop_2:     

                BLOCK 64, note_length * 4 + pause     
                defm note_length * 4 + 4
                defm note_length * 4 + 3
                defm note_length * 4 + 2
                defm note_length * 6 + 1
                
                defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8

                defm note_length * 4 + 1
                defm note_length * 4 + 2
                defm note_length * 4 + 3
                defm note_length * 6 + 4

                defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8


                defm note_length * 4 + 4
                defm note_length * 4 + 3
                defm note_length * 4 + 2
                defm note_length * 6 + 1
               
                 defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8


                defm note_length * 4 + 6
                defm note_length * 4 + 5
                defm note_length * 4 + 4
                defm note_length * 4 + 3

                defm note_length * 4 + pause
                defm note_length * 4 + 4
                defm note_length * 4 + 3

                defm note_length * 4 + pause


                defm $F1, $00, $F2, $02, $F3, $08, $F4, $02

                defm note_length * 4 + 4
                defm note_length * 4 + 3
                defm note_length * 4 + 4
                defm note_length * 6 + 1
                
                defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8

                defm note_length * 4 + 1
                defm note_length * 4 + 2
                defm note_length * 4 + 3
                defm note_length * 6 + 2

                defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8


                defm note_length * 4 + 4
                defm note_length * 4 + 3
                defm note_length * 4 + 4
                defm note_length * 6 + 1
               
                 defm $f3, 0
                defm note_length * 4 + pause
                 defm $f3, 8


                defm note_length * 4 + 6
                defm note_length * 4 + 5
                defm note_length * 4 + 4
                defm note_length * 4 + 3

                defm note_length * 4 + pause
                defm note_length * 4 + 4
                defm note_length * 4 + 3

                 defm $f3, 0
                defm note_length * 4 + pause





                defm $f0
                defw song_3_loop_2
