	object_const_def ; object_event constants
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	special Mobile_DummyReturnFalse
	iffalse .AlreadyHaveOddEgg
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	setval EGG_TICKET
	special UnusedFindItemInPCOrBag
	iftrue .AlreadyHaveOddEgg
	writetext Text_DayCareManTalksAboutEggTicket ; 7E2A
	buttonsound
	verbosegiveitem EGG_TICKET
	writetext DayCareText_ComeAgain ; 7EA3
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

Text_GrampsLookingForYou:
	text "Pépé te cherche."
	done

Text_DayCareManTalksAboutEggTicket:
	text "Je suis le type"
	line "de la PENSION."

	para "There's something"
	line "new in GOLDENROD"

	para "called the TRADE"
	line "CORNER."

	para "I was given an EGG"
	line "TICKET that can be"

	para "traded in for a"
	line "ODD EGG."

	para "But since we run a"
	line "DAY-CARE, we don't"

	para "need it. You may"
	line "as well have it."
	done

DayCareManText_GiveOddEgg:
	text "Je suis le TYPE de"
	line "la PENSION."

	para "Tu connais les"
	line "OEUFS?"

	para "J'élevais des"
	line "#MON avec ma"
	cont "femme..."

	para "Et puis on a trou-"
	line "vé un OEUF!"

	para "C'est pas trop"
	line "dingue, ça?"

	para "Bon. Tu le veux"
	line "cet OEUF?"
	cont "Tu peux le garder!"
	done

DayCareText_ComeAgain:
	text "A bientôt."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> reçoit"
	line "OEUF BIZARRE!"
	done

DayCareText_DescribeOddEgg:
	text "J'ai trouvé ça"
	line "en m'occupant du"

	para "#MON de"
	line "quelqu'un."

	para "Mais le dresseur"
	line "ne veut pas de"
	cont "l'OEUF..."
	done

DayCareText_PartyFull:
	text "Tu n'as plus de"
	line "place."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
