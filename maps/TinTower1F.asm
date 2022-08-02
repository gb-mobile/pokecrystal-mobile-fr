	object_const_def ; object_event constants
	const TINTOWER1F_SUICUNE
	const TINTOWER1F_RAIKOU
	const TINTOWER1F_ENTEI
	const TINTOWER1F_EUSINE
	const TINTOWER1F_SAGE1
	const TINTOWER1F_SAGE2
	const TINTOWER1F_SAGE3
	const TINTOWER1F_SAGE4
	const TINTOWER1F_SAGE5
	const TINTOWER1F_SAGE6

TinTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .FaceSuicune ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .NPCsCallback
	callback MAPCALLBACK_TILES, .StairsCallback

.FaceSuicune:
	prioritysjump .SuicuneBattle
	end

.DummyScene:
	end

.NPCsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .FaceBeasts
	special BeastsCheck
	iffalse .FaceBeasts
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
.GotRainbowWing:
	checkevent EVENT_FOUGHT_HO_OH
	iffalse .Done
	appear TINTOWER1F_EUSINE
.Done:
	return

.FaceBeasts:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .FoughtSuicune
	appear TINTOWER1F_SUICUNE
	setval RAIKOU
	special MonCheck
	iftrue .NoRaikou
	appear TINTOWER1F_RAIKOU
	sjump .CheckEntei

.NoRaikou:
	disappear TINTOWER1F_RAIKOU
.CheckEntei:
	setval ENTEI
	special MonCheck
	iftrue .NoEntei
	appear TINTOWER1F_ENTEI
	sjump .BeastsDone

.NoEntei:
	disappear TINTOWER1F_ENTEI
.BeastsDone:
	return

.FoughtSuicune:
	disappear TINTOWER1F_SUICUNE
	disappear TINTOWER1F_RAIKOU
	disappear TINTOWER1F_ENTEI
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	return

.StairsCallback:
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .DontHideStairs
	changeblock 10, 2, $09 ; floor
.DontHideStairs:
	return

.SuicuneBattle:
	applymovement PLAYER, TinTowerPlayerMovement1
	pause 15
	setval RAIKOU
	special MonCheck
	iftrue .Next1 ; if player caught Raikou, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement1
	turnobject PLAYER, LEFT
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_RAIKOU, TinTowerRaikouMovement2
	disappear TINTOWER1F_RAIKOU
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next1:
	setval ENTEI
	special MonCheck
	iftrue .Next2 ; if player caught Entei, he doesn't appear in Tin Tower
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement1
	turnobject PLAYER, RIGHT
	cry ENTEI
	pause 10
	playsound SFX_WARP_FROM
	applymovement TINTOWER1F_ENTEI, TinTowerEnteiMovement2
	disappear TINTOWER1F_ENTEI
	playsound SFX_EXIT_BUILDING
	waitsfx
.Next2:
	turnobject PLAYER, UP
	pause 10
	applymovement PLAYER, TinTowerPlayerMovement2
	applymovement TINTOWER1F_SUICUNE, TinTowerSuicuneMovement
	cry SUICUNE
	pause 20
	loadwildmon SUICUNE, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	dontrestartmapmusic
	disappear TINTOWER1F_SUICUNE
	setevent EVENT_FOUGHT_SUICUNE
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_NOTHING
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setmapscene ROUTE_36, SCENE_ROUTE36_NOTHING
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_NOTHING
	setscene SCENE_FINISHED
	clearevent EVENT_SET_WHEN_FOUGHT_HO_OH
	reloadmapafterbattle
	pause 20
	turnobject PLAYER, DOWN
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_EUSINE, 10, 15
	appear TINTOWER1F_EUSINE
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851ec
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE1, 9, 15
	appear TINTOWER1F_SAGE1
	applymovement TINTOWER1F_SAGE1, MovementData_0x1851f5
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE2, 9, 15
	appear TINTOWER1F_SAGE2
	applymovement TINTOWER1F_SAGE2, MovementData_0x1851fb
	playsound SFX_ENTER_DOOR
	moveobject TINTOWER1F_SAGE3, 9, 15
	appear TINTOWER1F_SAGE3
	applymovement TINTOWER1F_SAGE3, MovementData_0x1851fe
	moveobject TINTOWER1F_SAGE1, 7, 13
	moveobject TINTOWER1F_SAGE2, 9, 13
	moveobject TINTOWER1F_SAGE3, 11, 13
	turnobject PLAYER, RIGHT
	opentext
	writetext TinTowerEusineSuicuneText
	waitbutton
	closetext
	applymovement TINTOWER1F_EUSINE, MovementData_0x1851f1
	playsound SFX_EXIT_BUILDING
	disappear TINTOWER1F_EUSINE
	waitsfx
	special FadeOutMusic
	pause 20
	playmapmusic
	end

