	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetKenAndDecorForOldSaves
	
.SetKenAndDecorForOldSaves
	setmapscene PLAYERS_HOUSE_2F, SCENE_PLAYERS_HOUSE_2F_NOTHING
	setevent EVENT_DECO_N64
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_POSTER_1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	setevent EVENT_READ_OAKS_EMAIL
	return


.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext Oak2sLookingForYouText
	buttonsound
;	stringtotext GearName, MEM_BUFFER_1
;	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
;	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext GearIsActiveText1
	waitbutton
	waitsfx
	writetext GearIsActiveText2
	playsound SFX_ITEM
	waitsfx
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	jump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
;	closetext
;	special NameRival
;	opentext
	writetext FinalMomText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	setevent EVENT_BLUE_SILENT_TOWN
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .BankOfMom
	;checkevent EVENT_GAVE_MYSTERY_EGG_TO_OAK2
	;iftrue .GaveMysteryEgg
	;checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	;iftrue .GotAPokemon
	writetext HurryUpOak2IsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfOak2sErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	special BankOfMom
	waitbutton
	closetext
	end


TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end
	
GearIsActiveText1:
	text "That's it!"
	para "I think it's all"
	line "working!"
	done
	
GearIsActiveText2:
	text "<PLAYER>'s #GEAR"
	line "is now set up!"
	done

FinalMomText:
	;text "That's right,"
	;line "<RIVAL> is"
	;cont "his name!"

	text "By the way, that"
	line "friend of yours"

	para "stopped by looking"
	line "for you."

	para "He's probably still"
	line "close by. I'm sure"

	para "you'll bump into"
	line "him soon."
	done

Oak2sLookingForYouText:
	text "Oh, <PLAYER>…!"
	line "Your new #MON"

	para "GEAR isn't set up"
	line "yet!"

	para "Let's get that"
	line "done before you"
	cont "head out!"
	done

MomGivesPokegearText:
	text "#MON GEAR, or"
	line "just #GEAR."

	para "It's essential if"
	line "you want to be a"
	cont "good trainer."

	para "The time isn't"
	line "adjusted yet."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, do you"
	line "know how to use"
	cont "the PHONE?"
	done

KnowTheInstructionsText:
	text "Don't you just"
	line "turn the #GEAR"

	para "on and select the"
	line "PHONE icon?"
	done

DontKnowTheInstructionsText:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	done

InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"

	;para "By the way, that"
	;line "friend of yours"

	;para "stopped by looking"
	;line "for you."

	;para "I can't remember"
	;line "his name though…"

	done

HurryUpOak2IsWaitingText:
	text "PROF.OAK told me"
	line "he wanted to talk"

	para "to you. You should"
	line "go see him when"
	cont "you get a chance."

	done

SoWhatWasProfOak2sErrandText:
	text "So, what was PROF."
	line "OAK's request?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done


StoveText:
	text "Mom's specialty!"

	para "SUNPOINT VOLCANO"
	line "BURGER!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SILENT_TOWN, 2
	warp_event  7,  7, SILENT_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  1, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
