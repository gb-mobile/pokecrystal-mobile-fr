	object_const_def ; object_event constants
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike:
; unused
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "...(soupir)..."
	line "J'ai déménagé ici"

	para "mais je n'arrive"
	line "pas à vendre mes"
	cont "BICYCLETTES."
	cont "Pourquoi?"

	para "Pourrais-tu faire"
	line "de la BICYCLETTE"
	cont "et me faire de la"
	cont "pub?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Vraiment? Génial!"

	para "Donne-moi ton nom"
	line "et ton numéro de"

	para "téléphone et je te"
	line "prêterai une"
	cont "BICYCLETTE."
	done

BorrowedABicycleText:
	text "<PLAYER> emprunte"
	line "une BICYCLETTE."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "Mes BICYCLETTES"
	line "sont trop bien!"

	para "Tu peux en faire"
	line "partout."
	done

GoldenrodBikeShopClerkRefusedText:
	text "...(soupir)..."
	line "Ah, que dire de"
	cont "plus..."
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Tout chô tout bô!"

	para "BICYCLETTES de"
	line "poche de premier"
	cont "choix!"
	done

GoldenrodBikeShopBicycleText:
	text "C'est une sacrée"
	line "jolie BICYCLETTE!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
