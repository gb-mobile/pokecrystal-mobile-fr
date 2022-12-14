	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	buttonsound
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ANCIEN: Tu es"
	line "sans conteste un"
	cont "bon dresseur."

	para "Comme promis,"
	line "voici ta CS."

	para "Un conseil toute-"
	line "fois: traite tes"

	para "#MON avec plus"
	line "de gentillesse."

	para "Tu es bien trop"
	line "??pre au combat."

	para "Les #MON ne"
	line "sont pas des"
	cont "engins de guerre."
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "..."
	line "...Pfeuh!"

	para "On l'appelle"
	line "l'ANCIEN mais il"
	cont "est super nul!"

	para "Et il raconte"
	line "n'importe quoi..."

	para "Je ne me ferai"
	line "jamais battre par"

	para "un cr??tin qui"
	line "conseille d'??tre"

	para "gentil avec les"
	line "#MON."

	para "Seuls les #MON"
	line "puissants sont"
	cont "importants."

	para "Je me contrefiche"
	line "des #MON mi-"
	cont "gnons et faibles."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> utilise"
	line "une CORDE SORTIE!"
	done

SageLiSeenText:
	text "Bienvenue ?? toi,"
	line "mon poussin!"

	para "La TOUR CHETIFLOR"
	line "est un lieu"
	cont "d'entra??nement."

	para "Humains et #MON"
	line "y renforcent leurs"

	para "liens pour des"
	line "lendemains qui"
	cont "chantent."

	para "Je serai ton"
	line "adversaire final."

	para "Permets-moi de"
	line "mettre ?? l'??preuve"

	para "ton amiti?? envers"
	line "tes #MON!"
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

SageLiTakeThisFlashText:
	text "Toi et tes #MON"
	line "m??ritez bien cette"
	cont "nouvelle capacit??."

	para "Prends donc cette"
	line "CS FLASH."
	done

SageLiFlashExplanationText:
	text "Le FLASH illumine"
	line "les endroits les"
	cont "plus sombres."

	para "Pour l'utiliser en"
	line "dehors des combats"

	para "il te faudra ce-"
	line "pendant le BADGE"
	cont "de l'ARENE de"
	cont "MAUVILLE."
	done

SageLiAfterBattleText:
	text "Va, vole et"
	line "apprends la vie"
	cont "gr??ce aux #MON."
	done

SageJinSeenText:
	text "Je m'entra??ne pour"
	line "trouver la voie du"
	cont "#MON!"
	done

SageJinBeatenText:
	text "Mon entra??nement"
	line "est insuffisant."
	done

SageJinAfterBattleText:
	text "Quand un #MON"
	line "gagne en puissance"
	cont "son dresseur"
	cont "devient plus fort."

	para "Non, attends..."
	line "C'est le contraire"

	para "je crois..."
	line "Je sais plus."
	done

SageTroySeenText:
	text "Montre-moi ?? quel"
	line "point tu fais"
	cont "confiance ?? tes"
	cont "#MON."
	done

SageTroyBeatenText:
	text "Ta confiance est"
	line "totale! Bien!"
	done

SageTroyAfterBattleText:
	text "L'ANCIEN n'est"
	line "plus tr??s loin."
	done

SageNealSeenText:
	text "La CS de l'ANCIEN"
	line "??claire m??me les"
	cont "sombres cavernes."
	done

SageNealBeatenText:
	text "J'en ai pris plein"
	line "la t??te!"
	done

SageNealAfterBattleText:
	text "Que ta voie soit"
	line "douce et claire."
	done

SproutTower3FPaintingText:
	text "Une belle peinture"
	line "d'un majestueux"
	cont "CHETIFLOR."
	done

SproutTower3FStatueText:
	text "Une statue de"
	line "#MON..."

	para "Ca a l'air cher"
	line "et raffin??."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 1 ; coord events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
