unown_set: MACRO
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to wUnlockedUnowns bits
	dw .Set_A_H ; ENGINE_UNLOCKED_UNOWNS_A_TO_H
	dw .Set_I_P ; ENGINE_UNLOCKED_UNOWNS_I_TO_P
	dw .Set_Q_W ; ENGINE_UNLOCKED_UNOWNS_Q_TO_W
	dw .Set_X_Z ; ENGINE_UNLOCKED_UNOWNS_X_TO_Z
.End

.Set_A_H:
	unown_set A, B, C, D, E, F, G, H
.Set_I_P:
	unown_set I, J, K, L, M, N, O, P
.Set_Q_W:
	unown_set Q, R, S, T, U, V, W
.Set_X_Z:
	unown_set X, Y, Z
