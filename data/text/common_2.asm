UnknownText_0x1c0000::
	text "Pas de photo?"
	line "A plus tard!"
	done

UnknownText_0x1c0021::
	text "Un OEUF? Je peux"
	line "pas faire de l'art"
	cont "avec ça..."
	done

UnknownText_0x1c0043::
	text "B'jour! Je suis le"
	line "SPECIALISTE des"

	para "NOMS. Je donne mon"
	line "avis sur les noms"
	cont "des #MON."

	para "Veux-tu que je te"
	line "donne mon avis sur"
	cont "tes noms?"
	done

UnknownText_0x1c00a0::
	text "Le nom de quel"
	line "#MON veux-tu"
	cont "que j'étudie?"
	prompt

UnknownText_0x1c00cd::
	text "Hmm... @"
	text_ram wStringBuffer1
	text "."
	line "C'est un nom"
	cont "ma foi correct."

	para "Mais pourquoi ne"
	line "pas lui donner"
	cont "plus de pêche?"

	para "Veux-tu lui donner"
	line "un autre nom?"
	done

UnknownText_0x1c0142::
	text "OK. Comment"
	line "allons-nous le"
	cont "nommer?"
	prompt

UnknownText_0x1c0171::
	text "C'est bien mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

UnknownText_0x1c019e::
	text "OK. Reviens une"
	line "autre fois."
	done

UnknownText_0x1c01be::
	text "Hmm... @"
	text_ram wStringBuffer1
	text "?"
	line "C'est un super"
	cont "nom! Terrible!"

	para "Prends bien soin"
	line "de @"
	text_ram wStringBuffer1
	text "."
	done

UnknownText_0x1c0208::
	text "Whoa! C'est juste"
	line "un OEUF."
	done

UnknownText_0x1c0222::
	text "Ca ressemble un"
	line "peu à l'ancien..."

	para "Mais c'est mieux"
	line "qu'avant!"

	para "Bien joué!"
	done

UnknownText_0x1c0272::
	text "Parfait. Ce"
	line "#MON s'appelle"
	cont "donc @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gagne@"
	text_end

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "un bonus de"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " Points EXP!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Points EXP!"
	prompt

Text_GoMon::
	text_ram wBattleMonNick
	text "! Go!@"

Text_DoItMon::
	text_ram wBattleMonNick
	text "! Fonce!@"

Text_GoForItMon::
	text "En avant,"
	line "@"
	text_ram wBattleMonNick
	text "!@"

Text_YourFoesWeakGetmMon::
	text "Attaque,"
	line "@"
	text_ram wBattleMonNick
	text "!@"

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@"
	text_end

Text_ThatsEnoughComeBack::
	text "reviens!@"
	text_end

Text_OKComeBack::
	text "ça suffit!@"
	text_end

Text_GoodComeBack::
	text "reviens!@"
	text_end

Text_ComeBack::
	text "reviens!@"
	text_end
	done

UnknownText_0x1c0373::
	text "CT activée."
	prompt

UnknownText_0x1c0384::
	text "CS activée."
	prompt

UnknownText_0x1c0396::
	text "Elle contient"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Apprendre"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "à un #MON?"
	done

UnknownText_0x1c03c2::
	text_ram wStringBuffer2
	text " n'est"
	line "pas compatible"
	cont "avec @"
	text_ram wStringBuffer1
	text "."

	para "Il ne peut pas"
	line "apprendre"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "Plus de place"
	line "pour:"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0421::
	text "Vous obtenez"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "La connexion a"
	line "été perdue."
	prompt

UnknownText_0x1c0454::
	text "Erreur"
	line "communication."
	prompt

UnknownText_0x1c046a::
	text "CADEAU à récupérer"
	line "au CENTRE #MON."
	prompt

UnknownText_0x1c048e::
	text "Votre ami(e) n'est"
	line "pas prêt(e)."
	prompt

UnknownText_0x1c04a7::
	text "Seulement 5"
	line "CADEAUX par jour."
	prompt

UnknownText_0x1c04c6::
	text "Seulement 1 CADEAU"
	line "par jour et par"
	cont "personne."
	prompt

