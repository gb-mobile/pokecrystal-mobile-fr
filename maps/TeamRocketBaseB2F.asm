	object_const_def ; object_event constants
	const TEAMROCKETBASEB2F_ROCKET1
	const TEAMROCKETBASEB2F_ROCKET_GIRL
	const TEAMROCKETBASEB2F_LANCE
	const TEAMROCKETBASEB2F_DRAGON
	const TEAMROCKETBASEB2F_ELECTRODE1
	const TEAMROCKETBASEB2F_ELECTRODE2
	const TEAMROCKETBASEB2F_ELECTRODE3
	const TEAMROCKETBASEB2F_ELECTRODE4
	const TEAMROCKETBASEB2F_ELECTRODE5
	const TEAMROCKETBASEB2F_ELECTRODE6
	const TEAMROCKETBASEB2F_ROCKET2
	const TEAMROCKETBASEB2F_ROCKET3
	const TEAMROCKETBASEB2F_ROCKET4
	const TEAMROCKETBASEB2F_POKE_BALL

TeamRocketBaseB2F_MapScripts:
	db 4 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_TEAMROCKETBASEB2F_ELECTRODES
	scene_script .DummyScene3 ; SCENE_TEAMROCKETBASEB2F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .TransmitterDoorCallback

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.TransmitterDoorCallback:
	checkevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	iftrue .OpenDoor
	return

.OpenDoor:
	changeblock 14, 12, $07 ; floor
	return

RocketBaseBossFLeft:
	moveobject TEAMROCKETBASEB2F_LANCE, 9, 13
	sjump RocketBaseBossFScript

RocketBaseBossFRight:
	moveobject TEAMROCKETBASEB2F_ROCKET_GIRL, 21, 16
	moveobject TEAMROCKETBASEB2F_ROCKET1, 21, 16
	moveobject TEAMROCKETBASEB2F_DRAGON, 10, 13
	moveobject TEAMROCKETBASEB2F_LANCE, 10, 13
RocketBaseBossFScript:
	appear TEAMROCKETBASEB2F_ROCKET_GIRL
	appear TEAMROCKETBASEB2F_ROCKET1
	opentext
	writetext UnknownText_0x6d2ad
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, MovementData_0x6d21f
	playmusic MUSIC_ROCKET_ENCOUNTER
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d224
	turnobject PLAYER, UP
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d22f
	opentext
	writetext UnknownText_0x6d2c3
	waitbutton
	closetext
	cry DRAGONITE
	turnobject TEAMROCKETBASEB2F_ROCKET_GIRL, LEFT
	turnobject PLAYER, LEFT
	appear TEAMROCKETBASEB2F_DRAGON
	applymovement TEAMROCKETBASEB2F_DRAGON, MovementData_0x6d236
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d23b
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24c
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d244
	opentext
	writetext UnknownText_0x6d38c
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d241
	opentext
	writetext UnknownText_0x6d3bd
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_ROCKET1, MovementData_0x6d24a
	applymovement TEAMROCKETBASEB2F_ROCKET_GIRL, MovementData_0x6d248
	winlosstext UnknownText_0x6d45c, 0
	setlasttalked TEAMROCKETBASEB2F_ROCKET_GIRL
	loadtrainer EXECUTIVEF, EXECUTIVEF_2
	startbattle
	disappear TEAMROCKETBASEB2F_DRAGON
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
	opentext
	writetext UnknownText_0x6d4c6
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TEAMROCKETBASEB2F_ROCKET1
	disappear TEAMROCKETBASEB2F_ROCKET_GIRL
	disappear TEAMROCKETBASEB2F_ROCKET2
	disappear TEAMROCKETBASEB2F_ROCKET3
	disappear TEAMROCKETBASEB2F_ROCKET4
	pause 15
	special FadeInQuickly
	setscene SCENE_TEAMROCKETBASEB2F_ELECTRODES
	clearevent EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d5d8
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d250
	turnobject PLAYER, UP
	opentext
	writetext UnknownText_0x6d64e
	waitbutton
	closetext
	follow TEAMROCKETBASEB2F_LANCE, PLAYER
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d254
	stopfollow
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d258
	opentext
	writetext UnknownText_0x6d6cf
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d267
	disappear TEAMROCKETBASEB2F_LANCE

RocketBaseCantLeaveScript:
	applymovement PLAYER, MovementData_0x6d271
	end

RocketBaseLancesSideScript:
	opentext
	writetext UnknownText_0x6d7ea
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x6d278
	end

LanceHealsScript1:
	turnobject PLAYER, UP
	sjump LanceHealsCommon

LanceHealsScript2:
	turnobject PLAYER, RIGHT
	turnobject TEAMROCKETBASEB2F_LANCE, LEFT
