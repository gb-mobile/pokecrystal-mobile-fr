	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $31, $32, $33, $34, $35, $36, $37, $35, $35, $38, $39, $35
	db $3a, $35, $3b, $3c, $3d, $3e, $3f, $40, $35, $41, $42, $43
	db $44
.frame2
	db $01 ; bitmask
	db $15, $31, $32, $02, $45, $33, $34, $35, $36, $37, $35, $35
	db $38, $39, $34, $3a, $34, $3b, $3c, $32, $3e, $3f, $34, $3a
	db $41, $42, $43, $44
.frame3
	db $02 ; bitmask
	db $46, $34, $47, $36, $48, $49, $39, $35, $4a, $4b, $40, $4c
	db $41, $4d, $4e