UnknownText_0x1c04e9::
	text_ram wMysteryGiftPartnerName
	text " envoie"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_ram wMysteryGiftPartnerName
	text " envoie"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "chez @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

UnknownText_0x1c051a::
	text "Received"
	line "@"
	text_ram wc850
	text "'s CARD."
	prompt

UnknownText_0x1c0531::
	text_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "The CARD was not"
	line "registered."
	prompt

UnknownText_0x1c0573::
	text "La connexion a"
	line "été perdue."
	prompt

UnknownText_0x1c0591::
	text "Erreur"
	line "communication."
	prompt

_BadgeRequiredText::
	text "Un BADGE est"
	line "requis."
	prompt

UnknownText_0x1c05c8::
	text "Impossible d'uti-"
	line "liser ça ici."
	prompt

UnknownText_0x1c05dd::
	text_ram wStringBuffer2
	text_start
	line "lance COUPE!"
	prompt

UnknownText_0x1c05ec::
	text "Il n'y a rien"
	line "à COUPER ici."
	prompt

UnknownText_0x1c0609::
	text "Un FLASH illumine"
	line "les environs!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text_ram wStringBuffer2
	text_start
	line "lance SURF!"
	done

_CantSurfText::
	text "On ne peut pas"
	line "SURFER ici."
	prompt

_AlreadySurfingText::
	text "Vous êtes déjà en"
	line "train de SURFER!"
	prompt

_AskSurfText::
	text "L'eau est calme..."
	line "Un coup de SURF?"
	done

UnknownText_0x1c068e::
	text_ram wStringBuffer2
	text_start
	line "lance CASCADE!"
	done

UnknownText_0x1c06a3::
	text "Oh! Une énorme"
	line "cascade."
	done

UnknownText_0x1c06bf::
	text "Voulez-vous uti-"
	line "liser CASCADE?"
	done

UnknownText_0x1c06de::
	text_ram wStringBuffer2
	text_start
	line "lance TUNNEL!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> utilise"
	line "une CORDE SORTIE."
	done

UnknownText_0x1c0705::
	text "Impossible d'uti-"
	line "liser ça ici."
	done

UnknownText_0x1c071a::
	text "Retour au dernier"
	line "CENTRE #MON."
	done

UnknownText_0x1c073b::
	text "Impossible d'uti-"
	line "liser ça ici."
	done

UnknownText_0x1c0751::
	text "Un #MON utilise"
	line "déjà FORCE."
	prompt

UnknownText_0x1c0774::
	text_ram wStringBuffer2
	text_start
	line "lance FORCE!"
	done

UnknownText_0x1c0788::
	text_ram wStringBuffer1
	text " peut"
	line "déplacer les"
	cont "rochers."
	prompt

UnknownText_0x1c07a0::
	text "Un #MON peut"
	line "déplacer ça."

	para "Voulez-vous utili-"
	line "ser FORCE?"
	done

UnknownText_0x1c07d8::
	text "Les rochers peu-"
	line "vent être mainte-"
	cont "nant déplacés!"
	done

UnknownText_0x1c07f4::
	text "Un #MON"
	line "pourrait sûrement"
	cont "déplacer ça."
	done

UnknownText_0x1c0816::
	text_ram wStringBuffer2
	text_start
	line "lance SIPHON!"
	prompt

UnknownText_0x1c082b::
	text "C'est un terrible"
	line "siphon!"

	para "Un #MON peut"
	line "le traverser."
	done

UnknownText_0x1c0864::
	text "Un siphon est sur"
	line "la route."

	para "Lancer"
	line "SIPHON?"
	done

UnknownText_0x1c0897::
	text_ram wStringBuffer2
	text " donne"
	line "un COUP D'BOULE!"
	prompt

UnknownText_0x1c08ac::
	text "Non. Rien..."
	done

UnknownText_0x1c08bc::
	text "Un #MON peut"
	line "être dans l'arbre."

	para "Voulez-vous donner"
	line "un COUP D'BOULE?"
	done

UnknownText_0x1c08f0::
	text_ram wStringBuffer2
	text_start
	line "lance ECLATE-ROC!"
	prompt

