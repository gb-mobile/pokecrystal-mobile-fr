	object_const_def ; object_event constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd gymstatue2

FalknerIntroText:
	text "Je suis ALBERT, le"
	line "CHAMPION d'ARENE"
	cont "de MAUVILLE!"

	para "On dit qu'avec une"
	line "bonne d??charge"

	para "??lectrique, les"
	line "#MON volants"
	cont "grillent..."

	para "Je n'autorise per-"
	line "sonne ?? insulter"
	cont "les #MON!"

	para "Tu vas subir les"
	line "terribles attaques"

	para "de mes #MON"
	line "volants!"
	done

FalknerWinLossText:
	text "...Zut de fl??te!"
	line "Les #MON ador??s"
	cont "de mon papa..."

	para "Tr??s bien."
	line "Prends ceci."

	para "C'est le BADGE"
	line "ZEPHYR officiel de"
	cont "la LIGUE #MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> re??oit"
	line "le BADGE ZEPHYR."
	done

FalknerZephyrBadgeText:
	text "Le BADGE ZEPHYR"
	line "augmente l'ATTAQUE"
	cont "des #MON."

	para "Il permet aussi"
	line "aux #MON"

	para "d'utiliser FLASH"
	line "en dehors des"
	cont "combats."

	para "Prends ??a aussi."
	done

FalknerTMMudSlapText:
	text "En utilisant une"
	line "CT, les #MON"

	para "apprennent une"
	line "nouvelle capacit??."

	para "R??fl??chis bien"
	line "avant d'agir, une"
	cont "CT ne s'utilise"
	cont "qu'une fois."

	para "La CT31 contient"
	line "COUD'BOUE."

	para "Elle r??duit la"
	line "pr??cision de l'en-"

	para "nemi et lui infli-"
	line "ge des d??g??ts."

	para "En d'autres termes"
	line "c'est ?? la fois"
	cont "offensif et"
	cont "d??fensif."
	done

FalknerFightDoneText:
	text "Il y a des ARENES"
	line "#MON dans"
	cont "les alentours."

	para "Tu devrais tester"
	line "ton habilet?? dans"
	cont "ces ARENES."

	para "Je vais m'entra??-"
	line "ner plus dur pour"

	para "devenir le plus"
	line "grand!"
	done

BirdKeeperRodSeenText:
	text "Le mot cl?? est..."
	line "Le cran!"

	para "Ceux d'ici s'en-"
	line "tra??nent nuit et"

	para "jour pour devenir"
	line "ma??tre des"
	cont "#MON volants."

	para "Allez!"
	done

BirdKeeperRodBeatenText:
	text "Yaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "L'habilet??"
	line "d'ALBERT est"
	cont "bien r??elle!"

	para "Si tu as les"
	line "chevilles qui"
	cont "enflent, change"
	cont "de baskets!"
	done

BirdKeeperAbeSeenText:
	text "Montre-moi si tu"
	line "as les ??paules"
	cont "pour battre"
	cont "ALBERT!"
	done

BirdKeeperAbeBeatenText:
	text "Saperlipopette!"
	line "C'est impossible!"
	done

BirdKeeperAbeAfterBattleText:
	text "C'est path??tique"
	line "de perdre contre"
	cont "toi..."
	done

VioletGymGuyText:
	text "H?? toi! Je ne"
	line "suis pas un"
	cont "dresseur mais"
	cont "je peux te donner"
	cont "quelques conseils!"

	para "Crois-moi!"
	line "Tes r??ves de"

	para "star peuvent"
	line "se r??aliser."

	para "T'y crois?"
	line "Alors ??coute bien."

	para "Les plantes sont"
	line "faibles contre les"

	para "volants. Garde ??a"
	line "en m??moire."
	done

VioletGymGuyWinText:
	text "Beau combat! Ne"
	line "l??che pas prise et"

	para "tu deviendras sans"
	line "probl??me une"
	cont "star!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
