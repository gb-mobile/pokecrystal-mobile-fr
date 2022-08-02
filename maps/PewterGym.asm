	object_const_def ; object_event constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd gymstatue2

BrockIntroText:
	text "PIERRE: C'est pas"
	line "tous les jours"

	para "qu'on reçoit de la"
	line "visite de quelqu'"
	cont "un de JOHTO."

	para "Moi c'est PIERRE,"
	line "le CHAMPION de"

	para "l'ARENE d'ARGENTA."
	line "J'adore les #-"
	cont "MON de la roche."

	para "Mes #MON sont"
	line "insensibles à la"

	para "plupart des atta-"
	line "ques physiques. Tu"

	para "vas en baver pour"
	line "leur faire des"
	cont "dégâts."

	para "C'est parti!"
	done

BrockWinLossText:
	text "PIERRE: Tes #-"
	line "MON ont pu passer"
	cont "ma défense de"
	cont "pierre..."

	para "Tu es plus balèze"
	line "que je ne le"
	cont "pensais..."

	para "Tiens... Prends"
	line "ce BADGE."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE ROCHE."
	done

BrockBoulderBadgeText:
	text "PIERRE: <PLAY_G>,"
	line "merci. J'ai aimé"

	para "me battre contre"
	line "toi, même si je"
	cont "l'ai mauvaise."

	para "Ce BADGE ROCHE"
	line "renforcera tes"
	cont "#MON."
	done

BrockFightDoneText:
	text "PIERRE: Grand est"
	line "le monde. Beaucoup"

	para "de dresseurs tu"
	line "rencontreras."
	cont "Oh que oui."

	para "Tu verras..."
	line "Je vais devenir"
	cont "super balèze."
	done

CamperJerrySeenText:
	text "Les dresseurs de"
	line "cette ARENE utili-"
	cont "sent des #MON"
	cont "du type ROCHE."

	para "Cet élément a une"
	line "grande DEFENSE."

	para "Les combats ris-"
	line "quent de durer"
	cont "super longtemps."
	done

CamperJerryBeatenText:
	text "Il faut que je"
	line "gagne..."
	done

CamperJerryAfterBattleText:
	text "Hé toi! Dresseur"
	line "de JOHTO! PIERRE"

	para "est super fort! Il"
	line "va te punir la"
	cont "tête!"
	done

PewterGymGuyText:
	text "Hé! Graine de"
	line "star! Tu"

	para "affrontes les"
	line "CHAMPIONS de"
	cont "KANTO, non?"

	para "Ils sont tout"
	line "aussi forts et"

	para "déterminés que"
	line "ceux de JOHTO."
	done

PewterGymGuyWinText:
	text "Hé! Graine de"
	line "star! Cette"

	para "ARENE ne t'a pas"
	line "posé trop de"
	cont "problèmes..."

	para "Tu m'as bluffé."
	line "Sérieusement."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	db 3 ; object events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