UnknownText_0x1c0906::
	text "Un #MON"
	line "pourrait peut-être"
	cont "casser ça."
	done

UnknownText_0x1c0924::
	text "Ce rocher a l'air"
	line "cassable."

	para "Voulez-vous utili-"
	line "ser ECLATE-ROC?"
	done

UnknownText_0x1c0958::
	text "Oh!"
	line "Ca mord!"
	prompt

UnknownText_0x1c0965::
	text "Rien du tout!"
	prompt

UnknownText_0x1c0979::
	text "Il n'y a rien"
	line "dans le coin."
	prompt

UnknownText_0x1c099a::
	text "Vous ne pouvez"
	line "pas descendre ici!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> monte sur:"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> descend"
	line "de: @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "Cet arbre peut"
	line "être COUPE!"

	para "Lancer COUPE?"
	done

UnknownText_0x1c0a05::
	text "Cet arbre peut"
	line "être COUPE!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> trouve:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "Mais <PLAYER> ne"
	line "peut plus rien"
	cont "porter."
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	done

UnknownText_0x1c0a77::
	text "Le CHERCH'OBJET"
	line "indique la présen-"
	cont "ce d'un objet!"
	prompt

UnknownText_0x1c0aa9::
	text "Le CHERCH'OBJET"
	line "n'a rien trouvé..."
	cont "Dommage!"
	prompt

UnknownText_0x1c0acc::
	text_ram wStringBuffer3
	text_start
	line "est K.O!"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER> n'a plus"
	line "de #MON en"
	cont "forme!"

	para "<PLAYER> est"
	line "hors-jeu!"
	prompt

UnknownText_0x1c0b03::
	text_ram wStringBuffer3
	text_start
	line "lance DOUX PARFUM!"
	done

UnknownText_0x1c0b1a::
	text "Il n'y a rien"
	line "dans le coin..."
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> fait"
	line "jaillir de l'eau."

	para "Mais rien ne"
	line "se passe..."
	done

UnknownText_0x1c0b65::
	text "Les #MON de"
	line "<PLAYER> sont tous"
	cont "soignés!"
	done

Text_AnEGGCantHoldAnItem::
	text "Un OEUF ne peut"
	line "rien porter."
	prompt

UnknownText_0x1c0b9a::
	text "Aucun objet."
	done

UnknownText_0x1c0ba5::
	text "En jeter"
	line "combien?"
	done

UnknownText_0x1c0bbb::
	text "Jeter @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c0bd8::
	text_ram wStringBuffer2
	text_start
	line "à la poubelle!"
	prompt

UnknownText_0x1c0bee::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	prompt

Text_YouDontHaveAMon::
	text "Vous n'avez pas"
	line "de #MON!"
	prompt

UnknownText_0x1c0c2e::
	text_ram wStringBuffer2
	text_start
	line "enregistré(e)."
	prompt

UnknownText_0x1c0c45::
	text "On ne peut enre-"
	line "gistrer cet objet."
	prompt

UnknownText_0x1c0c63::
	text "Où déplacer"
	line "ceci?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "C'est inutilisable"
	line "en combat."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "Etes-vous un gar-"
	line "çon ou une fille?"
	done

UnknownText_0x1c0cc6::
	text_ram wStringBuffer2
	text " de"
	line "<USER>"

	text_end ; unused

UnknownText_0x1c0cd0::
	text_pause
	text "<SCROLL>monte à fond!@"
	text_end
	prompt

UnknownText_0x1c0ce0::

	cont "augmente!"
	prompt

UnknownText_0x1c0ceb::
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>"

	text_end ; unused

UnknownText_0x1c0cf5::
	text_pause
	text "<SCROLL>diminue à fond!@"
	text_end
	prompt

UnknownText_0x1c0d06::

	cont "diminue!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@"
	text_end

UnknownText_0x1c0d12::
	text_start
	line "crée un cyclone!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "rayonne!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "baisse la tête!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "brille!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "s'envole!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "creuse un trou!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "lance@"
	text_end

_UsedMove2Text::
	text_start
	line "lance@"
	text_end

