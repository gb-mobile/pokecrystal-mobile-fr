	object_const_def ; object_event constants
	const MOUNTMOON_SILVER

MountMoon_MapScripts:
	db 2 ; scene scripts
	scene_script .RivalEncounter ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.RivalEncounter:
	prioritysjump .RivalBattle
	end

.DummyScene:
	end

.RivalBattle:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoonSilverTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoonSilverTextWin, MountMoonSilverTextLoss
	setlasttalked MOUNTMOON_SILVER
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoonSilverTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON_SILVER, MountMoonSilverMovementAfter
	disappear MOUNTMOON_SILVER
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

MountMoonSilverMovementBefore:
	step LEFT
	step LEFT
	step LEFT
	step_end

MountMoonSilverMovementAfter:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoonSilverTextBefore:
	text "<……> <……> <……>"

	para "Cela faisait"
	line "longtemps,"
	cont "<PLAYER>."

	para "...Depuis ma"
	line "défaite j'ai"

	para "cherché l'élément"
	line "manquant à mon"
	cont "entraînement..."

	para "Et tu sais quoi?"
	line "Je l'ai trouvé!"

	para "<PLAYER>, ça va"
	line "être ta fête!"
	done

MountMoonSilverTextWin:
	text "<……> <……> <……>"

	para "Je pensais avoir"
	line "élevé mes #MON"

	para "au max de leurs"
	line "capacités..."

	para "...Mais ce n'était"
	line "pas suffisant..."
	done

MountMoonSilverTextAfter:
	text "<……> <……> <……>"

	para "...OK t'as"
	line "gagné."

	para "Mais t'excite pas:"
	line "c'est loin d'être"
	cont "la fin."

	para "Je serai le plus"
	line "grand des dres-"
	cont "seurs, tu verras."

	para "N'oublie pas: j'ai"
	line "des relations."

	para "...Ecoute <PLAYER>."

	para "Un de ces jours je"
	line "vais te prouver à"

	para "quel point je suis"
	line "meilleur que toi."
	done

MountMoonSilverTextLoss:
	text "<……> <……> <……>"

	para "Yahahaha!"
	line "Vengeance!"

	para "Avec mes #MON,"
	line "je vais battre le"

	para "CHAMPION et être"
	line "le plus grand des"
	cont "dresseurs."
	done

MountMoon_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  3,  3, ROUTE_3, 1
	warp_event 15, 15, ROUTE_4, 1
	warp_event 13,  3, MOUNT_MOON, 7
	warp_event 15, 11, MOUNT_MOON, 8
	warp_event 25,  5, MOUNT_MOON_SQUARE, 1
	warp_event 25, 15, MOUNT_MOON_SQUARE, 2
	warp_event 25,  3, MOUNT_MOON, 3
	warp_event 25, 13, MOUNT_MOON, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
