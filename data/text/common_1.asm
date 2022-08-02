_FruitBearingTreeText::
	text "C'est un arbre à"
	line "fruits."
	done

_HeyItsFruitText::
	text "Hé! C'est un(e)"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtenu:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Mais le SAC"
	line "est plein..."
	done

_NothingHereText::
	text "Il n'y a rien"
	line "ici..."
	done

_WhichApricornText::
	text "Quel NOIGRUME"
	line "dois-je utiliser?"
	done

_HowManyShouldIMakeText::
	text "Combien dois-je"
	line "en créer?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "regagne @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PV!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus empoisonné."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text " n'est"
	line "plus paralysé."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text_start
	line "ne brûle plus."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "n'est plus gelé."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "se réveille."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text " regagne"
	line "son énergie."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text " est"
	line "revitalisé."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

	text_end ; unused

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " revient"
	line "à lui."
	done

_EnterNewPasscodeText::
	text "Entrez un nombre"
	line "à 4 chiffres."
	done

_ConfirmPasscodeText::
	text "Entrez le même No."
	line "pour confirmation."
	done

_PasscodesNotSameText::
	text "Ce n'est pas le"
	line "même numéro."
	done

_PasscodeSetText::
	text "CODE SECRET"
	line "défini."

	para "Entrez ce No. la"
	line "prochaine fois"
	cont "pour ouvrir le"
	cont "FICHIER CARTE."

	para ""
	done

_FourZerosInvalidText::
	text "0000 invalide!"
	done

_EnterPasscodeText::
	text "Entrez le CODE du"
	next "FICHIER CARTE."
	done

_IncorrectPasscodeText::
	text "CODE SECRET"
	line "incorrect!"
	done

_CardFolderOpenText::
	text "FICHIER CARTE"
	line "ouvert.@"
	text_end

_OakTimeText1::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz...Hm? Quoi...?"
	line "Tu m'as réveillé!"

	para "Mais quelle heure"
	line "est-il?"
	prompt

_OakTimeText2::
	text "Quelle heure"
	line "est-il?"
	done

_OakTimeText3::
	text "What?@"
	text_end

_OakTimeText4::
	text "?"
	done

_OakTimeText5::
	text "Combien de"
	line "minutes?"
	done

_OakTimeText6::
	text "Whoa!@"
	text_end

_OakTimeText7::
	text "?"
	done

_OakTimeText8::
	text "!"
	line "J'suis en retard!"
	done

_OakTimeText11::
	text "!"
	line "Non! J'suis en"
	cont "retard!"
	done

_OakTimeText12::
	text "!"
	line "C'est normal qu'il"
	cont "fasse nuit!"
	done

_OakTimeText13::
	text "Quel jour?"
	done

_OakTimeText14::
	text "?"
	done

UnknownText_0x1bc384::
	text "Rien n'est"
	line "connecté."
	done

UnknownText_0x1bc3a1::
	text "Check cell phone"
	line "adapter."
	done

UnknownText_0x1bc3bc::
	text "Check CDMA"
	line "adapter."
	done

UnknownText_0x1bc3d1::
	text "Check DOCOMO PHS"
	line "adapter."
	done

UnknownText_0x1bc3ec::
	text "Check DDI PHS"
	line "adapter."
	done

UnknownText_0x1bc404::
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

UnknownText_0x1bc42c::
	text "Mot de passe:"
	line ""
	done

UnknownText_0x1bc43f::
	text "OK?"
	done

UnknownText_0x1bc44c::
	text "Entrer le"
	line "no. ID."
	done

UnknownText_0x1bc45e::
	text "Entrer le"
	line "montant."
	done

_NothingToChooseText::
	text "Il n'y a rien"
	line "à choisir."
	prompt

_WhichSidePutOnText::
	text "Mettre de quel"
	line "côté?"
	done

_WhichSidePutAwayText::
	text "Ranger de quel"
	line "côté?"
	done

_PutAwayTheDecoText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Il n'y a rien"
	line "à ranger."
	prompt

_SetUpTheDecoText::
	text "Installé:"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Rangé:"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "et installé:"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "C'est déjà"
	line "installé."
	prompt

_LookTownMapText::
	text "C'est la CARTE."
	done