_UsedInsteadText::
	text "à la place,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "Hein?"

	para "@"
	text_end

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c0dd8::
	text "Donner un surnom"
	line "à @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "C'est @"
	text_ram wBreedMon2Nick
	text_start
	line "qui a été laissé"
	cont "chez la dame de la"
	cont "PENSION."
	done

UnknownText_0x1c0e24::
	text "C'est @"
	text_ram wBreedMon1Nick
	text_start
	line "qui a été laissé"
	cont "chez l'homme de la"
	cont "PENSION."
	done

UnknownText_0x1c0e54::
	text "Il déborde"
	line "d'énergie."
	prompt

UnknownText_0x1c0e6f::
	text "Il se fiche de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "Il aime bien"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "Il est amical avec"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "Il s'intéresse à"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Il n'y a pas de"
	line "LETTRE ici."
	prompt

ClearedMailPutAwayText::
	text "Le COURRIER a été"
	line "rangé."
	prompt

MailPackFullText::
	text "Le SAC est plein."
	prompt

MailMessageLostText::
	text "Le message de la"
	line "LETTRE sera perdu."
	cont "OK?"
	done

MailAlreadyHoldingItemText::
	text "Il porte déjà"
	line "un objet."
	prompt

MailEggText::
	text "Un OEUF ne peut"
	line "porter une LETTRE!"
	prompt

MailMovedFromBoxText::
	text "Cette LETTRE vient"
	line "de la BOITE AUX"
	cont "LETTRES."
	prompt

UnknownText_0x1c0fb3::
	text "Oui"
	prompt

UnknownText_0x1c0fb8::
	text "Non"
	prompt

UnknownText_0x1c0fbc::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Type animation @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0fdd::
	text "Numéro #MON?"
	done

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text_start
	line "va au PC de LEO."
	prompt

UnknownText_0x1c1006::
	text "Il faut des"
	line "#MON à appeler!"
	prompt

UnknownText_0x1c1024::
	text "Quoi?"
	done

UnknownText_0x1c102b::
	text "Il y a un #MON"
	line "tenant une LETTRE."

	para "Enlevez la LETTRE"
	line "s'il vous plaît."
	prompt

UnknownText_0x1c1062::
	text "Vous n'avez aucun"
	line "#MON!"
	prompt

UnknownText_0x1c1080::
	text "Vous ne pouvez"
	line "déposer le dernier"
	cont "#MON!"
	prompt

UnknownText_0x1c10a2::
	text "Vous ne pouvez"
	line "prendre plus de"
	cont "#MON."
	prompt

UnknownText_0x1c10c0::
	text_ram wStringBuffer1
	text_start
	line "capturé!"
	prompt

UnknownText_0x1c10cf::
	text "Changer de"
	line "#MON?"
	done

UnknownText_0x1c10dd::
	text "Vous avez déjà"
	line "un @"
	text_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "Le gagnant du"
	line "Concours de"
	cont "Capture est@"
	text_pause
	text "..."

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "qui a capturé un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_FirstPlaceScoreText::
	text_start

	para "Le score gagnant"
	line "est de @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " pts!"
	prompt

ContestJudging_SecondPlaceText::
	text "En deuxième place:"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "qui a capturé un"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_SecondPlaceScoreText::
	text_start

	para "Le score est de"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_ThirdPlaceText::
	text "En troisième:"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "qui a capturé un"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Le score est de"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

UnknownText_0x1c1203::
	text "Je vais mesurer"
	line "ce MAGICARPE."

	para "Hmm... Il mesure"
	line "@"
	text_ram wStringBuffer1
	text "cm."
	prompt

UnknownText_0x1c123a::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c1261::
	text "Félicitations!"

	para "Le No. ID de votre"
	line "@"
	text_ram wStringBuffer1
	text " dans"

	para "votre équipe"
	line "correspond."
	prompt

UnknownText_0x1c12ae::
	text "Félicitations!"

	para "Le No. ID de votre"
	line "@"
	text_ram wStringBuffer1
	text " dans"

	para "votre BOITE PC"
	line "correspond."
	prompt

