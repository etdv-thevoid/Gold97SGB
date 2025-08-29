	object_const_def ; object_event constants
	const RADIOTOWER4F_ROCKER
	const RADIOTOWER4F_BURGLAR
	const RADIOTOWER4F_SUPER_NERD
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_SCIENTIST
	const RADIOTOWER4F_GRUNTM27
	const RADIOTOWER4F_GRUNTM28

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText


RadioTower4fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fRocker
	writetext RadioTower4fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover4fRocker
	writetext RadioTower4fRockerTextTakeover
	waitbutton
	closetext
	end
	

RadioTower4fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover4fTeacher
	writetext RadioTower4fTeacherTextTakeover
	waitbutton
	closetext
	end

RadioTower4fSuperNerd:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fSuperNerd
	checkflag ENGINE_MAP_CARD
	iffalse .KenFinallyGivesMap
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .KenAfterRadioTower
	writetext RadioTower4fSuperNerdText
	waitbutton
	closetext
	end
.MidRocketTakeover4fSuperNerd
	writetext RadioTower4fSuperNerdTextTakeover
	waitbutton
	closetext
	end
.KenAfterRadioTower
	writetext RadioTower4fSuperNerdTextAfter
	waitbutton
	closetext
	end
.KenFinallyGivesMap
	writetext KenGiveMapInTower
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext KenGiveMapInTower2
	waitbutton
	closetext
	end
	

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "MAP CARD@"
	

	
RadioTower4fBurglar:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarText
	waitbutton
	closetext
	end
.MidRocketTakeover4fBurglar
	writetext RadioTower4fBurglarTextTakeover
	waitbutton
	closetext
	end
	
TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM27:
	trainer GRUNTM, GRUNTM_27, EVENT_BEAT_ROCKET_GRUNTM_27, GruntM27SeenText, GruntM27BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM27AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM28:
	trainer GRUNTM, GRUNTM_28, EVENT_BEAT_ROCKET_GRUNTM_28, GruntM28SeenText, GruntM28BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM28AfterBattleText
	waitbutton
	closetext
	end
	

GruntM28SeenText:
	text "Surprise!"
	done
	
GruntM28BeatenText:
	text "You were prepared"
	line "for this…"
	done
	
GruntM28AfterBattleText:
	text "I'm sure you're"
	line "used to seeing"
	para "TEAM ROCKET grunts"
	line "by now."
	done

KenGiveMapInTower:
	text "KEN: Hey, bro!"
	line "I did it!"
	para "I'm a DJ now!"
	para "And the research"
	line "you've been doing"
	para "for PROF.OAK is"
	line "super useful for"
	cont "my radio show!"
	para "I owe ya one!"
	para "…Oh, wait!"
	line "I never had a"
	para "chance to give"
	line "this to you!"
	done
	
KenGiveMapInTower2:
	text "How did you make"
	line "it this far with-"
	para "out a map and not"
	line "get lost?"
	done
	
GruntM27SeenText:
	text "Going to the top?"
	para "I don't think so!"
	done
	
GruntM27BeatenText:
	text "I hear the view"
	line "is lovely up"
	cont "there."
	done
	
GruntM27AfterBattleText:
	text "You can beat me,"
	line "but you can't beat"
	cont "GIOVANNI!"
	done

	
ScientistMarcSeenText:
	text "My research shows"
	line "we have a brat!"
	done
	
ScientistMarcBeatenText:
	text "Oh, dear."
	done
	
ScientistMarcAfterBattleText:
	text "You stand in the"
	line "way of science!"
	done
	
RadioTower4fTeacherText:
	text "MARY: Be sure to"
	line "tune in to KEN's"
	cont "#MON TALK,"
	para "daily after 10"
	line "in the morning!"
	done
	
RadioTower4fTeacherTextTakeover:
	text "MARY: I should've"
	line "stayed home today!"
	done
	
RadioTower4fBurglarText:
	text "Hiya, kid!"
	para "I'm the production"
	line "manager for KEN's"
	cont "#MON TALK!"
	para "Be sure to tune in"
	line "to our show!"
	done
	
RadioTower4fBurglarTextTakeover:
	text "This isn't part of"
	line "the production"
	cont "plan!"
	done

RadioTower4fRockerText:
	text "I listened to the"
	line "radio while I was"
	cont "at SANSKRIT RUINS."
	para "I heard a strange"
	line "broadcast there."
	done
	
RadioTower4fRockerTextTakeover:
	text "All our regular"
	line "shows are"
	cont "currently off-air!"
	done
	
	
RadioTower4fSuperNerdText:
	text "KEN: Hey, bro!"
	line "I did it!"
	para "I'm a DJ now!"
	para "And the research"
	line "you've been doing"
	para "for PROF.OAK is"
	line "super useful for"
	cont "my radio show!"
	para "I owe ya one!"
	done
	
RadioTower4fSuperNerdTextTakeover:
	text "KEN: Bro! What are"
	line "you doing here!?"
	para "Stay safe!"
	done
	
RadioTower4fSuperNerdTextAfter:
	text "KEN: Did you kick"
	line "those ROCKETS out"
	cont "of here?"
	para "Bro, you and your"
	line "#MON are"
	cont "seriously strong!"
	done
	
RadioTower4FStudio2SignText:
	text "4F STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  7,  0, RADIO_TOWER_3F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  4,  1, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RadioTower4fRocker, -1
	object_event  7,  5, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower4fBurglar, -1
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4fSuperNerd, -1
	object_event  0,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, RadioTower4fTeacher, -1
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  1,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM27, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 1, TrainerGruntM28, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
