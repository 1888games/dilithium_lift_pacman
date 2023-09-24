


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; increases points scored by player
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
score_points:
        ld b, a
        ld hl,current_score                                                        ;get start of score (lo byte first)
        ld a,(hl)                                                                        ;load into accumulator
        add a, b                                                                                ;add 90 pts - written in bcd
        daa                                                                                        ;correct for bcd overflow
        ld (hl),a                                                                        ;store new value
        ld b,3                                                                                ;need to see if the carry propogates through remaining three bcd bytes
        ld c,0                                                                                ;gonna add 0 so quicker to load into register
.addloop:
        inc hl                                                                                ;move to next highest byte
        ld a,(hl)                                                                        ;load into accumulator
        adc c                                                                                ;add zero with carry taken into account
        daa                                                                                        ;adjust flags to correct for bcd overflow
        ld (hl),a                                                                        ;store new bcd pair
        djnz .addloop                                                                ;continue loop until b is zero
        
        ;now check high score to see if bigger start with high bytes
        ld b,4
        ld de,current_score + 4                                                ;get high byte first (point one too far as we dec straight away)
        ld hl,high_score + 4                                                ;get high byte first (point one too far as we dec straight away)
.check_loop:
        dec de                                                                                ;move to next most significant bytes
        dec hl                                                                                ;for score and high score
        ld a,(de)                                                                        ;load score byte
        cp (hl)                                                                                ;compare with highscore byte (does subtract but doesn't affect a register)
        daa                                                                                        ;correct for bcd numbers (in case we have 80 and above as these would appear as -ve numbers)
        ret m                                                                                ;not bigger so stop checking
        jp nz,.new_high_score                                                ;if numbers not the same then we have a new high score so stop checking
        djnz .check_loop:                                                        ;do for all 4 bytes if necessary (until b = 0)


        ;if here score is better so copy score to highscore
.new_high_score:
        ld hl,current_score                                                        ;set current score location in hl
        ld de,high_score                                                        ;set highscore location in de and copy
        ld bc,4                                                                                ;copy 4 bytes from (hl) to (de)
        ldir
        
        ret