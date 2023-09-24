
        device zxspectrum48                                                                                ;allows savebin to work for creating the binaries - at the end of the file
                                                                                                                        ;instead of using OUTPUT before each org - just slightly easier to manage
        include "scripts/data/memory.asm"
        include "scripts/data/constants.asm"
        include "scripts/data/ram.asm"
                         
        org     0                                                                                ;tell assembler to assemble from address 0
        jp      start                                                               ;jump to initialisation code



        include "scripts/system/rst.asm"
        include "scripts/system/vblank.asm"
        include "scripts/system/startup.asm"            // jumps to title.start_title_mode

        include "scripts/system/input.asm"
        include "scripts/system/sprite.asm"        

        include "scripts/gameplay/title.asm"
        include "scripts/gameplay/start_game.asm"
        include "scripts/gameplay/game_loop.asm"
        include "scripts/gameplay/game_over.asm"
        include "scripts/system/hud.asm"
        include "scripts/system/debug.asm"
        include "scripts/gameplay/collision.asm"
        include "scripts/system/score.asm"
        //include "scripts/gameplay/bullet.asm"
        include "scripts/gameplay/player.asm"
        include "scripts/system/text.asm"
        include "scripts/system/utility.asm"
        include "scripts/system/map.asm"


        // start of new game
        include "scripts/gameplay/grid.asm"
        include "scripts/gameplay/droid.asm"
        include "scripts/gameplay/laser.asm"
        include "scripts/gameplay/lost_life.asm"
        include "scripts/system/sound.asm"
        include "scripts/system/sound_wave.asm"


        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; logic to be performed every frame - main logic of code
; needs to check to see what mode game is in first so it can run
; the correct game loop function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mainloop:                
        ld a,(mode)                                                                        ;get mode
        cp title_mode                                                                ;is it title mode
        jp z,title_logic                                                        ;yes
        cp game_mode                                                                ;is it game mode
        jp z,game_logic                                                                ;yes
        cp game_over                                                                ;is it game over
        jp z,game_over_logic                                                ;yes
        cp life_lost
        jp z,lose_update
wait:
        halt                                                                                ;finished processing let's wait for vsync
        jp mainloop      

        org  $1000

        include "scripts/data/rom_6f.asm"

        org $2ffe        ; attempting the crc

        defm $0
        defm $fd



       savebin "C:/Users/NickSherman/Dropbox/Channel F/Dilithium Lift/MAME/roms/pacman/pacman.6e",$0000, $1000
        savebin "C:/Users/NickSherman/Dropbox/Channel F/Dilithium Lift/MAME/roms/pacman/pacman.6f",$1000, $1000
        savebin "C:/Users/NickSherman/Dropbox/Channel F/Dilithium Lift/MAME/roms/pacman/pacman.6h",$2000, $1000
        savebin "C:/Users/NickSherman/Dropbox/Channel F/Dilithium Lift/MAME/roms/pacman/pacman.6j",$3000, $1000

       ; savebin "C:/Dropbox/Dropbox/Channel F/Pacman/MAME/roms/pacman/pacman.6e",$0000, $1000
        ;savebin "C:/Dropbox/Dropbox/Channel F/Pacman/MAME/roms/pacman/pacman.6f",$1000, $1000
        ;savebin "C:/Dropbox/Dropbox/Channel F/Pacman/MAME/roms/pacman/pacman.6h",$2000, $1000
        ;savebin "C:/Dropbox/Dropbox/Channel F/Pacman/MAME/roms/pacman/pacman.6j",$3000, $1000