_LookPikachuPosterText::
	text "C'est un poster du"
	line "mignon PIKACHU."
	done

_LookClefairyPosterText::
	text "C'est un poster du"
	line "mignon MELOFEE."
	done

_LookJigglypuffPosterText::
	text "C'est un poster du"
	line "mignon RONDOUDOU."
	done

_LookAdorableDecoText::
	text "Un(e) superbe"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "Une poupée géante!"
	line "C'est super doux."
	done

_MomShoppingText1::
	text "Salut, <PLAYER>!"
	line "Ca va bien?"
	prompt

_MomShoppingText2::
	text "J'ai trouvé un bel"
	line "objet à acheter..."
	prompt

_MomShoppingText3::
	text "Alors j'ai dépensé"
	line "tes sous. Désolée!"
	prompt

_MomShoppingText4::
	text "C'est dans ton PC."
	line "Ca va te plaire!"
	done

_MomShoppingText5::
	text "En faisant les"
	line "courses j'ai vu"
	cont "cette superbe"
	cont "poupée, alors..."
	prompt

_MomShoppingText6::
	text "Elle est dans ta"
	line "chambre!"
	done

_TradingText1::
	text_ram wPlayerTrademonSpeciesName
	text " est"
	line "envoyé à @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText2::
	text_start
	done

_TradingText3::
	text_ram wOTTrademonSenderName
	text " dit"
	line "adieu à"
	done

_TradingText4::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText5::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText6::
	text "Contre @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

_TradingText7::
	text_ram wOTTrademonSenderName
	text " envoie"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText8::
	text_ram wOTTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText9::
	text "contre @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

_TradingText10::
	text_ram wPlayerTrademonSenderName
	text " va échan-"
	line "ger @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText11::
	text "contre @"
	text_ram wOTTrademonSpeciesName
	text_start
	line "de @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText12::
	text "Echange @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "...."
	done

_TradingText13::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText14::
	text "Echange @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "...."
	done

_TradingText15::
	text "Prends soin de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText16::
	text_ram wOTTrademonSpeciesName
	text_start
	line "revient!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "LULA: CHRONIQUE"
	done

_OPT_IntroText2::
	text_start
	line "DU PROF.CHEN!"
	done

_OPT_IntroText3::
	text_start
	line "Avec moi, LULA!"
	done

_OPT_OakText1::
	text_start
	line "CHEN: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

_OPT_OakText2::
	text_start
	line "est près de:"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "LULA: @"
	text_ram wStringBuffer1
	text_end
	done

OPT_SweetAdorably::
	text_start
	line "est adorable et"
	done

OPT_WigglySlickly::
	text_start
	line "est mou et"
	done

OPT_AptlyNamed::
	text_start
	line "bien nommé et"
	done

OPT_UndeniablyKindOf::
	text_start
	line "est vraiment"
	done

OPT_Unbearably::
	text_start
	line "est très"
	done

OPT_WowImpressively::
	text_start
	line "est super"
	done

OPT_AlmostPoisonously::
	text_start
	line "est toxique et"
	done

OPT_Sensually::
	text_start
	line "est sensuel et"
	done

OPT_Mischievously::
	text_start
	line "est vicieux et"
	done

OPT_Topically::
	text_start
	line "est célèbre et"
	done

OPT_Addictively::
	text_start
	line "est très"
	done

OPT_LooksInWater::
	text_start
	line "dans l'eau est"
	done

OPT_EvolutionMustBe::
	text_start
	line "évolué est"
	done

OPT_Provocatively::
	text_start
	line "est provoquant et"
	done

OPT_FlippedOut::
	text_start
	line "est fou et"
	done

OPT_HeartMeltingly::
	text_start
	line "est tellement"
	done

OPT_Cute::
	text_start
	line "mignon."
	done

OPT_Weird::
	text_start
	line "bizarre."
	done

OPT_Pleasant::
	text_start
	line "agréable."
	done

OPT_BoldSortOf::
	text_start
	line "courageux."
	done

OPT_Frightening::
	text_start
	line "effrayant."
	done

OPT_SuaveDebonair::
	text_start
	line "rapide!"
	done

OPT_Powerful::
	text_start
	line "puissant."
	done

OPT_Exciting::
	text_start
	line "vigoureux."
	done

