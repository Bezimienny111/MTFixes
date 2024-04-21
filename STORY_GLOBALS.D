// *************************
// Globalvariablen für Story
// *************************

const int ZivilAnquatschDist = 300;

const int DurstigeBauern = 10;

const int XP = 100;

var int SLF_FIRE;

var int Kapitel;
var int Play_Lute;
var int Firstjoint;
var int Secondjoint;
var int Thirdjoint;
var int Wissen_Almanach;

var int Points_OC;
var int Points_NC;
var int Points_ST;




// *************MODIFICATE BY FENIX**********
var int SROOM_OpenGate;
var int InsertBugs;
var int EAROOOMOPEN;
const int EAROOOMOPEN_Amount = 7;

//Final Fight
var int UrizielReaver;
var int StartStage;

var int SkeletonNextGuild;
var int RessurectSkeleton;
var int AmountOfSkeletons;
var int RessurectedSkeletons;

var int WeakeUpStatue;

var int WeakedUpStatue;
var int WeakedUpStatueNow;


var int Melkor_die;

var int Party_WeaponGive;

var c_npc old_target;	
var c_npc while_target;	

//SoulReaver

var int SR_FirstGame;
var int SR_DamageType;
var int SR_DamageValue;

var int LevelToCast;
const int Level_Fire	= 150;
const int Level_Air		= 150;
const int Level_Earth	= 150;
const int Level_Water	= 150;

var int WhichElemental;
const int E_F	= 1;
const int E_A	= 2;
const int E_E	= 3;
const int E_W	= 4;

var int SetSpecial;

//Sta³e œwiatów
var int Zen_Var;
const int Var_WORLD 			= 1;
const int Var_ORCGRAVEYARD		= 2;
const int Var_ORCTEMPEL			= 3;
const int Var_OLDMINE			= 4;
const int Var_FREEMINE			= 5;
const int Var_ANCIENTTEMPLE		= 6;
const int Var_UDERGROUNDWORLD	= 7;
const int Var_ABANDONEDMINE		= 8;
const int Var_THEROCK			= 9;
const int Var_ROOM				= 10;
const int Var_FINALFIGHT		= 11;
const int Var_EASTERROOM		= 12;

var int TimeToUniteCamps;
var int CampsUnite;

//Walka z nieumar³ym Ur-Shakiem
const string NameOfWPForClones = "TPL_RANDOM_";

const int TimeGiven = 30;
var int Sleeper_Banished;
var int FightWithUrShak_Time;
var int FightWithUrShak_Level;
var int FightWithUrShak_Fight;
var int FightWithUrShak_AmoutToKill;
var int FightWithUrShak_Sleep;

//trucizny
var int Hero_Poisoned;
var int Poisoned_Time;



const int FS_Weak 		= 0;
const int FS_Strong 	= 3;
const int FS_Stronger 	= 4;
const int FS_Master 	= 5;

const int Teacher_Weak_1H		=	44;
const int Teacher_Strong_1H		=	69;
const int Teacher_Master_1H		=	89;
const int Teacher_SMaster_1H	=	100;

const int Teacher_Weak_2H	=	44;
const int Teacher_Strong_2H	=	69;
const int Teacher_Master_2H	=	89;
const int Teacher_SMaster_2H	=	99;

const int Teacher_Weak_Cross	=	25;
const int Teacher_Strong_Cross	=	69;
const int Teacher_Master_Cross	=	100;

const int Teacher_Weak_Bow	=	25;
const int Teacher_Strong_Bow	=	70;
const int Teacher_Master_Bow	=	100;
//01:05:2008
//Konwoje

var int ConvoyStatus;
var int AmoutOfConvoys;

var int ConvoyTime;
var int Convoy_Part;
var int awaria_konwoju;

var string enemy_wp;
var int PlaceOfEnemy;	
var int NumberOfArchers;
var int NumberOfFighters;

var int AttackFromBack;

const int FighterBandit = 1;
const int ArcherBandit = 2;

