

player_crystal:
       

        ld hl, (player_screen_location)

        ld a, (hl)
        cp tile_dilithium
        jp nz, no_hit
      
        ld a, tile_grid
        ld (hl), a

        ld a, $10
        call score_points 

        call sfx_collect

  
 

        ld a, (total_dilithium)
        dec a
      //  daa
        ld (total_dilithium), a                                                                    ;set game counter to 60 (in bcd)
        jp nz, no_hit

        pop bc 

        jp next_level                                                                  ;and store  


no_hit:

        ret


