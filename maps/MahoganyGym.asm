	object_const_def ; object_event constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd gymstatue2

PryceText_Intro:
	text "Les #MON ont"
	line "beaucoup d'aven-"

	para "tures au cours de"
	line "leur vie, comme"
	cont "nous."

	para "Moi aussi, j'ai"
	line "beaucoup souffert"
	cont "dans ma vie."

	para "Comme je suis plus"
	line "vieux que toi,"
	cont "laisse-moi"
	cont "t'expliquer..."

	para "Je suis avec les"
	line "#MON depuis"

	para "bien avant ta"
	line "naissance."

	para "Je ne perds pas"
	line "facilement."

	para "Moi, FREDO, le"
	line "dresseur du froid,"

	para "je vais te montrer"
	line "ma puissance!"
	done

PryceText_Impressed:
	text "Ah, je suis tr??s"
	line "impressionn?? par"
	cont "ta prouesse."

	para "Avec un temp??-"
	line "rament comme le"

	para "tien, tu surmon-"
	line "teras tous les"
	cont "obstacles de la"
	cont "vie."

	para "Tu m??rites ce"
	line "BADGE!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> re??oit"
	line "le BADGEGLACIER."
	done

PryceText_GlacierBadgeSpeech:
	text "Ce BADGE permet ??"
	line "tes #MON de"
	cont "d??velopper leur"
	cont "SPECIAL."

	para "Il permet aussi"
	line "?? tes #MON"
	cont "d'utiliser SIPHON"
	cont "pour passer les"
	cont "tourbillons."

	para "Et ??a... C'est un"
	line "cadeau de ma part!"
	done

PryceText_IcyWindSpeech:
	text "Cette CT contient"
	line "VENT GLACE."

	para "Il inflige des"
	line "d??g??ts et r??duit"
	cont "la vitesse des"
	cont "#MON."

	para "Il incarne la"
	line "rudesse du froid"
	cont "hivernal."
	done

PryceText_CherishYourPokemon:
	text "Lorsque la glace"
	line "et la neige"
	cont "fondent, le"
	cont "printemps arrive."

	para "Toi et tes #-"
	line "MON serez ensemble"
	cont "pendant des"
	cont "ann??es."

	para "Profitez bien de"
	line "ces instants!"
	done

BoarderRonaldSeenText:
	text "Je vais geler tes"
	line "#MON et tu ne"
	cont "pourras plus rien"
	cont "faire!"
	done

BoarderRonaldBeatenText:
	text "Saperlipopette!"
	line "Je n'ai rien pu"
	cont "faire."
	done

BoarderRonaldAfterBattleText:
	text "Je crois qu'il"
	line "existe une capa-"

	para "cit?? que les #-"
	line "MON peuvent utili-"
	cont "ser m??me en ??tant"
	cont "gel??s."
	done

BoarderBradSeenText:
	text "Cette ARENE a le"
	line "sol glissant."

	para "C'est d??lire, pas"
	line "vrai?"

	para "Mais..."
	line "Fini de jouer!"
	done

BoarderBradBeatenText:
	text "Tu vois ?? quel"
	line "point on est"
	cont "s??rieux ici?"
	done

BoarderBradAfterBattleText:
	text "Cette ARENE est"
	line "superbe. J'adore"
	cont "surfer avec mes"
	cont "#MON!"
	done

BoarderDouglasSeenText:
	text "Je connais le"
	line "secret de FREDO."
	done

BoarderDouglasBeatenText:
	text "OK. Je vais te"
	line "le dire."
	done

BoarderDouglasAfterBattleText:
	text "Le secret de la"
	line "force de FREDO..."

	para "Il m??dite"
	line "derri??re une"

	para "cascade tous les"
	line "jours pour accro??-"
	cont "tre sa force et"
	cont "d??velopper son"
	cont "esprit."
	done

SkierRoxanneSeenText:
	text "Pour vaincre"
	line "FREDO, notre"

	para "CHAMPION d'ARENE,"
	line "tu dois penser"
	cont "avant de patiner."
	done

SkierRoxanneBeatenText:
	text "Enfin, moi j'te"
	line "bats en ski!"
	done

SkierRoxanneAfterBattleText:
	text "Si tu ne patines"
	line "pas avec pr??cision"

	para "tu n'iras pas bien"
	line "loin dans cette"
	cont "ARENE."
	done

SkierClarissaSeenText:
	text "Sors de mon"
	line "slalom!"
	done

SkierClarissaBeatenText:
	text "Non! Tu m'as fait"
	line "d??raper!"
	done

SkierClarissaAfterBattleText:
	text "Je n'aurais pas"
	line "d?? me vanter..."
	done

MahoganyGymGuyText:
	text "FREDO est un v??t??-"
	line "ran qui entra??ne"

	para "des #MON depuis"
	line "50 ans."

	para "Il pr??tend ??tre"
	line "bon pour geler ses"

	para "adversaires avec"
	line "des attaques de"
	cont "glace."

	para "Tu devrais le"
	line "faire fondre avec"

	para "ton ambition"
	line "br??lante!"
	done

MahoganyGymGuyWinText:
	text "FREDO, c'est quel-"
	line "qu'un, mais toi"
	cont "t'es pas naze"
	cont "non plus!"

	para "C'??tait un combat"
	line "chaud qui a soud??"

	para "l'??cart entre deux"
	line "g??n??rations!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	db 7 ; object events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