const string ConvoyStart = "OW_CONVOY_1";//"OW_CONVOY_85"
const string ConvoyEnd = "OW_CONVOY_85";//OW_CONVOY_78
const string ConvoyFinish = "OW_CONVOY_92";
const string sciezka = "OW_CONVOY_";

var string InConvoy;

var string StrazPrzednia;
var string Pilnowani;
var string StrazTylna;

var string Start_StrazPrzednia;
var string Start_Pilnowani;
var string Start_StrazTylna;//"OW_PATH_1_1"

var string ConvoyIs;
var string ProtectingWP;
var string postoj;

var int PlaceOfConvoy;
//var int GoAhead;
var int Attack_is;
var int Attack_time;
var int Ambush;
var int Convoy;

//19:09:2007
const int Cube_Use = 20;

var int niunia_sleep;
var int sand_yeah;

var int FirstTimeUElite;
var int Kill_Special_ShamanL;
var int Kill_Special_Shaman;
const int Spec_Max = 6;

var int hun_prot;

var int AttackForOrcCamp;
var int KilledIntoRoardToOrcHunters;

var int Time_Changer;
//


	var int Kirgo_Charged;
	var int Kharim_Charged;
var int ThangorDeliver;
var int hero_bad;
var int hero_good;
var int Monk_Escape;
var int BAD_SOUL;
var int hero_rules;
var int mel_read;
var int path_kind;

var int Ingmar_Angry;

var int IWin;
var int ILose;

var int IKillMyEnemy;

var int FightFighters_Today;
var int FightMy_Today;
var int patrolowanie;

var int liczba_walczacych;
var int liczba_broni;

var int MyEnemyID;
var int MyEnemyLose;

var int zwyciesca;

var int chose_enemy;
var c_npc My_enemy;

var int My_Wins;

var int MyStatistic;
var C_item MySword;
var C_item PersonalArmor;

var int EnemyStatistic;

var float przymus1;
var float przymus2;
var float przymus3;

var float PriceOfFight;
var int AwardForMyFight;
var int AwardForFight;

var int Scatty_argued;

var int Fighters_Charged;
var int MyEnemy_Charged;

var int chosse_fighters1;
var int chosse_fighters2;

var int avard_for_others_fight;

var c_npc first_fighter;
var c_npc second_fighter;

var c_npc winner_is;
var c_npc loser_is;

var c_npc this_is_winner;

var int MojWybor;

var int fighteroponent1;
var int fighteroponent2;

var string Prisoner_Name_True;

var int Prisoner_Name_Los;


var string PrisonerHead_True;

var int PrisonerHead_Los;

var int PrisonerSkin;     var int PrisonerSkin_Los;
var int PrisonerBody;	  var int PrisonerBody_Los;
var int PrisonerFace;     var int PrisonerFace_Los;

var string PrisonerMesh_True;

var int PrisonerMesh_Los;

var int miecz1h;
var int miecz2h;
var int luk;
var int kusze;

// **************************************************
//					Zabite Potwory - Fenix
// **************************************************
      var int Monster_Kill;
      var int wilk;
      var int orkowypies;
      var int zebacz;
      var int kasacz;
      var int cieniostwor;
      var int Ogar;
      var int jaszczur;
      var int brzytwa;
      var int topielec;
      var int pelzacz;
      var int krwiopijca;
      var int waz;
      var int Trollik;
      var int kretoszczur;
      var int scierwojad;
var int skeletons;
var int gobos;
var int golem;
var int orc;
var int uorc;
var int boars;
var int demons;
var int dragon;
var int buger;
var int harp;
var int zom;
var int others;
var int human_kill;


// *************MADEBYSIEKACZ**********

