	object_const_def ; object_event constants
	const PAGOTAGYM_FALKNER
	const PAGOTAGYM_YOUNGSTER1
	const PAGOTAGYM_YOUNGSTER2
	const PAGOTAGYM_GYM_GUY

PagotaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaGymFalknerScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_FALKNER
	iftrue RematchScriptFalkner
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptFalkner
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall PagotaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	clearevent EVENT_ROUTE_102_SILVER
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
	

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
RematchScriptFalkner:
	opentext
	writetext FalknerRematchText
	waitbutton
	closetext
	winlosstext FalknerRematchWinText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_FALKNER
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptFalkner:
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

FalknerRematchText:
	text "I was told you"
	line "won at the"
	cont "#MON LEAGUE."
	para "Congratulations!"
	
	para "I've been doing"
	line "lots of training"
	para "here at the"
	line "PAGOTA GYM."
	
	para "Let's see if you"
	line "can still beat"
	cont "me!"
	done

FalknerRematchWinText:
	text "It's no wonder"
	line "you won!"
	done

FalknerAfterRematchText:
	text "I'm glad I was"
	line "your first"
	para "stepping stone"
	line "to greatness!"
	
	para "Keep on fighting!"
	done



PagotaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end


PagotaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_GYM_FALKNER
	iftrue .nothere
	checkevent EVENT_BEAT_FALKNER
	iftrue .PagotaGymGuyWinScript
	writetext PagotaGymGuyText
	waitbutton
	closetext
	end
	
.nothere
	writetext PagotaGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.PagotaGymGuyWinScript:
	writetext PagotaGymGuyWinText
	waitbutton
	closetext
	end

PagotaGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "I knew you'd be"
	line "showing up here"
	cont "sometime soon!"
	
	para "It's always great"
	line "to see a new"
	para "trainer take on"
	line "the LEAGUE."

	para "But are you ready"
	line "to take me on?"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done

FalknerWinLossText:
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#MON…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

FalknerZephyrBadgeText:
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "CUT, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

FalknerTMMudSlapText:
	text "By using a TM, a"
	line "#MON will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

FalknerFightDoneText:
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these GYMS."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done

BirdKeeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#MON masters."

	para "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "FALKNER's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face FALKNER!"
	done

BirdKeeperAbeBeatenText:
	text "This can't be"
	line "true!"
	done

BirdKeeperAbeAfterBattleText:
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done

PagotaGymGuyText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
	done

PagotaGymGuyTextNotHere:
	text "Hey! Are you here"
	line "to challenge"
	cont "FALKNER?"
	
	para "I hate to tell you"
	line "this, but he's not"
	cont "here!"
	
	para "FALKNER's gone out"
	line "somewhere right"
	cont "now."
	
	para "Maybe look around"
	line "town for him."
	para "He couldn't have"
	line "gone far."
	done

PagotaGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done

PagotaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 2
	warp_event  4, 15, PAGOTA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 13, BGEVENT_READ, PagotaGymStatue
	bg_event  5, 13, BGEVENT_READ, PagotaGymStatue

	db 4 ; object events
	object_event  4,  4, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PagotaGymFalknerScript, EVENT_PAGOTA_GYM_FALKNER
	object_event  7,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  0,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  6, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaGymGuyScript, -1
