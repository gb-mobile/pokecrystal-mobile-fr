_OakText6::
	text "Heu... C'est quoi"
	line "ton nom?"
	prompt

_OakText7::
	text "<PLAYER>, ta quête"
	line "est sur le point"
	cont "de commencer."

	para "Joies et périls"
	line "paveront ta"
	cont "route..."

	para "Un monde de rêve,"
	line "de dangers et de"

	para "#MON t'attend!"
	line "En avant!"

	para "..."
	line "A plus tard."
	done

UnknownText_0x1c40e6::
	text "L'horloge est"
	line "peut-être fausse."

	para "Régler l'heure"
	line "s.v.p."
	prompt

UnknownText_0x1c411c::
	text "Régler avec la"
	line "manette."

	para "Choix:   Bouton A"
	line "Retour:  Bouton B"
	done

UnknownText_0x1c415b::
	text "OK?"
	done

UnknownText_0x1c4168::
	text "L'horloge a été"
	line "réinitialisée."
	done

UnknownText_0x1c4183::
	text "Trop de temps"
	line "s'est écoulé."
	cont "Essayer à nouveau."
	prompt

UnknownText_0x1c41b1::
	text "Vous ne pourrez"
	line "pas combattre si"
	cont "vous échangez ce"
	cont "#MON."
	prompt

UnknownText_0x1c41e6::
	text "Le @"
	text_ram wStringBuffer1
	text_start
	line "de votre ami(e) a"
	cont "l'air bizarre!"
	prompt

UnknownText_0x1c4212::
	text_ram wd004
	text_start
	line "contre @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Voulez-vous sauve-"
	line "garder la partie?"
	done

UnknownText_0x1c456d::
	text "SAUVEGARDE..."
	line "NE PAS ETEINDRE."
	done

UnknownText_0x1c4590::
	text "<PLAYER> sauve"
	line "la partie."
	done

UnknownText_0x1c45a3::
	text "Il y a déjà une"
	line "sauvegarde. La"
	cont "remplacer?"
	done

UnknownText_0x1c45d9::
	text "Il y a une autre"
	line "sauvegarde. La"
	cont "remplacer?"
	done

UnknownText_0x1c460d::
	text "La sauvegarde"
	line "est corrompue!"
	prompt

UnknownText_0x1c462a::
	text "En changeant de"
	line "BOITE #MON,"
	cont "les données sont"
	cont "sauvegardées. OK?"
	done

UnknownText_0x1c465f::
	text "A chaque déplace-"
	line "ment de #MON,"
	cont "les données sont"
	cont "sauvegardées. OK?"
	done

UnknownText_0x1c4693::
	text "L'espace de sauve-"
	line "garde est dépassé."
	done

UnknownText_0x1c46b7::
	text "Pas de fenêtre"
	line "pour apparition."
	done

UnknownText_0x1c46dc::
	text "Cas corrompu!"
	prompt

_ObjectEventText::
	text "Cas objet."
	done

UnknownText_0x1c46fc::
	text "Cas BG"
	done

UnknownText_0x1c4706::
	text "Cas coordonnées"
	done

UnknownText_0x1c4719::
	text "<PLAYER> reçoit"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> met"
	line "@"
	text_ram wStringBuffer1
	text " dans"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text_ram wStringBuffer3
	text ":"
	line "complet!"
	prompt

UnknownText_0x1c475f::
	text "Je sais tout."
	line "Je vois tout."

	para "Je sais tout de"
	line "tes #MON!"
	done

UnknownText_0x1c4797::
	text "Hein? Je n'arrive"
	line "pas à voir!"

	para "Comment ça se fait"
	line "tout ça?"
	done

UnknownText_0x1c47d4::
	text "Hmm... Tu as vu"
	line "@"
	text_ram wSeerNickname
	text " ici:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "Il était"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Son niveau: @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Magie!"
	prompt

UnknownText_0x1c4837::
	text "Hmm... @"
	text_ram wSeerNickname
	text_start
	line "vient de @"
	text_ram wSeerOTName
	text_start
	cont "et d'un échange?"

	para "A @"
	text_ram wSeerCaughtLocation
	text ","
	line "@"
	text_ram wSeerOTName
	text_start
	cont "a vu @"
	text_ram wSeerNickname
	text "!"
	prompt

