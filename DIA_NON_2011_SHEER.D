
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Sheer_EXIT(C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 999;
	condition			= Info_Sheer_EXIT_Condition;
	information			= Info_Sheer_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Sheer_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Sheer_EXIT_Info()
{	
	if (hero_bed_guy == FALSE)
	{
	AI_Output (self, other,"Info_Sheer_EXIT_13_00"); //Si³a i Honor wojowniku!
	AI_StopProcessInfos	(self);
	}
	else
	{
	AI_StopProcessInfos	(self);
	};
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Sheer_Hello (C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 1;
	condition		= Info_Sheer_Hello_Condition;
	information		= Info_Sheer_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj wojowniku.";    
};                       

FUNC INT Info_Sheer_Hello_Condition()
{	
	if (AncientFind==LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Hello_Info()
{	
	AI_Output (self, other,"Info_Sheer_Hello_13_00"); //Twój oddech zdradza strach œmiertelniku.
	AI_Output (other, self,"Info_Sheer_Hello_15_01"); //Ale ja...
	AI_Output (self, other,"Info_Sheer_Hello_13_02"); //Cuchniesz strachem i starymi onucami.
	if (sevensteps == TRUE)
	{
	AI_Output (self, other,"Info_Sheer_Hello_13_03"); //Ale wyczuwam te¿ w tobie determinacjê i wolê walki.
	AI_Output (self, other,"Info_Sheer_Hello_13_04"); //Smuga cienia na twojej twarzy zdradza przebyte trudy.
	AI_Output (self, other,"Info_Sheer_Hello_13_05"); //Mêdrcy mawiaj¹, ¿e kiedy uczeñ jest gotowy, wtedy pojawia siê Mistrz.
	AI_Output (self, other,"Info_Sheer_Hello_13_06"); //Czy jesteœ gotowy œmiertelniku na spotkanie ze swym mistrzem?
	AI_Output (other, self,"Info_Sheer_Hello_15_07"); //Nie wiem o czym mówisz. Ja chcia³em tylko...
	AI_DrawWeapon (self);
	AI_Output (self, other,"Info_Sheer_Hello_13_08"); //Wszed³eœ na drogê chwa³y i mêstwa.
	AI_Output (self, other,"Info_Sheer_Hello_13_09"); //Ale musisz poznaæ czym jest honor prawdziwego wojownika.
	AI_Output (self, other,"Info_Sheer_Hello_13_10"); //A prawdziwi wojownicy stoj¹ naprzeciw siebie w odleg³oœci wyci¹gniêtego miecza.
	AI_Output (self, other,"Info_Sheer_Hello_13_11"); //Czy jesteœ gotów do kolejnej próby œmiertelniku?
	AI_Output (other, self,"Info_Sheer_Hello_15_12"); //Hmm. Tak, jestem, ale...
	AI_Output (self, other,"Info_Sheer_Hello_13_13"); //Skoro tak, niech Innos rozstrzygnie, który z nas jest godzien przelaæ za niego krew!
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self,other);
	
	//Edit By Fenix
	AI_StartState (self,ZS_ATTACK,1,""); //Edytowane przez Adanosa
	//AI_StartState (self,ZS_FriendlyAttack,1,"");
	//AI_StartState (self,ZS_AttackSheer,1,""); //Edytowane przez Adanosa
	
	
	B_LogEntry		(P_AncientPath,		"Sheer'Ghar uraczy³ mnie jak¹œ be³kotliw¹ gadk¹ o honorze i najzwyczajniej w œwiecie st³uk³ mnie na kwaœne jab³ko. Trzeba przyznaæ, ¿e wie do czego s³u¿y miecz."); 
	AncientPath=AncientPath+1;//AncientPath=2;
	}
	else
	{
	AI_Output (self, other,"Info_Sheer_Hello_13_14"); //OdejdŸ w pokoju œmiertelniku skoro jeszcze mo¿esz.
	AI_StopProcessInfos	(self);
	};
};

// ***********************Know Seven steps*************************************

INSTANCE Info_Sheer_Hello1 (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_Hello1_Condition;
	information		= Info_Sheer_Hello1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³em zapytaæ o Drogê Siedmiu Kroków.";    
};                       

FUNC INT Info_Sheer_Hello1_Condition()
{	
	if (AncientFind==LOG_RUNNING)&&(AncientPath==1)&&(sevensteps == TRUE)&&(Npc_KnowsInfo(hero,Info_Sheer_Hello))
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Hello1_Info()
{	
	AI_Output (self, other,"Info_Sheer_Hello1_13_00"); //Twój oddech nadal zdradza strach œmiertelniku.
	AI_Output (self, other,"Info_Sheer_Hello1_13_01"); //Ale wyczuwam te¿ w tobie determinacjê i wolê walki.
	AI_Output (self, other,"Info_Sheer_Hello1_13_02"); //Smuga cienia na twojej twarzy zdradza przebyte trudy.
	AI_Output (self, other,"Info_Sheer_Hello1_13_03"); //Mêdrcy mawiaj¹, ¿e kiedy uczeñ jest gotowy, wtedy pojawia siê Mistrz.
	AI_Output (self, other,"Info_Sheer_Hello1_13_04"); //Czy jesteœ gotowy œmiertelniku na spotkanie ze swym mistrzem?
	AI_Output (other, self,"Info_Sheer_Hello1_15_05"); //Nie wiem o czym mówisz. Ja chcia³em tylko...
	AI_DrawWeapon (self);
	AI_Output (self, other,"Info_Sheer_Hello1_13_06"); //Wszed³eœ na drogê chwa³y i mêstwa.
	AI_Output (self, other,"Info_Sheer_Hello1_13_07"); //Ale musisz poznaæ czym jest honor prawdziwego wojownika.
	AI_Output (self, other,"Info_Sheer_Hello1_13_08"); //A prawdziwi wojownicy stoj¹ naprzeciw siebie w odleg³oœci wyci¹gniêtego miecza.
	AI_Output (self, other,"Info_Sheer_Hello1_13_09"); //Czy jesteœ gotów do kolejnej próby œmiertelniku?
	AI_Output (other, self,"Info_Sheer_Hello1_15_10"); //Hmm. Tak, jestem, ale...
	AI_Output (self, other,"Info_Sheer_Hello1_13_11"); //Skoro tak, niech Innos rozstrzygnie, który z nas jest godzien przelaæ za niego krew!
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self,other);
	//AI_StartState (self,ZS_AttackSheer,1,"");
	AI_StartState (self,ZS_ATTACK,1,""); // Edytowane przez Adanosa
	B_LogEntry		(P_AncientPath,		"Sheer'Ghar uraczy³ mnie jak¹œ be³kotliw¹ gadk¹ o honorze i najzwyczajniej w œwiecie st³uk³ mnie na kwaœne jab³ko. Trzeba przyznaæ, ¿e wie do czego s³u¿y miecz."); 
	AncientPath=AncientPath+1;//AncientPath=2;
};



//****After Fight********************************************************

INSTANCE Info_Sheer_After (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_After_Condition;
	information		= Info_Sheer_After_Info;
	important		= 1;
	permanent		= 0;   
};                       

FUNC INT Info_Sheer_After_Condition()
{	
	if (sevensteps == TRUE)&&(AncientPath==2) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_After_Info()
{	
	AI_GotoNpc(self,other);
	AI_Output (self, other,"Info_Sheer_After_13_00"); //Odnalaz³eœ w sobie honor wojownika œmiertelniku.
	AI_Output (other, self,"Info_Sheer_After_15_01"); //A ja myœla³em, ¿e ty tylko chcesz mnie zabiæ.
	AI_Output (self, other,"Info_Sheer_After_13_02"); //W³aœciwie u¿yta ironia te¿ jest broni¹. S³owami ³atwiej jest sprowokowaæ do walki ni¿ mieczem.
	AI_Output (self, other,"Info_Sheer_After_13_03"); //Uczyni³eœ kolejny krok na drodze ku chwale.
	AI_Output (self, other,"Info_Sheer_After_13_04"); //Jesteœ ju¿ gotowy do tego aby zdobyæ szacunek moich braci.
	AI_Output (self, other,"Info_Sheer_After_13_05"); //Mój ju¿ zdoby³eœ. Walczy³eœ godnie i z poœwiêceniem mimo, i¿ by³a to walka z góry skazana na przegran¹.
	point=point+1;//point=1;
	AI_Output (self, other,"Info_Sheer_After_13_06"); //Mimo, i¿ nie mog³eœ zwyciê¿yæ wygra³eœ jako wojownik.
	AI_Output (self, other,"Info_Sheer_After_13_07"); //Wyczuwam w tobie duszê wojownika.
	AI_Output (self, other,"Info_Sheer_After_13_08"); //Kto wie, mo¿e kiedyœ wspólnie skierujemy nasze miecze przeciwko z³u.
	AI_Output (self, other,"Info_Sheer_After_13_09"); //Bywaj wojowniku. Niech Ogieñ Innosa zawsze rozgrzewa twe serce.
	AI_Output (other, self,"Info_Sheer_After_15_10"); //Skrzy¿owanie miecza z tob¹ Mistrzu by³o dla mnie zaszczytem.
	B_LogEntry		(P_AncientPath,		"Zdoby³em uznanie Sheer'Ghara, prawdziwego mistrza szermierki. Jego jêzyk jest jak dla mnie zbyt patetyczny, ale cieszê siê, ¿e ten odwa¿ny wojownik poprze mnie przed Ken'Udzem."); 
	B_GiveXP(XP*5);
};


//****Traitor********************************************************

INSTANCE Info_Sheer_Trait (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_Trait_Condition;
	information		= Info_Sheer_Trait_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Jestem tu z polecenia Eli'Ne.";

};                       

FUNC INT Info_Sheer_Trait_Condition()
{	
	if (sevensteps == TRUE)&&(AncientPath==2)&&(BalTrait==2)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Trait_Info()
{	
	AI_Output (other, self,"Info_Sheer_Trait_15_00"); //Przysy³a mnie Eli'Ne.
	AI_Output (self, other,"Info_Sheer_Trait_13_01"); //Wiem. Wykaza³eœ siê nie tylko prawdomównoœci¹, ale i odwag¹ mówi¹c jej o zdradzie Balaiaretha.
	AI_Output (self, other,"Info_Sheer_Trait_13_02"); //Balaiareth kaza³ ci zabiæ Ognionoœcê i w ten sposób mia³eœ zdobyæ jego szacunek.
	AI_Output (other, self,"Info_Sheer_Trait_15_03"); //Takie by³y jego s³owa.
	AI_Output (self, other,"Info_Sheer_Trait_13_04"); //Podejrzewa³em go o zdradê, odk¹d jego Mistrz Uriziel opuœci³ nasz¹ kongregacjê.
	AI_Output (self, other,"Info_Sheer_Trait_13_05"); //Niestety nigdy nie zdo³a³em zdobyæ wystarczaj¹cych dowodów.
	AI_Output (self, other,"Info_Sheer_Trait_13_06"); //Balaiareth zawsze by³ niezwykle ostro¿ny. A¿ do teraz.
	AI_Output (self, other,"Info_Sheer_Trait_13_07"); //Najwidoczniej wci¹¿ ³¹czy go mentalna wiêŸ z jego Mistrzem.
	AI_Output (self, other,"Info_Sheer_Trait_13_08"); //Z tego wynika, ¿e Urizielowi bardzo siê do czegoœ spieszy.
	AI_Output (self, other,"Info_Sheer_Trait_13_09"); //Niestety, nie mogê powiedzieæ ci nic wiêcej.
	AI_Output (self, other,"Info_Sheer_Trait_13_10"); //Mimo, i¿ pokaza³eœ, ¿eœ jest godzien zaufania, to taki jest nakaz Ken'Udza.
	AI_Output (self, other,"Info_Sheer_Trait_13_11"); //Mogê ci tylko zdradziæ, ¿e krew Ognionoœcy jest niemal¿e bezcenn¹ ingrediencj¹.
	AI_Output (self, other,"Info_Sheer_Trait_13_12"); //A w po³¹czeniu z pewnym skradzionym nam przez Uriziela reliktem, mo¿e zapocz¹tkowaæ prawdziw¹ lawinê z³a.
	AI_Output (self, other,"Info_Sheer_Trait_13_13"); //PójdŸ do Algiriona, on da ci kolejne instrukcje.
	AI_Output (self, other,"Info_Sheer_Trait_13_14"); //Swoim czynem œmiertelniku dowiod³eœ, ¿e Ken'Udz trafnie ciê oceni³.
	AI_Output (self, other,"Info_Sheer_Trait_13_15"); //Kiedy zg³êbisz ju¿ tajemnicê œcie¿ki to wróæ do mnie. Z³o¿ê ci pewn¹ propozycjê.
	AI_Output (self, other,"Info_Sheer_Trait_13_16"); //A teraz bywaj i niech Innos nad Tob¹ czuwa.
	B_LogEntry		(P_AncientPath,		"Sheer'Ghar doceni³ mój czyn. Jego wdziêcznoœæ znaczy dla mnie wiêcej ni¿ góry z³ota. Muszê przyznaæ, ¿e ten tajemniczy Pradawny bardzo mnie intryguje. Powiedzia³, ¿e jak tylko zg³êbiê tajemnicê Drogi Siedmiu Kroków bêdzie mia³ dla mnie pewn¹ propozycjê."); 
	//Edit By Fenix
	BalTrait=3;//trzecia rozmowa
	/////////////////
	B_GiveXP(XP*7);
};

//****Master********************************************************

INSTANCE Info_Sheer_Master (C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 3;
	condition		= Info_Sheer_Master_Condition;
	information		= Info_Sheer_Master_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Czy zostaniesz moim Mistrzem?";

};                       

FUNC INT Info_Sheer_Master_Condition()
{	
	if (sevensteps == TRUE)&&(AncientPath==2)&&(BalTrait==10)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Master_Info()
{	
	AI_Output (other, self,"Info_Sheer_Master_15_00"); //Ken'Udz poleci³ mi poszukaæ wœród Was nauczyciela i przewodnika.
	AI_Output (other, self,"Info_Sheer_Master_15_01"); //Czy zaszczycisz mnie i zostaniesz moim Mistrzem?
	AI_Output (self, other,"Info_Sheer_Master_13_02"); //To ja jestem zaszczycony Twoim wyborem.
	AI_Output (self, other,"Info_Sheer_Master_13_03"); //Jak ju¿ rzek³em, kiedy uczeñ jest gotowy to pojawia siê Mistrz.
	AI_Output (self, other,"Info_Sheer_Master_13_04"); //Byæ mo¿e ju¿ nadszed³ ten czas.
	AI_Output (self, other,"Info_Sheer_Master_13_05"); //Musisz jednak wiedzieæ, ¿e moja œcie¿ka jest œcie¿k¹ wojownika.
	AI_Output (self, other,"Info_Sheer_Master_13_06"); //Nie nauczê ciê istoty magii. Nie posi¹dziesz te¿ wiedzy Zaklinacza Kryszta³ów.
	AI_Output (self, other,"Info_Sheer_Master_13_07"); //Mogê ciê jednak nauczyæ wiele o prawdziwej walce.
	AI_Output (self, other,"Info_Sheer_Master_13_08"); //Poka¿ê ci jak mo¿esz opanowaæ emocje, zwiêkszyæ swoj¹ sprawnoœæ fizyczn¹ i odpornoœæ.
	AI_Output (self, other,"Info_Sheer_Master_13_09"); //Wybieraj wiêc, ale pamiêtaj, ¿e tylko raz mo¿esz wybraæ swego Mistrza.
	Info_ClearChoices (Info_Sheer_Master);
	Info_AddChoice (Info_Sheer_Master, "Zostañ moim Mistrzem!", Info_Sheer_Master_Yes);
	Info_AddChoice (Info_Sheer_Master, "Muszê to przemyœleæ.", Info_Sheer_Master_No);
};

// ------------------------------------Yes--------------------------------
FUNC VOID Info_Sheer_Master_Yes()
{	
	AI_Output (other, self,"Info_Sheer_Master_Yes_15_01"); //B¹dŸ moim Mistrzem! Taki jest mój wybór.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_02"); //Bêdzie tak, jak rzek³eœ.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_03"); //Od tej chwili ³¹czy nas wiêŸ silniejsza ni¿ ¿ycie czy œmieræ.
	//B_ChangeGuild    (hero,GIL_BAB);
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_04"); //Dokonuj¹c tego wyboru sta³eœ siê jednym z nas.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_05"); //Pamiêtaj jednak, ¿e ¿ycie w naszej kongregacji to nieustaj¹cy obowi¹zek i powinnoœæ wobec Innosa.
	AI_Output (other, self,"Info_Sheer_Master_Yes_15_06"); //Nigdy o tym nie zapomnê Mistrzu.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_07"); //Przyjmij wiêc ten miecz jako symbol Twojego oddania Innosowi i naszemu zakonowi.
	CreateInvItems(self, DragonKiller, 1);
	B_GiveInvItems(self,other,DragonKiller,1);
	AI_Output (other, self,"Info_Sheer_Master_Yes_15_08"); //Przysiêgam, ¿e nigdy nie splamiê tego ostrza krwi¹ niewinnych. 
	AI_Output (other, self,"Info_Sheer_Master_Yes_15_09"); //Przyrzekam te¿, ¿e zawsze bêdê walczy³ z ogniem Innosa w sercu.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_10"); //Jesteœ wiêc gotów aby sprostaæ kolejnej próbie.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_11"); //PójdŸ do Ken'Udza. Od teraz ty i ja stanowimy jedno.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_12"); //WeŸ te¿ ten amulet. To najcenniejszy skarb, jaki mogê ci podarowaæ.
	AI_Output (self, other,"Info_Sheer_Master_Yes_13_13"); //Nigdy siê z nim nie rozstawa³em...
	CreateInvItems(self, sheer_gift, 1);
	B_GiveInvItems(self,other,sheer_gift,1);
	AncientPath=AncientPath+1;//AncientPath=3;
	B_LogEntry		(P_Ancient,		"Sheer'Ghar zgodzi³ siê zostaæ moim Mistrzem. Ten wspania³y wojownik nauczy mnie wszystkiego co wie o walce, a tak¿e poka¿e mi jak panowaæ nad emocjami i jak zwiêkszyæ sprawnoœæ fizyczn¹. Podarowa³ mi wspania³y amulet. A teraz muszê znów porozmawiaæ z Ken'Udzem."); 
	B_GiveXP(XP*10);
	Master = 1;
	AI_StopProcessInfos	(self);
};

// ------------------------------------No--------------------------------
FUNC VOID Info_Sheer_Master_No()
{	
	AI_Output (other, self,"Info_Sheer_Master_No_15_01"); //To nie jest ³atwa decyzja. Muszê siê jeszcze nad tym zastanowiæ.
	AI_Output (self, other,"Info_Sheer_Master_No_13_02"); //Uczynisz tak, jak podpowie ci serce.
	AI_StopProcessInfos	(self);
};



//****Master again********************************************************

INSTANCE Info_Sheer_Master1 (C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 33;
	condition		= Info_Sheer_Master1_Condition;
	information		= Info_Sheer_Master1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Zdecydowa³em! B¹dŸ mym mistrzem.";

};                       

FUNC INT Info_Sheer_Master1_Condition()
{	
	if (sevensteps == TRUE)&&(AncientPath==2)&&(BalTrait==10)&&(Npc_KnowsInfo(hero,Info_Sheer_Master))
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Master1_Info()
{	
	AI_Output (other, self,"Info_Sheer_Master1_15_01"); //B¹dŸ moim Mistrzem! Taki jest mój wybór.
	AI_Output (self, other,"Info_Sheer_Master1_13_02"); //Bêdzie tak, jak rzek³eœ.
	AI_Output (self, other,"Info_Sheer_Master1_13_03"); //Od tej chwili ³¹czy nas wiêŸ silniejsza ni¿ ¿ycie czy œmieræ.
	AI_Output (self, other,"Info_Sheer_Master1_13_04"); //Dokonuj¹c tego wyboru sta³eœ siê jednym z nas.
	//B_ChangeGuild    (hero,GIL_BAB);
	AI_Output (self, other,"Info_Sheer_Master1_13_05"); //Pamiêtaj jednak, ¿e ¿ycie w naszej kongregacji to nieustaj¹cy obowi¹zek i powinnoœæ wobec Innosa.
	AI_Output (other, self,"Info_Sheer_Master1_15_06"); //Nigdy o tym nie zapomnê Mistrzu.
	AI_Output (self, other,"Info_Sheer_Master1_13_07"); //Przyjmij wiêc ten miecz jako symbol Twojego oddania Innosowi i naszemu zakonowi.
	CreateInvItems(self, DragonKiller, 1);
	B_GiveInvItems(self,other,DragonKiller,1);
	AI_Output (other, self,"Info_Sheer_Master1_15_08"); //Przysiêgam, ¿e nigdy nie splamiê tego ostrza krwi¹ niewinnych. 
	AI_Output (other, self,"Info_Sheer_Master1_15_09"); //Przyrzekam te¿, ¿e zawsze bêdê walczy³ z ogniem Innosa w sercu.
	AI_Output (self, other,"Info_Sheer_Master1_13_10"); //Jesteœ wiêc gotów aby sprostaæ kolejnej próbie.
	AI_Output (self, other,"Info_Sheer_Master1_13_11"); //PójdŸ do Ken'Udza. Od teraz ty i ja stanowimy jedno.
	AI_Output (self, other,"Info_Sheer_Master1_13_12"); //WeŸ te¿ ten amulet. To najcenniejszy skarb, jaki mogê ci podarowaæ.
	AI_Output (self, other,"Info_Sheer_Master1_13_13"); //Nigdy siê z nim nie rozstawa³em...
	CreateInvItems(self, sheer_gift, 1);
	B_GiveInvItems(self,other,sheer_gift,1);
	AncientPath=AncientPath+1;//AncientPath=3;
	B_LogEntry		(P_Ancient,		"Sheer'Ghar zgodzi³ siê zostaæ moim Mistrzem. Ten wspania³y wojownik nauczy mnie wszystkiego co wie o walce, a tak¿e poka¿e mi jak panowaæ nad emocjami i jak zwiêkszyæ sprawnoœæ fizyczn¹. Podarowa³ mi wspania³y amulet. A teraz muszê znów porozmawiaæ z Ken'Udzem."); 
	B_GiveXP(XP*10);
	Master = 1;
	AI_StopProcessInfos	(self);
};


//****Surface********************************************************

INSTANCE Info_Sheer_Surf (C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 2;
	condition		= Info_Sheer_Surf_Condition;
	information		= Info_Sheer_Surf_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Podobno chcesz mi coœ powiedzieæ Mistrzu.";

};                       

FUNC INT Info_Sheer_Surf_Condition()
{	
	if (sevensteps == TRUE)&&(AncientPath==4)&&(Master == 1)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Surf_Info()
{	
	AI_Output (other, self,"Info_Sheer_Surf_15_00"); //Ken'Udz powiedzia³ mi Mistrzu, ¿e masz mi coœ wa¿nego do przekazania.
	AI_Output (self, other,"Info_Sheer_Surf_13_01"); //Twoje kolejne wyzwanie znajduje siê na powierzchni. Ken'Udz da ci wkrótce pozwolenie na opuszczenie naszej œwi¹tyni.
	AI_Output (self, other,"Info_Sheer_Surf_13_02"); //Jak ju¿ wiesz, nikt z nas nie mo¿e wyjœæ na powierzchniê. Taka jest wola Ken'Udza.
	AI_Output (self, other,"Info_Sheer_Surf_13_03"); //I nawet je¿eli nie wszyscy siê z tym zgadzaj¹, to tak musi byæ.
	AI_Output (self, other,"Info_Sheer_Surf_13_04"); //Pos³uszeñstwo i zaufanie najlepiej spaja. Po zdradzie Uriziela musimy byæ bardzo ostro¿ni.
	AI_Output (other, self,"Info_Sheer_Surf_15_05"); //O co chcesz mnie prosiæ Mistrzu?
	AI_Output (self, other,"Info_Sheer_Surf_13_06"); //Wiele wieków temu na powierzchni by³y organizowane walki gladiatorów.
	AI_Output (self, other,"Info_Sheer_Surf_13_07"); //Najlepsi wojownicy z ca³ej wyspy spotykali siê na Arenie Wiecznego Ognia. 
	AI_Output (self, other,"Info_Sheer_Surf_13_08"); //Miejsce to wci¹¿ istnieje i z tego co wiem, wci¹¿ s¹ tam prowadzone walki.
	AI_Output (self, other,"Info_Sheer_Surf_13_09"); //Przed wiekami wiele razy zwyciê¿a³em na tej w³aœnie arenie i jako jedyny, nigdy nie pozbawi³em swojego przeciwnika ¿ycia.
	AI_Output (self, other,"Info_Sheer_Surf_13_10"); //Arena sama nagradza zwyciêzców pewnym potê¿nym artefaktem.
	AI_Output (self, other,"Info_Sheer_Surf_13_11"); //Jest nim Kryszta³ Zwyciêzców.
	AI_Output (self, other,"Info_Sheer_Surf_13_12"); //Jednak dla mnie ma on znaczenie szczególne. Trudno ubraæ uczucia w s³owa, wiêc nie bêdê nawet próbowa³.
	AI_Output (self, other,"Info_Sheer_Surf_13_13"); //Ten kryszta³ jest dla mnie bardzo wa¿ny. Gdybym móg³, jeszcze raz stan¹³bym do walki na arenie.
	AI_Output (self, other,"Info_Sheer_Surf_13_14"); //Niestety, nikt z nas nie mo¿e opuœciæ œwi¹tyni. 
	AI_Output (other, self,"Info_Sheer_Surf_15_15"); //Mo¿esz byæ pewien Mistrzu, ¿e odzyskasz ten kryszta³.
	AI_Output (other, self,"Info_Sheer_Surf_15_16"); //Stanê do walki na arenie i zdobêdê to wspania³e trofeum dla ciebie.
	AI_Output (self, other,"Info_Sheer_Surf_13_17"); //Bêdê ci bardziej ni¿ wdziêczny. Nie spodziewaj siê jednak nagrody za swój czyn.
	AI_Output (self, other,"Info_Sheer_Surf_13_18"); //Bêdzie to dla ciebie lekcja pokory, a dla mnie ostateczne potwierdzenie s³usznoœci podjêtej wczeœniej decyzji.
	AI_Output (self, other,"Info_Sheer_Surf_13_19"); //Walcz z godnoœci¹ i honorem wojownika. Przyjmij tak¿e ten kryszta³. Na pewno zrobisz z niego dobry u¿ytek.
	CreateInvItems(self, HealCristal, 1);
	B_GiveInvItems(self,other,HealCristal,1);
	trial=trial+1;//=5;
	B_LogEntry		(P_Ancient,		"Mój Mistrz, Sheer'Ghar poprosi³ mnie abym stan¹³ do walki na Arenie Wiecznego Ognia, która znajduje siê gdzieœ w Kolonii Karnej. Je¿eli wygram, arena wynagrodzi mnie potê¿nym artefaktem: Kryszta³em Zwyciêzców, który powinienem oddaæ mojemu Mistrzowi."); 
	B_GiveXP(XP*2);
};

//****Cristal********************************************************
////////////////////////////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////
INSTANCE Info_Sheer_Cristal (C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 25;
	condition		= Info_Sheer_Cristal_Condition;
	information		= Info_Sheer_Cristal_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Zdoby³em Kryszta³ Zwyciêzców.";

};                       

FUNC INT Info_Sheer_Cristal_Condition()
{	
	if (Npc_HasItems (other,GodCristal)==1)&&(Npc_KnowsInfo (other, Info_Sheer_Surf))
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Cristal_Info()
{	
	AI_Output (other, self,"Info_Sheer_Cristal_15_00"); //Zdoby³em Kryszta³ Zwyciêzców Mistrzu.
	AI_Output (self, other,"Info_Sheer_Cristal_13_01"); //Udowodni³eœ wiêc, ¿e jesteœ wspania³ym wojownikiem.
	AI_Output (self, other,"Info_Sheer_Cristal_13_02"); //Ale czy jesteœ gotów aby mi go oddaæ?
	AI_Output (other, self,"Info_Sheer_Cristal_15_03"); //Da³em s³owo. Gdyby ktoœ inny zada³ mi takie pytanie, to musia³by posmakowaæ mojego miecza.
	AI_Output (self, other,"Info_Sheer_Cristal_13_04"); //Twoje s³owa œwiadcz¹ o trafnoœci mojego wyboru. 
	B_GiveInvItems(other,self, GodCristal,1);
	AI_Output (self, other,"Info_Sheer_Cristal_13_05"); //Wraz z tym klejnotem wróci³y stare wspomnienia... A nawet coœ wiêcej...
	AI_Output (other, self,"Info_Sheer_Cristal_15_06"); //Czy dobrze ciê czujesz Mistrzu?
	AI_Output (self, other,"Info_Sheer_Cristal_13_07"); //Tak... To tylko nostalgia... WeŸ proszê ten kryszta³ jako podziêkowanie za Twój trud.
	CreateInvItems(self, PowerCristal, 1);
	B_GiveInvItems(self,other,PowerCristal,1);
	B_GiveInvItems(other,self,GodCristal,1);
	AI_Output (self, other,"Info_Sheer_Cristal_13_08"); //Jego moc doda ci si³ w walce z naszymi nieprzyjació³mi.
	B_LogEntry		(P_Ancient,		"Odda³em Kryszta³ Zwyciêzców mojemu Mistrzowi. Sheer'Ghar na widok klejnotu popad³ w dziwn¹ nostalgiê. Ciekawe jakie wspomnienia wi¹¿¹ mojego Mistrza i ten klejnot?"); 
	B_GiveXP(XP*10);
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//**************************Ken fall***************************

INSTANCE Info_Sheer_Fall (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_Fall_Condition;
	information		= Info_Sheer_Fall_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Uriziel zaatakowa³ œwi¹tyniê!";

};                       

FUNC INT Info_Sheer_Fall_Condition()
{	
	if (sevensteps == TRUE)&&(ken_fall==TRUE)&&(sheer_myst==FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Fall_Info()
{	
	AI_Output (other, self,"Info_Sheer_Fall_15_00"); //Uriziel zaatakowa³ œwi¹tyniê! Ken'Udz nie ¿yje! Inni te¿ le¿¹ martwi!
	AI_Output (self, other,"Info_Sheer_Fall_13_01"); //Spokojnie. Pamiêtaj, ¿e prawdziwy wojownik musi byæ zimny jak lód i twardy jak ska³a.
	AI_Output (self, other,"Info_Sheer_Fall_13_02"); //Twój gniew musi byæ równie ch³odny, co i Twoje opanowanie.
	AI_Output (self, other,"Info_Sheer_Fall_13_03"); //Wiem co siê wydarzy³o. Przewidzia³em to wiele lat temu, jednak Ken'Udz nie chcia³ mnie wtedy wys³uchaæ.
	AI_Output (other, self,"Info_Sheer_Fall_15_04"); //Jak to nie chcia³ ciê wys³uchaæ? 
	AI_Output (self, other,"Info_Sheer_Fall_13_05"); //Ken'Udz nie ufa mi w równej mierze co... Urizielowi.
	AI_Output (other, self,"Info_Sheer_Fall_15_06"); //Niemo¿liwe!
	AI_Output (self, other,"Info_Sheer_Fall_13_07"); //Niestety, taka jest prawda. Jednak najgorsze jest to, ¿e ma do tego pe³ne prawo.
	AI_Output (other, self,"Info_Sheer_Fall_15_08"); //Hmm. Ken'Udz w naszej ostatniej rozmowie, prosi³ mnie abym dowiedzia³ siê dlaczego odmówi³eœ przyjêcia stanowiska Pierwszego Miecza zakonu Pradawnych.
	AI_Output (self, other,"Info_Sheer_Fall_13_09"); //Tak. To prawda. Nie przyj¹³em tego honoru, ale mia³em swoje powody.
	AI_Output (other, self,"Info_Sheer_Fall_15_10"); //Wydaje mi siê, ¿e nadszed³ w³aœciwy czas na to, abym pozna³ o Tobie prawdê, Sheer'Ghar.
	AI_Output (self, other,"Info_Sheer_Fall_13_11"); //To bêdzie niezwykle smutna prawda. Ale je¿eli taka jest Twoja wola. Wys³uchaj wiêc mojej historii...
	AI_Output (self, other,"Info_Sheer_Fall_13_12"); //Przed wieloma wiekami, kiedy te ziemie wolne by³y od jarzma demonów i orków, zamieszkiwa³ je spokojny i niezwykle zaawansowany cywilizacyjnie lud.
	AI_Output (self, other,"Info_Sheer_Fall_13_13"); //Jednak lud ten nie korzysta³ z magii ani miecza. Ich orê¿em by³a technologia, a tarcz¹ pokój i dyplomacja.
	AI_Output (self, other,"Info_Sheer_Fall_13_14"); //Niestety, jak ju¿ zapewne wiesz, ziemie te nawiedzi³ potê¿ny demon. Bestia szczególnie upodoba³a sobie tych spokojnych i nikomu nie wadz¹cych ludzi.
	AI_Output (self, other,"Info_Sheer_Fall_13_15"); //Zapomnia³em jeszcze dodaæ, ¿e ludzie ci zwali siê Sacrr'Ankther. W naszym jêzyku nazwa ta, znaczy tyle co: Poœwiêceni Dobru.
	AI_Output (self, other,"Info_Sheer_Fall_13_16"); //I by³a to najczystsza prawda. Lud ten na ka¿dym kroku czyni³ dobro. Jednak Sacrr'Ankther nie czcili ¿adnego ze znanych ludziom bogów.
	AI_Output (self, other,"Info_Sheer_Fall_13_17"); //Nie byli jednak ateistami. Istota, której oddawali czeœæ, by³a Zapomnianym Bogiem, Pierwszym z Pierwszych Dzieci S³oñca i Gwiazd.
	AI_Output (self, other,"Info_Sheer_Fall_13_18"); //Ten nienazwany bóg obdarza³ swych wyznawców szczególnymi darami. Sacrr'Ankther potrafili czytaæ w ludzkich myœlach jak w otwartej ksiêdze, dlatego zawsze wiedzieli jak pomóc innym.
	AI_Output (self, other,"Info_Sheer_Fall_13_19"); //Zawsze znali w³aœciw¹ odpowiedŸ na ka¿de pytanie i zawsze czynili po¿ytek ze swej wiedzy.
	AI_Output (other, self,"Info_Sheer_Fall_15_20"); //Wybacz, ¿e przerywam, ale bardzo du¿o wiesz o tej staro¿ytnej rasie. Mówisz tak jakbyœ by³...
	AI_Output (self, other,"Info_Sheer_Fall_13_21"); //Jednym z nich. To chcia³eœ powiedzieæ?
	AI_Output (other, self,"Info_Sheer_Fall_15_22"); //W rzeczy samej. Wyj¹³eœ te s³owa z moich ust. Czy to prawda? Jesteœ jednym z nich?
	AI_Output (self, other,"Info_Sheer_Fall_13_23"); //Tak, to prawda. I to w³aœnie ta prawda tak bardzo podzieli³a mnie i Ken'Udza.
	AI_Output (self, other,"Info_Sheer_Fall_13_24"); //Kiedy demon zaatakowa³ i zaw³adn¹³ umys³ami wielu spoœród nas, nikt nie wiedzia³ jak z nim walczyæ.
	AI_Output (self, other,"Info_Sheer_Fall_13_25"); //Nasza wiedza i potê¿na technologia by³y bezsilne.
	AI_Output (self, other,"Info_Sheer_Fall_13_26"); //Demon pokona³ nas nasz¹ w³asn¹ broni¹: si³¹ umys³u.
	AI_Output (self, other,"Info_Sheer_Fall_13_27"); //I wtedy przybyli Pradawni. Gdyby nie oni, demon zaw³adn¹³by nad wszystkimi spoœród nas.
	AI_Output (self, other,"Info_Sheer_Fall_13_28"); //Kiedy Pradawni pokonali bestiê i odes³ali j¹ do przeklêtej sfery demonów byliœmy pewni, ¿e s¹ naszymi wybawicielami, wys³annikami naszego boga.
	AI_Output (self, other,"Info_Sheer_Fall_13_29"); //Pomiêdzy Pradawnymi byli Uriziel i Ken'Udz.
	AI_Output (self, other,"Info_Sheer_Fall_13_30"); //Wtedy to Pradawni orzekli, ¿e w zamian za uratowanie naszego ludu musimy przyj¹æ ich wiarê, wiarê w Innosa.
	AI_Output (self, other,"Info_Sheer_Fall_13_31"); //Pierwszy z Pierwszych, nasz mentor i przywódca po bardzo burzliwej naradzie z pozosta³ymi Sacrr postanowi³, ¿e nie porzucimy wiary naszych przodków.
	AI_Output (self, other,"Info_Sheer_Fall_13_32"); //Prawie wszyscy z Pradawnych zgodnie orzekli, ¿e Poœwiêceni Dobru musz¹ zostaæ zg³adzeni.
	AI_Output (self, other,"Info_Sheer_Fall_13_33"); //Niestety zasugerowali siê tym, ¿e zarówno demon jak i nasz lud w³adaj¹ t¹ sam¹, potê¿n¹ si³¹ umys³u. Pradawni byli przekonani, ¿e moc ta pochodzi w³aœnie od wygnanego demona.
	AI_Output (self, other,"Info_Sheer_Fall_13_34"); //Mimo naszych próœb i b³agañ, nikt nie chcia³ daæ wiary naszym s³owom.
	AI_Output (self, other,"Info_Sheer_Fall_13_35"); //Tylko jeden z Pradawnych sprzeciwi³ siê pozosta³ym.
	AI_Output (other, self,"Info_Sheer_Fall_15_36"); //Uriziel!
	AI_Output (self, other,"Info_Sheer_Fall_13_37"); //Tak. Dobrze odgad³eœ. To Uriziel stan¹³ w naszej obronie.
	AI_Output (self, other,"Info_Sheer_Fall_13_38"); //I tylko dlatego nasz lud nie zosta³ eksterminowany. Pradawni pozwolili nam opuœciæ tê krainê. Prawie wszyscy z moich braci i sióstr wybrali drogê ucieczki.
	AI_Output (self, other,"Info_Sheer_Fall_13_39"); //Zdaje siê, ¿e kraina do której zbiegli nazywa³a siê Jarkendar. Podobno nie sposób dostaæ siê tam drog¹ l¹dow¹.
	AI_Output (self, other,"Info_Sheer_Fall_13_40"); //Jednak kilkoro z nas zdecydowa³o siê przyj¹æ now¹ wiarê. Wybraliœmy drogê walki i zemsty.
	AI_Output (self, other,"Info_Sheer_Fall_13_41"); //Wtedy uwa¿a³em Uriziela za prawdziwego bohatera. Nie podejrzewa³em, ¿e jego decyzja wynika³a tylko i wy³¹cznie z egoistycznej chêci poznania naszych tajemnic.
	AI_Output (self, other,"Info_Sheer_Fall_13_42"); //Uriziel chcia³ posi¹œæ wiedzê o naszej technologii, aby póŸniej wykorzystaæ j¹ przeciwko w³asnym braciom.
	AI_Output (self, other,"Info_Sheer_Fall_13_43"); //Niestety, ju¿ wtedy jego serce ska¿one by³o jadem Beliara.
	AI_Output (self, other,"Info_Sheer_Fall_13_44"); //A ja sta³em siê jego naj¿arliwszym poplecznikiem. 
	AI_Output (other, self,"Info_Sheer_Fall_15_45"); //Dlatego Ken'Udz ci nie ufa! Pewnie podejrzewa³, ¿e wci¹¿ sprzyjasz zdrajcy!
	AI_Output (self, other,"Info_Sheer_Fall_13_46"); //Byæ mo¿e taka jest prawda. 
	AI_Output (other, self,"Info_Sheer_Fall_15_47"); //Ale dlaczego odrzuci³eœ stanowisko Pierwszego Miecza?
	AI_Output (self, other,"Info_Sheer_Fall_13_48"); //Tym razem powód jest du¿o bardziej prozaiczny.
	AI_Output (self, other,"Info_Sheer_Fall_13_49"); //Ja nigdy nie wyrzek³em siê mojej pierwszej i jedynej wiary.
	AI_Output (self, other,"Info_Sheer_Fall_13_50"); //Szanowa³em Pana Ognia, czci³em jego dogmaty, ale nigdy nie wyrzuci³em z serca Zapomnianego Boga naszego ludu.
	AI_Output (self, other,"Info_Sheer_Fall_13_51"); //I Ken'Udz dobrze o tym wiedzia³.
	AI_Output (self, other,"Info_Sheer_Fall_13_52"); //Tylko Ken'Udz wiedzia³ tak¿e o tym, ¿e nie zg³êbi³em do koñca tajemnicy Drogi Siedmiu Kroków. Jednak nie wyda³ mnie przed pozosta³ymi.
	AI_Output (self, other,"Info_Sheer_Fall_13_53"); //Nie wiem dlaczego tak post¹pi³, ale musia³ mieæ w tym jakiœ cel. Jego m¹droœæ czasami bywa równie nieodgadniona co jego myœli.
	AI_Output (self, other,"Info_Sheer_Fall_13_54"); //Mimo swego daru, nawet ja nie potrafiê czytaæ w jego myœlach. 
	AI_Output (self, other,"Info_Sheer_Fall_13_55"); //Kiedy kasta wojowników zwróci³a siê do mnie z proœb¹ bym obj¹³ stanowisko Pierwszego Miecza, odmówi³em niemal¿e bez zastanowienia.
	AI_Output (self, other,"Info_Sheer_Fall_13_56"); //Nie chcia³em obraziæ Innosa wyborem Pierwszego Miecza, który nie mia³ w swoim sercu miejsca dla Pana Ognia.
	AI_Output (other, self,"Info_Sheer_Fall_15_57"); //To dlaczego wybra³eœ drogê Pradawnych?
	AI_Output (self, other,"Info_Sheer_Fall_13_58"); //Wybra³em drogê walki, nie drogê Pradawnych. Jednak te dwie œcie¿ki okaza³y siê zbie¿ne.
	AI_Output (self, other,"Info_Sheer_Fall_13_59"); //Chcia³em nauczyæ siê walczyæ, aby w przysz³oœci móc obroniæ mój lud. Nigdy nie zamierza³em pozostaæ wœród Pradawnych d³u¿ej ni¿ by³o to konieczne.
	AI_Output (self, other,"Info_Sheer_Fall_13_60"); //Kiedy Ken'Udz zosta³ Wielkim Mistrzem, wiedzia³em, ¿e moje dni w zakonie s¹ ju¿ policzone.
	AI_Output (self, other,"Info_Sheer_Fall_13_61"); //Przecie¿ tylko on zna³ o mnie prawdê.
	AI_Output (self, other,"Info_Sheer_Fall_13_62"); //Jednak Ken'Udz ponownie wykaza³ siê niepojêt¹ dla mnie m¹droœci¹.
	AI_Output (self, other,"Info_Sheer_Fall_13_63"); //Uczynisz co zechcesz - powiedzia³. - Jednak dopiero wtedy gdy odnajdzie nas Wybraniec Innosa.
	AI_Output (self, other,"Info_Sheer_Fall_13_64"); //Jego s³owa wydawa³y mi siê wtedy pozbawione sensu. A¿ do dzisiaj.
	AI_Output (other, self,"Info_Sheer_Fall_15_65"); //Dlaczego tak siê na mnie patrzysz? Chyba nie myœlisz, ¿e...
	AI_Output (self, other,"Info_Sheer_Fall_13_66"); //Ja tak nie myœlê. Ja to wiem.
	AI_Output (self, other,"Info_Sheer_Fall_13_67"); //Jesteœ prawdziwym wybrañcem Innosa i Ken'Udz wiedzia³ o tym od samego pocz¹tku.
	AI_Output (self, other,"Info_Sheer_Fall_13_68"); //Jestem nawet pewien tego, ¿e jego chwilowa "niedyspozycja" te¿ ma swój ukryty cel.
	AI_Output (self, other,"Info_Sheer_Fall_13_69"); //Ken'Udz jest zbyt potê¿ny, aby mog³a pokonaæ go wola Uriziela.
	AI_Output (self, other,"Info_Sheer_Fall_13_70"); //Myœlê, ¿e teraz nadszed³ dla ciebie czas kolejnej próby.
	AI_Output (self, other,"Info_Sheer_Fall_13_71"); //Musisz odnaleŸæ Uriziela i ostatecznie pokonaæ bestiê. Raz na zawsze wyplenimy z³o z tej krainy.
	AI_Output (self, other,"Info_Sheer_Fall_13_72"); //Ja pozostanê na stra¿y œwi¹tyni i wraz z pozosta³ymi Pradawnymi bêdziemy chroniæ Wielkiego Mistrza.
	AI_Output (self, other,"Info_Sheer_Fall_13_73"); //Mo¿e trywialnie to zabrzmi, ale teraz nasz los spoczywa w Twoich rêkach.
	AI_Output (self, other,"Info_Sheer_Fall_13_74"); //Swymi czynami dowiod³eœ, ¿e jesteœ jednym z nas. Teraz nadszed³ czas ostatecznej próby.
	AI_Output (self, other,"Info_Sheer_Fall_13_75"); //Niech Pradawny Bóg wspiera ciê sw¹ m¹droœci¹, a Innos niech pokieruje Twym ramieniem.
	AI_Output (self, other,"Info_Sheer_Fall_13_76"); //Poka¿ tym s³ugusom Beliara jak straszny mo¿e byæ gniew Innosa!
	AI_Output (other, self,"Info_Sheer_Fall_15_77"); //Tak te¿ i bêdzie!
	sheer_myst=TRUE;
	B_LogEntry		(P_Ancient,		"Pozna³em przedziwn¹ historiê Sheer'Ghara. Ten wspania³y wojownik naprawdê wiele przeszed³, ale najdziwniejsze w tym wszystkim jest to, ¿e on wierzy, ¿e to ja jestem Wybrañcem Innosa. Dziwny jest ten œwiat. Mam tylko nadziejê, ¿e nie zawiodê pok³adanych we mnie oczekiwañ..."); 
	B_GiveXP(XP*20);
	AI_StopProcessInfos	(self);
};



////////////////////////////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////
//******************************************************************************
var int Sheer_Merke_STR;
var int Sheer_Merke_DEX;
var int Sheer_Limit_STR;
var int Sheer_Limit_DEX;

// ************Sheer teacher************************************************

INSTANCE Info_Sheer_Teach(C_INFO)
{
	npc			= Non_2011_Sheer;
	nr			= 100;
	condition	= Info_Sheer_Teach_Condition;
	information	= Info_Sheer_Teach_Info;
	important		= 0;
	permanent		= 1;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC INT Info_Sheer_Teach_Condition()
{
	if (Npc_KnowsInfo(other,  Info_Sheer_Cristal))
	{
		return 1;
	};
};

FUNC VOID Info_Sheer_Teach_Info()
{	
	AI_Output(other,self,"Info_Sheer_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ Mistrzu?
	AI_Output(self,other,"Info_Sheer_Teach_13_01"); //Mogê ci pokazaæ, jak zwiêkszyæ si³ê i zrêcznoœæ.
	
	Sheer_Merke_STR = hero.attribute[ATR_STRENGTH];
	Sheer_Merke_DEX = hero.attribute[ATR_DEXTERITY];

	Sheer_Limit_STR = self.attribute[ATR_STRENGTH];
	Sheer_Limit_DEX = self.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Sheer_Teach);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_1);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_1);
	Info_AddChoice		(Info_Sheer_Teach,DIALOG_BACK									,Info_Sheer_Teach_BACK);	
};

func void Info_Sheer_Teach_BACK()
{
	if (Sheer_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"Info_Sheer_Teach_BACK_13_00"); //Jesteœ coraz silniejszy. Oby Twa si³a zwróci³a siê przeciw naszym nieprzyjacio³om.
	};
	if (Sheer_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"Info_Sheer_Teach_BACK_13_01"); //Twoja zrêcznoœæ jest coraz lepsza. Æwicz jednak dalej aby osi¹gn¹æ szczyt swych mo¿liwoœci.
	};
	AI_Output(self,other,"Info_Sheer_Teach_BACK_13_02"); //Trochê ju¿ umiesz, ale wiele jeszcze przed tob¹ przyjacielu.
	Info_ClearChoices	(Info_Sheer_Teach);
};

func void Info_Sheer_Teach_STR_1()
{
	Sheer_Limit_STR = self.attribute[ATR_STRENGTH];
	Sheer_Merke_STR = hero.attribute[ATR_STRENGTH];
	if (Sheer_Limit_STR > Sheer_Merke_STR)
	{
	B_BuyAttributePoints (other,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Sheer_Teach);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_1);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_1);
	Info_AddChoice		(Info_Sheer_Teach,DIALOG_BACK									,Info_Sheer_Teach_BACK);
	}
	else if (Sheer_Limit_STR <= Sheer_Merke_STR)
	{
	AI_Output(self,other,"Info_Sheer_Teach_STR_1_13_01"); //Jesteœ ju¿ tak silny jak ja. Wiêcej ciê ju¿ nie nauczê.
	Info_ClearChoices	(Info_Sheer_Teach);
	};
};

func void Info_Sheer_Teach_STR_5()
{
	Sheer_Limit_STR = self.attribute[ATR_STRENGTH];
	Sheer_Merke_STR = hero.attribute[ATR_STRENGTH];
	if (Sheer_Limit_STR > Sheer_Merke_STR)
	{
	B_BuyAttributePoints (other,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Sheer_Teach);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_1);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_1);
	Info_AddChoice		(Info_Sheer_Teach,DIALOG_BACK									,Info_Sheer_Teach_BACK);
	}
	else if (Sheer_Limit_STR <= Sheer_Merke_STR)
	{
	AI_Output(self,other,"Info_Sheer_Teach_STR_5_13_01"); //Jesteœ ju¿ tak silny jak ja. Wiêcej ciê ju¿ nie nauczê.
	Info_ClearChoices	(Info_Sheer_Teach);
	};
};

func void Info_Sheer_Teach_DEX_1()
{
	Sheer_Limit_DEX = self.attribute[ATR_DEXTERITY];
	Sheer_Merke_DEX = hero.attribute[ATR_STRENGTH];
	if (Sheer_Limit_STR > Sheer_Merke_DEX)
	{
	B_BuyAttributePoints (other,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Sheer_Teach);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_1);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_1);
	Info_AddChoice		(Info_Sheer_Teach,DIALOG_BACK									,Info_Sheer_Teach_BACK);
	}
	else if (Sheer_Limit_STR <= Sheer_Merke_DEX)
	{
	AI_Output(self,other,"Info_Sheer_Teach_DEX_1_13_01"); //Jesteœ ju¿ tak zrêczny jak ja. Wiêcej ciê ju¿ nie nauczê.
	Info_ClearChoices	(Info_Sheer_Teach);
	};
};

func void Info_Sheer_Teach_DEX_5()
{
	Sheer_Limit_DEX = self.attribute[ATR_DEXTERITY];
	Sheer_Merke_DEX = hero.attribute[ATR_STRENGTH];
	if (Sheer_Limit_STR > Sheer_Merke_DEX)
	{
	B_BuyAttributePoints (other,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Sheer_Teach);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Sheer_Teach_STR_1);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_5);
	Info_AddChoice		(Info_Sheer_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Sheer_Teach_DEX_1);
	Info_AddChoice		(Info_Sheer_Teach,DIALOG_BACK									,Info_Sheer_Teach_BACK);
	}
	else if (Sheer_Limit_STR <= Sheer_Merke_DEX)
	{
	AI_Output(self,other,"Info_Sheer_Teach_DEX_5_13_01"); //Jesteœ ju¿ tak zrêczny jak ja. Wiêcej ciê ju¿ nie nauczê.
	Info_ClearChoices	(Info_Sheer_Teach);
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--------------2H fighting-----------------------------------------------------------


instance  Sheer_2HMASTER (C_INFO)
{
	npc				= Non_2011_Sheer;
	condition		= Sheer_2HMASTER_Condition;
	information		= Sheer_2HMASTER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Nauka: Broñ dwurêczna (Guru), 30 PN"; 
	nr				= 6;
};

FUNC int  Sheer_2HMASTER_Condition()
{	
	if (Npc_GetTalentValue  (hero,NPC_TALENT_REGENERATE) >= 80)&& (Master == 1)&&(learn_twoh == TRUE) && (Npc_GetTalentValue  (hero,NPC_TALENT_REGENERATE) != 100)

	{
		return TRUE;
	};

};


FUNC void  Sheer_2HMASTER_Info()
{
	if ((Npc_GetTalentValue  (hero,NPC_TALENT_REGENERATE) == 99 )&& (hero.attribute[ATR_STRENGTH] >= 230) && (hero.lp	>= 30))
	{	
		hero.lp = hero.lp-30;
		Npc_SetTalentValue(hero, NPC_TALENT_REGENERATE, 100);
		Npc_SetTalentSkill(hero, NPC_TALENT_2H, Walka_Guru);
		PrintScreen("Zosta³eœ Guru w Pos³ugiwaniu siê Broni¹ Dwurêczn¹!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);	
	}else
	{
	 
		var string msg_1;
		msg_1 = "Si³a - 230, Posiadasz: ";
		var string msg_2;
		msg_2 = "Broñ dwurêczna - 99%. Posiadasz: ";
		var string msg_3; 
		msg_3 = "Punkty nauki - 30. Posiadasz: ";
		
		
		PrintScreen("Wymagania:",-1,12,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen(ConcatStrings(msg_1,IntToString(hero.attribute[ATR_STRENGTH])),-1,17,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen(ConcatStrings(msg_2,IntToString(Npc_GetTalentValue(hero,NPC_TALENT_REGENERATE))),-1,22,"FONT_OLD_20_WHITE.TGA",2);
		PrintScreen(ConcatStrings(msg_3,IntToString(hero.lp)),-1,27,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString("Si³a - 230, Posiadasz:",hero.attribute[ATR_STRENGTH],0),-1,17,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString("Broñ dwurêczna - 99%. Posiadasz:",Npc_GetTalentValue(hero,NPC_TALENT_REGENERATE),0),-1,22,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString("Punkty nauki - 30. Posiadasz:",hero.lp,0),-1,27,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString(" ",hero.lp,0),-1,32,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString(" ",hero.attribute[ATR_STRENGTH],0),-1,37,"FONT_OLD_20_WHITE.TGA",2);
		//PrintScreen(B_BuildLearnString(" ",Npc_GetTalentValue(hero,NPC_TALENT_REGENERATE),0),-1,42,"FONT_OLD_20_WHITE.TGA",2);
	};
		
};

instance  Sheer_ZWEIHAND1s (C_INFO)
{
	npc				= Non_2011_Sheer;
	condition		= Sheer_ZWEIHAND1s_Condition;
	information		= Sheer_ZWEIHAND1s_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naucz mnie walki dwurêcznym orê¿em."; 
	nr				= 5;
};

FUNC int  Sheer_ZWEIHAND1s_Condition()
{	
	if (Npc_GetTalentValue  (hero,NPC_TALENT_2H) >= 0)&& (Master == 1)&&(learn_twoh == FALSE)

	{
		return TRUE;
	};

};


FUNC void  Sheer_ZWEIHAND1s_Info()
{
	AI_Output (other, self,"Sheer_ZWEIHAND1s_15_01"); //Chcia³bym nauczyæ siê pos³ugiwaæ dwurêcznym orê¿em Mistrzu.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_02"); //Dobrze, najpierw zajmiemy siê podstawami.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"Sheer_ZWEIHAND1s_13_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
	learn_twoh = TRUE;
};



instance  Sheer_ZWEIHAND1 (C_INFO)
{
	npc				= Non_2011_Sheer;
	condition		= Sheer_ZWEIHAND1_Condition;
	information		= Sheer_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Walka dwurêcznym orê¿em."; 
};

FUNC int  Sheer_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentValue  (hero,NPC_TALENT_2H) >= 0)&& (Master == 1)&&(learn_twoh == TRUE)

	{
		return TRUE;
	};

};


FUNC void  Sheer_ZWEIHAND1_Info()
{
	//Edit By Fenix
	mnozenie ();
	Info_ClearChoices	(Sheer_ZWEIHAND1);    
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Sheer_ZWEIHAND1_1);
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Sheer_ZWEIHAND1_5);	
	//Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString("Nauka: Broñ dwurêczna (Guru)",30,0), Sheer_2HMASTER_Info);	
	Info_AddChoice		(Sheer_ZWEIHAND1,DIALOG_BACK, Sheer_ZWEIHAND1_BACK);
	Info_AddChoice		(Sheer_ZWEIHAND1,"Rezygnacja", Sheer_ZWEIHAND1_EXIT);

};

func void Sheer_ZWEIHAND1_EXIT()
{
	AI_StopProcessInfos	(self);
};

func void Sheer_ZWEIHAND1_BACK()
{
	
	Info_ClearChoices	(Sheer_ZWEIHAND1);
};


func void Sheer_ZWEIHAND1_1()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1*miecz2h,self);
	//B_GiveSkill(other,NPC_TALENT_2H,0,1);
	Info_ClearChoices	(Sheer_ZWEIHAND1);
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Sheer_ZWEIHAND1_1);
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Sheer_ZWEIHAND1_5);
	Info_AddChoice		(Sheer_ZWEIHAND1,DIALOG_BACK, Sheer_ZWEIHAND1_BACK);
	Info_AddChoice		(Sheer_ZWEIHAND1,"Rezygnacja", Sheer_ZWEIHAND1_EXIT);

};