UnknownText_0x1c12fc::
	text "Donner un surnom"
	line "au @"
	text_ram wStringBuffer1
	text_start
	cont "reçu?"
	done

UnknownText_0x1c1328::
	text "Bzzzzt! Il faut un"
	line "#MON pour"
	cont "utiliser ça!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> allume"
	line "le PC."
	prompt

UnknownText_0x1c1368::
	text "Que veux-tu"
	line "faire?"
	done

_PlayersPCHowManyWithdrawText::
	text "Combien voulez-"
	line "vous en retirer?"
	done

_PlayersPCWithdrewItemsText::
	text "Retiré @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Pas de place pour"
	line "plus d'objets."
	prompt

UnknownText_0x1c13df::
	text "Pas d'objets ici!"
	prompt

_PlayersPCHowManyDepositText::
	text "Combien voulez-"
	line "vous en déposer?"
	done

_PlayersPCDepositItemsText::
	text "Déposé @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "Plus de place pour"
	line "garder des objets."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> allume"
	line "le PC."
	prompt

UnknownText_0x1c1462::
	text "Accéder à quel PC?"
	done

UnknownText_0x1c1474::
	text "PC de LEO"
	line "connecté."

	para "Gestion Stocks"
	line "de #MON."
	prompt

UnknownText_0x1c14a4::
	text "PC personnel"
	line "connecté."

	para "Gestion Stocks"
	line "d'objets."
	prompt

UnknownText_0x1c14d2::
	text "PC du PROF.CHEN"
	line "connecté."

	para "Evaluation du"
	line "#DEX."
	prompt

UnknownText_0x1c1505::
	text "..."
	line "Déconnexion..."
	done

_OakPCText1::
	text "Veux-tu que j'éva-"
	line "lue ton #DEX?"
	done

_OakPCText2::
	text "Niveau #DEX"
	line "actuel:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON vus"
	line "@"
	text_ram wStringBuffer4
	text " #MON pris"

	para "Evaluation"
	line "PROF.CHEN:"
	done

_OakRating01::
	text "Cherche des #-"
	line "MON dans les"
	cont "hautes herbes!"
	done

_OakRating02::
	text "Bien. Je vois que"
	line "tu sais te servir"
	cont "des # BALLS."
	done

_OakRating03::
	text "Tu t'améliores"
	line "mais il te reste"

	para "beaucoup de choses"
	line "à découvrir."
	done

_OakRating04::
	text "Tu dois remplir"
	line "ton #DEX."

	para "Attrape plusieurs"
	line "types de #MON!"
	done

_OakRating05::
	text "Tu te donnes du"
	line "mal, ça se voit."

	para "Ton #DEX se"
	line "remplit doucement."
	done

_OakRating06::
	text "Certains #MON"
	line "évoluent seuls,"

	para "d'autres ont be-"
	line "soin de PIERRES."
	done

_OakRating07::
	text "Est-ce que tu as"
	line "une CANNE? Tu"

	para "peux pêcher des"
	line "#MON!"
	done

_OakRating08::
	text "Super! Tu aimes"
	line "collectionner"
	cont "des trucs, hein?"
	done

_OakRating09::
	text "Certains #MON"
	line "n'apparaissent"

	para "qu'à certains"
	line "moments de la"
	cont "journée."
	done

_OakRating10::
	text "Ton #DEX se"
	line "remplit. C'est"
	cont "bien!"
	done

_OakRating11::
	text "Impressionnant!"
	line "Tu fais évoluer"

	para "tes #MON!"
	line "Bravo!"
	done

_OakRating12::
	text "Tu connais"
	line "FARGAS? Il fabri-"
	cont "que des BALLS!"
	done

_OakRating13::
	text "Oh! Tu as trouvé"
	line "plus de #MON"

	para "qu'au dernier"
	line "recensement du"
	cont "#DEX."
	done

_OakRating14::
	text "Echanges-tu tes"
	line "#MON? Il"

	para "faut se faire"
	line "des amis!"
	done

_OakRating15::
	text "Whoa! T'as passé"
	line "la barre des 200!"
	cont "Ton #DEX est"
	cont "mortel!"
	done