var int WYPLATA_DAY;
var int cook_join;
var int kazz_hello;
var int GADY;
var int Geralt_zarcie_DAY;
var int OCHYDA;
var int porcja;
var int miesko;
var int ordin;
var int mark;
var int kucharzmark;
var int nowykucharz;
var int odpoczynek;
var int przejscie;
var int Kamil_specialjoint;
var int log_Dawidtrain;
var int log_Bardtrain;
var int log_Siekacztrain;
var int Kamil_orki;
var int Dawid_test;
var int Siekacz_z;
var int bandyci_atak;
var int piwo;
var int piwo_DAY;
var int cpun_DAY;
var int cpun;
var int Dark;
var int kopacze;
var int PALACZ_ProtectionPaid;
var int PALACZ_PayDay;
var int spodnie;
var int decyzja;
var int DarkDead;
var int kartka;
var int kucharz;
var int newkucharz;
var int zbrojah;
var int zbrojakowala;
var int VERDON;
var int VERDONZ;
var int WINKO_HALLDORA;
var int REKRUT;
var int CZEMU;
var int fisk;
var int DORM;
var int zbrojaM;
var int Melkor_Skrytka;
var int Handel_piwem;
var int armorki; 
var int markkucharz;
var int Play_EXLute;
var int JAJCO;
var int MUZYK;

//*********magic items*********
var int INNOS_SWD;
var int INNOS_ARM;
//**************************

//************GOTOWANIE****************
var int zupazwarzyw;
var int zupazchrz¹szcza;
var int POZIOMKOWA_ZUPA;
var int ROSOL2;
var int Patrole;
var int sharpner;
var int lost;
var int BABE_RESCUE;
var int KROLL_INV;
// ***********Przemytnicy**************

var int monk_thief;
var int monk_problem;
var int kira_kidnapp;
var int quentin_hi;
var int jaskier_song;
var int corect_answer;
var int focus_stone;
var int sand_teacher1;
var int anghar_teacher1;
var int Kyro_1;
var int Kyro_2;
var int Kyro_rec;
var int learn_bow;
var int learn_cross;
var int learn_oneh;
var int learn_twoh;
var int Orc_Attack;
var int time_attack;
var int Orc_Secret;
var int can_gamble;
var int gamble_again;
var int gamble_bet;
var int Drinking_Lerned;
var int DiegoHelp;
var int cavalorn_identify;
var int OHCamp;
var int DiegoBow;
var int DiegoArrow;
var int FindHunter;
var int PalAnghar;
var int AngharHelp;
var int ThangorProof;
var int ServinHelp;
var int KorthHelp;
var int MonkHelp;
var int proof;
var int quentinattack;
var int oresecret;
var int inv;
var int CronosDeal;
var int IanKnow;
var int Korth_Go;
var int KyroGo;
var int bow_improve;
var int Thorus_Ask;
var int Diego_Myst;
var int MobUse;
const int Bed_Used=1;
const int Cooker_Used=2;
const int CristalUsing=3;
const int Smithery_Using=4;
const int Alchemy_Using=5;
const int CristalRune_Used=6;
const int TeleportRune_Used=7;
const int Gambling_Used=8;
const int Resurect_Use=9;
const int SHARPNERY_USING = 10;
//Edit by Fenix
const int ElementalSeal_Use=11;
////////////////

var int friends_meeting;
var int Alchemy_read;
var int ydrago;
var int ydrago_growth;
var int ydrago_apper;
var int alchemik_disappear;
var int arena_fighting;

//************Pradawni*************
var int hero_bed_guy;
var int ken_go_proof;
var int alm_give;
var int FindEremita;
var int eremita;
var int CristalUsed;
var int Cristal_Used;
var int Dragon_Teleport;
var int AncientProof;
var int AncientFind;
var int sevensteps;
var int AncientPath;
var int point;
var int FladProof;
var int BalTrait;
var int SheerM_Spawn;
var int trial;
var int AncientPortal;
var int ken_fall;
var int sheer_myst;

//*******Efekt daje tylko pierwsze u¿ycie Chromanina :D

var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

var int Master;
var int Cristal_Ench;
var int Uriziel_Join;
var int Last_Quest;
var int talk_permit;
var int GorHanis_Charged;
//----------------------------------

