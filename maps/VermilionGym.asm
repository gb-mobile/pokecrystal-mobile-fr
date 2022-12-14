	object_const_def ; object_event constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd gymstatue2

LtSurgeIntroText:
	text "BOB: H?? toi!"
	line "Le lutin!"

	para "On peut dire que"
	line "tu as du courage"

	para "de venir me cher-"
	line "cher des noises!"

	para "Moi j'suis le boss"
	line "des #MON"
	cont "??lectriques!"

	para "Je n'ai jamais"
	line "perdu un combat."

	para "J'vais te punir!"
	line "Comme ?? l'entra??-"
	cont "nement!"
	done

LtSurgeWinLossText:
	text "BOB: Arrrgh!"
	line "Trop fort!"

	para "OK. Voil?? ton"
	line "BADGE FOUDRE!"
	done

ReceivedThunderBadgeText:
	text "<PLAYER> re??oit"
	line "le BADGE FOUDRE."
	done

LtSurgeThunderBadgeText:
	text "BOB: Le BADGE FOU-"
	line "DRE augmente la"
	cont "VITESSE de tes"
	cont "#MON."

	para "Ce BADGE est la"
	line "preuve de ta vic-"

	para "toire. Porte-le"
	line "fi??rement!!!"
	done

LtSurgeFightDoneText:
	text "BOB: H?? toi!"
	line "Tu tiens le coup?"

	para "Moi et mes #MON"
	line "on a la p??che!"
	done

GentlemanGregorySeenText:
	text "Tu viens d??fier le"
	line "MAJOR BOB?"

	para "C'est ce qu'on va"
	line "voir!"
	done

GentlemanGregoryBeatenText:
	text "Pardon, MAJOR"
	line "BOB!"
	done

GentlemanGregoryAfterBattleText:
	text "A l'arm??e, le"
	line "MAJOR BOB m'a"
	cont "sauv?? la vie."
	done

GuitaristVincentSeenText:
	text "Le MAJOR BOB a foi"
	line "en mes talents de"

	para "dresseur de #-"
	line "MON ??lectriques."

	para "Tu crois pouvoir"
	line "me battre?"
	done

GuitaristVincentBeatenText:
	text "Ooh, sous le choc!"
	done

GuitaristVincentAfterBattleText:
	text "Si les pi??ges de"
	line "l'ARENE marchaient"
	cont "tu en aurais bav??!"
	done

JugglerHortonSeenText:
	text "J'vais t'allonger!"
	line "Oh que oui!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line ""
	done

JugglerHortonAfterBattleText:
	text "Ne te r??jouis pas"
	line "trop de m'avoir"

	para "battu. Le MAJOR"
	line "BOB, c'est pas la"
	cont "m??me limonade."
	done

VermilionGymGuyText:
	text "H??! Graine de"
	line "star!"

	para "Tu sais quoi..."

	para "Le MAJOR BOB qui"
	line "est tr??s prudent,"

	para "a pos?? des pi??ges"
	line "dans l'ARENE."

	para "Mais...h?? h??..."
	line "les pi??ges ne sont"
	cont "pas branch??s."

	para "Tu n'auras donc"
	line "aucun probl??me ??"
	cont "voir le MAJOR BOB."
	done

VermilionGymGuyWinText:
	text "Fouii! C'??tait une"
	line "sacr??e rencontre!"

	para "Ca m'a tout"
	line "retourn??."
	done

VermilionGymTrashCanText:
	text "Mmmm! Une bonne"
	line "poubelle d??gueue."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	db 5 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
