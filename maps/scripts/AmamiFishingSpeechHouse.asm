	object_const_def ; object_event constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudeText:
	text "I am the FISHING"
	line "GURU, the elder of"
	cont "the FISHING BROS."

	para "Do you happen to"
	line "know FISHERMAN"

	para "WILTON? He fishes"
	line "on ROUTE 44."

	para "He came through"
	line "with an amazing"
	cont "tip on the phone."

	para "Thanks to him, I"
	line "caught a whole lot"

	para "of a rare #MON."
	line "What a day it was!"
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AMAMI_TOWN, 1
	warp_event  3,  7, AMAMI_TOWN, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