func void Sheer_ZWEIHAND1_5()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_2H,5,LPCOST_TALENT_2H_2*miecz2h,self);
	//B_GiveSkill(other,NPC_TALENT_2H,0,5);
	Info_ClearChoices	(Sheer_ZWEIHAND1);
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Sheer_ZWEIHAND1_1);
	Info_AddChoice		(Sheer_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Sheer_ZWEIHAND1_5);
	Info_AddChoice		(Sheer_ZWEIHAND1,DIALOG_BACK, Sheer_ZWEIHAND1_BACK);
	Info_AddChoice		(Sheer_ZWEIHAND1,"Rezygnacja", Sheer_ZWEIHAND1_EXIT);

};


instance  SHEER_TRAIN (C_INFO)
{
	npc				= Non_2011_Sheer;
	condition		= SHEER_TRAIN_Condition;
	information		= SHEER_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz mnie walki jednorêcznym orê¿em."; 
};

FUNC int  SHEER_TRAIN_Condition()
{	
	if (Npc_GetTalentValue  (hero,NPC_TALENT_1H) >= 0)&& (Master == 1)&&(learn_twoh == TRUE)
	{
		return TRUE;
	};

};


FUNC void  SHEER_TRAIN_Info()
{
	//Edit By Fenix
	mnozenie ();
	Info_ClearChoices	(SHEER_TRAIN);    
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1*miecz1h,0), SHEER_TRAIN_1);
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_5,LPCOST_TALENT_1H_2*miecz1h,0), SHEER_TRAIN_5);		
	Info_AddChoice		(SHEER_TRAIN,DIALOG_BACK, SHEER_TRAIN_BACK);
	Info_AddChoice		(SHEER_TRAIN,"Rezygnacja", SHEER_TRAIN_EXIT);

};

