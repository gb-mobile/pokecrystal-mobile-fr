	object_const_def ; object_event constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_BLACK_BELT1
	const VICTORYROADGATE_BLACK_BELT2

VictoryRoadGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	sjump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	buttonsound
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

VictoryRoadGateLeftBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateLeftBlackBeltText

VictoryRoadGateRightBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateRightBlackBeltText

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end

VictoryRoadGateOfficerText:
	text "Seuls les dres-"
	line "seurs confirmés"
	cont "peuvent passer."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "Tu n'as pas tous"
	line "les BADGES d'ARENE"
	cont "de JOHTO."

	para "Je ne peux pas"
	line "te laisser passer."
	cont "Désolé."
	done

VictoryRoadGateEightBadgesText:
	text "Oh! Les huit"
	line "BADGES de JOHTO!"

	para "Après vous,"
	line "votre altesse!"
	done

VictoryRoadGateLeftBlackBeltText:
	text "Cette route mène"
	line "au MONT ARGENT."

	para "Tu y verras des"
	line "#MON affreu-"
	cont "sement forts."
	done

VictoryRoadGateRightBlackBeltText:
	text "Tu vas à la LIGUE"
	line "#MON, hein?"

	para "Le CONSEIL des 4"
	line "est super hyper"

	para "méga fort!!! Tu"
	line "vas en baver!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 17,  7, ROUTE_22, 1
	warp_event 18,  7, ROUTE_22, 1
	warp_event  9, 17, ROUTE_26, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event  9,  0, VICTORY_ROAD, 1
	warp_event 10,  0, VICTORY_ROAD, 1
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateLeftBlackBeltScript, EVENT_OPENED_MT_SILVER
	object_event 12,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRightBlackBeltScript, EVENT_FOUGHT_SNORLAX
