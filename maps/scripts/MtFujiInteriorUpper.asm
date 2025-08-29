	object_const_def ; object_event constants
	const MTFUJIINTERIORUPPER_COOLTRAINER_F
	const MTFUJIINTERIORUPPER_BIRDKEEPER
	const MTFUJIINTERIORUPPER_SWIMMER_M
	const MTFUJIINTERIORUPPER_SOLDIER
	const MTFUJIINTERIORUPPER_COOLTRAINER_M
	const MTFUJIINTERIORUPPER_PSYCHIC
	const MTFUJIINTERIORUPPER_FIREBREATHER
	const MTFUJIINTERIORUPPER_HIKER
	const MTFUJIINTERIORUPPER_HIKER2
	const MTFUJIINTERIORUPPER_COOLTRAINER_M2
	const MTFUJIINTERIORUPPER_COOLTRAINER_F2
	const MTFUJIINTERIORUPPER_ITEM_1
	const MTFUJIINTERIORUPPER_ITEM_2
	const MTFUJIINTERIORUPPER_ITEM_3

MtFujiInteriorUpper_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

MtFujiInteriorUpperHelixFossil:
	itemball HELIX_FOSSIL

	
MtFujiInteriorUpperNugget:
	itemball NUGGET
	
MtFujiInteriorUpperToxic:
	itemball TM_TOXIC

MtFujiInteriorUpperHiddenPpUp:
	hiddenitem PP_UP, EVENT_MT_FUJI_INTERIOR_UPPER_HIDDEN_PP_UP

	
TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJennAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBirdkeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdkeeperRoySeenText, BirdkeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdkeeperRoyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierAntonio:
	trainer SOLDIER, ANTONIO, EVENT_BEAT_SOLDIER_ANTONIO, SoldierAntonioSeenText, SoldierAntonioBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierAntonioAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainermAndy:
	trainer COOLTRAINERM, ANDY, EVENT_BEAT_COOLTRAINERM_ANDY, CooltrainermAndySeenText, CooltrainermAndyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAndyAfterBattleText
	waitbutton
	closetext
	end
	

TrainerPsychicRichard:
	trainer PSYCHIC_T, RICHARD, EVENT_BEAT_PSYCHIC_RICHARD, PsychicRichardSeenText, PsychicRichardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRichardAfterBattleText
	waitbutton
	closetext
	end
	

TrainerFirebreatherWalt:
	trainer FIREBREATHER, WALT, EVENT_BEAT_FIREBREATHER_WALT, FirebreatherWaltSeenText, FirebreatherWaltBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherWaltAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end


TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermTyler:
	trainer COOLTRAINERM, TYLER, EVENT_BEAT_COOLTRAINERM_TYLER, CooltrainermTylerSeenText, CooltrainermTylerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermTylerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

BirdkeeperRoySeenText:
	text "My birds don't"
	line "have much room to"
	cont "fly in this cave."
	done

BirdkeeperRoyBeatenText:
	text "Grounded!"
	done

BirdkeeperRoyAfterBattleText:
	text "My birds always"
	line "do their best."
	done

CooltrainerfJennSeenText:
	text "Let me see if you"
	line "have what it takes"
	para "to challenge the"
	line "LEAGUE."
	done

CooltrainerfJennBeatenText:
	text "I'd say you do…"
	done

CooltrainerfJennAfterBattleText:
	text "To defeat the"
	line "LEAGUE, you'll"
	para "have to face the"
	line "ELITE FOUR all in"
	cont "a row."
	para "And the CHAMPION"
	line "after that."
	para "It takes a lot."
	para "You better be"
	line "ready!"
	done
	

SwimmermKirkSeenText:
	text "The water is calm"
	line "in here."
	para "It's kind of un-"
	line "settling."
	done

SwimmermKirkBeatenText:
	text "I'm sunk!"
	done

SwimmermKirkAfterBattleText:
	text "It must be nice"
	line "riding on a"
	cont "#MON."
	done

SoldierAntonioSeenText:
	text "It takes a real"
	line "trooper to make it"
	cont "through this cave!"
	done
	
SoldierAntonioBeatenText:
	text "Keep pushing"
	line "forward!"
	done
	