OPT_Groovy::
	text_start
	line "cool!"
	done

OPT_Inspiring::
	text_start
	line "exaltant."
	done

OPT_Friendly::
	text_start
	line "amical."
	done

OPT_HotHotHot::
	text_start
	line "chaud!"
	done

OPT_Stimulating::
	text_start
	line "stimulant."
	done

OPT_Guarded::
	text_start
	line "protégé."
	done

OPT_Lovely::
	text_start
	line "gracieux."
	done

OPT_Speedy::
	text_start
	line "rapide."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: ANTENNE"
	done

_BenIntroText2::
	text_start
	line "MUSIQUE PKMN!"
	done

_BenIntroText3::
	text_start
	line "C'est moi, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "SEB: #MUSIQUE!"
	done

_FernIntroText2::
	text_start
	line "Avec DJ SEB!"
	done

_BenFernText1::
	text_start
	line "Ce @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "on s'écoute"
	done

_BenFernText2B::
	text_start
	line "on s'la donne avec"
	done

_BenFernText3A::
	text_start
	line "la fanfare PKMN!"
	done

_BenFernText3B::
	text_start
	line "la berceuse PKMN!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "SAM: Yeah! Comment"
	done

_LC_Text2::
	text_start
	line "ça gaze les gars?"
	done

_LC_Text3::
	text_start
	line "Si t'as la pêche"
	done

_LC_Text4::
	text_start
	line "ou pas le moral,"
	done

_LC_Text5::
	text_start
	line "ne rate jamais le"
	done

_LC_Text6::
	text_start
	line "BON NUMERO!"
	done

_LC_Text7::
	text_start
	line "Cette semaine le"
	done

_LC_Text8::
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Je répète..."
	done

_LC_Text10::
	text_start
	line "Gagne et va vite"
	done

_LC_Text11::
	text_start
	line "à la TOUR RADIO!"
	done

_LC_DragText1::
	text_start
	line "J'aime pas trop"
	done

_LC_DragText2::
	text_start
	line "répéter..."
	done

; Places and People

_PnP_Text1::
	text_start
	line "SOCIO FM!"
	done

_PnP_Text2::
	text_start
	line "Présenté par"
	done

_PnP_Text3::
	text_start
	line "moi, DJ PETRA!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text " @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_PnP_cute::
	text_start
	line "est adorable."
	done

_PnP_lazy::
	text_start
	line "est cool."
	done

_PnP_happy::
	text_start
	line "est en joie."
	done

_PnP_noisy::
	text_start
	line "fait du bruit."
	done

_PnP_precocious::
	text_start
	line "est calme."
	done

_PnP_bold::
	text_start
	line "est difficile."
	done

_PnP_picky::
	text_start
	line "est difficile!"
	done

_PnP_sortofok::
	text_start
	line "est pas mal."
	done

_PnP_soso::
	text_start
	line "est OK."
	done

_PnP_great::
	text_start
	line "est super!"
	done

_PnP_mytype::
	text_start
	line "est trop cool."
	done

_PnP_cool::
	text_start
	line "est cool, non?"
	done

_PnP_inspiring::
	text_start
	line "est terrible!"
	done

_PnP_weird::
	text_start
	line "est étrange."
	done

_PnP_rightforme::
	text_start
	line "est formidable."
	done

_PnP_odd::
	text_start
	line "est bizarre!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_RocketRadioText1::
	text_start
	line "...Heu...on est"
	done

_RocketRadioText2::
	text_start
	line "la TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Après trois ans"
	done

_RocketRadioText4::
	text_start
	line "d'attente, on"
	done

_RocketRadioText5::
	text_start
	line "est de retour"
	done

_RocketRadioText6::
	text_start
	line "pour de bon!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Chef!"
	done

_RocketRadioText8::
	text_start
	line "On a réussi!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Où est notre chef?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Il nous écoute?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: Ici BUENA!"
	done

_BuenaRadioText2::
	text_start
	line "Le mot de passe!"
	done

_BuenaRadioText3::
	text_start
	line "C'est..."
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Souvenez-vous en!"
	done

_BuenaRadioText6::
	text_start
	line "Je suis à la RADIO"
	done