UnknownText_0x1c487f::
	text "Quoi!? Incroyable!"

	para "Je comprends pas"
	line "trop pourquoi mais"

	para "c'est incroyable!"
	line "Tu as quelque"
	cont "chose de spécial."

	para "Je ne sais pas où"
	line "tu l'as vu mais"
	cont "c'était au niveau"
	cont "@"
	text_ram wSeerCaughtLevelString
	text "."

	para "Pas mal, non?"
	prompt

UnknownText_0x1c491d::
	text "Hé!"

	para "C'est un OEUF!"

	para "On ne peut encore"
	line "rien dire dessus."
	done

UnknownText_0x1c4955::
	text "Pfff! Je savais"
	line "que t'allais dire"
	cont "ça!"
	done

UnknownText_0x1c497a::
	text "Dis donc..."

	para "Il serait sage de"
	line "prendre plus soin"
	cont "de tes #MON."
	done

UnknownText_0x1c49c6::
	text "Dis donc..."

	para "Il a l'air d'avoir"
	line "grandi."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble avoir"
	cont "confiance en lui."
	done

UnknownText_0x1c4a21::
	text "Dis donc..."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble être"
	cont "plus fort."
	done

UnknownText_0x1c4a5b::
	text "Dis donc..."

	para "Il a l'air d'avoir"
	line "pris du muscle."

	para "@"
	text_ram wSeerNickname
	text_start
	line "semble avoir"
	cont "confiance en lui."
	cont "Il a dû gagner"
	cont "plein de combats!"
	done

UnknownText_0x1c4ae5::
	text "Dis donc..."

	para "Tes efforts"
	line "m'impressionnent."

	para "Cela faisait long-"
	line "temps que je n'a-"

	para "vais pas vu un"
	line "#MON aussi fort"
	cont "que ce @"
	text_ram wSeerNickname
	text "."

	para "Le voir en combat"
	line "doit être plutôt"
	cont "impressionnant."
	done

UnknownText_0x1c4b92::
	text "Félicitations!"
	line "Votre @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "évolue en"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Hein? @"
	text_ram wStringBuffer2
	text_start
	line "n'évolue plus!"
	prompt

UnknownText_0x1c4be3::
	text "Quoi? @"
	text_ram wStringBuffer2
	text_start
	line "évolue!"
	done

UnknownText_0x1c4bfd::
	text "Combien?"
	done

UnknownText_0x1c4c08::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "pour @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4c28::
	text "Bonjour toi."

	para "Je vends des"
	line "herbes médicinales"
	cont "à bon marché."

	para "C'est bien bon"
	line "mais un peu amer."

	para "Ton #MON ne va"
	line "peut-être pas"
	cont "aimer."

	para "Héhéhéhéhé..."
	done

UnknownText_0x1c4ca3::
	text "Combien?"
	done

UnknownText_0x1c4cae::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "pour @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4cce::
	text "Merci."
	line "Héhéhéhéhé..."
	done

UnknownText_0x1c4cea::
	text "Ton SAC est"
	line "plein."
	done

UnknownText_0x1c4d08::
	text "Pas assez de sous!"
	line "Héhéhéhéhéhé!"
	done

UnknownText_0x1c4d2a::
	text "A bientôt!"
	line "Héhéhéhéhéhé..."
	done

UnknownText_0x1c4d47::
	text "Salut! Tu cherches"
	line "une bonne affaire?"

	para "Je vends des ob-"
	line "jets super rares!"

	para "Et un de chaque"
	line "type..."
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text " coûte"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥. Tu veux?"
	done

UnknownText_0x1c4dcd::
	text "Merci."
	done

UnknownText_0x1c4dd6::
	text "Oh! Ton SAC"
	line "est super plein."
	done

UnknownText_0x1c4df7::
	text "Tu as déjà acheté"
	line "ça. J'en ai"
	cont "plus du tout."
	done

UnknownText_0x1c4e28::
	text "Oh! T'as super"
	line "pas de sous."
	done

