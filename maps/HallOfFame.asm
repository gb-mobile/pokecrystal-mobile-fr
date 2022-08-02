	object_const_def ; object_event constants
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	db 2 ; scene scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.EnterHallOfFame:
	prioritysjump .EnterHallOfFameScript
	end

.DummyScene:
	end

.EnterHallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext HallOfFame_LanceText
	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_FINISHED
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_FINISHED
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "PETER: Je ne suis"
	line "pas venu ici"
	cont "depuis longtemps."

	para "Ce lieu consacre"
	line "les MAITRES de la"

	para "LIGUE pour l'éter-"
	line "nité."

	para "Leurs courageux"
	line "#MON sont aussi"
	cont "accueillis."

	para "Aujourd'hui, un"
	line "nouveau MAITRE a"

	para "fait son appari-"
	line "tion. Un MAITRE"

	para "aimant ses #MON"
	line "plus que tout."

	para "Un dresseur"
	line "persévérant et"
	cont "déterminé."

	para "Tu possèdes tous"
	line "les atouts pour"

	para "être le plus grand"
	line "des MAITRES!"

	para "<PLAY_G>, je vais"
	line "inscrire ton nom"

	para "et celui de tes"
	line "amis!"
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
