	object_const_def ; object_event constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	prioritysjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	buttonsound
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	buttonsound
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	buttonsound
	writetext ElmAfterTheftText5
	buttonsound
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	buttonsound
	writetext ShowElmTogepiText3
	buttonsound
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	buttonsound
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	buttonsound
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ORME: <PLAY_G>!"
	line "Te voil??!"

	para "J'ai un service ??"
	line "te demander."

	para "Je fais de nouvel-"
	line "les recherches sur"

	para "les #MON et il"
	line "y a certains ??l??-"

	para "ments qui me"
	line "manquent."

	para "Vois-tu..."

	para "J'??cris un article"
	line "pour une grande"
	cont "conf??rence."

	para "Mais certains"
	line "points restent"
	cont "myst??rieux."

	para "Donc!"

	para "J'aimerais que tu"
	line "entra??nes un de"

	para "mes nouveaux"
	line "#MON."
	done

ElmText_Accepted:
	text "Merci, <PLAY_G>!"

	para "Tu es chic!"
	done

ElmText_Refused:
	text "Mais..."
	line "J'en ai besoin!"
	done

ElmText_ResearchAmbitions:
	text "Mes recherches"
	line "termin??es, nous"

	para "en saurons un peu"
	line "plus sur le myst??-"
	cont "re des #MON."

	para "Et ??a c'est pas"
	line "rien!"
	done

ElmText_GotAnEmail:
	text "Oh! J'ai re??u un"
	line "e-mail!"

	para "<??????><??????><??????>"
	line "Hmm??? Oui???"

	para "OK???"
	done

ElmText_MissionFromMrPokemon:
	text "Ecoute voir."

	para "J'ai un ami du nom"
	line "de M.#MON."

	para "Il d??couvre sans"
	line "cesse de dr??les"
	cont "de trucs."

	para "Il vient de m'en-"
	line "voyer un e-mail"

	para "disant qu'il a"
	line "quelque chose ?? me"
	cont "montrer."

	para "C'est tentant mais"
	line "j'ai vraiment trop"
	cont "de travail..."

	para "Attends!"

	para "Je sais!"

	para "<PLAY_G>, peux-tu"
	line "y aller pour moi?"
	done

ElmText_ChooseAPokemon:
	text "Je veux que tu"
	line "entra??nes l'un"

	para "des #MON dans"
	line "ces BALLS."

	para "Il sera ton"
	line "nouvel ami,"
	cont "<PLAY_G>!"

	para "Allez! Choisis!"
	done

ElmText_LetYourMonBattleIt:
	text "Si un #MON"
	line "sauvage appara??t,"
	cont "d??fie-le avec ton"
	cont "#MON ador??!"
	done

LabWhereGoingText:
	text "PROF.ORME: Hep!"
	line "O?? vas-tu?"
	done

TakeCyndaquilText:
	text "PROF.ORME: Veux-tu"
	line "HERICENDRE, le"
	cont "#MON de feu?"
	done

TakeTotodileText:
	text "PROF.ORME: Veux-tu"
	line "KAIMINUS, le"
	cont "#MON d'eau?"
	done

TakeChikoritaText:
	text "PROF.ORME: Veux-tu"
	line "GERMIGNON, le"
	cont "#MON plante?"
	done

DidntChooseStarterText:
	text "PROF.ORME: Fais le"
	line "bon choix!"

	para "Ton partenaire est"
	line "tr??s important."
	done

ChoseStarterText:
	text "PROF.ORME: C'est"
	line "un tr??s bon"
	cont "#MON!"
	done

ReceivedStarterText:
	text "<PLAYER> re??oit"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "M.#MON vit"
	line "apr??s VILLE"

	para "GRIOTTE, la"
	line "ville voisine."

	para "C'est tout droit."
	line "Tu ne peux pas te"
	cont "perdre."

	para "Mais on ne sait"
	line "jamais: prends mon"

	para "No. de t??l??phone."
	line "Appelle-moi s'il"
	cont "arrive un truc!"
	done

ElmDirectionsText2:
	text "Si ton #MON est"
	line "bless??, soigne-le"

	para "avec cette jolie"
	line "machine."

	para "Utilise-la quand"
	line "tu veux."
	done

ElmDirectionsText3:
	text "<PLAY_G>, je"
	line "compte sur toi!"
	done

GotElmsNumberText:
	text "<PLAYER> re??oit le"
	line "num??ro de t??l. du"
	cont "PROF.ORME."
	done

ElmDescribesMrPokemonText:
	text "M.#MON fouille"
	line "un peu partout et"
	cont "trouve des bizar-"
	cont "reries."

	para "Mais la plupart du"
	line "temps ??a ne sert ??"
	cont "rien..."
	done