_BuenaRadioText7::
	text_start
	line "de DOUBLONVILLE!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Il est minuit!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "C'est la fin!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Merci d'avoir"
	done

_BuenaRadioMidnightText5::
	text_start
	line "écouté aujourd'hui"
	done

_BuenaRadioMidnightText6::
	text_start
	line "et allez au dodo!"
	done

_BuenaRadioMidnightText7::
	text_start
	line "C'était DJ BUENA"
	done

_BuenaRadioMidnightText8::
	text_start
	line "en direct!"
	done

_BuenaRadioMidnightText9::
	text "Au revoir!"
	done

_BuenaRadioMidnightText10::
	text "...."
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "retire"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "utilise"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text " sur"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_ThatCantBeUsedRightNow::
	text "C'est inutilisable"
	line "pour l'instant."
	prompt

Text_ThatItemCantBePutInThePack::
	text "Cet objet n'entre"
	line "pas dans le SAC."
	done

Text_TheItemWasPutInThePack::
	text_ram wStringBuffer1
	text_start
	line "va dans le SAC."
	done

Text_RemainingTime::
	text "Temps restant"
	done

Text_YourMonsHPWasHealed::
	text "PV du #MON"
	line "restaurés."
	prompt

Text_Warping::
	text "Téléportation..."
	done

UnknownText_0x1bd05e::
	text "Quel chiffre doit"
	line "être modifié?"
	done

UnknownText_0x1bd07f::
	text "Jouer avec"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd09a::
	text "Il faut 2 #MON"
	line "pour l'élevage."
	prompt

Text_BreedingIsNotPossible::
	text "Elevage"
	line "impossible."
	prompt

UnknownText_0x1bd0d8::
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

UnknownText_0x1bd109::
	text "Pas d'OEUF."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "Il va éclore!"
	prompt

UnknownText_0x1bd131::
	text "Tester"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "C'est parti!"
	done

UnknownText_0x1bd14d::
	text "C'est fini!"
	done

UnknownText_0x1bd153::
	text "Pour un garçon!"
	done

UnknownText_0x1bd15f::
	text "Pour une fille!"
	done

UnknownText_0x1bd16c::
	text "Ce n'est pas pour"
	line "un garçon!"
	done

UnknownText_0x1bd188::
	text "BOITE pleine!"
	done

UnknownText_0x1bd19a::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Starting link."
	done

UnknownText_0x1bd211::
	text "Link terminated."
	done

UnknownText_0x1bd223::
	text "Closing link."
	done

UnknownText_0x1bd232::
	text "Clear the time"
	line "limit?"
	done

UnknownText_0x1bd249::
	text "The time limit was"
	line "cleared."
	done

UnknownText_0x1bd266::
	text "Pick which packet"
	line "as an error?"
	done

UnknownText_0x1bd286::
	text "Echange @"
	text_ram wStringBuffer2
	text_start
	line "contre @"
	text_ram wStringBuffer1
	text "...."
	done

UnknownText_0x1bd2a0::
	text "VOLTORBBADGE"
	line "obtenu!"
	done

UnknownText_0x1bd2bc::
	text "Quel étage?"
	done

UnknownText_0x1bd2ca::
	text "PRESENTATEUR: BIP!"

	para "Temps écoulé!"
	done

UnknownText_0x1bd2e7::
	text "PRESENTATEUR: Le"
	line "concours est fini!"
	done

_RepelWoreOffText::
	text "Effet du REPOUSSE"
	line "terminé."
	done

_PlayerFoundItemText::
	text "<PLAYER> trouve:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "Mais <PLAYER> n'a"
	line "plus de place..."
	done

_JustSawSomeRareMonText::
	text "J'ai vu un"
	line "@"
	text_ram wStringBuffer1
	text " rare"
	cont "vers @"
	text_ram wStringBuffer2
	text "."

	para "Je t'appelle si je"
	line "vois un autre"
	cont "#MON rare, OK?"
	prompt

_SavingRecordText::
	text "SAUVEGARDE..."
	line "NE PAS ETEINDRE!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

	text_end ; unused

_NoCoinsText::
	text "Vous n'avez pas de"
	line "jetons."
	prompt

_NoCoinCaseText::
	text "Vous n'avez pas de"
	line "BOITE JETON."
	prompt

