	object_const_def ; object_event constants
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUY

BlackthornGym1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	return

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	buttonsound
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	buttonsound
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuyWinScript
	writetext BlackthornGymGuyText
	waitbutton
	closetext
	end

.BlackthornGymGuyWinScript:
	writetext BlackthornGymGuyWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd gymstatue2

ClairIntroText:
	text "Je suis SANDRA."

	para "Je suis la reine"
	line "des dragons."

	para "Je peux m??me tenir"
	line "t??te au CONSEIL"
	cont "des 4 de la LIGUE."

	para "Tu veux toujours"
	line "te battre?"

	para "...Bon."
	line "C'est parti!"

	para "Je vais pas y"
	line "aller mollo!"
	done

ClairWinText:
	text "Perdu?"

	para "J'y crois pas!!"
	line "Il y a s??rement"
	cont "une erreur..."
	done

ClairText_GoToDragonsDen:
	text "Ce n'est pas"
	line "possible."

	para "J'ai peut-??tre"
	line "perdu mais tu n'as"

	para "pas les ??paules"
	line "pour la LIGUE"
	cont "#MON."

	para "Tu devrais relever"
	line "le d??fi des utili-"
	cont "sateurs de"
	cont "dragons."

	para "Derri??re cette"
	line "ARENE se trouve"
	cont "l'ANTRE du DRAGON."

	para "Il y a un petit"
	line "temple au centre."
	cont "Vas-y."

	para "Si tu arrives ??"
	line "prouver ta valeur,"

	para "tu seras digne de"
	line "porter le BADGE!"
	done

ClairText_TooMuchToExpect:
	text "Et alors?"

	para "On a peur"
	line "maintenant?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Tu en as mis du"
	line "temps!"

	para "Tiens! Prends ??a!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> re??oit"
	line "CT24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Elle contient"
	line "DRACOSOUFFLE."

	para "Quoi? Non, ??a n'a"
	line "rien ?? voir avec"
	cont "mon haleine."

	para "Ecoute: si tu la"
	line "veux pas, t'as"
	cont "qu'?? la laisser."
	done

BlackthornGymClairText_BagFull:
	text "Bah alors? Tu n'as"
	line "pas de place?"
	done

BlackthornGymClairText_League:
	text "Et ben alors?"

	para "Tu ne vas pas ??"
	line "la LIGUE #MON?"

	para "Tu sais o?? c'est,"
	line "n'est-ce pas?"

	para "Va d'abord au"
	line "BOURG GEON."

	para "SURFE ensuite vers"
	line "l'est. Le chemin"
	cont "sera rude."

	para "Ne perds pas ?? la"
	line "LIGUE #MON!"

	para "Si tu perds, de"
	line "quoi j'aurai"
	cont "l'air, moi?"

	para "Fais de ton mieux."
	done

CooltrainermPaulSeenText:
	text "C'est ton premier"
	line "combat face ?? des"
	cont "dragons?"

	para "Je vais te montrer"
	line "leur r??sistance"
	cont "supr??me!"
	done

CooltrainermPaulBeatenText:
	text "Mes #MON"
	line "dragon ont perdu?"
	done

CooltrainermPaulAfterBattleText:
	text "PETER voulait te"
	line "revoir?"
	cont "Mensonge!"
	done

CooltrainermMikeSeenText:
	text "Mes chances de"
	line "perdre? M??me pas"
	cont "une pour mille!"
	done

CooltrainermMikeBeatenText:
	text "Je ne suis plus"
	line "tr??s bon en"
	cont "maths."
	done

CooltrainermMikeAfterBattleText:
	text "Je connais mes"
	line "d??fauts..."

	para "On recommence?"
	line "Non? Bon et bien"
	cont "merci pour la"
	cont "le??on..."
	done

CooltrainerfLolaSeenText:
	text "Les dragons sont"
	line "des #MON"

	para "sacr??s. Ils sont"
	line "plein de vie."

	para "Si tu ne fais pas"
	line "attention, tu ne"

	para "pourras pas en"
	line "venir ?? bout."
	done

CooltrainerfLolaBeatenText:
	text "Bien jou??!"
	done

CooltrainerfLolaAfterBattleText:
	text "Les dragons sont"
	line "faibles face aux"
	cont "attaques de type"
	cont "DRAGON."
	done

BlackthornGymGuyText:
	text "H??! Graine de"
	line "star!"

	para "C'est une longue"
	line "journ??e, mais on"

	para "arrivera bien-"
	line "t??t au bout!"
	cont "Compte sur moi!"

	para "SANDRA utilise les"
	line "#MON mythiques"
	cont "et sacr??s de type"
	cont "DRAGON."

	para "C'est assez dur"
	line "de les battre."

	para "Mais tu sais, ils"
	line "sont cens??s ??tre"

	para "faibles contre"
	line "les attaques de"
	cont "type GLACE."
	done

BlackthornGymGuyWinText:
	text "Bien jou??!"
	line "Beau combat!"

	para "Il ne reste plus"
	line "que le challenge"
	cont "de la LIGUE"
	cont "#MON."

	para "Tu es sur le"
	line "point de devenir"
	cont "MAITRE #MON!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuyScript, -1
