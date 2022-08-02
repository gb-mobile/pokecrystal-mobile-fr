	object_const_def ; object_event constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd pokecenternurse

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "As-tu rencontré le"
	line "#MANIAC?"

	para "Il se vante sans"
	line "cesse sur ses"
	cont "#MON rares."
	done

CianwoodGymGuyText:
	text "Les dresseurs de"
	line "l'ARENE sont des"
	cont "grosses brutes."

	para "Je veux pas qu'ils"
	line "s'en prennent à"
	cont "moi."

	para "Un conseil: le"
	line "CHAMPION utilise"
	cont "le type COMBAT."

	para "Tu devrais donc"
	line "utiliser des"
	cont "#MON PSY."

	para "Mets son équipe"
	line "K.O. avant qu'elle"

	para "n'utilise la"
	line "force."

	para "Et les rochers au"
	line "milieu de l'ARENE?"

	para "Bouge-les correc-"
	line "tement pour accé-"
	cont "der au CHAMPION."

	para "Si tu ne peux plus"
	line "progresser, sors."
	done

CianwoodGymGuyWinText:
	text "<PLAYER>!"
	line "Tu as gagné!"
	cont "Je le savais rien"
	cont "qu'en te voyant!"
	done

CianwoodPokecenter1FUnusedText1:
; unreferenced
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

CianwoodPokecenter1FUnusedText2:
; unreferenced
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "J'adore frimer"
	line "avec mes #MON."

	para "Et toi?"
	line "C'est ton truc?"

	para "Je vais faire"
	line "plein de combats"

	para "et frimer avec"
	line "mes jolis #MON!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
