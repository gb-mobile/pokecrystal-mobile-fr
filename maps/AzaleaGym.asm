	object_const_def ; object_event constants
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd gymstatue2

BugsyText_INeverLose:
	text "Je suis HECTOR!"
	line "Je ne perds jamais"

	para "lorsqu'il s'agit"
	line "de #MON"
	cont "insecte."

	para "Mes recherches"
	line "vont me permettre"

	para "d'??tre un super"
	line "expert des"
	cont "#MON insecte!"

	para "Laisse-moi te"
	line "montrer ce que"
	cont "j'ai d??couvert!"
	done

BugsyText_ResearchIncomplete:
	text "Whaou, dingue!"
	line "Tu connais bien"
	cont "les #MON!"

	para "Mes recherches ne"
	line "sont pas finies."

	para "OK, tu as gagn??."
	line "Prends ce BADGE."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> re??oit"
	line "le BADGE ESSAIM."
	done

BugsyText_HiveBadgeSpeech:
	text "Connais-tu"
	line "les pouvoirs du"
	cont "BADGE ESSAIM?"

	para "Une fois que tu"
	line "poss??des ce BADGE,"
	cont "les #MON"
	cont "jusqu'au niveau 30"
	cont "et les ??chang??s"
	cont "t'ob??issent."

	para "Les #MON qui"
	line "connaissent COUPE"

	para "peuvent aussi"
	line "l'utiliser hors"
	cont "des combats."

	para "Tiens, je veux que"
	line "tu prennes ceci."
	done

BugsyText_FuryCutterSpeech:
	text "La CT49 contient"
	line "TAILLADE."

	para "Si tu ne manques"
	line "pas ton coup,"
	cont "la puissance au-"
	cont "gmente ?? chaque"
	cont "tour."

	para "Plus le combat est"
	line "long, plus le coup"
	cont "est puissant."

	para "C'est pas super"
	line "??a? Et c'est moi"
	cont "qui l'ai trouv??e!"
	done

BugsyText_BugMonsAreDeep:
	text "Les #MON"
	line "insecte ont des"

	para "talents cach??s. Il"
	line "faudra encore du"
	cont "temps pour tous"
	cont "les d??couvrir."

	para "Etudie-les"
	line "minutieusement."
	done

BugCatcherBennySeenText:
	text "Les #MON"
	line "insecte ??voluent"

	para "rapidement. Ils"
	line "deviennent forts"
	cont "plus vite."
	done

BugCatcherBennyBeatenText:
	text "Faire ??voluer un"
	line "#MON n'est pas"
	cont "suffisant!"
	done

BugCatcherBennyAfterBattleText:
	text "Les #MON"
	line "deviennent plus"
	cont "forts en ??voluant!"
	done

BugCatcherAlSeenText:
	text "Les #MON"
	line "insecte sont trop"

	para "cool et trop"
	line "r??sistants! Je"
	cont "vais trop te le"
	cont "prouver!"
	done

BugCatcherAlBeatenText:
	text "T'as prouv?? ??"
	line "quel point t'es"
	cont "bal??ze!..."
	done

BugCatcherAlAfterBattleText:
	text "Ils sont trop"
	line "cool mais la"

	para "plupart des filles"
	line "n'aiment pas les"
	cont "#MON insecte."

	para "Je ne sais pas"
	line "pourquoi..."
	done

BugCatcherJoshSeenText:
	text "Tu as sauv?? tous"
	line "les RAMOLOSS? T'es"
	cont "super bal??ze toi!"

	para "Mais mes #MON"
	line "adultes sont aussi"
	cont "un peu bal??zes je"
	cont "crois!"
	done

BugCatcherJoshBeatenText:
	text "Aarrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "Je crois que j'ai"
	line "oubli?? de leur"
	cont "apprendre un truc!"
	done

TwinsAmyandmay1SeenText:
	text "PIM: Salut!"
	line "Tu veux battre le"
	cont "CHAMPION? Oh non!"
	done

TwinsAmyandmay1BeatenText:
	text "PIM & PAM: Oh,"
	line "double zut!"
	done

TwinsAmyandmay1AfterBattleText:
	text "PIM: Et paf!"
	done

TwinsAmyandmay2SeenText:
	text "PAM: Tu veux voir"
	line "le CHAMPION?"
	cont "Pas tout de suite!"
	done

TwinsAmyandmay2BeatenText:
	text "PIM & PAM: Oh,"
	line "double zut!"
	done

TwinsAmyandmay2AfterBattleText:
	text "PAM: Nos #MON"
	line "insecte ont un"
	cont "peu perdu..."
	cont "Quelle honte!"
	done

AzaleaGymGuyText:
	text "Yo, toi!"

	para "HECTOR est jeune"
	line "mais ses connais-"

	para "sances en mati??re"
	line "de #MON sont"
	cont "vastes."

	para "Ca risque d'??tre"
	line "difficile sans mes"
	cont "conseils."

	para "Voyons voir... Les"
	line "#MON insecte"
	cont "sont vuln??rables"
	cont "au feu."

	para "Les attaques des"
	line "#MON volants"
	cont "sont aussi tr??s"
	cont "efficaces."
	done

AzaleaGymGuyWinText:
	text "Bien jou??! Voil??"
	line "une bonne le??on."

	para "Avec des gens"
	line "comme toi, l'ave-"
	cont "nir des #MON"
	cont "sera brillant!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