LanceHealsCommon:
	opentext
	writetext LanceHealsText1
	waitbutton
	closetext
	special FadeOutPalettes
	special StubbedTrainerRankings_Healings
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	opentext
	writetext LanceHealsText2
	waitbutton
	closetext
	setscene SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS
	setevent EVENT_LANCE_HEALED_YOU_IN_TEAM_ROCKET_BASE
	readvar VAR_FACING
	ifequal RIGHT, .FacingRight
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d212
	disappear TEAMROCKETBASEB2F_LANCE
	end

.FacingRight:
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d219
	disappear TEAMROCKETBASEB2F_LANCE
	end

TrainerGruntM17:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, GruntM17SeenText, GruntM17BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM17AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM18:
	trainer GRUNTM, GRUNTM_18, EVENT_BEAT_ROCKET_GRUNTM_18, GruntM18SeenText, GruntM18BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM18AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM19:
	trainer GRUNTM, GRUNTM_19, EVENT_BEAT_ROCKET_GRUNTM_19, GruntM19SeenText, GruntM19BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM19AfterBattleText
	waitbutton
	closetext
	end

RocketElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE1
	disappear TEAMROCKETBASEB2F_ELECTRODE4
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d28c
	sjump RocketBaseElectrodeScript

RocketElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE2
	disappear TEAMROCKETBASEB2F_ELECTRODE5
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d299
	sjump RocketBaseElectrodeScript

RocketElectrode3:
	cry ELECTRODE
	loadwildmon ELECTRODE, 23
	startbattle
	iftrue TeamRocketBaseB2FReloadMap
	disappear TEAMROCKETBASEB2F_ELECTRODE3
	disappear TEAMROCKETBASEB2F_ELECTRODE6
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	iffalse TeamRocketBaseB2FReloadMap
	checkevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	iffalse TeamRocketBaseB2FReloadMap
	reloadmapafterbattle
	special PlayMapMusic
	applymovement PLAYER, MovementData_0x6d2a4
	sjump RocketBaseElectrodeScript

TeamRocketBaseB2FReloadMap:
	reloadmapafterbattle
	end

RocketBaseElectrodeScript:
	moveobject TEAMROCKETBASEB2F_LANCE, 18, 6
	appear TEAMROCKETBASEB2F_LANCE
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d27a
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x6d809
	buttonsound
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext UnknownText_0x6d8f8
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB2F_LANCE, DOWN
	opentext
	writetext UnknownText_0x6d994
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement TEAMROCKETBASEB2F_LANCE, MovementData_0x6d283
	disappear TEAMROCKETBASEB2F_LANCE
	setevent EVENT_CLEARED_ROCKET_HIDEOUT
	clearflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	setscene SCENE_TEAMROCKETBASEB2F_NOTHING
	clearevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_TURNED_OFF_SECURITY_CAMERAS
	setevent EVENT_SECURITY_CAMERA_1
	setevent EVENT_SECURITY_CAMERA_2
	setevent EVENT_SECURITY_CAMERA_3
	setevent EVENT_SECURITY_CAMERA_4
	setevent EVENT_SECURITY_CAMERA_5
	end

TeamRocketBaseB2FLockedDoor:
	conditional_event EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER, .Script

.Script:
	opentext
	checkevent EVENT_LEARNED_HAIL_GIOVANNI
	iftrue .KnowsPassword
	writetext UnknownText_0x6dd39
	waitbutton
	closetext
	end

.KnowsPassword:
	writetext UnknownText_0x6dd6b
	waitbutton
	playsound SFX_ENTER_DOOR
	changeblock 14, 12, $07 ; floor
	reloadmappart
	closetext
	setevent EVENT_OPENED_DOOR_TO_ROCKET_HIDEOUT_TRANSMITTER
	waitsfx
	end

TeamRocketBaseB2FTransmitterScript:
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .Deactivated
	writetext UnknownText_0x6dda7
	waitbutton
	closetext
	end

.Deactivated:
	writetext UnknownText_0x6de03
	waitbutton
	closetext
	end

TeamRocketBaseB2FTMThief:
	itemball TM_THIEF

TeamRocketBaseB2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B2F_HIDDEN_FULL_HEAL

MovementData_0x6d212:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d219:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d21f:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

MovementData_0x6d224:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d22f:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

MovementData_0x6d236:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_0x6d23b:
	fix_facing
	set_sliding
	jump_step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

MovementData_0x6d241:
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_0x6d244:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d248:
	big_step LEFT
	step_end

MovementData_0x6d24a:
	big_step LEFT
	step_end

MovementData_0x6d24c:
	big_step LEFT
	big_step UP
	turn_head LEFT
	step_end

MovementData_0x6d250:
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6d254:
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d258:
	step_sleep 8
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 8
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 8
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