SoldierAntonioAfterBattleText:
	text "It's time for you"
	line "to march on!"
	done
	
CooltrainermAndySeenText:
	text "Which path is the"
	line "right path?"
	done

CooltrainermAndyBeatenText:
	text "Guess it wasn't"
	line "this one."
	done

CooltrainermAndyAfterBattleText:
	text "That was a serious"
	line "question."
	para "I don't want to"
	line "get lost in here."
	done	

PsychicRichardSeenText:
	text "I know your deep-"
	line "est desires!"
	done

PsychicRichardBeatenText:
	text "Good battle!"
	done

PsychicRichardAfterBattleText:
	text "You desire to make"
	line "your way out of"
	cont "this cave!"
	para "…I guess that"
	line "one is pretty"
	cont "obvious."
	done
	
FirebreatherWaltSeenText:
	text "I like my caves"
	line "nice and warm."
	para "This one is not."
	done
	
FirebreatherWaltBeatenText:
	text "Ow, hot!"
	done

FirebreatherWaltAfterBattleText:
	text "It's pretty chilly"
	line "in here."
	para "Have you ever been"
	line "in MAGMA SHAFT?"
	para "It's much more"
	line "toasty there!"
	done

HikerMichaelSeenText:
	text "Yo! You're spunky!"
	line "But you know what?"

	para "When it comes to"
	line "sheer spunkiness,"
	cont "I'm the man!"
	done

HikerMichaelBeatenText:
	text "My #MON weren't"
	line "spunky enough!"
	done

HikerMichaelAfterBattleText:
	text "Boy, do I love"
	line "HP UP! Mmmm, yum!"

	para "I keep drinking my"
	line "#MON's!"

	para "I can't help it!"
	done


HikerKennySeenText:
	text "I should catch"
	line "myself an ONIX."
	done

HikerKennyBeatenText:
	text "I lost…"
	done

HikerKennyAfterBattleText:
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	
	para "MT.FUJI would have"
	line "been shorter many"
	cont "millennia ago."
	done
	
CooltrainermTylerSeenText:
	text "This is the last"
	line "section before the"
	cont "summit!"
	para "Can you make it?"
	done

CooltrainermTylerBeatenText:
	text "I think you've got"
	line "this."
	done

CooltrainermTylerAfterBattleText:
	text "You're close to"
	line "facing the LEAGUE."
	para "How does that make"
	line "you feel?"
	done
	

CooltrainerfCybilSeenText:
	text "You look strong."

	para "Good trainers seek"
	line "tough opponents"
	cont "instinctively."
	done

CooltrainerfCybilBeatenText:
	text "Nope! This won't"
	line "do at all."
	done

CooltrainerfCybilAfterBattleText:
	text "We all get better"
	line "by experiencing"
	cont "many battles."

	para "I battled a lot to"
	line "become what I am"
	cont "today--an elite."
	done	

MtFujiInteriorUpper_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 25, 51, MOUNT_FUJI_OUTSIDE, 6
	warp_event 15, 41, MOUNT_FUJI_OUTSIDE, 7
	warp_event  9, 33, MOUNT_FUJI_OUTSIDE, 8
	warp_event 19,  1, FUJI_SUMMIT, 3
	warp_event 28, 41, MT_FUJI_INTERIOR_LOWER, 9

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3, 20, BGEVENT_ITEM, MtFujiInteriorUpperHiddenPpUp

	db 14 ; object events
	object_event 26, 45, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event 15, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdkeeperRoy, -1
	object_event  7, 47, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 13, 31, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierAntonio, -1
	object_event 18, 29, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAndy, -1
	object_event 21, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPsychicRichard, -1
	object_event 14, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFirebreatherWalt, -1
	object_event 26, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event 15,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerHikerKenny, -1
	object_event 36, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermTyler, -1
	object_event  8, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfCybil, -1
	object_event 37, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperNugget, EVENT_MT_FUJI_INTERIOR_UPPER_NUGGET
	object_event 37,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperToxic, EVENT_MT_FUJI_INTERIOR_UPPER_TOXIC
	object_event  2,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtFujiInteriorUpperHelixFossil, EVENT_MT_FUJI_INTERIOR_UPPER_HELIX_FOSSIL
