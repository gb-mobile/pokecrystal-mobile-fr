	object_const_def ; object_event constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR

.nomobile
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer UnknownText_0x9f783

Route40BattleTowerGateTwinScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x9f66f

.mobile
	jumptextfaceplayer UnknownText_0x9f6ba

UnknownText_0x9f66f:
	text "Tu es aussi ici"
	line "pour la TOUR DE"
	cont "COMBAT?"

	para "Mais tu ne peux"
	line "pas y entrer je"
	cont "parie..."
	done

UnknownText_0x9f6ba:
	text "La TOUR DE COMBAT"
	line "a ouvert ses"
	cont "portes."

	para "Je veux y aller"
	line "mais..."
	cont "J'ai peur."
	done

Route40BattleTowerGateRockerText:
	text "Tu vas à la TOUR"
	line "DE COMBAT?"

	para "Si tu gagnes plein"
	line "de fois, tu peux"

	para "remporter des"
	line "trucs spéciaux."
	done

UnknownText_0x9f783:
	text "Je vais entraîner"
	line "mes #MON avant"

	para "de me lancer vers"
	line "la TOUR DE COMBAT."
	done

Route40BattleTowerGateTwinText:
	text "Mes #MON ont"
	line "tous des niveaux"
	cont "différents..."

	para "Je dois les"
	line "entraîner!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
