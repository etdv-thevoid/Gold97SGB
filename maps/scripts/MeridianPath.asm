	object_const_def ; object_event constants
	const MERIDIANPATH_YOUNGSTER1
	const MERIDIANPATH_LASS1
	const MERIDIANPATH_YOUNGSTER2
	const MERIDIANPATH_LASS2
	const MERIDIANPATH_YOUNGSTER3
	const MERIDIANPATH_LASS3
	const MERIDIANPATH_SUPER_NERD
	const MERIDIANPATH_COOLTRAINER_M2
	const MERIDIANPATH_POKE_BALL

MeridianPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainermKevinSeenText, CooltrainermKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKevinAfterBattleText
	waitbutton
	closetext
	end


MeridianPathProtein:
	itemball PROTEIN

MeridianPathHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_MERIDIAN_PATH_HIDDEN_HYPER_POTION
	
MeridianPathSign:
	jumptext MeridianPathSignText
	
MeridianPathSignText:
	text "MERIDIAN PATH"
	para "NAGO VILLAGE -"
	line "RYUKYU CITY"
	done


BeautyVictoriaSeenText:
	text "You ever climbed"
	line "the CHARRED"
	cont "SUMMIT?"
	done

BeautyVictoriaBeatenText:
	text "How could I lose?"
	done

BeautyVictoriaAfterBattleText:
	text "The view is very"
	line "pretty up there."
	done

SchoolboyJoeSeenText:
	text "You've traveled"
	line "all of NIHON?"
	para "That's cool."
	para "But do you stand"
	line "a chance against"
	cont "a trainer like me?"
	done

SchoolboyJoeBeatenText:
	text "Ow! Stomped flat!"
	done

SchoolboyJoeAfterBattleText:
	text "Looks like you had"
	line "plenty of time to"
	para "raise your #MON"
	line "while traveling."
	done

LassLauraSeenText:
	text "You look like"
	line "you're far from"
	cont "home."
	done

LassLauraBeatenText:
	text "I'm out!"
	done

LassLauraAfterBattleText:
	text "Where are you"
	line "from?"
	para "SILENT TOWN?"
	para "I've never been"
	line "there."
	done

CamperLloydSeenText:
	text "Going to CHARRED"
	line "SUMMIT?"
	done

CamperLloydBeatenText:
	text "Whoa! Too much."
	done

CamperLloydAfterBattleText:
	text "Legend says that a"
	line "rare #MON"
	cont "roosts here."
	para "But I've climbed"
	line "to the top and"
	para "never seen any-"
	line "thing."
	done

LassShannonSeenText:
	text "Let me tell you,"
	line "I'm a tough"
	cont "trainer!"
	done

LassShannonBeatenText:
	text "You're kidding."
	done

LassShannonAfterBattleText:
	text "I did my best."
	line "But you did"
	cont "better, I guess."
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "Battle me."
	done

SupernerdPatBeatenText:
	text "You weren't"
	line "supposed to win."
	done

SupernerdPatAfterBattleText:
	text "There's a lady"
	line "in NAGO VILLAGE"
	para "who has like a"
	line "million CHARMANDER"
	cont "in her house."
	para "I worry that it'll"
	line "catch fire."
	done


CooltrainermKevinSeenText:
	text "You want to"
	line "battle, right?"
	para "Right."
	done

CooltrainermKevinBeatenText:
	text "I've never had a"
	line "battle this good!"
	done

CooltrainermKevinAfterBattleText:
	text "That was a great"
	line "battle!"

	para "You and your #-"
	line "MON are truly out-"
	cont "standing!"
	done


MeridianPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 47, MERIDIAN_PATH_RYUKYU_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 14, BGEVENT_ITEM, MeridianPathHiddenHyperPotion
	bg_event 11,  5, BGEVENT_READ, MeridianPathSign

	db 8 ; object events
	object_event  9,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event  8, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyJoe, -1
	object_event 13, 44, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 14, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event  8, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassShannon, -1
	object_event  6, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdPat, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermKevin, -1
	object_event  6, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeridianPathProtein, EVENT_MERIDIAN_PATH_PROTEIN