UnknownText_0x1c4e46::
	text "Reviens plus"
	line "tard."
	done

UnknownText_0x1c4e5f::
	text "Oui? Besoin d'un"
	line "médicament?"
	done

UnknownText_0x1c4e7e::
	text "Combien?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text_start
	line "ça fait @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4eab::
	text "Merci, merci!"
	done

UnknownText_0x1c4eb9::
	text "Tu n'as plus de"
	line "place."
	done

UnknownText_0x1c4ed8::
	text "Hein? C'est pas"
	line "assez."
	done

UnknownText_0x1c4ef6::
	text "Très bien. A la"
	line "prochaine."
	done

UnknownText_0x1c4f12::
	text "Tu n'as rien"
	line "à vendre."
	prompt

UnknownText_0x1c4f33::
	text "Combien?"
	done

UnknownText_0x1c4f3e::
	text "J'peux t'en donner"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥."

	para "Ca te va?"
	done

UnknownText_0x1c4f62::
	text "Bienvenue! En quoi"
	line "puis-je t'aider?"
	done

UnknownText_0x1c4f80::
	text "Voilà."
	line "Merci!"
	done

UnknownText_0x1c4f9a::
	text "Vous n'avez pas"
	line "assez de sous."
	done

UnknownText_0x1c4fb7::
	text "Tu ne peux plus"
	line "rien porter."
	done

UnknownText_0x1c4fd7::
	text "Je ne peux pas"
	line "t'acheter ça."
	prompt

UnknownText_0x1c4ff9::
	text "A la prochaine!"
	done

UnknownText_0x1c500d::
	text "As-tu besoin"
	line "d'autre chose?"
	done

UnknownText_0x1c502e::
	text "Reçu: @"
	text_decimal hMoneyTemp, 3, 6
	text "¥"
	line "pour @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5049::
	text "Combien"
	line "de jetons?"
	done

UnknownText_0x1c505e::
	text "C'est parti!"
	done

UnknownText_0x1c5066::
	text "Pas assez de"
	line "jetons."
	prompt

UnknownText_0x1c5079::
	text "Zut... plus de"
	line "jetons..."
	done

UnknownText_0x1c5092::
	text "Jouer encore?"
	done

UnknownText_0x1c509f::
	text "en ligne!"
	line "@"
	text_ram wStringBuffer2
	text " jetons!"
	done

UnknownText_0x1c50bb::
	text "Et zut!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

UnknownText_0x1c5182::
	text "Heure inconnue"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Pick three #MON"
	line "for battle."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

UnknownText_0x1c521c::
	text "Only three #MON"
	line "may enter."
	prompt

UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "Hein? Pardon!"
	line "Mauvais numéro!"
	done

UnknownText_0x1c5580::
	text "Clic!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "Ce numéro est hors"
	line "de la zone."
	done

UnknownText_0x1c55ac::
	text "Va parler à cette"
	line "personne!"
	done

UnknownText_0x1c55ca::
	text "Merci!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Mot de passe OK."
	line "Choisir CONTINUER"
	cont "& réinitialiser"
	cont "les paramètres."
	prompt

UnknownText_0x1c560b::
	text "Mauvais mot de"
	line "passe!"
	prompt

UnknownText_0x1c561c::
	text "Réinitialiser"
	line "l'horloge?"
	done

UnknownText_0x1c562e::
	text "Entrer le mot de"
	line "passe."
	done

UnknownText_0x1c564a::
	text "Effacer zone de"
	line "sauvegarde?"
	done

UnknownText_0x1c5660::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5678::
	text "Oublier quelle"
	next "capacité?"
	done

UnknownText_0x1c5699::
	text "Arrêter d'appren-"
	line "dre @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "n'a pas appris"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tente d'apprendre"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Mais @"
	text_ram wMonOrItemNameBuffer
	text " ne"
	line "peut pas apprendre"
	cont "plus de quatre"
	cont "capacités."

	para "Effacer une"
	line "ancienne capacité"
	cont "pour @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 et...@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text "Tadaa!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " oublie"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Et..."
	prompt

