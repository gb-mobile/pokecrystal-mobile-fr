	object_const_def ; object_event constants
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	prioritysjump EcruteakGymClosed
	end

.DummyScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd gymstatue2

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Bienvenue."

	para "Ici ?? ROSALIA,"
	line "les #MON sont"
	cont "v??n??r??s."

	para "On dit qu'un"
	line "#MON aux cou-"

	para "leurs de l'arc-en-"
	line "ciel appara??tra"

	para "face ?? un dresseur"
	line "d'exception."

	para "C'est pourquoi je"
	line "m'entra??ne ?? fond"
	cont "les bananes."

	para "Je peux voir ce"
	line "que d'autres ne"
	cont "voient pas."

	para "H?? oui..."

	para "Encore un peu et"
	line "je pourrai voir"

	para "ce #MON et"
	line "ses plumes arc-en-"
	cont "ciel."

	para "Tu vas m'aider ??"
	line "m'am??liorer!"
	done

MortyWinLossText:
	text "Je ne suis pas"
	line "encore assez bon."
	cont "Je ne vois rien."
	cont "Il me faut des"
	cont "lunettes!!"

	para "Bon allez, ce"
	line "BADGE est ?? toi."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> re??oit"
	line "le BADGE BRUME."
	done

MortyText_FogBadgeSpeech:
	text "En poss??dant le"
	line "BADGE BRUME, tous"

	para "les #MON jusqu'"
	line "au niveau 50"
	cont "t'ob??iront."

	para "En plus de ??a les"
	line "#MON qui ont"

	para "appris SURF"
	line "pourront l'uti-"
	cont "liser partout."

	para "Prends aussi ceci."
	done

MortyText_ShadowBallSpeech:
	text "C'est BALL'OMBRE."
	line "Elle cause"

	para "des d??g??ts et peut"
	line "r??duire la DEFENSE"
	cont "SPE."

	para "Utilise-la et tu"
	line "verras!"
	done

MortyFightDoneText:
	text "Je vois..."

	para "Ta journ??e a ??t??"
	line "longue et"
	cont "mouvement??e."

	para "Tu as fait plein"
	line "de trucs super"
	cont "g??niaux."

	para "Je t'envie pour"
	line "??a..."
	done

SageJeffreySeenText:
	text "J'ai pass?? tout le"
	line "printemps avec mes"

	para "#MON et puis"
	line "aussi l'??t?? et"
	cont "surtout l'hiver..."

	para "Lorsque le prin-"
	line "temps revint,"

	para "nous avions pass??"
	line "de longs moments"
	cont "ensemble."
	done

SageJeffreyBeatenText:
	text "J'ai appris ??"
	line "gagner et ??"
	cont "perdre."
	done

SageJeffreyAfterBattleText:
	text "D'o?? viennent les"
	line "#MON?"
	done

SagePingSeenText:
	text "Peux-tu infliger"
	line "des d??g??ts ?? nos"
	cont "#MON?"
	done

SagePingBeatenText:
	text "Ah! Bien jou??!"
	done

SagePingAfterBattleText:
	text "On n'utilise que"
	line "les #MON de"
	cont "type SPECTRE."

	para "Aucune attaque"
	line "de type NORMAL"
	cont "ne peut les"
	cont "inqui??ter!"
	done

MediumMarthaSeenText:
	text "Je vais gagner!"
	done

MediumMarthaBeatenText:
	text "Et bah non, j'ai"
	line "perdu!"
	done

MediumMarthaAfterBattleText:
	text "Celui qui veut et"
	line "bah, il peut!"
	done

MediumGraceSeenText:
	text "Ah! Ca te fait"
	line "peur le sol"

	para "invisible, hein?"
	line "Tu n'as plus qu'??"
	cont "me battre et je te"
	cont "file un conseil!"
	done

MediumGraceBeatenText:
	text "Kk-kkoi?"
	done

MediumGraceAfterBattleText:
	text "Tr??s bien. Je vais"
	line "te donner un truc"

	para "?? propos du sol"
	line "invisible."

	para "Le bon chemin est"
	line "devant nos yeux!"
	done

EcruteakGymGuyText:
	text "Les dresseurs d'ici"
	line "ont un truc"
	cont "secret."

	para "Si tu gagnes, ils"
	line "te parleront peut-"

	para "??tre du fameux"
	line "secret de ROSALIA."
	done

EcruteakGymGuyWinText:
	text "Whaou, <PLAYER>!"
	line "Bien jou??!"

	para "J'??tais cach?? dans"
	line "un coin tant"
	cont "j'??tais mort de"
	cont "trouille!"
	done

EcruteakGymClosedText:
	text "MORTIMER, le CHAM-"
	line "PION, est absent."

	para "Tu dois partir."

	para "Hohohoho."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	db 7 ; object events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
