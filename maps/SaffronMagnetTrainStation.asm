	object_const_def ; object_event constants
	const SAFFRONMAGNETTRAINSTATION_OFFICER
	const SAFFRONMAGNETTRAINSTATION_GYM_GUY
	const SAFFRONMAGNETTRAINSTATION_TEACHER
	const SAFFRONMAGNETTRAINSTATION_LASS

SaffronMagnetTrainStation_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

SaffronMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToGoldenrod
	writetext SaffronMagnetTrainStationOfficerTrainIsntOperatingText
	waitbutton
	closetext
	end

.MagnetTrainToGoldenrod:
	writetext SaffronMagnetTrainStationOfficerAreYouComingOnBoardText
	yesorno
	iffalse .DecidedNotToRide
	checkitem PASS
	iffalse .PassNotInBag
	writetext SaffronMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval TRUE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.PassNotInBag:
	writetext SaffronMagnetTrainStationOfficerYouDontHaveAPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromGoldenrod:
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement SAFFRONMAGNETTRAINSTATION_OFFICER, SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement
	opentext
	writetext SaffronMagnetTrainStationOfficerArrivedInSaffronText
	waitbutton
	closetext
	end

SaffronMagnetTrainStationGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronMagnetTrainStationGymGuyText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronMagnetTrainStationTeacherScript:
	jumptextfaceplayer SaffronMagnetTrainStationTeacherText

SaffronMagnetTrainStationLassScript:
	jumptextfaceplayer SaffronMagnetTrainStationLassText

SaffronMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

SaffronMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

SaffronMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

SaffronMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

SaffronMagnetTrainStationOfficerTrainIsntOperatingText:
	text "Le TRAIN MAGNET ne"
	line "fonctionne pas"
	cont "pour l'instant."
	done

SaffronMagnetTrainStationOfficerAreYouComingOnBoardText:
	text "Nous partons bien-"
	line "tôt pour DOUBLON-"
	cont "VILLE."

	para "Veux-tu monter"
	line "à bord?"
	done

SaffronMagnetTrainStationOfficerRightThisWayText:
	text "Puis-je voir"
	line "ton PASSE?"

	para "OK. Ca marche."
	line "Par ici."
	done

SaffronMagnetTrainStationOfficerYouDontHaveAPassText:
	text "Désolé."
	line "Pas de PASSE."
	done

SaffronMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "Encore merci et"
	line "à bientôt!"
	done

SaffronMagnetTrainStationOfficerArrivedInSaffronText:
	text "Nous sommes arri-"
	line "vés à SAFRANIA."

	para "A bientôt."
	done

SaffronMagnetTrainStationGymGuyText:
	text "Le TRAIN MAGNET"
	line "est un train super"

	para "moderne qui utili-"
	line "se l'énergie"

	para "magnétique pour"
	line "aller à toute"
	cont "vitesse."

	para "Mais sans électri-"
	line "cité, il ne bouge"
	cont "pas trop..."
	done

SaffronMagnetTrainStationGymGuyText_ReturnedMachinePart:
	text "Fouiii..."

	para "Combien de fois"
	line "ai-je fait la na-"

	para "vette entre KANTO"
	line "et JOHTO? J'en"
	cont "sais rien, moi!"
	done

SaffronMagnetTrainStationTeacherText:
	text "Il y avait une"
	line "maison avant la"

	para "construction de la"
	line "STATION de TRAIN."

	para "Une petite fille,"
	line "appelée COPIEUSE,"
	cont "y vivait."
	done

SaffronMagnetTrainStationLassText:
	text "Bonjour. As-tu un"
	line "PASSE?"

	para "Moi j'en ai un!"
	line "Tous ceux de SA-"

	para "FRANIA qui utili-"
	line "sent le TRAIN"
	cont "MAGNET en ont un."
	done

SaffronMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 6
	warp_event  9, 17, SAFFRON_CITY, 6
	warp_event  6,  5, GOLDENROD_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, GOLDENROD_MAGNET_TRAIN_STATION, 3

	db 1 ; coord events
	coord_event 11,  6, SCENE_DEFAULT, Script_ArriveFromGoldenrod

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationOfficerScript, -1
	object_event 10, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationGymGuyScript, -1
	object_event  6, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationTeacherScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
	object_event  6, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMagnetTrainStationLassScript, EVENT_SAFFRON_TRAIN_STATION_POPULATION
