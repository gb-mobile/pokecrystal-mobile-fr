	object_const_def ; object_event constants
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	buttonsound
	verbosegiveitem TM_HIDDEN_POWER
	iffalse .Done
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	closetext
	end
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.Done:
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd difficultbookshelf

HiddenPowerGuyText1:
	text "...Tu as bien"
	line "voyagé..."

	para "Moi, j'ai médité."
	line "Au fond de moi une"

	para "nouvelle force"
	line "s'est réveillée."

	para "Laisse-moi parta-"
	line "ger mon pouvoir"

	para "avec tes #MON."
	line "Prends-ça."
	done

HiddenPowerGuyText2:
	text "Tu vois? C'est"
	line "PUIS.CACHEE!"

	para "Elle prolonge la"
	line "puissance de tes"
	cont "#MON."

	para "Rappelle-toi: cela"
	line "dépend du type et"
	cont "de la puissance du"
	cont "#MON utilisé."
	done

HiddenPowerGuyText3:
	text "Je médite..."
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
