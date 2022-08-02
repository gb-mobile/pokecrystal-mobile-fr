	object_const_def ; object_event constants
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
	end

MrPsychicsHouseBookshelf:
	jumpstd difficultbookshelf

MrPsychicText1:
	text "..."

	para "...."

	para "....."

	para "......Ah!"

	para "Tu veux ça?"
	done

MrPsychicText2:
	text "CT29: PSYKO."

	para "Il peux baisser"
	line "la DEFENSE"
	cont "SPECIALE de"
	cont "l'ennemi."
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
