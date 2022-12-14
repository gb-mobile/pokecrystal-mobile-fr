	object_const_def ; object_event constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Le LAC COLERE est"
	line "en fait un crat??re"

	para "cr???? par le"
	line "d??cha??nement des"
	cont "LEVIATOR."

	para "Le crat??re s'est"
	line "peu ?? peu rempli"

	para "d'eau de pluie et"
	line "un LAC s'est"
	cont "form??."

	para "Cette histoire se"
	line "transmet de g??n??-"

	para "ration en g??n??-"
	line "ration. Elle vient"
	cont "d'un de mes"
	cont "grands-p??res."

	para "On pouvait attra-"
	line "per de vrais"

	para "MAGICARPE en"
	line "pleine forme ici!"

	para "Je ne comprends"
	line "pas ce qu'il se"
	cont "passe."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Ce LAC n'est plus"
	line "normal depuis"

	para "l'arriv??e des"
	line "hommes en noir."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Le LAC COLERE est"
	line "redevenu normal."

	para "Les MAGICARPE sont"
	line "de retour."

	para "Mon r??ve se"
	line "r??alise enfin:"
	cont "voir un monde"
	cont "plein de"
	cont "MAGICARPE."

	para "As-tu une CANNE?"
	line "Aide-moi si tu en"
	cont "as une."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, tu as un"
	line "MAGICARPE! Laisse-"

	para "moi voir sa"
	line "taille."
	done

MagikarpLengthRaterText_Memento:
	text "Whaou! Celui-ci"
	line "est d??mesur??!"

	para "Je te tire mon"
	line "chapeau!"

	para "Accepte ceci en"
	line "r??compense!"
	done

MagikarpLengthRaterText_Bonus:
	text "Ce qui est impor-"
	line "tant, c'est d'??pa-"

	para "ter les autres!"
	line "Suis mes conseils!"
	done

MagikarpLengthRaterText_TooShort:
	text "Whaou! C'est pas"
	line "mal du tout!"

	para "...J'aimerais pou-"
	line "voir te dire ??a"

	para "mais j'en ai d??j??"
	line "vu des plus gros."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Quoi? Ce n'est pas"
	line "un MAGICARPE!"
	done

MagikarpLengthRaterText_Refused:
	text "Alors... Tu n'as"
	line "rien pris qui"

	para "vaille la peine"
	line "d'??tre montr???"
	cont "Peut-??tre la"
	cont "prochaine fois!"
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "RECORD ACTUEL"

	para "@"
	text_ram wStringBuffer3
	text_start
	line "a ??t?? attrap?? par"
	cont "@"
	text_ram wStringBuffer4
	text_end

	text_end ; unused

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