func void SHEER_TRAIN_EXIT()
{
	AI_StopProcessInfos	(self);
};


func void SHEER_TRAIN_BACK()
{
	
	Info_ClearChoices	(SHEER_TRAIN);
};


func void SHEER_TRAIN_1()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1*miecz1h,self);
	//B_GiveSkill(other,NPC_TALENT_1H,0,1);
	Info_ClearChoices	(SHEER_TRAIN);
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1*miecz1h,0), SHEER_TRAIN_1);
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_5,LPCOST_TALENT_1H_2*miecz1h,0), SHEER_TRAIN_5);
	Info_AddChoice		(SHEER_TRAIN,DIALOG_BACK, SHEER_TRAIN_BACK);
	Info_AddChoice		(SHEER_TRAIN,"Rezygnacja", SHEER_TRAIN_EXIT);

};

func void SHEER_TRAIN_5()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_1H,5,LPCOST_TALENT_1H_2*miecz1h,self);
	//B_GiveSkill(other,NPC_TALENT_1H,0,5);
	Info_ClearChoices	(SHEER_TRAIN);
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1*miecz1h,0), SHEER_TRAIN_1);
	Info_AddChoice		(SHEER_TRAIN,B_BuildLearnString(NAME_Learn1h_5,LPCOST_TALENT_1H_2*miecz1h,0), SHEER_TRAIN_5);
	Info_AddChoice		(SHEER_TRAIN,DIALOG_BACK, SHEER_TRAIN_BACK);
	Info_AddChoice		(SHEER_TRAIN,"Rezygnacja", SHEER_TRAIN_EXIT);

};