MovementData_0x6d267:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6d271:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x6d278:
	step LEFT
	step_end

MovementData_0x6d27a:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d283:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x6d28c:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d299:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

MovementData_0x6d2a4:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

UnknownText_0x6d2ad:
	text "Hop hop hop!"
	line "On bouge plus!"
	done

UnknownText_0x6d2c3:
	text "On peut pas te"
	line "laisser fouiner"
	cont "par ici."

	para "C'est contre la"
	line "politique de la"
	cont "TEAM ROCKET."

	para "Même si t'es super"
	line "méga balèze, tu ne"

	para "pourras jamais"
	line "gagner contre nous"
	cont "deux en même"
	cont "temps."

	para "Désolé ma puce."
	line "C'est l'heure de"
	cont "prendre ta baffe."
	done

UnknownText_0x6d38c:
	text "Hé! Moi aussi"
	line "je veux m'amuser!"
	cont "T'es perso."
	done

UnknownText_0x6d3bd:
	text "Quoi? Tu avais un"
	line "complice? Et ton"

	para "sens de l'honneur?"
	line "Il est où? Hein?"

	para "Avec le remplaçant"
	line "du boss GIOVANNI,"

	para "je vais te montrer"
	line "qu'il faut pas"

	para "venir se frotter"
	line "à la TEAM ROCKET!"
	done

UnknownText_0x6d45c:
	text "Pfff. C'est vrai"
	line "que t'es balèze."

	para "Ca craint."

	para "Si tu venais à la"
	line "TEAM ROCKET, tu"

	para "deviendrais vite"
	line "CAID."
	done

UnknownText_0x6d4c6:
	text "...Cette cachette"
	line "est fichue..."

	para "Mais c'est pas"
	line "grave. L'opération"
	cont "radio est une"
	cont "réussite totale."

	para "On se fiche de"
	line "cette cachette"
	cont "maintenant."

	para "On a d'autres"
	line "plans."

	para "Tu vas vite com-"
	line "prendre la puis-"

	para "sance de la TEAM"
	line "ROCKET."

	para "Amuse-toi tant"
	line "qu'il est temps."

	para "Hi hihihihi hi!"
	done

UnknownText_0x6d5d8:
	text "PETER: Terminé!"
	line "On a battu tous"

	para "les gars de la"
	line "ROCKET du coin."

	para "Mais je m'inquiète"
	line "à propos du jeune"

	para "garçon que j'ai"
	line "combattu..."
	done

UnknownText_0x6d64e:
	text "Pardon, <PLAY_G>."
	line "J'étais en train"

	para "de t'admirer en"
	line "silence."

	para "Tout ce qu'il nous"
	line "reste à faire,"

	para "c'est d'arrêter le"
	line "signal radio."
	done

UnknownText_0x6d6cf:
	text "Cette machine"
	line "est la cause du"
	cont "problème."

	para "Je ne vois pas"
	line "d'interrupteur..."

	para "Il n'y a pas de"
	line "choix: il faut"

	para "mettre K.O. tous"
	line "les ELECTRODE."

	para "Cela devrait arrê-"
	line "ter cette machine"

	para "et du même coup"
	line "le signal."

	para "Ce n'est pas la"
	line "faute des #MON,"

	para "ça me met donc un"
	line "peu mal à l'aise."

	para "<PLAY_G>, on"
	line "fait chacun un"
	cont "côté."
	done

UnknownText_0x6d7ea:
	text "PETER: Je m'occupe"
	line "de ce côté."
	done

UnknownText_0x6d809:
	text "PETER: Cet étrange"
	line "signal s'est enfin"
	cont "arrêté."

	para "Le LAC doit être"
	line "normal à nouveau."

	para "Tu es formidable!"
	line "Je te remercie au"

	para "nom de tous les"
	line "#MON."

	para "Au fait. Voilà"
	line "pour toi."

	para "Je l'ai trouvée"
	line "ici mais moi j'en"
	cont "ai pas besoin."
	done

UnknownText_0x6d8e6:
	text "<PLAYER> reçoit"
	line "CS06."
	done

UnknownText_0x6d8f8:
	text "C'est SIPHON. Don-"
	line "ne-le à un #-"

	para "MON pour traverser"
	line "les rapides."

	para "Mais souviens-toi"
	line "de ceci..."

	para "Tu ne peux l'uti-"
	line "liser sur la carte"

	para "qu'en ayant le"
	line "BADGE de l'ARENE"
	cont "d'ACAJOU."
	done

UnknownText_0x6d994:
	text "<PLAY_G>..."

	para "Devenir le meil-"
	line "leur dresseur"

	para "#MON prend du"
	line "temps et est"
	cont "très difficile..."

	para "Vas-tu tenir le"
	line "coup?"

	para "..."

	para "Je vois."
	line "Tu as raison."

	para "Abandonner mainte-"
	line "nant serait stupi-"

	para "de. Tu ne dois pas"
	line "oublier ton rêve."

	para "Je suis impatient"
	line "de te revoir!"
	done

