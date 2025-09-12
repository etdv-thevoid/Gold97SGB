TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Urban
	dw TreeMonSet_Town
	dw TreeMonSet_Overworld1
	dw TreeMonSet_Overworld3
	dw TreeMonSet_Overworld2
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock


; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
; common
	db 50, SPEAROW,    15
	db 15, SPEAROW,    15
	db 15, SPEAROW,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    15
	db 15, SCYTHER,    15
	db 15, SCYTHER,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Urban:
; common
	db 50, SPEAROW,    15
	db 15, SPEAROW,    15
	db 15, SPEAROW,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    15
	db 15, SCYTHER,    15
	db 15, SCYTHER,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    15
	db 15, EKANS,      15
	db 15, SPEAROW,    15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    15
	db 15, PINSIR,     15
	db 15, PINSIR,     15
	db 10, AIPOM,      15
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Overworld1:
; common
	db 50, HOOTHOOT,   15
	db 15, SPINARAK,   15
	db 15, LEDYBA,     15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, NATU,       15
	db 15, NATU,       15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Overworld3:
; common
	db 50, HOOTHOOT,   15
	db 15, EKANS,      15
	db 15, HOOTHOOT,   15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, NATU,       15
	db 15, NATU,       15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Overworld2:
; common
	db 50, HOOTHOOT,   15
	db 15, VENONAT,    15
	db 15, HOOTHOOT,   15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, NATU,       15
	db 15, NATU,       15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   15
	db 15, NATU,       15
	db 15, NATU,       15
	db 10, NOCTOWL,    15
	db  5, BUTTERFREE, 15
	db  5, BEEDRILL,   15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, CATERPIE,   15
	db 15, WEEDLE,     15
	db 10, HOOTHOOT,   15
	db  5, METAPOD,    15
	db  5, KAKUNA,     15
	db -1

TreeMonSet_Rock:
	db 50, KRABBY,     20
	db 15, GEODUDE,    20
	db 15, GEODUDE,    20
	db 10, KRABBY,     20
	db  5, DIGLETT,    20
	db  5, DIGLETT,    20
	db -1
