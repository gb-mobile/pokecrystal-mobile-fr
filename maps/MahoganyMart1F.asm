	object_const_def ; object_event constants
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGON
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_MAHOGANYMART1F_NOTHING
	scene_script .LanceUncoversStaircase ; SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .MahoganyMart1FStaircase

.DummyScene0:
	end

.LanceUncoversStaircase:
	prioritysjump MahoganyMart1FLanceUncoversStaircaseScript
	end

.MahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	return

.ShowStairs:
	changeblock 6, 2, $1e ; stairs
	return

MahogayMart1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

.LanceEntered:
	writetext MahogayMart1FPharmacistText_LanceEntered
	waitbutton
	closetext
	end

MahogayMart1FBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	writetext MahogayMart1FBlackBeltText
	waitbutton
	closetext
	end

.LanceEntered:
	writetext MahogayMart1FBlackBeltText_LanceEntered
	waitbutton
	closetext
	end

MahoganyMart1FLanceUncoversStaircaseScript:
	pause 15
	opentext
	writetext UnknownText_0x6c52a
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGON, MovementData_0x6c3f6
	applymovement MAHOGANYMART1F_BLACK_BELT, MovementData_0x6c3fb
	pause 15
	disappear MAHOGANYMART1F_DRAGON
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c407
	opentext
	writetext UnknownText_0x6c549
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40a
	applymovement MAHOGANYMART1F_PHARMACIST, MovementData_0x6c403
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40e
	stopfollow
	opentext
	writetext UnknownText_0x6c59e
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e ; stairs
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	turnobject MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext UnknownText_0x6c5ba
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c412
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene SCENE_MAHOGANYMART1F_NOTHING
	waitsfx
	end

MahogayMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MovementData_0x6c3f6:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

MovementData_0x6c3fb:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

MovementData_0x6c403:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

MovementData_0x6c407:
	slow_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6c40a:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_0x6c40e:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x6c412:
	slow_step RIGHT
	step_end

UnknownText_0x6c414:
	text "Salut, toi!"

	para "Ca te dirait du"
	line "BONBON RAGE?"

	para "C'est cool d'en"
	line "manger à ACAJOU!"
	done

MahogayMart1FPharmacistText_LanceEntered:
	text "Graaah... Tu as"
	line "trouvé l'escalier"
	cont "secret!"
	done

MahogayMart1FBlackBeltText:
	text "Hé hé!! Ca marche"
	line "pas mal pour moi!"
	cont "Hé hé!"

	para "Les MAGICARPE ne"
	line "valent rien mais"

	para "les LEVIATOR rap-"
	line "portent gros!"
	done

MahogayMart1FBlackBeltText_LanceEntered:
	text "Gueuhhh..."

	para "Les #MON dragon"
	line "de ce type sont"
	cont "super forts..."
	done

UnknownText_0x6c52a:
	text "PETER: DRACOLOSSE,"
	line "ULTRALASER."
	done

UnknownText_0x6c549:
	text "Tu en as mis du"
	line "temps, <PLAY_G>!"

	para "Comme je le pen-"
	line "sais, cet étrange"

	para "signal radio vient"
	line "d'ici."
	done

UnknownText_0x6c59e:
	text "Les escaliers sont"
	line "par ici."
	done

UnknownText_0x6c5ba:
	text "PETER: <PLAY_G>,"
	line "nous ferions mieux"

	para "de nous séparer."
	line "Je passe en"
	cont "premier."
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MAHOGANY_TOWN, 1
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  1,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FBlackBeltScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  3,  6, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahogayMart1FGrannyScript, EVENT_MAHOGANY_MART_OWNERS
