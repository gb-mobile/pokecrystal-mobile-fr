	object_const_def ; object_event constants
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuy2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuy1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuy2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuy4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	buttonsound
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	buttonsound
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

PowerPlantOfficer1ApproachGymGuy2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Un voleur s'est"
	line "introduit dans la"
	cont "CENTRALE..."

	para "Mais où va le"
	line "monde? Hein?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "On raconte des"
	line "trucs à AZURIA."

	para "Un drôle de type"
	line "rôde dans les"

	para "environs..."
	line "C'est flippant."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Tu veux bien"
	line "m'aider?"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Il faut renforcer"
	line "la sécurité."
	done

PowerPlantGymGuy1SomeoneStoleAPartText:
	text "Quelqu'un a volé"
	line "une partie essen-"

	para "tielle du généra-"
	line "teur."

	para "Sans elle, rien"
	line "ne marche!"
	done

PowerPlantGymGuy1GeneratorUpAndRunningText:
	text "Le générateur est"
	line "en marche. Il crée"

	para "de l'électricité"
	line "à gogo."
	done

PowerPlantGymGuy2PowerPlantUpAndRunningText:
	text "Cette CENTRALE a"
	line "été abandonnée il"
	cont "y a longtemps."

	para "On l'a relancée"
	line "pour donner de"

	para "l'énergie au TRAIN"
	line "MAGNET."
	done

PowerPlantGymGuy2GeneratorIsRunningAgainText:
	text "Le générateur est"
	line "en marche!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "Le PATRON de la"
	line "CENTRALE est plus"
	cont "loin."

	para "Attention, il est"
	line "furax depuis que"
	cont "quelqu'un a tout"
	cont "bousillé son joli"
	cont "générateur..."
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Depuis la répara-"
	line "tion du générateur"

	para "le PATRON est très"
	line "heureux."
	done

PowerPlantGymGuy4MagnetTrainConsumesElectricityText:
	text "Le TRAIN MAGNET"
	line "consomme beaucoup"
	cont "d'électricité."

	para "Il ne bougera pas"
	line "si le nouveau gé-"
	cont "nérateur ne marche"
	cont "pas..."
	done

PowerPlantGymGuy4WeCanGetMagnetTrainRunningText:
	text "OK! On peut à nou-"
	line "veau faire marcher"
	cont "le TRAIN MAGNET."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "PATRON: J'vais"
	line "exploser! Faut que"
	cont "j'me défoule!"

	para "Qui a cassé mon"
	line "générateur? Qui?"

	para "Je l'aimais tant!"
	line "Comme mon bébé!"

	para "Si j'attrape cette"
	line "crapule, il aura"

	para "droit à un coup"
	line "d'ELECANON!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "PATRON: Je vais"
	line "m'le faire!"

	para "Même s'il pleure,"
	line "même s'il prie,"

	para "je vais quand même"
	line "me l'faire!"

	para "Gahahahah!"
	done

PowerPlantManagerThatsThePartText:
	text "PATRON: Ah! Oui!"

	para "C'est la PARTIE"
	line "manquante de mon"
	cont "joli générateur!"
	cont "Tu l'as trouvée?"
	done

PowerPlantManagerTakeThisTMText:
	text "Wahah! Merci!"

	para "Tiens! Prends"
	line "cette CT!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "PATRON: CT07 est"
	line "l'ELECANON. C'est"

	para "une technique"
	line "très puissante!"

	para "Elle n'est pas"
	line "très précise mais"

	para "elle dépote! Fais-"
	line "moi confiance!"
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "PATRON: Mon petit"
	line "générateur chéri!"

	para "Pompe l'électrici-"
	line "té! Allez! Tu dois"
	cont "pomper!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	db 1 ; coord events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	db 7 ; object events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
