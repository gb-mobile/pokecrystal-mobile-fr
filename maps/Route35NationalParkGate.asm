	object_const_def ; object_event constants
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	buttonsound
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	buttonsound
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "On est @"
	text_ram wStringBuffer3
	text "."
	line "Ca veut dire que"

	para "le Concours de"
	line "Capture d'insecte"
	cont "est aujourd'hui."

	para "Les règles sont"
	line "simples."

	para "Avec un #MON de"
	line "l'équipe, il faut"

	para "attraper un #-"
	line "MON insecte qui"
	cont "sera noté."

	para "Alors? On tente"
	line "sa chance?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Voici des PARC"
	line "BALLS pour le"
	cont "concours."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> reçoit"
	line "20 PARC BALLS."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
	text "La personne qui"
	line "capture le #-"
	cont "MON insecte le"
	cont "plus puissant est"
	cont "désignée vain-"
	cont "queur."

	para "La partie dure"
	line "20 minutes."

	para "Si toutes les"
	line "PARC BALLS sont"
	cont "épuisées, c'est"
	cont "fini!"

	para "Le dernier #MON"
	line "attrapé peut être"
	cont "gardé."

	para "Allez hop! C'est"
	line "la chasse aux"
	cont "#MON insecte!"
	done

Route35NationalParkGateOfficer1AskToUseFirstMonText:
	text "Oh-oh..."

	para "Tu as plus d'un"
	line "#MON."

	para "Tu dois utiliser"
	line "@"
	text_ram wStringBuffer3
	text ", le"

	para "premier #MON de"
	line "ton équipe."

	para "Tu es d'accord?"
	done

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Parfait. Je vais"
	line "garder les autres"
	cont "#MON pendant le"
	cont "concours."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER> confie"
	line "ses #MON au"
	cont "RECEPTIONNISTE."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Choisis le #MON"
	line "à utiliser pendant"

	para "le concours et"
	line "viens me voir."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "OK. Et bien"
	line "à la prochaine."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh-oh..."
	line "Le premier #MON"

	para "de ton équipe ne"
	line "peut combattre."

	para "Change-le avec le"
	line "#MON de ton"

	para "choix et viens me"
	line "voir."
	done

Route35NationalParkGateOfficer1MakeRoomText:
	text "Oh-oh... Ton"
	line "équipe et ta BOITE"
	cont "PC sont pleines."

	para "Tu n'as pas de"
	line "place pour le"
	cont "#MON insecte"
	cont "à attraper."

	para "Fais de la place"
	line "dans l'équipe ou"

	para "dans la BOITE PC"
	line "et viens me voir."
	done

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh-oh... Tu as un"
	line "OEUF en premier"
	cont "dans ton équipe."

	para "Change-le avec le"
	line "#MON de ton"

	para "choix et viens me"
	line "voir."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Tu as encore @"
	text_ram wStringBuffer3
	text_start
	line "minute(s)."

	para "Veux-tu t'arrêter"
	line "maintenant?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Attends à la"
	line "Porte Nord pour"

	para "connaître le nom"
	line "des vainqueurs."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "OK. Retourne de-"
	line "hors et termine."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "Le concours d'au-"
	line "jourd'hui est ter-"

	para "miné. Reviens une"
	line "autre fois."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "Il y a des con-"
	line "cours régulière-"

	para "ment au PARC."
	line "Inscris-toi!"
	done

Route35NationalParkGateYoungsterText:
	text "C'est pour quand"
	line "le prochain Con-"
	cont "cours de Capture?"
	done

BugCatchingContestExplanationText:
	text "Le Concours de"
	line "Capture se déroule"

	para "le mardi, le jeudi"
	line "et le samedi."

	para "On peut y gagner"
	line "un prix rien qu'en"

	para "participant mais"
	line "on garde aussi le"

	para "#MON insecte"
	line "que l'on chope"

	para "pendant le con-"
	line "cours."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