UnknownText_0x1bd407::
	text "OK, connectez le"
	line "Câble Game Link."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> échange"
	line "@"
	text_ram wStringBuffer2
	text " contre"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

_NPCTradeIntroText1::
	text "Je collectionne"
	line "les #MON. As-tu"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Pas d'échange?"
	line "Maiiiiiis!!!"
	done

_NPCTradeWrongText1::
	text "Hein? C'est pas"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "Tu plaisantes...?"
	done

_NPCTradeCompleteText1::
	text "Ouais! J'ai un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Cool!"
	done

_NPCTradeAFterText1::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Salut! Je cherche"
	line "ce #MON."

	para "Si tu as"
	line "@"
	text_ram wStringBuffer1
	text ","

	para "peux-tu l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "T'en as pas non"
	line "plus?"

	para "Pfff...."
	line "Et zut..."
	done

_NPCTradeWrongText2::
	text "Tu n'as pas"
	line "@"
	text_ram wStringBuffer1
	text "?"
	cont "C'est dommage."
	done

_NPCTradeCompleteText2::
	text "Cool! Merci!"

	para "J'ai enfin"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Salut! @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est en pleine for-"
	cont "me! Merci encore!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " est"
	line "mignon mais je"

	para "l'ai pas. Toi t'as"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Tu veux l'échanger"
	line "contre @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Tu veux pas échan-"
	line "ger? Bah mince..."
	done

_NPCTradeWrongText3::
	text "C'est pas"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Amène-m'en un, par"
	line "pitié!!!"
	done

_NPCTradeCompleteText3::
	text "Woah! Merci!"
	line "Je voulais tant un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Comment va mon"
	line "@"
	text_ram wStringBuffer2
	text "?"
	cont "Toujours la pêche?"

	para "Ton @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "est si mignon!"
	done

_NPCTradeCompleteText4::
	text "Bah alors?"
	done

_NPCTradeAfterText4::
	text "Echanger c'est"
	line "trop bizarre..."

	para "J'ai beaucoup à"
	line "apprendre."
	done

_MomLeavingText1::
	text "Oh! Quel joli"
	line "#MON."

	para "Où l'as-tu trouvé?"
	line "Hein? Où ça?"

	para "........."

	para "Alors t'aimes"
	line "l'aventure, quoi."

	para "OK!"
	line "J'vais t'aider."

	para "Mais..."
	line "Que faire?"

	para "Je sais! Je vais"
	line "économiser pour"
	cont "toi."

	para "L'argent, c'est"
	line "important."

	para "Veux-tu que j'éco-"
	line "nomise pour toi?"
	done

_MomLeavingText2::
	text "OK, je vais m'oc-"
	line "cuper de tes sous."

	para ".................."
	prompt

_MomLeavingText3::
	text "Fais attention."

	para "Les #MON sont"
	line "tes amis. Il faut"
	cont "les aimer aussi."

	para "En route!"
	done

_MomVisitingText1::
	text "Bienvenue!"
	line "Tu fais des"
	cont "efforts... C'est"
	cont "dur l'aventure!"

	para "J'ai rangé ta"
	line "chambre."

	para "Est-ce à propos"
	line "de l'argent?"
	done

_MomVisitingText2::
	text "Que veux-tu"
	line "faire?"
	done

_MomVisitingText3::
	text "Combien veux-tu"
	line "économiser?"
	done

_MomVisitingText4::
	text "Combien veux-tu"
	line "prendre?"
	done

_MomVisitingText5::
	text "Veux-tu économiser"
	line "de l'argent?"
	done

_MomVisitingText6::
	text "Tu n'as pas écono-"
	line "misé autant."
	prompt

_MomVisitingText7::
	text "Tu ne peux en"
	line "prendre autant."
	prompt

_MomVisitingText8::
	text "Tu n'en as pas"
	line "autant."
	prompt

_MomVisitingText9::
	text "Tu ne peux en"
	line "économiser autant."
	prompt

_MomVisitingText10::
	text "OK, je vais écono-"
	line "miser ton argent."
	cont "Aie confiance!"

	para "<PLAYER>,"
	line "tiens bon!"
	done

_MomVisitingText11::
	text "Je m'occupe de tes"
	line "sous! Va!"
	done

_MomVisitingText12::
	text "<PLAYER>,"
	line "courage!"
	done

