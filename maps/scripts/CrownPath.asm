	object_const_def ; object_event constants
	const CROWNPATH_SILVER

CrownPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWNPATH_SILVER, DOWN
	pause 15
	applymovement CROWNPATH_SILVER, UndergroundSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_PALSSIO_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_PALSSIO
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_5_CUBBURN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, UndergroundPlayer1StepToTheSide
	applymovement CROWNPATH_SILVER, UndergroundSilverLeavesMovement
	disappear CROWNPATH_SILVER
	setscene SCENE_UNDERGROUND_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWNCITY_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PATH_HIDDEN_FULL_RESTORE

CrownPathHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PATH_HIDDEN_X_SPECIAL
	
UndergroundSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
UndergroundPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end
	
UndergroundSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
UndergroundSilverBeforeText:
	text "Hi, <PLAYER>!"
	para "…"
	para "You're about to"
	line "climb MT.FUJI,"
	cont "right?"
	para "It's been a long"
	line "journey."
	para "We've both been"
	line "through a lot."
	para "Are your #MON"
	line "ready?"
	para "Are my #MON"
	line "ready?"
	para "Let's face off,"
	line "right here!"
	para "A battle between"
	line "friends!"
	done
	
UndergroundSilverWinText:
	text "…"
	done
	
UndergroundSilverLossText:
	text "…"
	done
	
UndergroundSilverAfterText:
	text "You know what I've"
	line "realized?"
	para "I was so excited"
	line "to challenge the"
	cont "LEAGUE."
	para "I wanted to have"
	line "the strongest"
	cont "#MON."
	para "I wanted to be the"
	line "toughest trainer"
	cont "there is."
	para "I only wanted to"
	line "defeat other"
	para "trainers to prove"
	line "how good I am."
	para "But dealing with"
	line "TEAM ROCKET has"
	cont "made me think."
	para "They only saw"
	line "#MON as tools"
	cont "to be used."
	para "And while their"
	line "ambitions were"
	para "evil, and mine had"
	line "only been selfish,"
	para "I realized that"
	line "the way I thought"
	para "about #MON was"
	line "similar."
	para "I saw my team only"
	line "as a way to have"
	cont "strength."
	para "And training"
	line "#MON shouldn't"
	cont "be about that."
	para "I've realized I"
	line "need to treat my"
	cont "team with love."
	para "And I don't think"
	line "I'm quite ready to"
	para "face the LEAGUE"
	line "until I've worked"
	para "on that more, and"
	line "made sure my"
	para "#MON are ready"
	line "for the challenge."
	para "So I'm going to do"
	line "some more training"
	cont "first."
	para "I'm going to make"
	line "sure me and my"
	para "#MON are ready"
	line "for the challenge,"
	para "so we can battle"
	line "as a team!"
	para "I'll see you"
	line "around soon."
	done

CrownPath_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 33, CROWN_PATH_GATE, 3
	warp_event 11, 33, CROWN_PATH_GATE, 4
	warp_event 11,  1, CROWN_CITY, 1
	warp_event 12,  1, CROWN_CITY, 2

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPathHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPathHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