ElmPokeBallText:
	text "Cela contient un"
	line "#MON attrap??"
	cont "par le PROF.ORME."
	done

ElmsLabHealingMachineText1:
	text "Je me demande ??"
	line "quoi ??a sert..."
	done

ElmsLabHealingMachineText2:
	text "Voulez-vous soi-"
	line "gner vos #MON?"
	done

ElmAfterTheftText1:
	text "ORME: <PLAY_G>,"
	line "c'est affreux..."

	para "Au fait, quelle"
	line "est la grande"
	cont "d??couverte de"
	cont "M.#MON?"
	done

ElmAfterTheftText2:
	text "<PLAYER> confie"
	line "l'OEUF MYSTERE au"
	cont "PROF.ORME."
	done

ElmAfterTheftText3:
	text "PROF.ORME: Ca?"
	done

ElmAfterTheftText4:
	text "Mais... C'est un"
	line "OEUF de #MON?"

	para "Si c'est un vrai,"
	line "c'est une grande"
	cont "d??couverte!"
	done

ElmAfterTheftText5:
	text "ORME: Quoi?!?"

	para "Le PROF.CHEN t'a"
	line "donn?? un #DEX?"

	para "<PLAY_G>, c'est"
	line "vrai? C-c'est"
	cont "incroyable!"

	para "Il a l'oeil pour"
	line "trouver les bons"
	cont "dresseurs pleins"
	cont "d'avenir."

	para "<PLAY_G>..."
	line "Tu dois avoir les"

	para "??paules pour ??tre"
	line "MAITRE."

	para "Tu as aussi l'air"
	line "de bien t'entendre"
	cont "avec les #MON."

	para "Tu devrais te lan-"
	line "cer ?? la conqu??te"
	cont "des ARENES."

	para "La plus proche est"
	line "celle de MAUVILLE."
	done

ElmAfterTheftText6:
	text "...<PLAY_G>."
	line "La route vers la"

	para "victoire est"
	line "longue."

	para "Va parler ?? ta"
	line "maman avant de"
	cont "partir."
	done

ElmStudyingEggText:
	text "PROF.ORME: N'aban-"
	line "donne pas!"

	para "Je t'appelle si"
	line "j'ai du nouveau"
	cont "sur cet OEUF."
	done

ElmAideHasEggText:
	text "ORME: <PLAY_G>?"
	line "N'as-tu pas vu"
	cont "mon assistant?"

	para "Il aurait d?? te"
	line "rencontrer avec"

	para "l'OEUF au CENTRE"
	line "#MON de"
	cont "MAUVILLE."

	para "Tu as d?? le rater."
	line "Va le voir l??-bas."
	done

ElmWaitingEggHatchText:
	text "ORME:"
	line "L'OEUF a-t-il"
	cont "??volu???"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Je"
	line "croyais que l'OEUF"
	cont "avait ??clos."

	para "O?? est le"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ORME: <PLAY_G>, tu"
	line "es en pleine"
	cont "forme!"
	done

ShowElmTogepiText2:
	text "Quoi?"
	line "Ce #MON!?!"
	done

ShowElmTogepiText3:
	text "L'OEUF a ??clos!"
	line "Donc les #MON"
	cont "naissent ?? partir"
	cont "d'OEUFS..."

	para "Mais ce n'est"
	line "peut-??tre pas le"
	cont "cas pour tous les"
	cont "#MON."

	para "Et beh, on a"
	line "encore du boulot"
	cont "avant de tout"
	cont "savoir."
	done

ElmGiveEverstoneText1:
	text "Merci, <PLAY_G>!"
	line "Tu aides mes"

	para "recherches sur les"
	line "#MON!"

	para "Voil?? pour toi!"
	line "Cadeau!"
	done

ElmGiveEverstoneText2:
	text "C'est une"
	line "PIERRE STASE."

	para "Certaines esp??ces"
	line "de #MON ??vo-"

	para "luent lorsqu'elles"
	line "atteignent un"
	cont "certain niveau."

	para "Un #MON tenant"
	line "une PIERRE STASE"
	cont "n'??voluera pas."

	para "Donne-la ?? un"
	line "#MON que tu"
	cont "ne veux pas faire"
	cont "??voluer."
	done

ElmText_CallYou:
	text "ORME: <PLAY_G>, je"
	line "t'appelle si j'ai"
	cont "du nouveau."
	done

AideText_AfterTheft:
	text "...(soupir)..."
	line "Ce #MON vol??..."

	para "Je me demande"
	line "comment il va."

	para "On dit qu'un"
	line "#MON ??lev?? par"

	para "un m??chant p'tit"
	line "bonhomme tourne"
	cont "mal lui aussi."
	done

ElmGiveMasterBallText1:
	text "Merci, <PLAY_G>!"
	line "Tu aides mes"

	para "recherches sur les"
	line "#MON!"

	para "Voil?? pour toi!"
	line "Cadeau!"
	done

