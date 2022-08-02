	object_const_def ; object_event constants
	const ROUTE5CLEANSETAGHOUSE_GRANNY
	const ROUTE5CLEANSETAGHOUSE_TEACHER

Route5CleanseTagHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	buttonsound
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

Route5CleanseTagHouseTeacherScript:
	jumptextfaceplayer Route5CleanseTagHouseTeacherText

HouseForSaleBookshelf:
	jumpstd difficultbookshelf

Route5CleanseTagHouseGrannyText1:
	text "Yaaaah!"

	para "Je sens une pré-"
	line "sence maléfique"
	cont "planer sur toi."

	para "Prends donc ce"
	line "talisman!"
	done

Route5CleanseTagHouseGrannyText2:
	text "La mort rôdait sur"
	line "ton âme... Mais ça"
	cont "va maintenant."
	done

Route5CleanseTagHouseTeacherText:
	text "Ma mémé est à fond"
	line "dans les délires"

	para "paranormaux."
	line "Excuse-la."

	para "Elle a dû te"
	line "faire peur, hein?"
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	db 2 ; object events
	object_event  2,  5, SPRITE_GRANNY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseTeacherScript, -1