// **************************************************
//					Kalendarz
// **************************************************
var int calendarday;
// **************************************************
//	Mroczne Tajemnice: Arena w Starym Obozie (LMVIII)
// **************************************************
var int ocfight;
var C_NPC opso1;
var C_NPC opso2;
var C_NPC opso3;
var C_NPC opso4;
var C_NPC opso5;
var C_NPC opso6;
var C_NPC opso7;
var C_NPC opso8;
var C_NPC opso9;
var C_NPC opso10;
var C_NPC opso11;
var C_NPC opso12;
var int pojedynek_jeden_kirgo;
var int pojedynek_jeden_kharim;
var int pojedynek_jeden_gorhanis;
var int pojedynek_jeden_shrat;
var int pojedynek_jeden_rufus;
var int pojedynek_jeden_herek;
var int pojedynek_dwa_kirgo;
var int pojedynek_dwa_kharim;
var int pojedynek_dwa_gorhanis;
var int pojedynek_dwa_shrat;
var int pojedynek_dwa_rufus;
var int pojedynek_dwa_herek;
var int pojedynek_trzy_kirgo;
var int pojedynek_trzy_kharim;
var int pojedynek_trzy_gorhanis;
var int pojedynek_trzy_shrat;
var int pojedynek_trzy_rufus;
var int pojedynek_trzy_herek;
var int pierwsza_walka_w_toku;
var int druga_walka_w_toku;
var int jeden_kharim;
var int jeden_kirgo;
var int jeden_gorhanis;
var int jeden_shrat;
var int jeden_rufus;
var int jeden_herek;
var int dwa_kharim;
var int dwa_kirgo;
var int dwa_gorhanis;
var int dwa_shrat;
var int dwa_rufus;
var int dwa_herek;
var int trzy_kharim;
var int trzy_kirgo;
var int trzy_gorhanis;
var int trzy_shrat;
var int trzy_rufus;
var int trzy_herek;
var int dwa_pojedynki;
var int dwa_pojedynki_globalna;
var int trzy_pojedynki;
var int trzy_pojedynki_globalna;
var int ktowygra;
var int grupa;
var int ocfighta;
var int grupa2;
var int ocfighta2;
var int ocfight2;
var int pojedynek;
var int ocfighta3;
var int ocfight3;
var int grupa3;


//*********************************
//********************************
//********************************

var int Knows_GetTeeth;
var int Knows_GetClaws;
var int Knows_GetFur;
var int Knows_GetHide;
var int Knows_GetTongue;
var int Knows_GetMCMandibles;
var int Knows_GetMCPlates;
var int Knows_GetBFSting;
var int Knows_GetUluMulu;

var int LesterGuide;

var int Bloodwyn_ProtectionPaid;
var int Bloodwyn_PayDay;
var int Herek_ProtectionBully;
var int Grim_ProtectionBully;
var int Jesse_PayForMe;



var int NC_Joints_verteilt;

var int Cronos_Messenger;
var int Thorus_MordragMageMessenger;


// **************************************************
//					Whistlers Schwert
// **************************************************
	var int Fisk_SCknows110;
	var int Fisk_ForgetSword;
	var int Fisk_SwordSold;
// **************************************************
// **************************************************
//					GotoNewcamp Mordrag
// **************************************************
	var int Mordrag_GotoNC_Day;
// **************************************************

var int	EnteredOldMine;
var int Kalom_TalkedTo;
var int KALOM_KRAUTBOTE; 
var int Kalom_DeliveredWeed;
var int Lefty_WorkDay;
var int Lefty_Mission;
var int Ricelord_AskedForWater;
var int An_Bauern_verteilt;

var int Lares_InformMordrag;

// Sumpflager
var int Psi_Walk;
var int Ghorim_KickHarlok;
var int Joru_JoinPsi;
var int Joru_Tips_Mage;
var int BaalNamib_Ansprechbar;
var int BaalNamib_Sakrileg;
var int BaalOrun_FetchWeed;
var INT Kalom_DrugMonopol;
var int Stooges_Fled;
var int idiots_deal;

