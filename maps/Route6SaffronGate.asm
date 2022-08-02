	object_const_def ; object_event constants
	const ROUTE6SAFFRONGATE_OFFICER

Route6SaffronGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

Route6SaffronGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext Route6SaffronGuardWelcomeText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext Route6SaffronGuardMagnetTrainText
	waitbutton
	closetext
	end

Route6SaffronGuardWelcomeText:
	text "Bienvenue à"
	line "SAFRANIA, la ville"
	cont "du TRAIN MAGNET!"

	para "...Enfin..."
	line "Le TRAIN MAGNET ne"

	para "fonctionne pas en"
	line "ce moment."

	para "Il n'y a plus de"
	line "courant depuis le"

	para "problème de la"
	line "CENTRALE."
	done

Route6SaffronGuardMagnetTrainText:
	text "Le TRAIN MAGNET"
	line "est la fierté de"
	cont "SAFRANIA."
	done

Route6SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