_MomVisitingText13::
	text "Fais de ton"
	line "mieux."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Je m'occupe de la"
	line "PENSION. Veux-tu"
	cont "que j'entraîne un"
	cont "#MON?"
	done

_DayCareManOddEggText::
	text "Je m'occupe de la"
	line "PENSION. Connais-"
	cont "tu les OEUFS?"

	para "J'élevais des"
	line "#MON avec"
	cont "ma femme et..."

	para "Surprise! On a"
	line "trouvé un OEUF!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#MON?"
	done

_DayCareLadyIntroText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "PENSION."

	para "Veux-tu que"
	line "j'entraîne un"
	cont "#MON?"
	done

_DayCareLadyOddEggText::
	text "Je suis la femme"
	line "du type qui"
	cont "s'occupe de la"
	cont "PENSION. Connais-"
	cont "tu les OEUFS?"

	para "J'élevais des"
	line "#MON avec"
	cont "mon mari et..."

	para "Surprise! On a"
	line "trouvé un OEUF!"

	para "C'est super dingue"
	line "comme truc!"

	para "Alors tu veux que"
	line "j'entraîne un"
	cont "#MON?"
	done

_WhatShouldIRaiseText::
	text "Qui veux-tu que"
	line "j'entraîne?"
	prompt

_OnlyOneMonText::
	text "Oh? Mais tu n'as"
	line "qu'un #MON."
	prompt

_CantRaiseEggText::
	text "Ah... Je n'accepte"
	line "pas les OEUFS."
	prompt

_RemoveMailText::
	text "Enlève les LETTRES"
	line "avant de me voir."
	prompt

_LastHealthyMonText::
	text "Si tu me le donnes"
	line "qui va combattre"
	cont "pour toi?"
	prompt

_IllRaiseYourMonText::
	text "Entendu. Je vais"
	line "entraîner ton"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Reviens le prendre"
	line "plus tard."
	done

_AreWeGeniusesText::
	text "On est trop bon!"
	line "Tu veux voir"
	cont "ton @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Ton @"
	text_ram wStringBuffer1
	text_start
	line "a bien grandi."

	para "Il a gagné"
	line "@"
	text_decimal wStringBuffer2 + 1, 1, 3
	text " niveau(x)."

	para "Si tu veux récupé-"
	line "rer ton #MON,"
	cont "tu dois payer"
	cont "@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "¥."
	done

_PerfectHeresYourMonText::
	text "Parfait! Voilà"
	line "ton #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> récupère"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Hein? Déjà?"
	line "Ton @"
	text_ram wStringBuffer1
	text_start
	para "a besoin de plus"
	line "de temps! Pour"

	para "récupérer ton"
	line "#MON, tu dois"
	cont "payer 100¥."
	done

_HaveNoRoomText::
	text "Tu n'as pas de"
	line "place."
	prompt

_DCNotEnoughMoneyText::
	text "Vous n'avez pas"
	line "assez de sous."
	prompt

_OhFineThenText::
	text "Très bien."
	prompt

_ComeAgainText::
	text "A bientôt."
	done

_NotYetText::
	text "Pas encore..."
	done

_FoundAnEggText::
	text "Ah, c'est toi!"

	para "On entraînait ton"
	line "#MON, et..."
	cont "Surprise totale!"

	para "Ton #MON a"
	line "pondu un OEUF!"

	para "On sait pas trop"
	line "comment mais..."

	para "Il est là en tout"
	line "cas. Tu le veux?"
	done

_ReceivedEggText::
	text "<PLAYER> reçoit"
	line "l'OEUF!"
	done

_TakeGoodCareOfEggText::
	text "Prends-en soin!"
	done

_RefuseEggText::
	text "Bon ben..."
	line "J'le garde. Merci!"
	done

_NoRoomForEggText::
	text "Tu n'as pas de"
	line "place dans ton"
	cont "équipe..."
	done

_WhichMonPhotoText::
	text "Quel #MON"
	line "dois-je photogra-"
	cont "phier?"
	prompt

_HoldOnText::
	text "Parfait. Parfait."
	line "On ne bouge plus."
	prompt

_PrestoAllDoneText::
	text "Fini! Terminé!"
	line "A bientôt!"
	done