TinTower1FSage1Script:
	jumptextfaceplayer TinTower1FSage1Text

TinTower1FSage2Script:
	jumptextfaceplayer TinTower1FSage2Text

TinTower1FSage3Script:
	jumptextfaceplayer TinTower1FSage3Text

TinTower1FSage4Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage4Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage4Text2

TinTower1FSage5Script:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .GotRainbowWing
	writetext TinTower1FSage5Text1
	buttonsound
	verbosegiveitem RAINBOW_WING
	closetext
	refreshscreen
	earthquake 72
	waitsfx
	playsound SFX_STRENGTH
	changeblock 10, 2, $20 ; stairs
	reloadmappart
	setevent EVENT_GOT_RAINBOW_WING
	closetext
	opentext
.GotRainbowWing:
	writetext TinTower1FSage5Text2
	waitbutton
	closetext
	end

.FoughtHoOh:
	writetext TinTower1FSage5Text3
	waitbutton
	closetext
	end

TinTower1FSage6Script:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .FoughtHoOh
	jumptextfaceplayer TinTower1FSage6Text1

.FoughtHoOh:
	jumptextfaceplayer TinTower1FSage6Text2

TinTowerEusine:
	jumptextfaceplayer TinTowerEusineHoOhText

TinTowerPlayerMovement1:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

TinTowerRaikouMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerRaikouMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement1:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerEnteiMovement2:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step LEFT
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerSuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	remove_sliding
	step_end

TinTowerPlayerMovement2:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

MovementData_0x1851ec:
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x1851f1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x1851f5:
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head UP
	step_end

MovementData_0x1851fb:
	step UP
	step UP
	step_end

MovementData_0x1851fe:
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end

TinTowerEusineSuicuneText:
	text "EUSINE: Bravo!"
	line "Trop fort!"

	para "Je n'ai jamais vu"
	line "un tel combat."

	para "Alors ça..."
	line "J'suis soufflé."

	para "SUICUNE est fort,"
	line "mais tu l'es"

	para "encore plus,"
	line "<PLAYER>."

	para "On dit que SUICUNE"
	line "a le pouvoir d'in-"

	para "voquer un #MON"
	line "aux couleurs de"
	cont "l'arc-en-ciel."

	para "Peut-être, on ne"
	line "sait jamais, ce"

	para "qu'il vient de se"
	line "passer le fera"
	cont "apparaître..."

	para "Je vais encore"
	line "étudier les"
	cont "légendes..."

	para "Merci de m'avoir"
	line "montré tes"
	cont "talents..."

	para "A très bientôt,"
	line "<PLAYER>!"
	done

TinTower1FSage1Text:
	text "Selon la"
	line "légende..."

	para "Lorsque les âmes"
	line "des #MON et des"

	para "humains se réunis-"
	line "sent, un #MON"

	para "aux couleurs de"
	line "l'arc-en-ciel des-"
	cont "cend des cieux..."

	para "Est-il possible"
	line "que les #MON"

	para "légendaires met-"
	line "tent les humains"
	cont "à l'épreuve?"
	done