UnknownText_0x1c5772::
	text "Les capacités des"
	line "CS ne peuvent être"
	cont "oubliées."
	prompt

UnknownText_0x1c5793::
	text "Jouer avec 3"
	line "jetons?"
	done

UnknownText_0x1c57ab::
	text "Pas assez de"
	line "jetons."
	prompt

UnknownText_0x1c57be::
	text "Choisir une carte."
	done

UnknownText_0x1c57ce::
	text "Parier..."
	done

UnknownText_0x1c57df::
	text "Jouer à nouveau?"
	done

UnknownText_0x1c57f4::
	text "Les cartes ont été"
	line "mélangées."
	prompt

UnknownText_0x1c5813::
	text "Ouais!"
	done

UnknownText_0x1c581a::
	text "Zut..."
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "Vous êtes en"
	line "dehors du réseau."
	prompt

UnknownText_0x1c5847::
	text "Qui voulez-vous"
	line "appeler?"
	done

UnknownText_0x1c5862::
	text "Presser un bouton"
	line "pour sortir."
	done

UnknownText_0x1c587d::
	text "Effacer ce numéro"
	line "enregistré?"
	done

UnknownText_0x1c589f::
	text "Quel prix?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "C'est ça?"
	done

UnknownText_0x1c58d1::
	text "Voilà!"
	done

UnknownText_0x1c58e0::
	text "Vous n'avez pas"
	line "assez de points."
	done

UnknownText_0x1c58ff::
	text "Vous n'avez pas"
	line "de place."
	done

UnknownText_0x1c591a::
	text "Oh. Revenez"
	line "plus tard!"
	done

UnknownText_0x1c5937::
	text "Excusez-moi!"
	done

Text_ExcuseMeYoureNotReady::
	text "Pardon mais..."
	line "Vous n'êtes pas"
	cont "prêt(e)."

	para ""
	done

UnknownText_0x1c5962::
	text "Revenez une fois"
	line "prêt(e)."
	done

_NeedAtLeastThreeMonText::
	text "Il vous faut au"
	line "moins 3 #MON."
	done

_EggDoesNotQualifyText::
	text "Un OEUF ne peut"
	line "être inscrit."
	done

_OnlyThreeMonMayBeEnteredText::
	text "Seuls 3 #MON"
	line "peuvent être"
	cont "enregistrés."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "Les @"
	text_ram wStringBuffer2
	text " #MON"
	line "doivent être de"
	cont "types différents."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "Les @"
	text_ram wStringBuffer2
	text " #MON"
	line "ne doivent pas"
	cont "tenir les mêmes"
	cont "objets."

	para ""
	done

_YouCantTakeAnEggText::
	text "On ne peut pas"
	line "prendre d'OEUF!"
	done

UnknownText_0x1c5a5a::
	text "Il a évité la"
	line "BALL!"

	para "Ce #MON ne se"
	line "laisse pas faire!"
	prompt

UnknownText_0x1c5a90::
	text "Vous manquez le"
	line "#MON!"
	prompt

UnknownText_0x1c5aa6::
	text "Oh non! Le #MON"
	line "s'est libéré!"
	prompt

UnknownText_0x1c5ac3::
	text "Raaah! Ca y était"
	line "presque!"
	prompt

UnknownText_0x1c5ae3::
	text "Aaaaaah!"
	line "Presque!"
	prompt

UnknownText_0x1c5afa::
	text "Mince! Ca y était"
	line "presque!"
	prompt

UnknownText_0x1c5b17::
	text "Et hop! @"
	text_ram wEnemyMonNick
	text_start
	line "est attrapé!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text " est en-"
	line "voyé au PC de LEO."
	prompt

UnknownText_0x1c5b53::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "Donner un surnom"
	line "à @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_ram wStringBuffer2
	text " de"
	line "@"
	text_ram wStringBuffer1
	text " monte."
	prompt

UnknownText_0x1c5bac::
	text "Inutilisable sur"
	line "ce #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "Le REPOUSSE utili-"
	line "sé auparavant est"
	cont "toujours effectif."
	prompt

