

process_effect:

	ld hl, EFFECT_TABLE_1
	ld ix, CH1_E_NUM
	ld iy, CH1_FREQ0
	call process_voice
	ld (CH1_VOL), a

	ld hl, EFFECT_TABLE_2
	ld ix, CH2_E_NUM
	ld iy, CH2_FREQ1
	call  process_voice
	ld (CH2_VOL), a

	ld hl, EFFECT_TABLE_3
	ld ix, CH3_E_NUM
	ld iy, CH3_FREQ1
	call  process_voice
	ld (CH3_VOL), a

	xor a
	ld (CH1_FREQ4), a

	ret

	
process_voice: // 2dee

	ld a, (ix + 0)
	and a
	jr nz, find_effect

init_param:

	ld a, (ix+2)
	and a
	ret z

	ld (ix+2), 0
	ld (ix+$0D), 0
	ld (ix+$0E), 0
	ld (ix+$0F), 0
	ld (iy+0), 0
	ld (iy+1), 0
	ld (iy+2), 0
	ld (iy+3), 0
	xor a
	ret 


find_effect:
	
	ld c, a
	ld b, 8
	ld e, $80

find_bit:

	ld a, e
	and c
	jr nz, process_bit
	srl e
	djnz find_bit
	ret


process_bit:

	ld a, (ix+2)
	and e
	jr nz, compute_effect
	ld (ix+2), e

	dec b
	ld a,b
	rlca
	rlca
	rlca
	ld c,a
	ld b,0
	push hl
	add hl, bc
	push ix
	pop de
	inc de
	inc de
	inc de 
	ld bc,$0008
	ldir
	pop hl

	ld a, (ix + 6)
	and $7F
	ld (ix+$0C), a

	ld a,(ix+4)
	ld (ix+$0E), a

	ld a, (ix+9)
	ld b, a
	rrca
	rrca
	rrca
	rrca
	and $0F
	ld (ix+$0B),a

	and $08
	jr nz, compute_effect
	ld (ix+$0F), b
	ld (ix+$0D),0



compute_effect:

	dec (ix+$0C)
	jr nz, update_freq
	ld a, (ix+8)
	and a
	jr z, skip1

	dec (ix+8)
	jr nz, skip1

	ld a, e
	cpl
	and (ix+0)
	ld (ix+0), a
	jp process_voice

skip1:

	ld a,(ix+6)
	and $7F
	ld (ix+$0C),a
	bit 7,(ix+6)
	jr z, skip2

	ld a, (ix+5)
	neg
	ld (ix+5), a
	bit 0, (ix+$0D)
	set 0, (ix+$0D)
	jr z, update_freq

	res 0,(ix+$0D)

skip2:
	


	ld a, (ix+4)
	add a, (ix+7)
	ld (ix+4), a
	ld (ix+$0E),a
	ld a, (ix+$09)
	add a,(ix+$0A)
	ld (ix+9),a
	ld b, a
	ld a,(ix+$0B)
	and 8
	jr nz, update_freq

	ld (ix+$0F), b


update_freq:

	ld a, (ix+$0e)
	add a,(ix+5)
	ld (ix+$0e),a
	ld l, a
	ld h, 0

	ld a, (ix+3)
	and $70
	jr z, skip3
	rrca
	rrca
	rrca
	rrca

	ld b, a

doubleIt2:

	add hl, hl
	djnz doubleIt2

skip3:

	ld (iy+0),l
	ld a,l
	rrca
	rrca
	rrca
	rrca
	ld (iy+1),a
	ld (iy+2), h
	ld a, h
	rrca
	rrca
	rrca
	rrca
	ld (iy+3), a
	ld a,(ix+$0B)

	jp type0
	rst $20

	defw	type0, type1, type2, type3, type4, type5
	defw 	type5,type5,type5,type5,type5,type5,type5, type5,type5,type5


type0:
	
	ld a, (ix+$0F)
	ret
type1:
	
	ld a, (ix+$0F)
	jr decrease_routine

type2:
	
	ld a, (SOUND_COUNTER)
	and 1

check_skip:

	ld a, (ix+$0f)
	ret nz
decrease_routine:

  	and $0F
  	ret z
  	dec a
  	ld (ix+$0F), a
  	ret

type3:
	
	ld a, (SOUND_COUNTER)
	and 3
	jr check_skip

type4:

	ld a, (SOUND_COUNTER)
	and $07
	jr check_skip

type5:
	ret




load_sound_registers:

	

	ld hl, (SOUND_COUNTER)
	inc (hl)
	inc hl
	dec (hl)
	



	ret