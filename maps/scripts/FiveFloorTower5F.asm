	object_const_def ; object_event constants
	const TINTOWER5F_SAGE1
	const TINTOWER5F_KURT
	const TINTOWER5F_CAPTAIN

FiveFloorTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
	checkevent EVENT_HO_OH_EVENT_STARTED
	iffalse .DoneStairs
	changeblock   0,  5, $3A ; ladder
.DoneStairs:
	return

FiveFloorTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_HO_OH_EVENT_STARTED
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSageYup
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, TINTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TINTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement TINTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
	text "KURT: I knew I was"
	line "right when I"
	para "sensed something"
	line "about you."
	done
	
CaptainCantBelieve:
	text "I can't believe"
	line "it!"
	para "The return of the"
	line "bird!"
	para "It's happening!"
	done
	
SageTellsYouToSeeBird:
	text "<PLAYER>."
	para "HO-OH roosts above"
	line "our heads."
	para "The bird has"
	line "returned, as"
	para "predicted in"
	line "legend."
	para "I sense that it"
	line "wants to meet"
	cont "you."
	para "It has determined"
	line "that actions you"
	para "have taken have"
	line "shown that you are"
	para "worthy of"
	line "approaching it."
	para "Make your way to"
	line "the roof."
	done
	
Text_5FSageDuringHoOh:
	text "The bird awaits."
	done

Text_5FSageAfterHoOh:
	text "Such an encounter"
	line "with the bird is"
	cont "a legendary event."
	done
	
Text_5FSageNope:
	text "You have reached"
	line "the top of the"
	cont "tower."
	para "But you have not"
	line "heard all of its"
	cont "messages."
	para "Please be sure you"
	line "have read all"
	para "signs on every"
	line "floor."
	para "Each one teaches"
	line "a valuable lesson."
	done
	
Text_5FSageYup:
	text "Welcome to the top"
	line "of the 5 FLOOR"
	cont "TOWER."
	para "This is a sacred"
	line "place that should"
	para "only be visited"
	line "by those willing"
	para "to show proper"
	line "respect."
	para "I understand that"
	line "KURT has asked"
	para "you to scale its"
	line "floors."
	para "I hope you can"
	line "go forward with"
	para "the knowledge and"
	line "understanding of"
	para "how to properly"
	line "treat #MON."
	para "Return now to see"
	line "KURT. You have my"
	cont "blessing."
	done

FiveFloorTower5FSign:
	setevent EVENT_READ_5F5F_SIGN
	jumptext FiveFloorTower5FSignText

	
FiveFloorTower5FSignText:
	text "This is a statue"
	line "of an ABRA."
	para "ABRA are easily"
	line "startled and quick"
	para "to flee when"
	line "encountered in the"
	cont "wild."
	para "Be sure to honor"
	line "and respect all"
	para "#MON in their"
	line "natural habitats."
	done
	
FiveFloorTower5FIncense:
	jumptext FiveFloorTower5FIncenseText

FiveFloorTower5FIncenseText:
	text "What is this?"
	para "Oh, it's an"
	line "incense burner!"
	done

FiveFloorTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, FIVE_FLOOR_TOWER_4F, 2
	warp_event  0,  5, FIVE_FLOOR_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, FiveFloorTower5FSign
	bg_event 3, 0, BGEVENT_READ, FiveFloorTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FiveFloorTower5FSageScript, EVENT_KURT_AND_CAPTAIN_AT_FIVE_FLOOR_TOWER