//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
var int InExtremoPlaying;
var int Aaron_lock;
var int Snipes_deal;
var int Ian_gearwheel;
var int CorKalom_BringBook;
var int CorKalom_BringMCQBalls;
var int YBerion_BringFocus; 
var int PresseTourJanuar2001; 
var int Corristo_KDFAufnahme;
var int Saturas_KDWAufnahme;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
var int CorAngar_GotoOGY;	//TRUE oder FALSE
var int CorAngar_FindHerb; 
var int	Fortuno_HasYBerionHerbs;	// TRUE oder FALSE
var int Yberion_dead;
var int BaalLukor_BringParchment;
		// 0:	keine Hälfte gefunden
		// 1:	die erste Hälfte gefunden
		// 2:	die zweite Hälfte gefunden
		// 3:	beide Hälften gefunden
		// 4:	Kampf gegen BaalLukor
var int CorAngar_SendToNC;
		// FALSE oder TRUE
var int	Saturas_BringFoci;
		// 0:	Auftrag nicht vergeben
		// 1:	Auftrag vergeben, Almanach und 1 Fokus abgeliefert
		// 2:	2 Fokus abgeliefert
		// 3:	3 Foki abgeliefert
		// 4:	4 Foki abgeliefert
		// 5:	5 Foki abgeliefert
var int MonasteryRuin_GateOpen;
		// TRUE oder FALSE
		
var int Troll_Wheel;
		//für Wheel in der Trollschlucht		
		// 0:	Auftrag nicht vergeben
		// 1:	1x vom Spieler angepackt
		// 2:	Winde von Diego repariert
		// 3:	Winde geöffnet
//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------

var int warned_gorn_or_lester; 			//TRUE oder FALSE			
var int oldHeroGuild;		
var int FMTaken;
var int Lee_freeminereport;
var int FindXardas;
var int FindGolemHearts;
	// 0: Auftrag nicht vergeben
	// 1: Auftrag vergeben
	// 2: ein Herz abgeliefert
	// 3: zwei Herzen abgeliefert
	// 4: drei Herzen abgeliefert
var int FindOrcShaman;					//LOG_RUNNING oder LOG_SUCCESS
var int UrShak_SpokeOfUluMulu;			//TRUE oder FALSE
var int FriendOfUrShak;					//TRUE oder FALSE
var int Gorn_JoinedForFM;				//TRUE oder FALSE
var int Gorn_GotoWolf;					//TRUE oder FALSE
var int	EnteredFreeMine;				//TRUE oder FALSE
var int	FreemineOrc_SuchePotion;		//LOG_RUNNING oder LOG_SUCCESS
var int	FreemineOrc_LookingUlumulu;		//LOG_RUNNING oder LOG_SUCCESS
var int MCPlatesDelivered;				//TRUE oder FALSE

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
var int	OrcCity_Sanctum_OuterGateOpen;
var int OrcCity_Sanctum_OuterGateTried;	//TRUE oder FALSE
var int EnteredTemple;					//TRUE oder FALSE
const int HighPriest_MaxHit = 3;		//Anzahl der Schläge auf den fünften Ork-Priester, bis der "SC-hats-kapiert-Dialog" kommt
var int	EncounteredHighPriest;			//TRUE oder FALSE
var int ExploreSunkenTower;				//TRUE oder FALSE
var int LoadSword;						//TRUE oder FALSE
var int	StartChaptersSix;				//TRUE oder FALSE
var int KnowStone;						//TRUE oder FALSE



//#####################################################################
//##
//##
//##					Erfahrungspunkte
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	KAPITEL 1
//---------------------------------------------------------------------
// Altes LagerAufnahme
const int	XP_DiegoBringlist   =  750;
const int	XP_Fingerstrain		=  100;
const int   XP_Whistlerssword	=  200;
const int	XP_kirgovictory		=  150;
const int	XP_Kharimlost		=   50;
const int	XP_kharimvictory	=  200;
const int	XP_Snafcook			=  100;
const int	XP_Slysearchfornek	=  250;
const int	XP_Thorusmordragko	=  250;	
const int	XP_Thorusmordragdead=  300;
const int	XP_fiskdealer		=  300;
const int	XP_BecomeShadow		= 1000;
const int	XP_DexterKalom		=  350;