_OakRating16::
	text "Tu as trouvé tant"
	line "de #MON!"

	para "Tu aides vraiment"
	line "mes recherches!"
	done

_OakRating17::
	text "Magnifique! Tu"
	line "peux devenir un"

	para "PROF. #MON"
	line "dès maintenant!"
	done

_OakRating18::
	text "Ton #DEX est"
	line "incroyable! Tu"

	para "vas devenir un"
	line "professionnel!"
	done

_OakRating19::
	text "Whoa! Un #DEX"
	line "parfait! Mon rêve"

	para "devient réalité!"
	line "Bravo! Bravo!"
	done

_OakPCText4::
	text "Connexion au PC du"
	line "PROF.CHEN coupée."
	done

UnknownText_0x1c19cd::
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

UnknownText_0x1c1a22::
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

UnknownText_0x1c1a5b::
	text ", ouais!"
	done

UnknownText_0x1c1a65::
	text "Zut..."
	done

UnknownText_0x1c1a6c::
	text "Voulez-vous arrê-"
	line "ter le concours?"
	done

UnknownText_0x1c1a90::
	text "Jeter combien de"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c1aad::
	text "Jeter @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c1aca::
	text_ram wStringBuffer1
	text_start
	line "à la poubelle."
	prompt

UnknownText_0x1c1adf::
	text "C'est trop"
	line "important!"
	prompt

UnknownText_0x1c1b03::
	text "CHEN: <PLAYER>!"
	line "Ce n'est pas le"
	cont "moment d'utiliser"
	cont "ce truc!"
	done

UnknownText_0x1c1b2c::
	text "Pris @"
	text_ram wStringBuffer1
	text_start
	line "de @"
	text_ram wMonOrItemNameBuffer
	text " et"

	para "fait tenir"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text_ram wMonOrItemNameBuffer
	text " tient"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Enlever la"
	line "LETTRE d'abord."
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text " ne"
	line "tient rien."
	prompt

UnknownText_0x1c1baa::
	text "Espace de stockage"
	line "d'objets complet."
	prompt

UnknownText_0x1c1bc4::
	text "Pris @"
	text_ram wStringBuffer1
	text_start
	line "de @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tient déjà"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Changer d'objet?"
	done

UnknownText_0x1c1c09::
	text "Cet objet ne peut"
	line "être tenu."
	prompt

UnknownText_0x1c1c22::
	text "La LETTRE perdra"
	line "son message. OK?"
	done

UnknownText_0x1c1c47::
	text "LETTRE enlevée de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "Pas de place pour"
	line "enlever la LETTRE."
	prompt

UnknownText_0x1c1c86::
	text "Envoyer la LETTRE"
	line "enlevée au PC?"
	done

UnknownText_0x1c1ca9::
	text "La BOITE AUX LET-"
	line "TRES du PC est"
	cont "pleine."
	prompt

UnknownText_0x1c1cc4::
	text "La LETTRE a été"
	line "envoyée au PC."
	prompt

UnknownText_0x1c1ce3::
	text "Pas assez de PV!"
	prompt

UnknownText_0x1c1cf3::
	text "Un objet du SAC"
	line "peut être enregis-"

	para "tré comme fonction"
	line "du bouton SELECT."
	done

_OakText1::
	text "Bonjour! Désolé de"
	line "l'attente!"

	para "Bienvenue dans le"
	line "monde de #MON!"

	para "Mon nom est CHEN."

	para "Mais on m'appelle"
	line "le PROF.#MON."
	prompt

_OakText2::
	text "Ce monde est peu-"
	line "plé de créatures"
	cont "appelées #MON.@"
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "Humains et #MON"
	line "vivent en parfaite"
	cont "harmonie..."

	para "Certains jouent"
	line "avec les #MON,"
	cont "d'autres font des"
	cont "combats avec eux."
	prompt

_OakText5::
	text "Mais il reste"
	line "beaucoup à appren-"
	cont "dre sur nos amis"
	cont "les #MON."

	para "De nombreux mystè-"
	line "res planent à leur"
	cont "sujet."

	para "Et c'est pourquoi"
	line "j'étudie les"
	cont "#MON tous les"
	cont "jours."
	prompt