TinTower1FSage2Text:
	text "Lorsque la TOUR de"
	line "CUIVRE brûla,"

	para "trois #MON sans"
	line "nom ont, paraît-"

	para "il, péri dans les"
	line "flammes..."

	para "Toutefois..."

	para "Un #MON couleur"
	line "arc-en-ciel..."

	para "Ou plus précisé-"
	line "ment..."

	para "HO-OH, descendit"
	line "du ciel et redonna"

	para "la vie aux trois"
	line "#MON."

	para "Ils se nomment..."

	para "SUICUNE, ENTEI et"
	line "RAIKOU."

	para "Et voilà ce qu'on"
	line "raconte."
	done

TinTower1FSage3Text:
	text "On dit que les"
	line "deux TOURS furent"

	para "construites pour"
	line "sceller l'amitié"

	para "entre #MON et"
	line "humains."

	para "C'était il y a"
	line "700 ans, mais"

	para "l'idée reste la"
	line "même aujourd'hui."
	done

TinTower1FSage4Text1:
	text "HO-OH a dû arriver"
	line "ici, à la TOUR"
	cont "FERRAILLE!"
	done

TinTower1FSage5Text1:
	text "Ceci te protégera."
	done

TinTower1FSage5Text2:
	text "Va."
	done

TinTower1FSage6Text1:
	text "Je crois que l'on"
	line "te met à l'épreu-"
	cont "ve."

	para "Avance l'esprit"
	line "clair."
	done

TinTowerEusineHoOhText:
	text "Je le savais."

	para "Je savais que tu"
	line "verrais le #MON"

	para "arc-en-ciel,"
	line "<PLAYER>."

	para "Je l'avais prédit."

	para "Je suis pas trop"
	line "mauvais, moi."

	para "Je vais continuer"
	line "à étudier pour"

	para "être un célèbre"
	line "#MANIAC!"
	done

TinTower1FSage4Text2:
	text "Les #MON légen-"
	line "daires sont censés"

	para "posséder trois"
	line "pouvoirs..."

	para "La foudre qui a"
	line "frappé la TOUR."

	para "Le feu qui a brûlé"
	line "la TOUR."

	para "Et la pluie qui a"
	line "éteint le feu..."
	done

TinTower1FSage5Text3:
	text "Lorsque les #-"
	line "MON légendaires"
	cont "sont apparus..."

	para "Ils pétrifièrent"
	line "de terreur les"
	cont "témoins de leur"
	cont "réveil..."

	para "Et..."

	para "Certains ont même"
	line "cru bon de les"
	cont "attaquer..."

	para "Les #MON légen-"
	line "daires, conscients"

	para "de leur puissance,"
	line "ont préféré fuir."
	done

TinTower1FSage6Text2:
	text "On dit que le"
	line "#MON légendai-"

	para "re SUICUNE est le"
	line "plus proche de"
	cont "HO-OH."

	para "Il y aurait aussi"
	line "un lien avec les"

	para "#MON connus"
	line "sous le nom de..."
	cont "ZARBI."

	para "Les ZARBI et"
	line "SUICUNE doivent"

	para "être liés en un"
	line "sens..."
	done

TinTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  9, 15, ECRUTEAK_CITY, 12
	warp_event 10, 15, ECRUTEAK_CITY, 12
	warp_event 10,  2, TIN_TOWER_2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event  9,  9, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_SUICUNE
	object_event  7,  9, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_RAIKOU
	object_event 12,  9, SPRITE_ENTEI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_ENTEI
	object_event  8,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TinTowerEusine, EVENT_TIN_TOWER_1F_EUSINE
	object_event  5,  9, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 14,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage3Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage4Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event  9,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage5Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
	object_event 14,  2, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower1FSage6Script, EVENT_TIN_TOWER_1F_WISE_TRIO_2
