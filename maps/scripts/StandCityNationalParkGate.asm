	object_const_def ; object_event constants
	const STANDCITYNATIONALPARKGATE_OFFICER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER1
	const STANDCITYNATIONALPARKGATE_YOUNGSTER2
	const STANDCITYNATIONALPARKGATE_ROCKER
	const STANDCITYNATIONALPARKGATE_POKEFAN_M
	const STANDCITYNATIONALPARKGATE_YOUNGSTER3
	const STANDCITYNATIONALPARKGATE_YOUNGSTER4
	const STANDCITYNATIONALPARKGATE_LASS
	const STANDCITYNATIONALPARKGATE_YOUNGSTER5
	const STANDCITYNATIONALPARKGATE_YOUNGSTER6
	const STANDCITYNATIONALPARKGATE_YOUNGSTER7
	const STANDCITYNATIONALPARKGATE_OFFICER2

StandCityNationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_STANDCITYNATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	priorityjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_STANDCITYNATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_STANDCITYNATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_103_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear STANDCITYNATIONALPARKGATE_OFFICER1
	disappear STANDCITYNATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar 1
	vartomem MEM_BUFFER_0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear STANDCITYNATIONALPARKGATE_OFFICER1
	appear STANDCITYNATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special FadeInQuickly
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear STANDCITYNATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear STANDCITYNATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear STANDCITYNATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear STANDCITYNATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route102OfficerScriptContest:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	scall Route102ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, DOWN
	applymovement PLAYER, ExitBuildingMovement
	playsound SFX_EXIT_BUILDING
	special FadeBlackQuickly
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing DOWN, NATIONAL_PARK_BUG_CONTEST, 32, 31
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route102Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem HEART_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_HEART_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

StandCityNationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route102Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route102ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route103NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

ExitBuildingMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6add1:
	big_step UP
	big_step UP
;	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

UnknownText_0x6ae87:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done

UnknownText_0x6aecc:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

UnknownText_0x6afb0:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_ram wStringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

UnknownText_0x6b021:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

UnknownText_0x6b055:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

UnknownText_0x6b081:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

UnknownText_0x6b0c6:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

UnknownText_0x6b0f2:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6b166:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

UnknownText_0x6b209:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6b284:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

UnknownText_0x6b2c5:
	text "OK. Please wait"
	line "here for the"

	para "announcement of"
	line "the winners."
	done

UnknownText_0x6b300:
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done

UnknownText_0x6b32b:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

UnknownText_0x6b370:
	text "Some #MON can"
	line "only be seen in"
	cont "the PARK."
	done

BugCatchingContestant1BText:
	text "DON: Wow, you beat"
	line "me. You're pretty"
	cont "good."
	done

BugCatchingContestant1BStillCompetingText:
	text "DON: Luck plays a"
	line "big part in this."

	para "You never know"
	line "what #MON will"
	cont "appear."
	done

BugCatchingContestant2BText:
	text "ED: I envy you."
	line "I just couldn't"
	cont "do it this time."
	done

BugCatchingContestant2BStillCompetingText:
	text "ED: Maybe you win"
	line "with big #MON?"
	done

BugCatchingContestant3BText:
	text "NICK: Well done!"
	line "I'm going to raise"
	cont "my #MON better."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICK: Maybe you"
	line "get a higher score"

	para "for a #MON of"
	line "an unusual color."
	done

BugCatchingContestant4BText:
	text "WILLIAM: You're"
	line "the winner? What"
	cont "did you catch?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILLIAM: Well, I'm"
	line "satisfied because"

	para "I caught a #MON"
	line "that I wanted."
	done

BugCatchingContestant5BText:
	text "BENNY: Congrats!"
	line "You have earned my"
	cont "respect!"
	done

BugCatchingContestant5BStillCompetingText:
	text "BENNY: I caught a"
	line "SCYTHER before,"
	cont "but I didn't win."
	done

BugCatchingContestant6BText:
	text "BARRY: That #-"
	line "MON you caught…"
	cont "it's awesome!"
	done

BugCatchingContestant6BStillCompetingText:
	text "BARRY: It's easier"
	line "to win if you get"

	para "a high-level bug"
	line "#MON."

	para "But I think they"
	line "also consider some"
	cont "other points."
	done

BugCatchingContestant7BText:
	text "CINDY: You won?"
	line "That's great!"

	para "Do you feel like"
	line "looking for bug"
	cont "#MON with me?"
	done

BugCatchingContestant7BStillCompetingText:
	text "CINDY: I really"
	line "love bug #MON!"
	done

BugCatchingContestant8BText:
	text "JOSH: I… I can't"
	line "believe I lost at"
	cont "bug-catching…"
	done

BugCatchingContestant8BStillCompetingText:
	text "JOSH: I heard that"
	line "somebody won with"
	cont "a CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUEL: Next time,"
	line "I'm going to win."
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUEL: Darn."
	line "I thought I would"
	cont "score higher…"
	done

BugCatchingContestant10BText:
	text "KIPP: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done

BugCatchingContestant10BStillCompetingText:
	text "KIPP: I study a"
	line "lot, but that's"

	para "not good enough to"
	line "win."
	done

UnusedBellignanText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Bellignan.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "I hear there's a"
	line "#MON that looks"
	cont "just like a tree."

	para "You can reveal its"
	line "identity using a"
	cont "SILPHSCOPE 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route103NationalParkGate.asm
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done

UnknownText_0x6b910:
	text "Uh-oh… Your PACK"
	line "is full."

	para "We'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done

UnknownText_0x6b97f:
	text "<PLAYER>?"

	para "Here's the prize"
	line "we were holding"
	cont "for you."
	done

StandCityNationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, NATIONAL_PARK, 1
	warp_event  1,  7, NATIONAL_PARK, 2
	warp_event  8,  7, STAND_CITY, 10
	warp_event  9,  7, STAND_CITY, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route102OfficerScriptContest, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityNationalParkGateOfficerScript, EVENT_STAND_CITY_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
