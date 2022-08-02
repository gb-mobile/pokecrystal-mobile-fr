	object_const_def ; object_event constants
	const AZALEAMART_CLERK
	const AZALEAMART_COOLTRAINER_M
	const AZALEAMART_BUG_CATCHER

AzaleaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_AZALEA
	closetext
	end

AzaleaMartCooltrainerMScript:
	jumptextfaceplayer AzaleaMartCooltrainerMText

AzaleaMartBugCatcherScript:
	jumptextfaceplayer AzaleaMartBugCatcherText

AzaleaMartCooltrainerMText:
	text "Il n'y a pas"
	line "de SUPER BALLS."

	para "Les # BALLS"
	line "devront faire"
	cont "l'affaire."

	para "J'aimerais que"
	line "FARGAS me fabri-"
	cont "que quelques unes"
	cont "de ses BALLS"
	cont "artisanales."
	done

AzaleaMartBugCatcherText:
	text "Une SUPER BALL est"
	line "plus efficace"
	cont "qu'une # BALL"
	cont "pour attraper les"
	cont "#MON."

	para "Mais celles de"
	line "FARGAS sont plus"
	cont "efficaces quelque-"
	cont "fois."
	done

AzaleaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 3
	warp_event  3,  7, AZALEA_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartClerkScript, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaMartCooltrainerMScript, -1
	object_event  7,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaMartBugCatcherScript, -1