const int  	XP_GilbertFound		= 100;
const int 	XP_XardasLetter		= 200;
const int 	XP_XardasLetterOPEN = 100;

// Sumpflager-Aufnahme
const int	XP_ArrivedAtPsiCamp			= 200;
const int	XP_WeedForJoru				= 50;
const int	XP_ImpressBaalCadar			= 250;
const int	XP_ImpressBaalNamib			= 250;
const int	XP_DustyJoined				= 250;
const int	XP_BribedDustyGuard			= 250;
const int	XP_DeliveredDusty			= 500;
const int	XP_SentHarlok				= 300;
const int	XP_BaalOrunTalks			= 100;
const int	XP_WeedFromBalor			= 100;
const int	XP_BalorNamedCipher			= 50;
const int	XP_WeedFromViran			= 500;
const int	XP_DeliveredWeedHarvest		= 100;
const int	XP_ReportToBaalOrun			= 200;
const int	XP_ImpressedBaalOrun		= 250;
const int	XP_ImpressedBaalTyon		= 200;
const int	XP_BecomeNovice				= 750;
const int	XP_WeedShipmentDelivered	= 200;
const int	XP_WeedShipmentReported		= 200;
const int 	XP_JackoRetired				= 500;
const int 	XP_DrugMonopol				= 750;

// Aufnahme Neues Lager
const int	XP_ArrivedWithMordrag		= 200;
const int	XP_LeftyCarriedWater		= 100;
const int	XP_LeftyConfronted			= 300;
const int	XP_KickedShrike				= 200;
const int	XP_ReportedKickedShrike		= 100;
const int	XP_ReportDeadDamLurker		= 300;
const int 	XP_CronosLetter				= 200;

const int	XP_CheatedIntoLaresHut		= 250;
const int	XP_GiveRingToLares			= 250;
const int	XP_GiveListToLares			= 250;
const int	XP_ReportListDeliveryToLares= 750;

const int	XP_DistributedWeedForKagan	= 200;
const int	XP_BaalIsidroSpendDrink		= 100;
const int	XP_BaalIsidroTellPlans		= 200;
const int	XP_BaalIsidroPayShare		= 500;
const int	XP_BaalIsidroPayLares		= 500;

const int	XP_BecomeBandit				= 1000;

const int	XP_AssistMordrag			= 250;

//---------------------------------------------------------------------
//	KAPITEL 2
//---------------------------------------------------------------------
const int	XP_BringFocusToYBerion		=	750;
const int	XP_BringFocusToCorKalom		=	250;
const int	XP_LureAaronAway			=	75;
const int	XP_SellKeyToAaron			=	75;
const int	XP_LureUlbertAway			=	75;
const int	XP_BringGearWheel			=	750;
const int	XP_HireGorNaKosh			=	250;
const int	XP_HireGorNaBar				=	250;
const int	XP_HireGorNaVid				=	250;
const int	XP_OpenAsghansGate			=	1500;
const int	XP_BringMCEggs				=	2500;
const int	XP_BringBook				=	2500;

const int	XP_ReportToMordrag			= 500;
const int 	XP_ReportToRaven			= 500;

//---------------------------------------------------------------------
//	KAPITEL 3
//---------------------------------------------------------------------
const int	XP_SaveBaalLukor			=	750;		//22.01.01: Ork-Graveyard enthält 4620 XP
const int	XP_ReportToCorAngar			=	2000;
const int	XP_FindHerbs				=	1500;
const int	XP_GetCronosPermission		=	250;
const int	XP_SayCorrectParole			=	250;
const int	XP_DeliverFocusToSaturas	=	500;
const int	XP_DeliverBookToSaturas		=	500;
const int	XP_DeliverSecondFocus		=	3500;
const int	XP_DeliverThirdFocus		=	3500;
const int	XP_DeliverFourthFocus		=	3500;
const int	XP_DeliverFifthFocus		=	4000;


