	object_const_def ; object_event constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	prioritysjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text ; 50D2
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared ; 50FC
	waitbutton
	closetext
	end

.GotAllUnown:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	writetext RuinsOfAlphResearchCenterUnusedText1 ; 5141
	waitbutton
	closetext
	end

.mobile
	writetext RuinsOfAlphResearchCenterUnusedText2 ; 517F
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; 5208
; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

MovementData_0x5926f:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Fini!"

	para "J'ai modifié ton"
	line "#DEX."

	para "J'ai incorporé un"
	line "autre #DEX"

	para "pour enregistrer"
	line "les données de"

	para "ZARBI dans l'ordre"
	line "où ses formes"
	cont "seront capturées."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "Le #DEX de"
	line "<PLAYER> est"
	cont "amélioré!"
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Les ZARBI capturés"
	line "seront tous enre-"
	cont "gistrés."

	para "Découvrez-les"
	line "tous!"
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Tu as attrapé tous"
	line "les types de"
	cont "ZARBI?"

	para "Mais c'est super,"
	line "mon bouchon!"

	para "J'ai préparé l'im-"
	line "primante pour les"
	cont "données de ZARBI."

	para "Tu peux l'utiliser"
	line "quand tu veux."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "Les RUINES sont"
	line "vieilles d'environ"
	cont "1500 ans."

	para "Personne ne sait"
	line "qui a pu les"
	cont "construire..."
	cont "Ni dans quel but."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Combien y a-t-il"
	line "de #MON diffé-"
	cont "rents dans les"
	cont "RUINES?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "Des #MON sont"
	line "apparus dans les"
	cont "RUINES?"

	para "Bah ça pour une"
	line "nouvelle!"

	para "Il faut tout de"
	line "suite y aller!"
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Grâce à ton aide,"
	line "notre enquête sur"

	para "les RUINES donne"
	line "enfin des"
	cont "résultats."

	para "Les RUINES sem-"
	line "blent être un re-"

	para "fuge pour les"
	line "#MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "Il y a des figures"
	line "étranges sur les"
	cont "murs des RUINES."

	para "Elles doivent être"
	line "la clé du mystère"
	cont "des RUINES."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "Les étranges #-"
	line "MON des RUINES?"

	para "Ils semblent être"
	line "proches des figu-"
	cont "res sur les murs."

	para "Hmmm..."

	para "Cela veut dire"
	line "qu'il y en a un"
	cont "grand nombre..."
	done

RuinsOfAlphResearchCenterUnusedText1:
; unused
	text "Nous pensons que"
	line "quelque chose a"

	para "fait apparaître"
	line "les signes"
	cont "dans les RUINES."

	para "Nous nous penchons"
	line "sur la question."
	done

RuinsOfAlphResearchCenterUnusedText2:
; unused
	text "D'après mes"
	line "recherches..."

	para "Les étranges figu-"
	line "res sont apparues"

	para "lorsque le CENTRE"
	line "#COM a été"
	cont "construit."

	para "Les ondes radio"
	line "doivent avoir une"
	cont "influence..."
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Comment ces drôles"
	line "de figures ont pu"
	cont "apparaître?"
	cont "C'est dingue!"

	para "J'y comprends"
	line "rien..."
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUINES D'ALPHA"

	para "Exploration"
	line "Année 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#MON Mystère"
	line "Nom: ZARBI"

	para "Un total de 26"
	line "types découverts."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Cela n'a pas l'air"
	line "de marcher pour"
	cont "l'instant..."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "ZARBI peut être"
	line "imprimé."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
; unused
	text "C'est une photo du"
	line "fondateur du"

	para "CENTRE de RECHER-"
	line "CHE: le PROF."
	cont "LASOIE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Il y a beaucoup de"
	line "livres de science."

	para "Anciennes ruines."
	line "Antiques mystères."
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	db 3 ; object events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
