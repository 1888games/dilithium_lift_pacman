;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; sets up title screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

title_location:                         equ tile_ram_start + 0 + column_7
author_location:                        equ tile_ram_start + 2 + column_5

start_title_mode:

        ld a,title_mode                                                                ;pick title mode
        ld (mode),a                                                                        ;and store


Title_Author:

        call clear_tile_ram

        call hide_sprites

        ld de,txt_game_title                                                        ;get text addr for game message
        ld hl, tile_ram_start + row_0 + column_7                                        ;vram address for text
        ld c,pink                                                                        ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_copyright 
        ld hl,tile_ram_start + row_2 + column_5                                     ;vram address for text
        ld c,cyan                                                                    ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_game_author                                                        ;get text addr for game message
        ld hl,tile_ram_start + row_2 + column_6                                      ;vram address for text
        ld c,palette_blue_red_yellow                                                                        ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

Instructions:

        ld de,txt_instruct_1                                                     ;get text addr for game message
        ld hl,tile_ram_start + row_5 + column_2                                      ;vram address for text
        ld c,cyan                                                                        ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_2                                                  ;get text addr for game message
        ld hl,tile_ram_start + row_6 + column_2                                      ;vram address for text                                                                     ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_3                                                   ;get text addr for game message
        ld hl,tile_ram_start + row_7 + column_2                                      ;vram address for text
                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_4                                                    ;get text addr for game message
        ld hl,tile_ram_start + row_8 + column_2                                      ;vram address for text                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_5                                                   ;get text addr for game message
        ld hl,tile_ram_start + row_10 + column_2                                      ;vram address for text                                                                     ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_6                                                   ;get text addr for game message
        ld hl,tile_ram_start + row_11 + column_2                                      ;vram address for text                                                                    ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld de,txt_instruct_7                                                  ;get text addr for game message
        ld hl,tile_ram_start + row_12 + column_2                                      ;vram address for text                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area


Legend:

        ld de,txt_man                                                     ;get text addr for game message
        ld hl,tile_ram_start + title_legend_row + title_legend_column                                      ;vram address for text
        ld c,pink                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld a,tile_man
        ld hl,tile_ram_start + title_legend_row +  title_key_column
        ld (hl), a
        set        2,h 
        ld a,colour_man
        ld (hl),a

        ld de,txt_dilithium                                               ;get text addr for game message
        ld hl,tile_ram_start + title_legend_row + 2 + title_legend_column                                      ;vram address for text
        ld c,palette_blue_red_yellow                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld a,tile_dilithium
        ld hl,tile_ram_start + title_legend_row + 2 +  title_key_column
        ld (hl), a
        set 2,h 
        ld a,colour_dilithium
        ld (hl),a

        ld de,txt_droid                                                ;get text addr for game message
        ld hl,tile_ram_start + title_legend_row + 4 + title_legend_column                                      ;vram address for text
        ld c,palette_pink_black_blue                                                                    ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld a,tile_droid
        ld hl,tile_ram_start + title_legend_row + 4 +  title_key_column
        ld (hl), a
        set 2,h 
        ld a,colour_droid_1
        ld (hl),a


        ld de,txt_laser                                         ;get text addr for game message
        ld hl,tile_ram_start + title_legend_row + 6 + title_legend_column                                      ;vram address for text
        ld c,cyan                                                                      ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld a,tile_laser
        ld hl,tile_ram_start + title_legend_row + 6 +  title_key_column
        ld (hl), a
        set 2,h 
        ld a,colour_laser
        ld (hl),a

        ld de,txt_crystal                                     ;get text addr for game message
        ld hl,tile_ram_start + title_legend_row + 8 + title_legend_column                                      ;vram address for text
        ld c,red                                                                    ;colour red
        call main_blit_text_and_colour                                ;write text to main game area

        ld a,tile_crystal_title
        ld hl,tile_ram_start + title_legend_row + 8 +  title_key_column
        ld (hl), a
        set 2,h 
        ld a,colour_crystal
        ld (hl),a


        ;setup bottom changing message
        ld hl,bottom_list                                                        ;point to last item in the list for bottom text drawing routine so we cycle round straight away
        ld (msg_bot_addr),hl                                                ;store in lookup
        ld hl,tile_ram_bot_vis_line1                                ;address of top left row of top border
        set 2,h                                                                                ;force to pallete ram
        ld a,yellow                                                                        ;colour pallete for white (pen 3)
        ld b,$1c                                                                        ;number of tiles to fill (28 entire columns)
        call fill_border_area_row                                        ;set colour for entire top row



        ;clear any data on second to top line
        ld de,msg_blank                                                                ;store text addr for instruction message
        ld hl,tile_ram_top_vis_line2                                ;vram address for second line of tiles
        call borders_blit_text_only                                        ;write text to border

        ld de,msg_blank                                                                ;store text addr for instruction message
        ld hl,tile_ram_top_vis_line1                                ;vram address for second line of tiles
        call borders_blit_text_only                                        ;write text to border


        jp wait  


                                                                              ;finished setup goto wait section


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; performs logic for title mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
title_logic:

        ld a,(start_state)                                                        ;get state
        and inp_chk_p1st                                                        ;examine p1 start
        cp inp_p1_presd                                                                ;check for pressed 
        jp z,start_game                                                                ;0 means pressed so start game

        call bot_display_upd                                                ;update text display at bottom of screen
     
       ; jp start_game
        jp wait                                                                                ;finished setup goto wait section
