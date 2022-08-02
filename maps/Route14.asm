	object_const_def ; object_event constants
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANM, CARTER, EVENT_BEAT_POKEFANM_CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmCarterAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRoyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrevor:
	trainer POKEFANM, TREVOR, EVENT_BEAT_POKEFANM_TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrevorAfterBattleText
	waitbutton
	closetext
	end

PokefanmCarterSeenText:
	text "J'ai eu du mal à"
	line "attraper mes #-"

	para "MON rares et super"
	line "jolis."
	done

PokefanmCarterBeatenText:
	text "Awaaah!"
	done

PokefanmCarterAfterBattleText:
	text "CARAPUCE, SALAME-"
	line "CHE et BULBIZARRE:"

	para "c'est une équipe"
	line "diversifiée."
	done

BirdKeeperRoySeenText:
	text "Je rêve de voler"
	line "avec mes amis les"
	cont "#MON oiseaux."
	done

BirdKeeperRoyBeatenText:
	text "Je rêve mais je ne"
	line "volerai jamais..."
	done

BirdKeeperRoyAfterBattleText:
	text "Tu as des #MON"
	line "qui ont appris la"

	para "CS VOL, non? Tu as"
	line "trop de chance."
	done

PokefanmTrevorSeenText:
	text "Le savais-tu?"

	para "Les #MON sont"
	line "plus amicaux s'ils"

	para "sont entraînés"
	line "dans un endroit"
	cont "familier."
	done

PokefanmTrevorBeatenText:
	text "Où ai-je rencontré"
	line "ce PSYKOKWAK?"
	done

PokefanmTrevorAfterBattleText:
	text "Y a-t-il un moyen"
	line "de savoir où l'on"

	para "a trouvé nos"
	line "#MON?"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event  6, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
