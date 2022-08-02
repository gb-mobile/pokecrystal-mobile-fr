	object_const_def ; object_event constants
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .BrunosRoomDoors

.LockDoor:
	prioritysjump .BrunosDoorLocksBehindYou
	end

.DummyScene:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, BrunosRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, BRUNO1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "Je suis ALDO du"
	line "CONSEIL des 4."

	para "Mon truc à moi"
	line "c'est de m'entraî-"
	cont "ner comme un méga"
	cont "dingue."

	para "Et c'est comme ça"
	line "que je suis devenu"
	cont "si fort et beau."

	para "... Ho!"
	line "Tu m'écoutes?"

	para "T'as pas peur ou"
	line "quoi? Très bien..."

	para "Comme on peut pas"
	line "discuter, on va"
	cont "s'battre."

	para "OK, <PLAYER>?"
	line "Tu vas... Quoi?"

	para "Tu veux que j'ar-"
	line "rête de parler?"

	para "COMBAT!"
	done

BrunoScript_BrunoBeatenText:
	text "Moi? Perdre?"
	line "Pourquoi?"
	done

BrunoScript_BrunoDefeatText:
	text "J'ai perdu, alors"
	line "je vais me taire."
	cont "Heu..."

	para "Va dans la pro-"
	line "chaine salle!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