INSTANCE Info_Sheer_Asking (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_Asking_Condition;
	information		= Info_Sheer_Asking_Info;
	important		= 1;
	permanent		= 0;

};                       

FUNC INT Info_Sheer_Asking_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_InosSon_Hello))
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Asking_Info()
{	
	AI_Output (self,other,"Info_Sheer_Asking_13_00"); //Ken'Udz ju¿ na ciebie czeka.
	AI_Output (self, other,"Info_Sheer_Asking_13_01"); //Cieszê siê, ¿e znowu ciê widzê.
       	var c_npc ken;
       	ken=Hlp_GetNpc(Non_2010_Kenudz);
	Npc_ExchangeRoutine(ken,"WAIT");
	AI_StopProcessInfos	(self);

};

//**************************epilog***************************

INSTANCE Info_Sheer_Epilog (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_Epilog_Condition;
	information		= Info_Sheer_Epilog_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Ocali³em wasz¹ tajemnicê.";

};                       

FUNC INT Info_Sheer_Epilog_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Sheer_Asking))
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_Epilog_Info()
{	
	AI_Output (other, self,"Info_Sheer_Epilog_15_00"); //Odnalaz³em dzieciê Innosa.
	AI_Output (self, other,"Info_Sheer_Epilog_13_01"); //Uratowa³eœ nasze... brzemiê. Uratowa³eœ te¿ nasz honor. A to dla mnie znaczy wiêcej ni¿ ¿ycie.
	if (Master == 1)
	{
	AI_Output (self, other,"Info_Sheer_Epilog_13_02"); //Nie mam nic, czym móg³bym odwdziêczyæ siê za ten czyn.
	AI_Output (self, other,"Info_Sheer_Epilog_13_03"); //Mam tylko zbrojê po poleg³ych towarzyszach. Niech chocia¿ ten pancerz pomo¿e ci w Twojej walce ze z³em tego œwiata przyjacielu.

	B_GiveXP(XP*10);
	CreateInvItem 		(hero, PalArmor);
	CreateInvItem		(self,			ItAmArrow);
	B_GiveInvItems		(self, hero,	ItAmArrow, 1);
	Npc_RemoveInvItem	(hero,			ItAmArrow);
	AI_Output (other, self,"Info_Sheer_Epilog_15_04"); //To dla mnie zaszczyt Mistrzu! Bêdê nosi³ ten pancerz jako symbol mojej wiary w Innosa.
	AI_Output (other, self,"Info_Sheer_Epilog_15_05"); //Co teraz uczynisz?
	AI_Output (self, other,"Info_Sheer_Epilog_13_06"); //W moim sercu nie ma ju¿ miejsca na nic innego ni¿ walka.
	AI_Output (self, other,"Info_Sheer_Epilog_13_07"); //Bêdê dalej walczy³ ze z³em. Chocia¿ tak mogê uczciæ pamiêæ poleg³ych towarzyszy.
	AI_Output (self, other,"Info_Sheer_Epilog_13_08"); //Bywaj mój uczniu i nigdy nie zapominaj o tym, kim siê sta³eœ i co ciê tutaj spotka³o.
	//Fenix :D
	AI_Output (self, other,"Info_Sheer_Epilog_13_14"); //Oby Fenix czuwa³ nad tob¹. Pamiêtaj jednak, by nigdy nie pod¹¿yæ t¹ sam¹ œcie¿k¹.
	AI_Output (other, self,"Info_Sheer_Epilog_13_15"); //Co powiedzia³eœ?
	AI_StopProcessInfos	(self);
	}
	else
	{
	AI_Output (other, self,"Info_Sheer_Epilog_15_09"); //To by³ mój obowi¹zek i powinnoœæ wobec Innosa.
	AI_Output (other, self,"Info_Sheer_Epilog_15_10"); //Co teraz uczynisz?
	AI_Output (self, other,"Info_Sheer_Epilog_13_11"); //W moim sercu nie ma ju¿ miejsca na nic innego ni¿ walka.
	AI_Output (self, other,"Info_Sheer_Epilog_13_12"); //Bêdê dalej walczy³ ze z³em. Chocia¿ tak mogê uczciæ pamiêæ po poleg³ych towarzyszach,
	AI_Output (self, other,"Info_Sheer_Epilog_13_13"); //Bywaj wiêc Wybrañcze i nigdy nie zapominaj o tym co ciê tutaj spotka³o.
	};
};

INSTANCE Info_Sheer_ENEMYF (C_INFO)
{
	npc			= Non_2011_Sheer;
	condition		= Info_Sheer_ENEMYF_Condition;
	information		= Info_Sheer_ENEMYF_Info;
	important		= 1;
	permanent		= 0;

};                       

FUNC INT Info_Sheer_ENEMYF_Condition()
{	
	if (hero_bed_guy == TRUE)
	{
		return 1;
	};
};
FUNC VOID Info_Sheer_ENEMYF_Info()
{	
	self.flags = 0;
	AI_Output (self, other,"Info_Sheer_ENEMYF_13_01"); //Nie jesteœ godzien miana wojownika. OdejdŸ st¹d i nigdy nie wracaj.
	Npc_SetPermAttitude	(self, ATT_ANGRY);
	Npc_SetTempAttitude (self, ATT_ANGRY); 
	Npc_SetAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
