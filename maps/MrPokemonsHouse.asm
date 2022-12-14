	object_const_def ; object_event constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetMrPokemon:
	prioritysjump .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	buttonsound
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	buttonsound
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hello! Tu dois"
	line "??tre <PLAY_G>."

	para "Le PROF.ORME a dit"
	line "que tu viendrais."
	done

MrPokemonIntroText2:
	text "Voil?? ce que je"
	line "voudrais que le"
	cont "PROF.ORME examine."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> re??oit"
	line "l'OEUF MYSTERE."
	done

MrPokemonIntroText3:
	text "Je connais un cou-"
	line "ple d'amis qui"
	cont "dirige une PENSION"
	cont "pour #MON."

	para "Ils m'ont donn??"
	line "cet OEUF."

	para "Il m'a paru louche"
	line "alors j'ai ??crit"
	cont "au PROF.ORME."

	para "En ce qui concerne"
	line "les ??volutions de"
	cont "#MON, le"
	cont "PROF.ORME est"
	cont "incollable."
	done

MrPokemonIntroText4:
	text "M??me le PROF.CHEN"
	line "le reconna??t."
	done

MrPokemonIntroText5:
	text "A mon avis, le"
	line "PROF.ORME aura"
	cont "une explication."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Tu retournes voir"
	line "le PROF.ORME?"

	para "Tiens. Tes #MON"
	line "devraient se"
	cont "reposer."
	done

MrPokemonText_ImDependingOnYou:
	text "Je compte sur toi!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "C'est beau la vie!"
	line "Il y a toujours"

	para "quelque chose ??"
	line "d??couvrir!"
	done

MrPokemonsHouse_OakText1:
	text "CHEN: Ahaa! C'est"
	line "toi <PLAY_G>!"

	para "Moi c'est CHEN!"
	line "Je suis un cher-"
	cont "cheur #MON."

	para "Je suis venu ren-"
	line "dre visite ?? mon"
	cont "vieil ami..."
	cont "M.#MON!"

	para "On m'a dit que tu"
	line "rendais service au"

	para "PROF.ORME, alors"
	line "je t'attendais."

	para "Oh! C'est quoi ??a?"
	line "Un #MON rare!"

	para "Voyons..."

	para "Hmm... Je vois!"

	para "Je comprends pour-"
	line "quoi le PROF.ORME"

	para "t'a confi?? un"
	line "#MON pour cette"
	cont "mission."

	para "Pour des cher-"
	line "cheurs comme moi"

	para "et le PROF.ORME,"
	line "les #MON sont"
	cont "des amis."

	para "Il a tout de suite"
	line "compris que tu"

	para "ferais attention ??"
	line "ton #MON."

	para "...Ah!"

	para "On peut te faire"
	line "confiance."

	para "Ca te dirait de me"
	line "rendre service?"

	para "Regarde ??a: c'est"
	line "une nouvelle ver-"
	cont "sion du #DEX."

	para "Il enregistre au-"
	line "tomatiquement les"

	para "donn??es sur les"
	line "#MON vus ou"
	cont "pris."

	para "C'est une encyclo-"
	line "p??die moderne!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> re??oit"
	line "le #DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Rencontre un maxi-"
	line "mum de #MON et"

	para "compl??te le"
	line "#DEX!"

	para "Bon. Je dois y"
	line "aller."

	para "J'ai une ??mission"
	line "de radio ?? faire"
	cont "?? DOUBLONVILLE."

	para "<PLAY_G>, je"
	line "compte sur toi!"
	done

MrPokemonText_GimmeTheScale:
	text "Oh? Cette ECAILLE!"
	line "C'est quoi?"
	cont "Un LEVIATOR rouge?"

	para "C'est dingue!"
	line "Je la veux..."

	para "<PLAY_G>, veux-tu"
	line "l'??changer?"

	para "Je peux te donner"
	line "le MULTI EXP du"
	cont "PROF.CHEN."
	done

MrPokemonText_Disappointed:
	text "C'est dommage."
	line "C'est si rare..."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "Il y a plein de"
	line "magazines"
	cont "??trangers."

	para "On ne comprend"
	line "m??me pas les"
	cont "titres."
	done

MrPokemonsHouse_BrokenComputerText:
	text "Un gros ordinateur"
	line "tout cass??..."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Un tas de pi??ces"
	line "bizarres!"

	para "Elles sont peut-"
	line "??tre d'un autre"
	cont "pays..."
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 2 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
