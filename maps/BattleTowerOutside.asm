	object_const_def ; object_event constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts: ; 67cd3
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	special Mobile_DummyReturnFalse
	iftrue .doorsopen;$7CE6
	changeblock 8, 8, $2C
	return

.doorsopen
	changeblock 8, 8, $12
	return

.Callback2:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR

.nomobile
	return

BattleTowerOutsideYoungsterScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_Mobile

BattleTowerOutsideBuenaScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideBuenaText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText_Mobile

BattleTowerOutsideSign:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideSignText_NotYetOpen

.mobile
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideDoor:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideText_DoorsClosed

.mobile
	jumptext BattleTowerOutsideText_DoorsOpen

BattleTowerOutsideYoungsterText_NotYetOpen:
; unreferenced
	text "Mazette! Elle est"
	line "grande cette TOUR"
	cont "DE COMBAT!"
	done

BattleTowerOutsideYoungsterText_Mobile:
; unreferenced
	text "La TOUR DE COMBAT"
	line "est géante!"

	para "Vu qu'il y a tout"
	line "plein de dresseurs"

	para "à l'intérieur, il"
	line "doit y avoir une"

	para "multitude de"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Foui! C'est grand"
	line "la TOUR DE COMBAT!"

	para "Il doit y avoir"
	line "plein de #MON"
	cont "différents!"
	done

BattleTowerOutsideBuenaText_NotYetOpen:
; unreferenced
	text "Kesski fabriquent"
	line "tous ici?"

	para "Y'aurait encore"
	line "une histoire de"

	para "baston que ça"
	line "m'étonnerait pas."
	done

BattleTowerOutsideBuenaText:
	text "On ne peut utili-"
	line "ser que 3 #MON."

	para "C'est dur de faire"
	line "un choix..."
	done

BattleTowerOutsideSailorText_Mobile:
; unreferenced
	text "Hin hin hin..."
	line "J'ai pris une"
	cont "perm' pour venir"
	cont "ici..."

	para "Je vais devenir"
	line "un CHAMPION!"
	cont "Un vrai de vrai!"
	done

BattleTowerOutsideSailorText:
	text "J'ai pris une"
	line "perm'."

	para "Je dois gagner!"
	line "Oh que oui!"
	done

BattleTowerOutsideSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "TOUR DE COMBAT"
	done

BattleTowerOutsideSignText:
	text "TOUR DE COMBAT"

	para "Le méga défi de"
	line "tout dresseur!"
	done

BattleTowerOutsideText_DoorsClosed:
; unused; originally shown when the Battle Tower was closed
	text "Les portes de la"
	line "TOUR DE COMBAT"
	cont "sont fermées..."
	done

BattleTowerOutsideText_DoorsOpen:
; unused; originally shown after the Battle Tower opened
	text "C'est ouvert!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event  8,  9, BGEVENT_READ, BattleTowerOutsideDoor; 67e8f
	bg_event  9,  9, BGEVENT_READ, BattleTowerOutsideDoor

	db 4 ; object events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