UnknownText_0x1c5bf9::
	text "Vous jouez de la"
	line "#FLUTE."

	para "Ouais..."
	line "Super musique!"
	prompt

UnknownText_0x1c5c28::
	text "Tous les #MON"
	line "endormis se"
	cont "réveillent."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> joue de la"
	line "#FLUTE.@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5c5e::
	text "Vous avez"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

UnknownText_0x1c5c7b::
	text "Jetons:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Monter les PP de"
	line "quelle capacité?"
	done

Text_RestoreThePPOfWhichMove::
	text "Restaurer PP de"
	line "quelle capacité?"
	done

Text_PPIsMaxedOut::
	text "PP de @"
	text_ram wStringBuffer2
	text_start
	line "au max."
	prompt

Text_PPsIncreased::
	text "PP de @"
	text_ram wStringBuffer2
	text_start
	line "augmentés."
	prompt

UnknownText_0x1c5cf1::
	text "PP restaurés."
	prompt

UnknownText_0x1c5d03::
	text "Il y a un trophée"
	line "à l'intérieur!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " envoie"
	line "le trophée à la"
	cont "maison."
	prompt

UnknownText_0x1c5d3e::
	text "Ca a l'air amer..."
	prompt

UnknownText_0x1c5d50::
	text "C'est inutilisable"
	line "sur un OEUF."
	prompt

UnknownText_0x1c5d6e::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

UnknownText_0x1c5d97::
	text "Ca appartient à"
	line "quelqu'un d'autre!"
	prompt

UnknownText_0x1c5db6::
	text "Ca n'a aucun"
	line "effet."
	prompt

UnknownText_0x1c5dd0::
	text "Le dresseur"
	line "détourne la BALL!"
	prompt

UnknownText_0x1c5def::
	text "Voler c'est mal!"
	prompt

UnknownText_0x1c5e01::
	text "Faire du vélo est"
	line "interdit ici."
	prompt

UnknownText_0x1c5e1d::
	text "Impossible de"
	line "monter sur votre"
	cont "@"
	text_ram wStringBuffer1
	text " ici."
	prompt

UnknownText_0x1c5e3a::
	text "La BOITE #MON"
	line "est pleine. C'est"
	cont "inutilisable pour"
	cont "l'instant."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> utilise:@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text " connaît"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "Ce #MON ne"
	line "connaît qu'une"
	cont "seule capacité."
	done

UnknownText_0x1c5eda::
	text "Lui faire oublier"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Le #MON a ou-"
	line "blié la capacité!"
	done

UnknownText_0x1c5f17::
	text "Un OEUF n'a pas de"
	line "capacité!"
	done

UnknownText_0x1c5f36::
	text "Ah?"
	line "A la prochaine."
	done

UnknownText_0x1c5f50::
	text "Quelle capacité"
	line "doit-il oublier?"
	prompt

UnknownText_0x1c5f74::
	text "Et oui! Moi j'suis"
	line "le TYPE QUI EFFACE"
	cont "LES CAPACITES!!!"

	para "Je peux persuader"
	line "les #MON"
	cont "d'oublier leurs"
	cont "capacités."

	para "Dois-je m'occuper"
	line "de l'un de tes"
	cont "#MON?"
	done

UnknownText_0x1c5fd1::
	text "Quel #MON?"
	prompt

Text_DSTIsThatOK::
	text_start
	line "OK?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "OK?"
	done

UnknownText_0x1c6000::
	text "Veux-tu"
	line "modifier l'heure?"
	done

UnknownText_0x1c6030::
	text "J'avance la"
	line "montre d'une"
	cont "heure."
	prompt

UnknownText_0x1c6056::
	text "Le changement"
	line "d'heure est-il"
	cont "fini?"
	done

UnknownText_0x1c6075::
	text "Je recule la"
	line "montre d'une"
	cont "heure."
	prompt

UnknownText_0x1c6095::
	text "Veux-tu"
	line "ajuster la"

	para "montre au change-"
	line "ment d'heure?"
	done

UnknownText_0x1c60d1::
	text "J'ai perdu la"
	line "notice du"
	cont "#MATOS."
	cont "Reviens plus tard."
	prompt
