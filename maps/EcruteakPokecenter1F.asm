	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	prioritysjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	buttonsound
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Salut, je suis"
	line "LEO. Et toi qui"
	cont "es-tu?"

	para "<PLAYER>,"
	line "hein? Tu arrives"
	cont "au bon moment."
	done

EcruteakPokecenter1F_BillText2:
	text "Je viens de finir"
	line "les derniers r??-"
	cont "glages du BLOC"
	cont "TEMPOREL."

	para "Tu sais que les"
	line "#MON peuvent"
	cont "??tre ??chang??s?"

	para "Mon BLOC TEMPOREL"
	line "a ??t?? mis"

	para "au point pour"
	line "faire des ??changes"
	cont "dans le temps."

	para "Mais tu ne peux"
	line "pas envoyer des"

	para "choses qui"
	line "n'existaient pas"
	cont "dans le pass??."

	para "Si tu le fais, le"
	line "PC du pass?? sera"
	cont "court-circuit??."

	para "Tu dois donc en-"
	line "lever tout ce qui"

	para "n'appartient pas"
	line "au pass??."

	para "En clair, pas"
	line "d'envoi de nou-"

	para "velles attaques ou"
	line "de nouveaux #-"
	cont "MON par le BLOC"
	cont "TEMPOREL."

	para "T'en fais pas."
	line "J'ai fait les"
	cont "derni??res modifs."

	para "Demain, les"
	line "BLOCS TEMPORELS"

	para "seront dans"
	line "tous les CENTRES"
	cont "#MON."

	para "Je dois vite"
	line "retourner ??"
	cont "DOUBLONVILLE pour"
	cont "voir mes parents."

	para "Tchao!"
	done

EcruteakPokecenter1FPokefanMText:
	text "La fa??on dont les"
	line "KIMONO dansent est"

	para "merveilleuse."
	line "Comme lorsqu'elles"
	cont "utilisent leurs"
	cont "#MON."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Tu veux te battre"
	line "contre plus d'ad-"

	para "versaires, non?"
	line "Il y a un endroit"
	cont "fait pour toi."

	para "O?? ??a?"

	para "Apr??s OLIVILLE."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "MORTIMER, le"
	line "CHAMPION d'ARENE"
	cont "est trooop cool."

	para "Ses #MON sont"
	line "bien bal??zes."
	done

EcruteakPokecenter1FGymGuyText:
	text "LAC COLERE..."

	para "L?? o?? le LEVIATOR"
	line "appara??t..."

	para "Ca sent l'em-"
	line "brouille. Je sais!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
