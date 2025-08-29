	object_const_def ; object_event constants
	const URASOEPARK_POKEFAN_M1
	const URASOEPARK_POKEFAN_M2
	const URASOEPARK_SUPER_NERD
	const URASOEPARK_LASS
	const URASOEPARK_ITEMBALL
	const URASOEPARK_ITEMBALL2

UrasoePark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerLandon:
	trainer ENGINEER, LANDON, EVENT_BEAT_ENGINEER_LANDON, EngineerLandonSeenText, EngineerLandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerLandonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end
	
UrasoeParkLassScript:
	jumptextfaceplayer UrasoeParkLassText

TropicalIslandJungleSign:
	jumptext TropicalIslandJungleSignText
	

UrasoeParkMiracleseed:
	itemball MIRACLE_SEED

	
UrasoeParkCalmSeed:
	itemball CALM_SEED

	
UrasoeParkLassText:
	text "The #MON here"
	line "are especially"
	cont "tough."
	para "This land was set"
	line "aside specifically"
	para "so RYUKYU CITY"
	line "couldn't expand"
	cont "into it."
	done

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

HikerJimAfterBattleText:
	text "All this grass is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done

PokefanmRobertSeenText:
	text "You like #MON,"
	line "don't you?"

	para "Me too!"
	done

PokefanmRobertBeatenText:
	text "I'd have to say"
	line "that's my loss."
	done

PokefanmRobertAfterBattleText:
	text "Look what you did"
	line "to my #MON…"

	para "I won't forget"
	line "this…"
	done
	
EngineerLandonSeenText:
	text "I think I've got a"
	line "plan to win this"
	cont "battle!"
	done
	
EngineerLandonBeatenText:
	text "The plan needs"
	line "some work!"
	done
	
EngineerLandonAfterBattleText:
	text "The plan to win"
	line "was to have"
	cont "stronger #MON."
	done

TropicalIslandJungleSignText:
	text "URASOE PARK"

	para "A Nature Reserve"
	line "For #MON"
	done

UrasoePark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 22,  1, RYUKYU_URASOE_PARK_GATE, 3
	warp_event 23,  1, RYUKYU_URASOE_PARK_GATE, 4
	warp_event 18, 12, URASOE_PARK_URASOE_TRAIL_GATE, 1
	warp_event 19, 12, URASOE_PARK_URASOE_TRAIL_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, TropicalIslandJungleSign

	db 6 ; object events
	object_event 30,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 16,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  4,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerEngineerLandon, -1
	object_event  3, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, UrasoeParkLassScript, -1
	object_event 39,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkMiracleseed, EVENT_PICKED_UP_MIRACLE_SEED_FROM_URASOE_PARK
	object_event  7, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkCalmSeed, EVENT_URASOE_PARK_CALM_SEED