//---------------------------------------------------------------------
//	KAPITEL 4
//---------------------------------------------------------------------
const int	XP_MessageForGorn			=	1000;
const int	XP_ReportToSaturas			=	1000; // Feuermagier tot!
const int	XP_DeliveredGolemhearts		=	2000;
const int	XP_FoundOrcShaman			=	1000;
const int	XP_ReturnedFromUrShak		=	1000;
const int	XP_GornJoins				=	1000;
const int	XP_FoundOrcSlave			=	2000;
const int	XP_CuredOrcSlave			=	2000;
const int	XP_DeliveredMCPlates		=	2000;
const int	XP_GotUluMulu				=	10000;
const int	XP_GorMCPlateArmor			=	1000;

//---------------------------------------------------------------------
//	KAPITEL 5
//---------------------------------------------------------------------
const int	XP_RetreatFromLastPriest	=	1000;
const int	XP_ShowUrizielToXardas		=	1000;
const int	XP_ReturnedFromSunkenTower	=	2000;
const int	XP_LoadedUriziel			=	5000;


//---------------------------------------------------------------------
//	KAPITEL 6
//---------------------------------------------------------------------








//#####################################################################
//##
//##
//##					Lernkosten
//##
//##
//#####################################################################

const int	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
const int	LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
const int	LPCOST_ATTRIBUTE_MANA		=	1;	

const int	LPCOST_TALENT_MAGE_1		=	10;	
const int	LPCOST_TALENT_MAGE_2		=	15;	
const int	LPCOST_TALENT_MAGE_3		=	20;	
const int	LPCOST_TALENT_MAGE_4		=	25;	
const int	LPCOST_TALENT_MAGE_5		=	30;	
const int	LPCOST_TALENT_MAGE_6		=	40;	

const int	LPCOST_TALENT_ACROBAT		=	10;	
const int	LPCOST_TALENT_SNEAK			=	10;	
const int	LPCOST_TALENT_PICKLOCK_1	=	10;	
const int	LPCOST_TALENT_PICKLOCK_2	=	20;	
const int	LPCOST_TALENT_PICKPOCKET_1	=	10;	
const int	LPCOST_TALENT_PICKPOCKET_2	=	20;
const int 	LPCOST_TALENT_FIREMASTER	=	50;
const int 	LPCOST_TALENT_REGENERATE = 20;


const int 	LPCOST_TALENT_1H_1				=	1;	
const int 	LPCOST_TALENT_1H_2				=	5;	
const int 	LPCOST_TALENT_2H_1				=	1;	
const int 	LPCOST_TALENT_2H_2				=	5;
const int 	LPCOST_TALENT_BOW_1				=	1;	
const int 	LPCOST_TALENT_BOW_2				=	5;	
const int 	LPCOST_TALENT_CROSSBOW_1		=	1;	
const int 	LPCOST_TALENT_CROSSBOW_2		=	5;


/*-------------------------------------------------------------------------

						LOG EINTRAGS VARIABLEN
( da die Logeinträge nicht einfach so in permanenten Infos stehen dürfen!) 

--------------------------------------------------------------------------*/
var int log_gornatothfight;
var int log_gornatothtrain;
var int log_wolftrain;
var int log_baalcadarsell;
var int log_baalcadartrain;
var int log_diegotrain;
var int log_scorpiocrossbow;
var int log_thorustrain;
var int log_thorusfight;
var int log_wedgelearn;
var int log_scattytrain;
var int log_cavalorntrain;

var int Dexter_Traded;
var int Scorpio_Exile;

//------------------------------------------------------------------------
//	Allgemeine Hilfsvariablen
//------------------------------------------------------------------------

var int LeftyDead;