ElmGiveMasterBallText2:
	text "Cette MASTER BALL"
	line "est la meilleure"
	cont "des BALLS!"

	para "Elle attrape"
	line "n'importe quel"

	para "#MON ?? tous"
	line "les coups."

	para "On ne la donne"
	line "qu'aux grands"
	cont "chercheurs"
	cont "#MON."

	para "Tu l'utiliseras"
	line "mieux que moi,"
	cont "<PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ORME: <PLAY_G>!"
	line "Te voil??!"

	para "J'ai quelque chose"
	line "pour toi."

	para "C'est un..."
	line "PASSE BATEAU!"

	para "Tu peux aller"
	line "attraper des #-"
	cont "MON ?? KANTO."
	done

ElmGiveTicketText2:
	text "Le bateau part"
	line "d'OLIVILLE."

	para "Mais ??a tu le sais"
	line "d??j??, <PLAY_G>."

	para "Apr??s tout, tu as"
	line "d??j?? bien"
	cont "voyag??."

	para "Dis bonjour au"
	line "PROF.CHEN ?? KANTO"
	cont "pour moi!"
	done

ElmsLabSignpostText_Egg:
	text "C'est l'OEUF de"
	line "#MON que le"
	cont "PROF.ORME ??tait en"
	cont "train d'??tudier."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, prends"
	line "ceci pour ta"
	cont "mission."
	done

AideText_AlwaysBusy:
	text "On est seulement"
	line "deux, alors on est"
	cont "toujours occup??."
	done

AideText_TheftTestimony:
	text "Il y avait du"
	line "vacarme dehors..."

	para "Lorsque je suis"
	line "all?? jeter un"
	cont "oeil, on avait"
	cont "vol?? un #MON."

	para "C'est impensable,"
	line "il faut vraiment"
	cont "ne pas avoir de"
	cont "coeur pour faire"
	cont "une telle chose!"

	para "...(soupir)..."
	line "Ce #MON vol??."

	para "Je me demande"
	line "comment il va."

	para "On dit que les"
	line "#MON ??lev??s"

	para "par un m??chant de-"
	line "viennent mauvais."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>!"

	para "Utilise ceci pour"
	line "compl??ter ton"
	cont "#DEX!"
	done

AideText_ExplainBalls:
	text "Pour compl??ter ton"
	line "#DEX, tu"
	cont "dois attraper des"
	cont "#MON."

	para "Lance des"
	line "# BALLS sur"
	cont "les #MON"
	cont "sauvages pour les"
	cont "attraper."
	done

ElmsLabOfficerText1:
	text "J'ai entendu dire"
	line "qu'un #MON"
	cont "a ??t?? vol?? ici..."

	para "Je viens de rece-"
	line "voir des infos"
	cont "du PROF.ORME."

	para "Apparemment,"
	line "c'??tait un jeune"
	cont "garnement aux"
	cont "longs cheveux"
	cont "rouges..."
	cont "Racaille-racaille!"

	para "Quuooi?"

	para "Tu as combattu un"
	line "dresseur comme ??a?"

	para "As-tu retenu"
	line "son nom?"
	done

ElmsLabOfficerText2:
	text "Il s'appelait"
	line "donc <RIVAL>."

	para "Merci pour ta"
	line "coop??ration!"
	done

ElmsLabWindowText1:
	text "La fen??tre est"
	line "ouverte."

	para "Un filet d'air"
	line "passe."
	done

ElmsLabWindowText2:
	text "Il a d??boul?? ici!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> ouvre un"
	line "livre."

	para "Astuce Voyage 1:"

	para "Appuyez sur START"
	line "pour ouvrir le"
	cont "MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> ouvre le"
	line "livre."

	para "Astuce Voyage 2:"

	para "Enregistrez votre"
	line "p??riple avec"
	cont "SAUVER!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> ouvre le"
	line "livre."

	para "Astuce Voyage 3:"

	para "Ouvrez votre SAC"
	line "et appuyez sur"
	cont "SELECT pour d??-"
	cont "placer les objets."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> ouvre le"
	line "livre."

	para "Astuce Voyage 4:"

	para "Voir les capacit??s"
	line "des #MON."
	cont "Appuyez sur le"
	cont "bouton A pour"
	cont "d??placer les"
	cont "capacit??s."
	done

ElmsLabTrashcanText:
	text "Il y a le papier"
	line "d'emballage du"
	cont "sandwich du PROF."
	done

ElmsLabPCText:
	text "OBSERVATIONS SUR"
	line "L'EVOLUTION DES"
	cont "#MON"

	para "...C'est ce qu'il"
	line "y a sur l'??cran..."
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 8 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
