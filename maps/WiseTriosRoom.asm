	object_const_def ; object_event constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	buttonsound
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Dingue..."

	para "SUICUNE, ENTEI et"
	line "RAIKOU se sont"
	cont "réveillés..."

	para "La légende est-"
	line "elle vraie?"
	done

WiseTriosRoomSage2Text:
	text "On s'entraîne à la"
	line "TOUR CENDREE mais"

	para "on n'a jamais vu"
	line "de trou s'ouvrir"

	para "jusqu'à présent."
	line "Quelqu'un doit en"

	para "être le"
	line "responsable."
	done

WiseTriosRoomSage3BlocksExitText:
	text "La TOUR FERRAILLE"
	line "est accessible aux"

	para "porteurs du BADGE"
	line "de ROSALIA."

	para "Toutefois, depuis"
	line "le réveil de"
	cont "SUICUNE, RAIKOU"

	para "et d'ENTEI, je ne"
	line "peux pas vous"
	cont "laisser entrer!"
	done

WiseTriosRoomSage3Text:
	text "Nous, le TRIO des"
	line "SAGES, sommes les"

	para "gardiens des #-"
	line "MON légendaires."
	done

SageGakuSeenText:
	text "La légende dit"
	line "que la venue d'un"

	para "dresseur pouvant"
	line "toucher l'âme des"

	para "#MON, un"
	line "#MON viendra"

	para "mettre ce dresseur"
	line "à l'épreuve dans"
	cont "la TOUR FERRAILLE."

	para "La légende s'est"
	line "réalisée!"

	para "Le #MON"
	line "légendaire SUICUNE"
	cont "est arrivé!"

	para "Nous, le TRIO des"
	line "SAGES, te mettons"
	cont "au défi d'entrer!"
	done

SageGakuBeatenText:
	text "Trop de puissance!"
	done

SageGakuAfterBattleText:
	text "Tu prétends donc"
	line "avoir vu SUICUNE,"
	cont "ENTEI et RAIKOU"
	cont "endormis?"

	para "Incroyable!"

	para "La légende dit"
	line "bien qu'on ne peut"
	cont "pas les voir"
	cont "dormir..."
	done

SageMasaSeenText:
	text "Doit-on te faire"
	line "confiance?"

	para "Je dois te mettre"
	line "à l'épreuve."
	done

SageMasaBeatenText:
	text "...Je dirai la"
	line "vérité..."
	done

SageMasaAfterBattleText:
	text "Il y a longtemps,"
	line "il y avait deux"
	cont "tours ici."

	para "La TOUR de CUIVRE,"
	line "qui pouvait éveil-"

	para "ler les #MON,"
	line "et la TOUR FER-"

	para "RAILLE, où les"
	line "#MON se"
	cont "reposaient."

	para "La vue depuis le"
	line "sommet des TOURS"

	para "devait être"
	line "magnifique."

	para "En ce temps-là, un"
	line "immense #MON"

	para "argenté avait fait"
	line "son nid en haut de"
	cont "la TOUR de CUIVRE."

	para "Toutefois..."

	para "Il y a 150 ans,"
	line "un éclair frappa"
	cont "l'une des TOURS."

	para "Elle prit feu et"
	line "brûla pendant"
	cont "trois jours."

	para "Et puis une pluie"
	line "violente eut"
	cont "raison du brasier."

	para "Voici comment la"
	line "TOUR CENDREE est"
	cont "née."
	done

SageKojiSeenText:
	text "Montre-moi ta"
	line "force!"
	done

SageKojiBeatenText:
	text "Trop de puissance!"
	line "Pourquoi?"
	done

SageKojiAfterBattleQuestionText:
	text "Toi... Es-tu là"
	line "pour les #MON"
	cont "légendaires?"
	done

SageKojiAfterBattleSpeechText:
	text "Je vois..."

	para "Nous, le TRIO des"
	line "SAGES, avons le"

	para "devoir de protéger"
	line "les #MON légen-"

	para "daires. "
	line "Nous ne laissons"

	para "passer que ceux"
	line "au coeur pur."

	para "Entre et découvre"
	line "la TOUR FERRAILLE."

	para "SUICUNE te mettra"
	line "à l'épreuve."
	done

SageKojiAfterBattleFinalText:
	text "Va."

	para "SUICUNE te mettra"
	line "à l'épreuve."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
