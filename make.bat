set dir=c:/users/nicksherman/dropbox/channel f/Dilithium Lift

cd %dir%/assets

nestopac

cd %dir%

sjasmplus  --lst="bin/listing.lst"  main.asm" 

;cd c:/

cd %dir%/MAME
Rem mame.exe pacman -w -debug
mame.exe pacman -w 

