	object_const_def ; object_event constants
	const ROUTE116_BUG_CATCHER3
	const ROUTE116_HIKER
;	const ROUTE116_POKE_BALL1
	const ROUTE116_POKE_BALL2
;	const ROUTE116_POKE_BALL3
;	const ROUTE116_POKE_BALL4
	const ROUTE116_FRUIT_TREE

Route116_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearTeknosRocks

.ClearTeknosRocks:
	setevent EVENT_BOARDWALK_PATH_IS_OPEN
	return



TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

Route116Sign:
	jumptext Route116SignText



Route116SuperPotion:
	itemball SUPER_POTION


Route116FruitTree:
	fruittree FRUITTREE_TREE_ROUTE_116


BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done
	


HikerRussellSeenText:
	text "I'm trying to walk"
	line "all of NIHON!"
	done

HikerRussellBeatenText:
	text "I'm tired!"
	done

HikerRussellAfterBattleText:
	text "I think I'll stick"
	line "around here and"
	cont "rest for a while."
	done

Route116SignText:
	text "ROUTE 116"

	para "BIRDON TOWN -"
	line "SANSKRIT TOWN"
	done


Route116_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 30, ROUTE_116_BIRDON_GATE, 1
	warp_event  9, 30, ROUTE_116_BIRDON_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route116Sign


	db 4 ; object events
	object_event  4, 26, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherDoug, -1
	object_event  8, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerHikerRussell, -1
	object_event  4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116SuperPotion, EVENT_ROUTE_116_MAX_POTION
	object_event  4, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route116FruitTree, -1
