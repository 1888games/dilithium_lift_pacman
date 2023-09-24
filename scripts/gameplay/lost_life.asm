
lose_update:

	 ld a, (life_lost_counter)
     dec a
     ld (life_lost_counter), a
    
     cp 0
     jp z, lose_reset
                                                             
        call fill_screen_area_colour                               

    ; call clear_colour_ram

	
	 jp wait


lose_reset:

	  ld a,(player_lives)  
	  dec a
	  ld (player_lives), a
	  cp 0
	  jp nz, NotGameOver

	  jp start_game_over

NotGameOver:

	 ld a,palette_cyan_pink_yellow                                                               
     call fill_screen_area_colour 

     ld de, (droid_screen_location)
     ld a, blank_tile
     ld (de), a    

     ld de, (droid_screen_location + 2)
     ld (de), a   

     ld de, (droid_screen_location + 4)
     ld (de), a  

     ld de, (droid_screen_location +6 )
     ld (de), a  


     call droid_initialise
     call player_initialise
     ld hl,spr_initial_game_data                                        ;addr of game sprite data
     call set_sprites                                                        ;do initial transfer of sprite data from rom to ram
                 	


  


	ld a, game_mode
	ld (mode), a



	jp wait


lose_set:

	ld a, life_lost
   	ld (mode),a  

    ld a, 100
    ld (life_lost_counter), a

    call sfx_died


    ret

	



