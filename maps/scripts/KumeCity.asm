	object_const_def ; object_event constants
	const KUMECITY_FRUIT_TREE1
	const KUMECITY_FRUIT_TREE2
	const KUMECITY_FISHER
	const KUMECITY_LASS
	const KUMECITY_TEACHER
	const KUMECITY_ROCKER

KumeCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KUME
	return

KumeCityPokecenterSign:
	jumpstd PokecenterSignScript

KumeCityMartSign:
	jumpstd MartSignScript

KumeCitySign:
	jumptext KumeCitySignText
	
UrumaCavernSign:
	jumptext UrumaCavernSignText

KumeCityFruitTree1:
	fruittree FRUITTREE_TREE_KUME_CITY

KumeCityFruitTree2:
	fruittree FRUITTREE_TREE_KUME_CITY_2
	
KumeCityFisherScript:
	jumptextfaceplayer KumeCityFisherText	

KumeCityLassScript:
	jumptextfaceplayer KumeCityLassText
	
KumeCityTeacherScript:
	jumptextfaceplayer KumeCityTeacherText

KumeCityRockerScript:
	jumptextfaceplayer KumeCityRockerText
	
KumeCityFisherText:
	text "It's cold over in"
	line "ICED CAVERN."
	para "Be prepared for"
	line "that if you go"
	cont "exploring."
	done
	
KumeCityLassText:
	text "You've been to"
	line "FROSTPOINT TOWN?"
	para "Wow, that's so far"
	line "from here."
	done
	
KumeCityTeacherText:
	text "You look like"
	line "you're ready to go"
	para "anywhere with"
	line "#MON."
	done
	
KumeCityRockerText:
	text "The climate isn't"
	line "as tropical here"
	cont "as RYUKYU CITY,"
	para "so we don't get as"
	line "many tourists."
	para "However, I hear"
	line "the islands south"
	para "of here are warm"
	line "and tropical."
	para "I've never seen"
	line "them, though."
	para "The whole area is"
	line "off-limits."
	done
	
KumeCitySignText:
	text "KUME CITY"
	para "The Rocky Mountain"
	line "Town"
	done
	
UrumaCavernSignText:
	text "ICED CAVERN"
	line "ENTRANCE"
	done

KumeCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7,  6, KUME_MART, 1
	warp_event 25, 18, KUME_POKECENTER_1F, 1
	warp_event  7, 25, KUME_SHIP_PARTS_HOUSE, 1
	warp_event 21, 13, KUME_ISLAND_LEGEND_SPEECH_HOUSE, 1
	warp_event 17, 23, KUME_SOCIAL_HOUSE, 1
	warp_event 15,  5, ICED_CAVERN_1F, 8

	db 0 ; coord events

	db 4 ; bg events
	bg_event 26, 18, BGEVENT_READ, KumeCityPokecenterSign
	bg_event  8,  6, BGEVENT_READ, KumeCityMartSign
	bg_event 28, 18, BGEVENT_READ, KumeCitySign
	bg_event 18,  7, BGEVENT_READ, UrumaCavernSign

	db 6 ; object events
	object_event 18, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeCityFruitTree1, -1
	object_event 16, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KumeCityFruitTree2, -1
	object_event 12, 19, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityFisherScript, -1
	object_event 25, 23, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityLassScript, -1
	object_event 12,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityTeacherScript, -1
	object_event 14, 27, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KumeCityRockerScript, -1