LanceHealsText1:
	text "PETER: Tu vas"
	line "bien?"

	para "Tes #MON sont"
	line "très fatigués."

	para "Tiens, soigne-les"
	line "avec mon médica-"
	cont "ment."
	done

LanceHealsText2:
	text "PETER: <PLAY_G>,"
	line "ensemble pour"
	cont "les #MON!"
	done

GruntM17SeenText:
	text "La porte ne"
	line "s'ouvre pas?"

	para "Normal, débiloss!"
	line "Il faut un mot de"

	para "passe connu seule-"
	line "ment de la TEAM"
	cont "ROCKET."
	done

GruntM17BeatenText:
	text "Quoi? Perdu?"
	done

GruntM17AfterBattleText:
	text "Hé... J'suis juste"
	line "un SBIRE."

	para "J'le connais pas"
	line "le mot de passe..."
	cont "C'est bête, hein?"
	done

GruntM18SeenText:
	text "Désolé je suis. "
	line "Mais te briser"

	para "je dois."
	done

GruntM18BeatenText:
	text "Perdu j'ai?"
	done

GruntM18AfterBattleText:
	text "A ma dernière mis-"
	line "sion, un gamin m'a"
	cont "aussi battu."

	para "Un garçon aux yeux"
	line "agressifs et aux"

	para "longs cheveux..."
	line "La honte c'est."

	para "Dégoûté je suis."
	line "Comprends-tu?"
	done

GruntM19SeenText:
	text "Espèce de sale"
	line "peste!"
	done

GruntM19BeatenText:
	text "Grrrr..."
	done

GruntM19AfterBattleText:
	text "Hé! Seul le chef"
	line "connaît le mot de"
	cont "passe de la porte."

	para "Où est le chef?"
	line "Qui sait? Va le"
	cont "chercher toi-même."
	done

UnknownText_0x6dd39:
	text "La porte est"
	line "fermée..."

	para "Il faut un mot"
	line "de passe."
	done

UnknownText_0x6dd6b:
	text "La porte est"
	line "fermée..."

	para "<PLAYER> tape"
	line "le mot de passe."

	para "La porte est"
	line "ouverte!"
	done

UnknownText_0x6dda7:
	text "C'est l'émetteur"
	line "qui envoie"

	para "l'horrible signal"
	line "radio."

	para "Il est réglé au"
	line "maximum."
	done

UnknownText_0x6de03:
	text "L'émetteur radio"
	line "a enfin interrompu"

	para "son signal maléfi-"
	line "que."
	done

TeamRocketBaseB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3, 14, TEAM_ROCKET_BASE_B1F, 2
	warp_event  3,  2, TEAM_ROCKET_BASE_B3F, 1
	warp_event 27,  2, TEAM_ROCKET_BASE_B3F, 2
	warp_event  3,  6, TEAM_ROCKET_BASE_B3F, 3
	warp_event 27, 14, TEAM_ROCKET_BASE_B3F, 4

	db 9 ; coord events
	coord_event  5, 14, SCENE_DEFAULT, LanceHealsScript1
	coord_event  4, 13, SCENE_DEFAULT, LanceHealsScript2
	coord_event 14, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFLeft
	coord_event 15, 11, SCENE_TEAMROCKETBASEB2F_ROCKET_BOSS, RocketBaseBossFRight
	coord_event 14, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 15, 12, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseCantLeaveScript
	coord_event 12,  3, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 10, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript
	coord_event 12, 11, SCENE_TEAMROCKETBASEB2F_ELECTRODES, RocketBaseLancesSideScript

	db 23 ; bg events
	bg_event 14, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 15, 12, BGEVENT_IFNOTSET, TeamRocketBaseB2FLockedDoor
	bg_event 17,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  9, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 12,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 13,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 14,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 15,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 16,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  4, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  5, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  6, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  7, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 17,  8, BGEVENT_READ, TeamRocketBaseB2FTransmitterScript
	bg_event 26,  7, BGEVENT_ITEM, TeamRocketBaseB2FHiddenFullHeal

	db 14 ; object events
	object_event 20, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	object_event 20, 16, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	object_event  5, 13, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_LANCE
	object_event  9, 13, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	object_event  7,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode1, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event  7,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode2, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event  7,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketElectrode3, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 22,  5, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event 22,  7, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_2
	object_event 22,  9, SPRITE_VOLTORB, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_3
	object_event 25, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM17, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM18, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 21, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM19, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FTMThief, EVENT_TEAM_ROCKET_BASE_B2F_TM_THIEF
