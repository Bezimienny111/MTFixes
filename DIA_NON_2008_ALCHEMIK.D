//Edit By Fenix
var int ChelpForAlchemik;

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Alch_EXIT(C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr			= 999;
	condition		= Info_Alch_EXIT_Condition;
	information		= Info_Alch_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Alch_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Alch_EXIT_Info()
{	
	AI_Output (self, other,"Info_Alch_EXIT_03_00"); //Bywaj m³odzieñcze.
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Alch hello
// ************************************************************

INSTANCE Info_Alch_Hello (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 1;
	condition		= Info_Alch_Hello_Condition;
	information	= Info_Alch_Hello_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Kim jesteœ?";
};                       

FUNC INT Info_Alch_Hello_Condition()
{	

		return 1;

};
FUNC VOID Info_Alch_Hello_Info()
{
		AI_Output (other, self,"Info_Alch_Hello_15_00"); //Kim jesteœ?
		AI_Output (self, other,"Info_Alch_Hello_03_01"); //Kimœ kto wysoko sobie ceni ciszê i samotnoœæ. A ty jesteœ kimœ kto ten ³ad zak³óca.
		AI_Output (other, self,"Info_Alch_Hello_15_02"); //Wybacz dziadku, ale zaintrygowa³o mnie, ¿e mieszkasz tu sam na takim odludziu.
		AI_Output (self, other,"Info_Alch_Hello_03_03"); //Dziadku? He he, nikt mnie tak jeszcze nie nazwa³. No dobra, skoro ju¿ tutaj przyszed³eœ to mo¿e na coœ siê przydasz.
		AI_Output (self, other,"Info_Alch_Hello_03_04"); //A wiêc by³em kiedyœ alchemikiem i jak widzisz wci¹¿ param siê tym zajêciem.
		self.name = "Alchemik";
		AI_Output (self, other,"Info_Alch_Hello_03_05"); //Mogê zdradziæ ci kilka interesuj¹cych w³aœciwoœci niektórych roœlin je¿eli przyniesiesz mi kilka zió³.
		AI_Output (other, self,"Info_Alch_Hello_15_06"); //Nie ma sprawy. A jakie roœliny mam zerwaæ?
		AI_Output (self, other,"Info_Alch_Hello_03_07"); //Na pocz¹tek niech bêd¹: Orkowe Ziele, Krucze Ziele i Czarne Ziele. Wystarczy po jednej sztuce.
		AI_Output (self, other,"Info_Alch_Hello_03_08"); //Tutaj na p³askowy¿u raczej ich nie znajdziesz. Krucze Ziele lubi mrok i wilgoæ wiêc szukaj w takich miejscach, pozosta³e znajdziesz na powierzchni.
		AI_Output (other, self,"Info_Alch_Hello_15_09"); //Wrócê jak tylko znajdê wszystkie. Mo¿esz byæ tego pewien.
		Log_CreateTopic	(P_Alchemik, LOG_MISSION);
		Log_SetTopicStatus	(P_Alchemik, LOG_RUNNING);
		B_LogEntry		(P_Alchemik, "Spotka³em na niewielkim p³askowy¿u ponad opuszczon¹ kopalni¹ pewnego pustelnika, który podobno by³ kiedyœ alchemikiem. Poprosi³ mnie, ¿ebym przyniós³ mu Orkowe Ziele, Krucze Ziele i Czarne Ziele, a wtedy wyjawi mi sekretne w³aœciwoœci niektórych roœlin.");	
		AI_StopProcessInfos	(self);	
		
};

// ****************herbs********************************************

INSTANCE Info_Alch_Herbs (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 2;
	condition		= Info_Alch_Herbs_Condition;
	information	= Info_Alch_Herbs_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Mam zio³a.";
};                       

FUNC INT Info_Alch_Herbs_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Hello))&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_02)>=1)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=1)
	&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=1) 
	{
		return 1;
	};

};
FUNC VOID Info_Alch_Herbs_Info()
{
	AI_Output (other, self,"Info_Alch_Herbs_15_00"); //Znalaz³em wszystkie zio³a, o które mnie prosi³eœ.
	if ( C_BodystateContains(self, BS_SIT) )
	{
	AI_StandUp (self);
	AI_TurnToNpc (self, other);
	};
	AI_Output (self, other,"Info_Alch_Herbs_03_01"); //To wspaniale m³odzieñcze. Poka¿ czy na pewno przynios³eœ to o co ciê prosi³em.
	B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_02,1);
	B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,1);
	B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_02,1);
	Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,1);
	B_GiveXP(XP*2);
	AI_Output (self, other,"Info_Alch_Herbs_03_02"); //Tak, tych zió³ potrzebowa³em. Dobra robota ch³opcze. Zas³u¿y³eœ na nagrodê, któr¹ bêdzie bezcenna wiedza o w³aœciwoœciach niektórych roœlin.
	AI_Output (self, other,"Info_Alch_Herbs_03_03"); //A wiêc nadstaw ucha i s³uchaj.
	AI_Output (self, other,"Info_Alch_Herbs_03_04"); //Po zjedzeniu odpowiedniej iloœci niektórych roœlin lub owoców mo¿esz permanentnie poprawiæ swoje zdolnoœci.
	AI_Output (self, other,"Info_Alch_Herbs_03_05"); //Efekt jest taki jak po wytê¿onych æwiczeniach fizycznych albo umys³owych.
	AI_Output (other, self,"Info_Alch_Herbs_15_06"); //Co to za roœliny?
	AI_Output (self, other,"Info_Alch_Herbs_03_07"); //Na przyk³ad zwyczajne jab³ka! Nie rób takiej miny. Jak zjesz odpowiedni¹ iloœæ jab³ek to poprawisz swoj¹ tê¿yznê fizyczn¹.
	AI_Output (self, other,"Info_Alch_Herbs_03_08"); //Mo¿e efekt ten jest powtarzany. Nie wiem, bo nigdy nie próbowa³em zjeœæ takiej iloœci jab³ek. Niestety, mam od owoców straszne gazy...
	AI_Output (self, other,"Info_Alch_Herbs_03_09"); //Kolejnym przyk³adem jest ry¿. Po zjedzeniu sporej iloœci ry¿u te¿ zwiêkszysz swoj¹ tê¿yznê fizyczn¹.
	AI_Output (self, other,"Info_Alch_Herbs_03_10"); //Zdradzê ci jeszcze, ¿e Orkowe Ziele poprawi twoj¹ witalnoœæ, a Krucze Ziele doda ci mocy mentalnych.
	AI_Output (self, other,"Info_Alch_Herbs_03_11"); //Wiêcej wiedzieæ nie musisz. Mam nadziejê, ¿e nie rozpowiesz tych sekretów, bo niewielu ludzi zdaje sobie sprawê z potêgi roœlin i zió³. I wola³bym aby tak pozosta³o.
	AI_Output (other, self,"Info_Alch_Herbs_15_12"); //Bez obawy dziadku, zachowam to tylko dla siebie.
	AI_Output (self, other,"Info_Alch_Herbs_03_13"); //To œwietnie, a teraz pozwól, ¿e wrócê do swoich zajêæ.
	AI_Output (other, self,"Info_Alch_Herbs_15_14"); //Móg³byœ jeszcze poœwiêciæ mi chwilkê?
	AI_Output (self, other,"Info_Alch_Herbs_03_15"); //Czemu nie. Widzê po twojej minie, ¿e coœ ciê nurtuje. S³ucham.
	AI_Output (other, self,"Info_Alch_Herbs_15_16"); //Skoro jesteœ alchemikiem to mo¿e nauczy³byœ mnie wa¿enia mikstur?
	AI_Output (self, other,"Info_Alch_Herbs_03_17"); //Wybacz, ale nie mogê spe³niæ twojej proœby.
	AI_Output (other, self,"Info_Alch_Herbs_15_18"); //Ale...
	AI_Output (self, other,"Info_Alch_Herbs_03_19"); //Nie nalegaj bo i tak nie zmieniê zdania. Mogê jednak wa¿yæ dla ciebie mikstury, ale pod jednym warunkiem.
	AI_Output (other, self,"Info_Alch_Herbs_15_20"); //Jaki to warunek?
	AI_Output (self, other,"Info_Alch_Herbs_03_21"); //Bêdziesz mi regularnie, przynajmniej raz w tygodniu dostarcza³ zio³a i roœliny. Dziêki temu nie bêdê traci³ czasu na wa³êsanie siê po doœæ niebezpiecznej okolicy.
	AI_Output (self, other,"Info_Alch_Herbs_03_22"); //A ja w zamian bêdê wa¿y³ dla ciebie ró¿ne specyfiki. Oczywiœcie ingrediencje do tych mikstur tak¿e bêdziesz musia³ przynieœæ sam.
	AI_Output (self, other,"Info_Alch_Herbs_03_23"); //Zgadzasz siê na taki uk³ad?
	AI_Output (other, self,"Info_Alch_Herbs_15_24"); //Pewnie. Postaram siê wywi¹zaæ z umowy.
	AI_Output (self, other,"Info_Alch_Herbs_03_25"); //To wspaniale. A wiêc uwarzê coœ dla ciebie, jak przyniesiesz mi, powiedzmy 8 serafisów, kilka zió³ uzdrawiaj¹cych i Psiankê.
	AI_Output (self, other,"Info_Alch_Herbs_03_26"); //Oczywiœcie zap³acê ci za nie rud¹ i to wiêcej ni¿ dosta³byœ od handlarzy z obozów.
	AI_Output (self, other,"Info_Alch_Herbs_03_27"); //Ruszaj wiêc i uwa¿aj na siebie m³odzieñcze, bo Kolonia Karna to niebezpieczne miejsce.
	AI_Output (other, self,"Info_Alch_Herbs_15_28"); //Nie bój siê dziadku, potrafiê o siebie zadbaæ. Wrócê z roœlinami.
	B_LogEntry		(P_Alchemik, "Tym razem alchemik wys³a³ mnie po 8 serafisów, kilka zió³ uzdrawiaj¹cych i Psiankê. W zamian bêdzie dla mnie warzy³ ró¿ne mikstury.");	
	AI_StopProcessInfos	(self);	
};


// ****************herbs********************************************

INSTANCE Info_Alch_Deliver (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 3;
	condition		= Info_Alch_Deliver_Condition;
	information	= Info_Alch_Deliver_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Mam te roœliny.";
};                       

FUNC INT Info_Alch_Deliver_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Herbs))&&(NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=8)&&(NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=1)
	&&(NPC_HasItems(other,ItFo_Plants_Herb_01)>=3)
	{
		return 1;
	};

};
FUNC VOID Info_Alch_Deliver_Info()
{
	AI_Output (other, self,"Info_Alch_Deliver_15_00"); //Znalaz³em roœliny, których szuka³eœ. Oto one.
	B_GiveInvItems (other,self,ItFo_Plants_Seraphis_01,8);
	B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,1);
	B_GiveInvItems (other,self,ItFo_Plants_Herb_01,3);
	Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,8);
	Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_01,3);
	B_GiveXP(XP*2);
	AI_Output (self, other,"Info_Alch_Deliver_03_01"); //Wspaniale. Potrzebowa³em ich do zrobienia maœci na rze¿¹czkê, bo zdaje siê, ¿e Y'berion ma jakiœ problem ze swoimi prywatnymi 'ochroniarzami'.
	AI_Output (self, other,"Info_Alch_Deliver_03_02"); //Œwietnie. Teraz jak chcesz, mogê coœ dla ciebie uwarzyæ. Pamiêtaj jednak o sk³adnikach. Tutaj masz listê z ingrediencjami potrzebnymi do uwarzenia specyfików.
	B_GiveInvItems (self,other, Alchemy_ListA,1);
	B_GiveInvItems (self,other, Alchemy_ListB,1);
	AI_Output (self, other,"Info_Alch_Deliver_03_03"); //A teraz wracam do pracy. Ta maœæ musi byæ gotowa na jutro...
	B_LogEntry		(P_Alchemik, "Dosta³em od alchemika listê ze sk³adnikami niezbêdnymi do uwarzenia mikstur. Muszê chyba trochê porozgl¹daæ siê po Kolonii za tymi chwastami.");	
	AI_StopProcessInfos	(self);	
};


// ****************herbs buy********************************************

INSTANCE Info_Alch_Buy (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 4;
	condition		= Info_Alch_Buy_Condition;
	information	= Info_Alch_Buy_Info;
	important		= 0;
	permanent	= 1;
	description 	= "Mam roœliny na sprzeda¿.";
};                       

FUNC INT Info_Alch_Buy_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Deliver))
	{
		return 1;
	};

};
FUNC VOID Info_Alch_Buy_Info()
{
	AI_Output (other, self,"Info_Alch_Buy_15_00"); //Mam dla ciebie roœliny i zio³a na sprzeda¿...

	if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>0)||(NPC_HasItems(other,ItFo_Plants_Velayis_01)>0)||(NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>0)||(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>0)||(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>0)||(NPC_HasItems(other,ItFo_Plants_Herb_01)>0)&&(NPC_HasItems(other,ItFo_Plants_Herb_02)>0)||(NPC_HasItems(other,ItFo_Plants_Herb_03)>0)
	{
		var int ExpFromAlche;	ExpFromAlche	=	0;
		var int OreFromAlche;	OreFromAlche	=	0;
	
		if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>0)
		{

		CreateInvItems(self,ItMiNugget,Value_Seraphis*NPC_HasItems(other,ItFo_Plants_Seraphis_01)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Seraphis*NPC_HasItems(other,ItFo_Plants_Seraphis_01)*2);
		OreFromAlche += Value_Seraphis*NPC_HasItems(other,ItFo_Plants_Seraphis_01)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Seraphis_01));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Seraphis_01);
		
		B_GiveInvItems (other,self,ItFo_Plants_Seraphis_01,NPC_HasItems(other,ItFo_Plants_Seraphis_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,NPC_HasItems(self,ItFo_Plants_Seraphis_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_Velayis_01)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Velayis*NPC_HasItems(other,ItFo_Plants_Velayis_01)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Velayis*NPC_HasItems(other,ItFo_Plants_Velayis_01)*2);
		OreFromAlche += Value_Velayis*NPC_HasItems(other,ItFo_Plants_Velayis_01)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Velayis_01) );
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Velayis_01) ;
		
		B_GiveInvItems (other,self,ItFo_Plants_Velayis_01,NPC_HasItems(other,ItFo_Plants_Velayis_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_Velayis_01,NPC_HasItems(self,ItFo_Plants_Velayis_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Nachtschatten*NPC_HasItems(other,ItFo_Plants_Nightshadow_01)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Nachtschatten*NPC_HasItems(other,ItFo_Plants_Nightshadow_01)*2);
		OreFromAlche += Value_Nachtschatten*NPC_HasItems(other,ItFo_Plants_Nightshadow_01)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Nightshadow_01));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Nightshadow_01);
		
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,NPC_HasItems(other,ItFo_Plants_Nightshadow_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,NPC_HasItems(self,ItFo_Plants_Nightshadow_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Orkblatt*NPC_HasItems(other,ItFo_Plants_OrcHerb_01)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Orkblatt*NPC_HasItems(other,ItFo_Plants_OrcHerb_01)*2);
		OreFromAlche += Value_Orkblatt*NPC_HasItems(other,ItFo_Plants_OrcHerb_01)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_OrcHerb_01));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_OrcHerb_01);
		
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,NPC_HasItems(other,ItFo_Plants_OrcHerb_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,NPC_HasItems(self,ItFo_Plants_OrcHerb_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Rabenkraut*NPC_HasItems(other,ItFo_Plants_RavenHerb_01) *2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Rabenkraut*NPC_HasItems(other,ItFo_Plants_RavenHerb_01) *2);
		OreFromAlche += Value_Rabenkraut*NPC_HasItems(other,ItFo_Plants_RavenHerb_01) *2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_RavenHerb_01));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_RavenHerb_01);
		
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,NPC_HasItems(other,ItFo_Plants_RavenHerb_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,NPC_HasItems(self,ItFo_Plants_RavenHerb_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_Herb_01)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Heilkräuter1*NPC_HasItems(other,ItFo_Plants_Herb_01)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Heilkräuter1*NPC_HasItems(other,ItFo_Plants_Herb_01)*2);
		OreFromAlche += Value_Heilkräuter1*NPC_HasItems(other,ItFo_Plants_Herb_01)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Herb_01));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Herb_01);
		
		B_GiveInvItems (other,self,ItFo_Plants_Herb_01,NPC_HasItems(other,ItFo_Plants_Herb_01) );
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_01,NPC_HasItems(self,ItFo_Plants_Herb_01));
		};
		if (NPC_HasItems(other,ItFo_Plants_Herb_02)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Heilkräuter2*NPC_HasItems(other,ItFo_Plants_Herb_02) *2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Heilkräuter2*NPC_HasItems(other,ItFo_Plants_Herb_02) *2);
		OreFromAlche += Value_Heilkräuter2*NPC_HasItems(other,ItFo_Plants_Herb_02) *2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Herb_02));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Herb_02);
		
		B_GiveInvItems (other,self,ItFo_Plants_Herb_02,NPC_HasItems(other,ItFo_Plants_Herb_02) );
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,NPC_HasItems(self,ItFo_Plants_Herb_02));
		};
		if (NPC_HasItems(other,ItFo_Plants_Herb_03)>0)
		{


		CreateInvItems(self,ItMiNugget,Value_Heilkräuter3*NPC_HasItems(other,ItFo_Plants_Herb_03)*2);
		//B_GiveInvItems(self,other,ItMiNugget,Value_Heilkräuter3*NPC_HasItems(other,ItFo_Plants_Herb_03)*2);
		OreFromAlche += Value_Heilkräuter3*NPC_HasItems(other,ItFo_Plants_Herb_03)*2;
		//B_GiveXP(XP/20*NPC_HasItems(other,ItFo_Plants_Herb_03));
		ExpFromAlche += XP/20*NPC_HasItems(other,ItFo_Plants_Herb_03);
		
		B_GiveInvItems (other,self,ItFo_Plants_Herb_03,NPC_HasItems(other,ItFo_Plants_Herb_03) );
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,NPC_HasItems(self,ItFo_Plants_Herb_03));
		};
		AI_Output (self, other,"Info_Alch_Buy_03_01"); //To by³a korzystna wymiana.
		
		B_GiveXP (ExpFromAlche);
		B_GiveInvItems(self,other,ItMiNugget,OreFromAlche);
	}
	else
	{
	AI_Output (self, other,"Info_Alch_Buy_03_02"); //Pamiêtaj, ¿e przede wszystkim interesuj¹ mnie zio³a lecznicze i przywracaj¹ce manê, bo na nie jest najwiêksze zapotrzebowanie w Kolonii. Reszty na razie nie potrzebujê.
	};
};


// ****************mixtures********************************************

INSTANCE Info_Alch_Mix (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 5;
	condition		= Info_Alch_Mix_Condition;
	information	= Info_Alch_Mix_Info;
	important		= 0;
	permanent	= 1;
	description 	= "Uwarzysz dla mnie miksturê?";
};                       

FUNC INT Info_Alch_Mix_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Deliver))&&(Alchemy_read == TRUE)
	{
		return 1;
	};

};
FUNC VOID Info_Alch_Mix_Info()
{
	AI_Output (other, self,"Info_Alch_Mix_15_00"); //Uwarzysz dla mnie jak¹œ miksturê?
	AI_Output (self, other,"Info_Alch_Mix_03_01"); //Je¿eli posiadasz odpowiednie sk³adniki...


	var string es_01;
	if (NPC_HasItems(other,ItFo_Plants_Herb_01)>=3)&&(NPC_HasItems(other,ItFo_Plants_Herb_02)>=1)
	{
	es_01 = "Posiadasz sk³adniki";
	}
	else{
	es_01 = "Nie posiadasz sk³adników";
	};
	var string es_02;
	if (NPC_HasItems(other,ItFo_Plants_Herb_02)>=3)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=1)
	{
	es_02 = "Posiadasz sk³adniki";
	}
	else{
	es_02 = "Nie posiadasz sk³adników";
	};
	var string es_03;
	if (NPC_HasItems(other,ItFo_Plants_Herb_02)>=2)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=4)
	{
	es_03 = "Posiadasz sk³adniki";
	}
	else{
	es_03= "Nie posiadasz sk³adników";
	};
	var string es_04;
	if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=1)
	{
	es_04 = "Posiadasz sk³adniki";
	}
	else{
	es_04= "Nie posiadasz sk³adników";
	};
	var string es_05;
	if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=1)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=2)
	{
	es_05 = "Posiadasz sk³adniki";
	}
	else{
	es_05= "Nie posiadasz sk³adników";
	};
	
	var string es_06;
	if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=3)
	{
	es_06 = "Posiadasz sk³adniki";
	}
	else{
	es_06= "Nie posiadasz sk³adników";
	}	;
	
	var string es_07;
	if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=1)
	{
	es_07 = "Posiadasz sk³adniki";
	}
	else{
	es_07= "Nie posiadasz sk³adników";
	}	;

	var string es_08;
	if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=4)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=2)
	{
	es_08 = "Posiadasz sk³adniki";
	}
	else{
	es_08= "Nie posiadasz sk³adników";
	}	;	
	
	var string es_09;
	if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=6)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=3)
	{
	es_09 = "Posiadasz sk³adniki";
	}
	else{
	es_09= "Nie posiadasz sk³adników";
	};	
	
	var string es_10;
	if (NPC_HasItems(other,ItFo_Plants_Trollberrys_01)>=1)&&(NPC_HasItems(other,ItFo_Plants_mountainmoos_01)>=1)
	{
	es_10 = "Posiadasz sk³adniki";
	}
	else{
	es_10= "Nie posiadasz sk³adników";
	}	;	
	var string es_11;
	if (NPC_HasItems(other,ItFo_Plants_RavenHerb_02)>=1)&&(NPC_HasItems(other,ItFo_Plants_Velayis_01)>=1)
	{
	es_11 = "Posiadasz sk³adniki";
	}
	else{
	es_11 = "Nie posiadasz sk³adników";
	}	;
	var string es_12;
	if (NPC_HasItems(other,ItFo_Plants_Stoneroot_02)>=1)&&(NPC_HasItems(other,ItFo_Plants_Stoneroot_01)>=1)
	{
	es_12 = "Posiadasz sk³adniki";
	}
	else{
	es_12 = "Nie posiadasz sk³adników";
	}	;
	var string es_13;
	if (NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=8)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=10)
	{
	es_13 = "Posiadasz sk³adniki";
	}
	else{
	es_13 = "Nie posiadasz sk³adników";
	}	;
	
	var string es_14;
	if (NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=16)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=20)
	{
	es_14 = "Posiadasz sk³adniki";
	}
	else{
	es_14 = "Nie posiadasz sk³adników";
	}	;
	
	var string es_15;
	if (NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=10)&&(NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=4)
	{
	es_15 = "Posiadasz sk³adniki";
	}
	else{
	es_15 = "Nie posiadasz sk³adników";
	}	;
	
	var string es_16;
	if (NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=20)&&(NPC_HasItems(other,ItFo_Plants_Nightshadow_02)>=4)
	{
	es_16 = "Posiadasz sk³adniki";
	}
	else{
	es_16 = "Nie posiadasz sk³adników";
	}	;
	
	Info_ClearChoices (Info_Alch_Mix);
	Info_Addchoice (Info_Alch_Mix, "(wróæ).", Info_Alch_back);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings("Esencja uzdrawiaj¹ca. ",es_01), Info_Alch_Mix_h1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings("Wyci¹g uzdrawiaj¹cy. ",es_02), Info_Alch_Mix_h2);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings("Eliksir uzdrawiaj¹cy. ",es_03), Info_Alch_Mix_h3);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings("Esencja magicznej energii. ",es_04), Info_Alch_Mix_m1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Wyci¹g magicznej energii. ",es_05), Info_Alch_Mix_m2);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Eliksir magicznej energii. ",es_06), Info_Alch_Mix_m3);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Napój lekkoœci. ",es_07), Info_Alch_Mix_r1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Napój szybkoœci. ",es_08), Info_Alch_Mix_r2);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Napój przyspieszenia. ",es_09), Info_Alch_Mix_r3);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Esencja si³y. ",es_10), Info_Alch_Mix_s1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Esencja zwinnoœci. ",es_11), Info_Alch_Mix_z1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Wyci¹g si³y. ",es_12), Info_Alch_Mix_s2);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Esencja ¿ycia. ",es_13), Info_Alch_Mix_l1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Wyci¹g ¿ycia. ",es_14), Info_Alch_Mix_l2);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Esencja ducha. ",es_15), Info_Alch_Mix_g1);
	Info_Addchoice (Info_Alch_Mix,ConcatStrings( "Wyci¹g ducha. ",es_16), Info_Alch_Mix_g2);


};

FUNC VOID Info_Alch_back ()
{
	Info_ClearChoices (Info_Alch_Mix);
};
	
FUNC VOID Info_Alch_Mix_h1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Herb_01)>=3)&&(NPC_HasItems(other,ItFo_Plants_Herb_02)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_h1_03_01"); //Oto esencja uzdrawiaj¹ca.
		B_GiveInvItems (other,self,ItFo_Plants_Herb_01,3);
		B_GiveInvItems (other,self,ItFo_Plants_Herb_02,1);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Health_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_01,3);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,1);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_h2 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Herb_02)>=3)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_h2_03_01"); //Oto wyci¹g uzdrawiaj¹cy.
		B_GiveInvItems (other,self,ItFo_Plants_Herb_03,1);
		B_GiveInvItems (other,self,ItFo_Plants_Herb_02,3);
		CreateInvItems(self,ItFo_Potion_Health_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Health_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,3);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};

FUNC VOID Info_Alch_Mix_h3 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Herb_02)>=2)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=4)
		{
		AI_Output (self, other,"Info_Alch_Mix_h3_03_01"); //Oto eliksir uzdrawiaj¹cy.
		B_GiveInvItems (other,self,ItFo_Plants_Herb_03,4);
		B_GiveInvItems (other,self,ItFo_Plants_Herb_02,2);
		CreateInvItems(self,ItFo_Potion_Health_03,1);
		B_GiveInvItems (self,other,ItFo_Potion_Health_03,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,4);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,2);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};

FUNC VOID Info_Alch_Mix_m1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_m1_03_01"); //Oto esencja magicznej energii.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,1);
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Mana_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,2);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_m2 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=1)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=2)
		{
		AI_Output (self, other,"Info_Alch_Mix_m2_03_01"); //Oto wyci¹g magicznej energii.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,2);
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Mana_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,2);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,1);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_m3 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=3)
		{
		AI_Output (self, other,"Info_Alch_Mix_m3_03_01"); //Oto eliksir magicznej energii.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,3);
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Mana_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,3);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,2);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_r1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=2)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_r1_03_01"); //Oto napój lekkoœci.
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,1);
		B_GiveInvItems (other,self,ItFo_Plants_Seraphis_01,2);
		CreateInvItems(self,ItFo_Potion_Haste_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Haste_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,2);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_r2 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=4)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=2)
		{
		AI_Output (self, other,"Info_Alch_Mix_r2_03_01"); //Oto napój szybkoœci.
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,2);
		B_GiveInvItems (other,self,ItFo_Plants_Seraphis_01,4);
		CreateInvItems(self,ItFo_Potion_Haste_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Haste_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,2);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,4);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};

FUNC VOID Info_Alch_Mix_r3 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=6)&&(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=3)
		{
		AI_Output (self, other,"Info_Alch_Mix_r3_03_01"); //Oto napój przyspieszenia.
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,3);
		B_GiveInvItems (other,self,ItFo_Plants_Seraphis_01,6);
		CreateInvItems(self,ItFo_Potion_Haste_03,1);
		B_GiveInvItems (self,other,ItFo_Potion_Haste_03,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,3);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,6);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_s1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Trollberrys_01)>=1)&&(NPC_HasItems(other,ItFo_Plants_mountainmoos_01)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_s1_03_01"); //Oto esencja si³y.
		B_GiveInvItems (other,self,ItFo_Plants_Trollberrys_01,1);
		B_GiveInvItems (other,self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Strength_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Strength_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Trollberrys_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_01,1);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_z1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_RavenHerb_02)>=1)&&(NPC_HasItems(other,ItFo_Plants_Velayis_01)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_z1_03_01"); //Oto esencja zrêcznoœci.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_02,1);
		B_GiveInvItems (other,self,ItFo_Plants_Velayis_01,1);
		CreateInvItems(self,ItFo_Potion_Dex_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Dex_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Velayis_01,1);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_s2 ()
{

		if (NPC_HasItems(other,ItFo_Plants_Stoneroot_02)>=1)&&(NPC_HasItems(other,ItFo_Plants_Stoneroot_01)>=1)
		{
		AI_Output (self, other,"Info_Alch_Mix_s2_03_01"); //Oto wyci¹g si³y.
		B_GiveInvItems (other,self,ItFo_Plants_Stoneroot_02,1);
		B_GiveInvItems (other,self,ItFo_Plants_Stoneroot_01,1);
		CreateInvItems(self,ItFo_Potion_Strength_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Strength_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_01,1);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_l1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=8)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=10)
		{
		AI_Output (self, other,"Info_Alch_Mix_l1_03_01"); //Oto esencja ¿ycia.
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,8);
		B_GiveInvItems (other,self,ItFo_Plants_Herb_03,10);
		CreateInvItems(self,ItFo_Potion_Health_Perma_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Health_Perma_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,8);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,10);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_l2 ()
{

		if (NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=16)&&(NPC_HasItems(other,ItFo_Plants_Herb_03)>=20)
		{
		AI_Output (self, other,"Info_Alch_Mix_l2_03_01"); //Oto wyci¹g ¿ycia.
		B_GiveInvItems (other,self,ItFo_Plants_OrcHerb_01,16);
		B_GiveInvItems (other,self,ItFo_Plants_Herb_03,20);
		CreateInvItems(self,ItFo_Potion_Health_Perma_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Health_Perma_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,16);
		Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,20);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



FUNC VOID Info_Alch_Mix_g1 ()
{

		if (NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=10)&&(NPC_HasItems(other,ItFo_Plants_Nightshadow_01)>=4)
		{
		AI_Output (self, other,"Info_Alch_Mix_g1_03_01"); //Oto esencja ducha.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,10);
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_01,4);
		CreateInvItems(self,ItFo_Potion_Mana_Perma_01,1);
		B_GiveInvItems (self,other,ItFo_Potion_Mana_Perma_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,10);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,4);
		Info_ClearChoices (Info_Alch_Mix);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};


FUNC VOID Info_Alch_Mix_g2 ()
{
		if (NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=20)&&(NPC_HasItems(other,ItFo_Plants_Nightshadow_02)>=4)
		{
		AI_Output (self, other,"Info_Alch_Mix_g2_03_01"); //Oto wyci¹g ducha.
		B_GiveInvItems (other,self,ItFo_Plants_RavenHerb_01,20);
		B_GiveInvItems (other,self,ItFo_Plants_Nightshadow_02,4);
		CreateInvItems(self,ItFo_Potion_Mana_Perma_02,1);
		B_GiveInvItems (self,other,ItFo_Potion_Mana_Perma_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,20);
		Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_02,4);
		B_FullStop (hero);
		AI_SetWalkmode (self,NPC_WALK);
		AI_GotoWP	(self, "ALCHEMIK_LAB");
		AI_UseMob (self,"LAB",1);
		B_InterruptMob ("LAB");
		AI_UseMob (self,"LAB",-1);
		AI_GotoNpc(self,other);
		AI_Output (self, other,"Info_Alch_Mix_03_02"); //Nie powiem, trochê siê przy tym zmêczy³em. Wróæ za chwilê...
		Info_ClearChoices (Info_Alch_Mix);
		AI_StopProcessInfos	(self);
		}
		else
		{
		AI_Output (self, other,"Info_Alch_Mix_03_03"); //Nie masz odpowiednich ingrediencji. Wróæ ze wszystkimi sk³adnikami.
		Info_ClearChoices (Info_Alch_Mix);
		};
};



// **************Ask**********************************************

INSTANCE Info_Alch_Ask (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 5;
	condition		= Info_Alch_Ask_Condition;
	information	= Info_Alch_Ask_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Wygl¹dasz na zafrasowanego...";
};                       

FUNC INT Info_Alch_Ask_Condition()
{	
	if (hero.level >= 10) && (Npc_KnowsInfo (other, Info_Alch_Deliver))
	{
		return 1;
	};
};

FUNC VOID Info_Alch_Ask_Info()
{
		AI_Output (other, self,"Info_Alch_Ask_15_00"); //Wygl¹dasz na zafrasowanego. Czy coœ siê sta³o?
		AI_Output (self, other,"Info_Alch_Ask_03_01"); //A, to znowu ty? Nie, wszystko w porz¹dku, tylko...
		AI_Output (other, self,"Info_Alch_Ask_15_02"); //No wykrztuœ to wreszcie. Masz jakiœ problem?
		AI_Output (self, other,"Info_Alch_Ask_03_03"); //I tak, i nie. Wiesz co to andragorn?
		AI_Output (other, self,"Info_Alch_Ask_15_04"); //Jakieœ wino?
		AI_Output (self, other,"Info_Alch_Ask_03_05"); //Widzê, ¿e wszystko kojarzy ci siê tylko z jednym, ale by³eœ blisko.
		AI_Output (self, other,"Info_Alch_Ask_03_06"); //Andragorn to napar lecz¹cy przypad³oœci duszy i umys³u. Jeden z Baali zdaje siê, ¿e jest niestabilny emocjonalnie i Y'Berion prosi³ mnie o uwarzenie czegoœ co pomo¿e temu biedakowi.
		AI_Output (self, other,"Info_Alch_Ask_03_07"); //Niestety nie mogê znaleŸæ dwóch sk³adników...
		AI_Output (other, self,"Info_Alch_Ask_15_08"); //A co to za sk³adniki?
		AI_Output (self, other,"Info_Alch_Ask_03_09"); //To zwyczajne nasiona, ale jestem ju¿ stary i wzrok te¿ odmawia mi czasami pos³uszeñstwa.
		AI_Output (other, self,"Info_Alch_Ask_15_10"); //Nasiona czego?
		AI_Output (self, other,"Info_Alch_Ask_03_11"); //Nasiona czerwonego buka i wysokiego dêbu. Nie jest ³atwo je znaleŸæ.
		AI_Output (other, self,"Info_Alch_Ask_15_12"); //Mo¿e ja spróbujê.
		AI_Output (self, other,"Info_Alch_Ask_03_13"); //Naprawdê zrobi³byœ to? To wspaniale!
		AI_Output (other, self,"Info_Alch_Ask_15_14"); //A jaka bêdzie nagroda?
		AI_Output (self, other,"Info_Alch_Ask_03_15"); //Hmm, podarujê ci jedn¹ miksturê trwale zwiêkszaj¹c¹ twoje umiejêtnoœci. Sam sobie wybierzesz, t¹ która interesuje ciê najbardziej.
		AI_Output (other, self,"Info_Alch_Ask_15_16"); //Niech bêdzie. Wkrótce wrócê z nasionami.
		B_LogEntry	(P_Alchemik, "Alchemik poprosi³ mnie o przyniesienie nasion czerwonego buka i wysokiego dêbu. Potrzebuje ich do uwarzenia jakiegoœ andragornu, który ma pomóc wyleczyæ jednego z Baali z szaleñstwa. Nagrod¹ bêdzie wybrana przeze mnie mikstura podnosz¹ca jak¹œ umiejêtnoœæ.");	
};


// **************Seeds**********************************************

INSTANCE Info_Alch_Seeds (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 6;
	condition		= Info_Alch_Seeds_Condition;
	information	= Info_Alch_Seeds_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Znalaz³em nasiona.";
};                       

FUNC INT Info_Alch_Seeds_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Ask))&&(NPC_HasItems(other,ItFo_Plants_Bloodwood_01)>=1)&&(NPC_HasItems(other,ItFo_Plants_Towerwood_01)>=1)
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Seeds_Info()
{
		AI_Output (other, self,"Info_Alch_Seeds_15_00"); //Znalaz³em wszystkie nasiona.
		AI_Output (self, other,"Info_Alch_Seeds_03_01"); //To wspaniale. Naprawdê, bardzo mi pomog³eœ.
		AI_Output (other, self,"Info_Alch_Seeds_15_02"); //Oto nasiona.
		B_GiveInvItems (other,self,ItFo_Plants_Bloodwood_01,1);
		B_GiveInvItems (other,self,ItFo_Plants_Towerwood_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Towerwood_01,1);
		B_GiveXP(XP*3);
		
		//Edit By Fenix
		ChelpForAlchemik += 1;
		if (ChelpForAlchemik >= 3)
		{
			Log_SetTopicStatus	(P_Alchemik, LOG_SUCCESS);
		};
		
		AI_Output (self, other,"Info_Alch_Seeds_03_03"); //Dziêkujê. A teraz zgodnie z umow¹ wybierz sobie nagrodê.
		Info_ClearChoices (Info_Alch_Seeds);
		Info_AddChoice (Info_Alch_Seeds, "Wybieram esencjê ¿ycia.", Info_Alch_Seeds_HP);
		Info_AddChoice (Info_Alch_Seeds, "Wybieram esencjê ducha.", Info_Alch_Seeds_Mana);
		Info_AddChoice (Info_Alch_Seeds, "Wybieram esencjê si³y.", Info_Alch_Seeds_Str);
		Info_AddChoice (Info_Alch_Seeds, "Wybieram esencjê zrêcznoœci.", Info_Alch_Seeds_Dex);
};

// --------------------------------------------------------------------

FUNC VOID Info_Alch_Seeds_HP()
{	
	AI_Output (other, self,"Info_Alch_Seeds_HP_15_01"); //Wybieram esencjê ¿ycia.
	AI_Output (self, other,"Info_Alch_Seeds_HP_03_02"); //Bardzo dobry wybór. Dziêki tej miksturze poprawisz swoj¹ witalnoœæ.
	CreateInvItems(self,ItFo_Potion_Health_Perma_01,1);
	B_GiveInvItems (self,other,ItFo_Potion_Health_Perma_01,1);
	B_LogEntry	(P_Alchemik, "Alchemik dotrzyma³ s³owa i w zamian za nasiona podarowa³ mi miksturê.");	
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Alch_Seeds_Mana()
{	
	AI_Output (other, self,"Info_Alch_Seeds_Mana_15_01"); //Wybieram esencjê ducha.
	AI_Output (self, other,"Info_Alch_Seeds_Mana_03_02"); //Bardzo dobry wybór. Dziêki tej miksturze poprawisz swoj¹ wiedzê duchow¹.
	CreateInvItems(self,ItFo_Potion_Mana_Perma_01,1);
	B_GiveInvItems (self,other,ItFo_Potion_Mana_Perma_01,1);
	B_LogEntry	(P_Alchemik, "Alchemik dotrzyma³ s³owa i w zamian za nasiona podarowa³ mi miksturê.");
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Alch_Seeds_Str()
{	
	AI_Output (other, self,"Info_Alch_Seeds_Str_15_01"); //Wybieram esencjê si³y.
	AI_Output (self, other,"Info_Alch_Seeds_Str_03_02"); //Bardzo dobry wybór. Dziêki tej miksturze poprawisz swoj¹ si³ê.
	CreateInvItems(self,ItFo_Potion_Strength_01,1);
	B_GiveInvItems (self,other,ItFo_Potion_Strength_01,1);
	B_LogEntry	(P_Alchemik, "Alchemik dotrzyma³ s³owa i w zamian za nasiona podarowa³ mi miksturê.");
	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Alch_Seeds_Dex()
{	
	AI_Output (other, self,"Info_Alch_Seeds_Dex_15_01"); //Wybieram esencjê zrêcznoœci.
	AI_Output (self, other,"Info_Alch_Seeds_Dex_03_02"); //Bardzo dobry wybór. Dziêki tej miksturze poprawisz swoj¹ zrêcznoœæ.
	CreateInvItems(self,ItFo_Potion_Dex_01,1);
	B_GiveInvItems (self,other,ItFo_Potion_Dex_01,1);
	B_LogEntry	(P_Alchemik, "Alchemik dotrzyma³ s³owa i w zamian za nasiona podarowa³ mi miksturê.");
	AI_StopProcessInfos	(self);
};

//DragonBlood_Mixture

// **************Dragon blood**********************************************

INSTANCE Info_Alch_Blood (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 7;
	condition		= Info_Alch_Blood_Condition;
	information	= Info_Alch_Blood_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Widzia³eœ kiedyœ coœ takiego?";
};                       

FUNC INT Info_Alch_Blood_Condition()
{	
if (Npc_KnowsInfo (other, Info_Alch_Deliver))&&(NPC_HasItems(other,DragonBlood)>=1)
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Blood_Info()
{
		AI_Output (other, self,"Info_Alch_Blood_15_00"); //Widzia³eœ kiedyœ coœ takiego?
		AI_Output (self, other,"Info_Alch_Blood_03_01"); //Na Adanosa, to przecie¿ fiolka ze smocz¹ krwi¹. Sk¹d to masz?
		AI_Output (other, self,"Info_Alch_Blood_15_02"); //Hmm, to raczej retoryczne pytanie...
		AI_Output (self, other,"Info_Alch_Blood_03_03"); //Zabi³eœ smoka! Myœla³em, ¿e te bestie ju¿ dawno wyginê³y. Niesamowite...
		AI_Output (other, self,"Info_Alch_Blood_15_04"); //Da³byœ radê zrobiæ coœ z tej krwi?
		AI_Output (self, other,"Info_Alch_Blood_03_05"); //Masz na myœli miksturê?
		AI_Output (other, self,"Info_Alch_Blood_15_06"); //Mniej wiêcej.
		AI_Output (self, other,"Info_Alch_Blood_03_07"); //Mój mistrz zdradzi³ mi kiedyœ recepturê na wywar z krwi smoka, bo by³ pewien, ¿e i tak z niego nie skorzystam.
		AI_Output (self, other,"Info_Alch_Blood_03_08"); //Ale ten stary ³ajdak ci¹gle by³ pijany, wiêc nie wiem czy w ogóle wiedzia³ co mówi.
		AI_Output (other, self,"Info_Alch_Blood_15_09"); //Jestem gotów zaryzykowaæ. Co chcesz za przyrz¹dzenie tej mikstury?
		AI_Output (self, other,"Info_Alch_Blood_03_10"); //Ja? Nic. Zabi³eœ smoka. Wystarczy mi œwiadomoœæ tego, ¿e pozna³em tak wspania³ego wojownika.
		AI_Output (self, other,"Info_Alch_Blood_03_11"); //Zrobiê to za darmo. Bêdê jednak potrzebowa³ jeszcze dwóch sk³adników.
		AI_Output (other, self,"Info_Alch_Blood_15_12"); //Mianowicie?
		AI_Output (self, other,"Info_Alch_Blood_03_13"); //Potrzebujê bia³ej i czarnej per³y do procesu destylacji krwi. 
		AI_Output (self, other,"Info_Alch_Blood_03_14"); //W sumie bêdê jeszcze potrzebowa³ alkoholu, siarki i zaklêcia uzdrawiaj¹cego, ale z tym ju¿ sobie poradzê.
		AI_Output (other, self,"Info_Alch_Blood_15_15"); //Dobra, postaram siê poszukaæ tych pere³.
		AI_Output (self, other,"Info_Alch_Blood_03_16"); //Aha. Zachowam tê fiolkê. Zakopiê to w ziemi, ¿eby krew siê dostatecznie sch³odzi³a.
		B_GiveInvItems (other,self,DragonBlood,1);
		Npc_RemoveInvItems(self,DragonBlood,1);
		B_LogEntry	(P_Alchemik, "Alchemik przyrz¹dzi dla mnie wywar z krwi smoka, potrzebuje jednak jeszcze dwóch sk³adników: bia³ej i czarnej per³y. Ciekawe gdzie ja je znajdê?");
	

};

// **************perls**********************************************

var int blood_wait;

INSTANCE Info_Alch_Blood1 (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 8;
	condition		= Info_Alch_Blood1_Condition;
	information	= Info_Alch_Blood1_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Znalaz³em per³y.";
};                       

FUNC INT Info_Alch_Blood1_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Alch_Blood))&&(NPC_HasItems(other,DARKPEARL)>=1)&&(NPC_HasItems(other,WHITEPEARL)>=1)
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Blood1_Info()
{
		AI_Output (other, self,"Info_Alch_Blood1_15_00"); //Znalaz³em per³y. Oto one.
		B_GiveInvItems (other,self,DARKPEARL,1);
		B_GiveInvItems (other,self,WHITEPEARL,1);
		Npc_RemoveInvItems(self,DARKPEARL,1);
		Npc_RemoveInvItems(self,WHITEPEARL,1);
		B_GiveXP(XP*4);
		AI_Output (self, other,"Info_Alch_Blood1_03_01"); //To œwietnie. Krew ju¿ dostatecznie stê¿a³a. PrzyjdŸ po wywar za dwa dni. Je¿eli nie prze¿yjê tego eksperymentu, to wszystko co tu znajdziesz jest twoje.
		AI_Output (other, self,"Info_Alch_Blood1_15_02"); //Dlaczego mia³byœ nie prze¿yæ?
		AI_Output (self, other,"Info_Alch_Blood1_03_03"); //Ze smocz¹ krwi¹ nigdy nie wiadomo... Ale b¹dŸ dobrej myœli. Jestem alchemikiem od trzydziestu lat i nadal mam wszystkie koñczyny, wiêc chyba sobie poradzê.
		AI_Output (other, self,"Info_Alch_Blood1_15_04"); //Mam nadziejê, ¿e wiesz co robisz. Powodzenia...
		blood_wait = B_SetDayTolerance()+2;
		B_LogEntry	(P_Alchemik, "Alchemik zabra³ siê za przyrz¹dzanie wywaru ze smoczej krwi. Zajmie mu to dwa dni wiêc mogê trochê odpocz¹æ. Mam nadziejê, ¿e prze¿yje ten eksperyment, bo nie chcia³bym mieæ go na sumieniu.");
};

// **************blood mixtures**********************************************



INSTANCE Info_Alch_Blood2 (C_INFO)
{
	npc		= Non_2008_Alchemik;
	condition		= Info_Alch_Blood2_Condition;
	information	= Info_Alch_Blood2_Info;
	important		= 1;
	permanent	= 0;
};                       

FUNC INT Info_Alch_Blood2_Condition()
{
if (Npc_KnowsInfo (other, Info_Alch_Blood1))&&(blood_wait <= (Wld_GetDay()))
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Blood2_Info()
{

		AI_Output (self, other,"Info_Alch_Blood2_03_00"); //Wywar jest ju¿ gotowy, proszê. Tylko nie rozbij...
		CreateInvItems(self,DragonBlood_Mixture,1);
		B_GiveInvItems (self,other,DragonBlood_Mixture,1);
		AI_Output (self, other,"Info_Alch_Blood2_03_01"); //Muszê ciê jednak ostrzec. Mikstura jest bardzo niestabilna i masz nik³¹ szansê na to, ¿e prze¿yjesz po wypiciu tego wywaru.
		AI_Output (other, self,"Info_Alch_Blood2_15_02"); //Jak to, nik³¹ szansê? Dlaczego?
		AI_Output (self, other,"Info_Alch_Blood2_03_03"); //Smocza krew to niezwykle ¿r¹ca substancja. Per³y co prawda zneutralizowa³y z³¹ aurê, ale ludzki organizm jest antagonist¹ w stosunku do krwi smoka.
		AI_Output (other, self,"Info_Alch_Blood2_15_04"); //Czyli co? Lepiej to wylaæ albo wyrzuciæ?
		AI_Output (self, other,"Info_Alch_Blood2_03_05"); //To ju¿ zale¿y od ciebie. Ale pamiêtaj, ¿e ja ciê ostrzega³em.
		AI_Output (other, self,"Info_Alch_Blood2_15_06"); //A jak oceniasz moje szanse na prze¿ycie po wypiciu wywaru?
		AI_Output (self, other,"Info_Alch_Blood2_03_07"); //Mam byæ szczery?
		AI_Output (other, self,"Info_Alch_Blood2_15_08"); //Jak najbardziej.
		AI_Output (self, other,"Info_Alch_Blood2_03_09"); //Jesteœ silnym mê¿czyzn¹. Myœlê, ¿e 5:1 na twoj¹... niekorzyœæ.
		AI_Output (other, self,"Info_Alch_Blood2_15_10"); //Cholera to trochê ma³o. A jakie jest dzia³anie wywaru?
		AI_Output (self, other,"Info_Alch_Blood2_03_11"); //Je¿eli twój organizm poradzi sobie z mikstur¹ to prawdopodobnie odziedziczysz jak¹œ cechê smoka. Nie wiem na pewno, to tylko przypuszczenia...
		AI_Output (other, self,"Info_Alch_Blood2_15_12"); //Dobra, raz kozie œmieræ...
		B_GiveXP(XP*2);
		B_LogEntry	(P_Alchemik, "Alchemik przyrz¹dzi³ wywar z krwi smoka, ale muszê byæ bardzo ostro¿ny, bo ta cholerna mikstura jest bardzo niestabilna. Mo¿e lepiej bêdzie jej nie ruszaæ?");

		//Edit By Fenix
		ChelpForAlchemik += 1;
		if (ChelpForAlchemik >= 3)
		{
			Log_SetTopicStatus	(P_Alchemik, LOG_SUCCESS);
		};
		
		AI_StopProcessInfos	(self);
};


//****************************JAIL********************

INSTANCE Info_Alch_Jail (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 18;
	condition		= Info_Alch_Jail_Condition;
	information	= Info_Alch_Jail_Info;
	important		= 0;
	permanent	= 0;
	description 	= "No proszê, kogo to znalaz³em!";
};                       

FUNC INT Info_Alch_Jail_Condition()
{	
if (alchemik_disappear == TRUE)
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Jail_Info()
{
	B_GiveXP(XP*5);
	AI_Output (other, self,"Info_Alch_Jail_15_00"); //No proszê, kogo to znalaz³em!
	if (Npc_KnowsInfo (other, Info_Alch_Hello))
	{
	AI_Output (self, other,"Info_Alch_Jail_03_01"); //Witaj przyjacielu! Nawet nie wiesz jak siê cieszê na widok Twojej zakazanej gêby!
	AI_Output (other, self,"Info_Alch_Jail_15_02"); //Co ty tutaj robisz i jak siê tutaj znalaz³eœ?
	AI_Output (self, other,"Info_Alch_Jail_03_03"); //Co robiê? Czekam na œmieræ do cholery! Nie wiem dlaczego ci troglodyci trzymaj¹ mnie tutaj ¿ywego. Mo¿e skoñczy³y im siê zapasy ¿ywnoœci...
	AI_Output (self, other,"Info_Alch_Jail_03_04"); //A trafi³em tu przez w³asn¹ g³upotê. Zbiera³em zio³a i nawet nie zauwa¿y³em kiedy znalaz³em siê na terytorium tych w³ochatych ma³p.
	AI_Output (self, other,"Info_Alch_Jail_03_05"); //No, a resztê to ju¿ mo¿esz sobie sam dopowiedzieæ.
	AI_Output (self, other,"Info_Alch_Jail_03_06"); //Dziêkujê przyjacielu za uwolnienie. Dalej ju¿ jakoœ sobie poradzê. 
	AI_Output (self, other,"Info_Alch_Jail_03_07"); //Znam pewne przejœcie przez góry.
	AI_Output (self, other,"Info_Alch_Jail_03_08"); //O cholera, co to za odg³osy...
	AI_Output (self, other,"Info_Alch_Jail_03_09"); //Ktoœ tutaj idzie...
	alchemik_disappear = LOG_SUCCESS;
	B_LogEntry	(P_Alchemik, "Odnalaz³em Alchemika! Orkowie uwiêzili go w swoim obozie. Jednak rozmowê przerwa³ nam dozorca wiêŸniów, a Alchemik skorzysta³ z okazji i taktycznie siê ulotni³...");
	Wld_InsertNpc				(Non_2038_SlaveMaster,"ORK_MEET");
	AI_StopProcessInfos	(self);
	}
	else
	{
	AI_Output (self, other,"Info_Alch_Jail_03_11"); //Kim jesteœ i co robisz w tych lochach?
	AI_Output (self, other,"Info_Alch_Jail_03_12"); //Co robiê? Czekam na œmieræ do cholery! Nie wiem dlaczego ci troglodyci trzymaj¹ mnie tutaj ¿ywego. Mo¿e skoñczy³y im siê zapasy ¿ywnoœci...
	AI_Output (self, other,"Info_Alch_Jail_03_13"); //A trafi³em tu przez w³asn¹ g³upotê. Zbiera³em zio³a i nawet nie zauwa¿y³em kiedy znalaz³em siê na terytorium tych w³ochatych ma³p.
	AI_Output (self, other,"Info_Alch_Jail_03_14"); //No, a resztê to ju¿ mo¿esz sobie sam dopowiedzieæ.
	AI_Output (self, other,"Info_Alch_Jail_03_15"); //Dziêkujê ci nieznajomy za uwolnienie. Dalej ju¿ jakoœ sobie poradzê. 
	AI_Output (self, other,"Info_Alch_Jail_03_16"); //Znam pewne przejœcie przez góry.
	AI_Output (self, other,"Info_Alch_Jail_03_17"); //Jak prze¿yjesz, to znajdziesz mnie na p³askowy¿u ponad opuszczon¹ kopalni¹. Wtedy mo¿e...
	AI_Output (self, other,"Info_Alch_Jail_03_18"); //O cholera, co to za odg³osy...
	AI_Output (self, other,"Info_Alch_Jail_03_19"); //Ktoœ tutaj idzie...
	Log_CreateTopic	(P_Alchemik, LOG_MISSION);
	Log_SetTopicStatus	(P_Alchemik, LOG_RUNNING);
	B_LogEntry	(P_Alchemik, "Uwolni³em jakiegoœ cz³owieka zamkniêtego w lochach, w obozie orków.  Powiedzia³, ¿e znajdê go na p³askowy¿u ponad opuszczon¹ kopalni¹ i taktycznie siê ulotni³...");
	Wld_InsertNpc				(Non_2038_SlaveMaster,"ORK_MEET");
	alchemik_disappear = LOG_SUCCESS;
	AI_StopProcessInfos	(self);
	};	

};

//*************Thx*******************

INSTANCE Info_Alch_Gift (C_INFO)
{
	npc		= Non_2008_Alchemik;
	condition		= Info_Alch_Gift_Condition;
	information	= Info_Alch_Gift_Info;
	important		= 1;
	permanent	= 0;
};                       

FUNC INT Info_Alch_Gift_Condition()
{	
if (Npc_KnowsInfo (other, Info_Alch_Jail))&&(alchemik_disappear == LOG_SUCCESS)	&& (Npc_IsDead(Non_2038_SlaveMaster))
	{	
	return 1;
	};
};

FUNC VOID Info_Alch_Gift_Info()
{
	AI_Output (self, other,"Info_Alch_Gift_03_00"); //Wybacz przyjacielu z tego wszystkiego zapomnia³em ci podziêkowaæ.
	B_GiveXP(XP*5);
	AI_Output (self, other,"Info_Alch_Gift_03_01"); //Uratowa³eœ moje g³upie dupsko. WeŸ proszê ten klucz.
	CreateInvItems(self,Mild_Key,1);
	B_GiveInvItems (self,other,Mild_Key,1);
	AI_Output (self, other,"Info_Alch_Gift_03_02"); //Otworzysz nim skrzyniê w opuszczonym tartaku. Mo¿esz zatrzymaæ wszystko co tam znajdziesz.
	AI_Output (self, other,"Info_Alch_Gift_03_03"); //Wiesz co? WeŸ te¿ tê recepturê. Nauczysz siê z niej jak warzyæ ró¿ne napitki. Byæ mo¿e ta wiedza na coœ ci siê przyda.
	CreateInvItems(self,Drink_List,1);
	B_GiveInvItems (self,other,Drink_List,1);
	AI_Output (self, other,"Info_Alch_Gift_03_04"); //Potrzebujesz tylko sto³u alchemicznego, menzurki i trochê cierpliwoœci. Jeszcze raz dziêkujê za uratowanie ¿ycia.
	AI_Output (other, self,"Info_Alch_Gift_15_05"); //Mia³eœ szczêœcie, ¿e lubiê wtykaæ nos w nie swoje sprawy i tym razem pad³o na orków.
	AI_Output (self, other,"Info_Alch_Gift_03_06"); //Szczêœcie? To by³o b³ogos³awieñstwo bogów. Nigdy o tym nie zapomnê.
	AI_Output (other, self,"Info_Alch_Gift_15_07"); //Ca³a przyjemnoœæ po mojej stronie.
	
	//Edit By Fenix
	ChelpForAlchemik += 1;
	if (ChelpForAlchemik >= 3)
	{
		Log_SetTopicStatus	(P_Alchemik, LOG_SUCCESS);
	};
	
	B_LogEntry	(P_Alchemik, "Alchemik podziêkowa³ mi za uratowane ¿ycie. Wrêczy³ mi klucz do skrzyni znajduj¹cej siê w opuszczonym tartaku. Mam nadziejê, ¿e znajdê tam coœ wiêcej ni¿ tylko kurz i pleœñ. Podarowa³ mi te¿ recepturê z której nauczê siê warzyæ napitki. Aby u¿yæ sto³u potrzebujê pustej flaszki.");
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,	"START");
	AI_Teleport  (self, "SPAWN_ALCHEMIK");
};




//ItFo_Plants_Flameberry_01 - ogniocierñ, ItFo_Plants_Seraphis_01 - serafis, ItFo_Plants_Velayis_01 - Velais, ItFo_Plants_mountainmoos_01 - górski mech,
//ItFo_Plants_Nightshadow_01 - psianka, ItFo_Plants_Nightshadow_02 - Kocianka, ItFo_Plants_OrcHerb_01 - orkowe ziele,
//ItFo_Plants_RavenHerb_01 - krucze ziele, ItFo_Plants_RavenHerb_02 - czarne ziele, ItFo_Plants_Stoneroot_01 - twardzeñ,
//ItFo_Plants_Stoneroot_02 - Dragrot, ItFo_Plants_Trollberrys_01 - trolest, 
//ItFo_Plants_Herb_01-03 - zio³a uzdrawiaj¹ce,
//ItFo_Plants_Bloodwood_01 - nasienie czerw. buka, 
//ItFo_Plants_Towerwood_01 - nasienie wysokiego dêby



///////////////////////////////////////////////////////////

// ************************************************************
// 		Leki ;]
// ************************************************************

INSTANCE Info_Alch_Lek (C_INFO)
{
	npc		= Non_2008_Alchemik;
	nr		= 1;
	condition		= Info_Alch_Lek_Condition;
	information	= Info_Alch_Lek_Info;
	important		= 0;
	permanent	= 0;
	description 	= "Przysy³a mnie Dorm.";
};                       

FUNC INT Info_Alch_Lek_Condition()

{
 IF	(DORM==LOG_RUNNING) &&	(Npc_KnowsInfo(other,Info_Alch_Hello))
{	

		return 1;

};
};
FUNC VOID Info_Alch_Lek_Info()
{
		AI_Output (other, self,"Info_Alch_Lek_15_00"); //Przysy³a mnie Dorm.
		AI_Output (self, other,"Info_Alch_Lek_03_01"); //Dorm? Hmm... Aha! Ju¿ wiem.
		AI_Output (self, other,"Info_Alch_Lek_15_02"); //To ten kopacz, który przychodzi³ do mnie po lekarstwa. Czego on znowu chce i dlaczego sam do mnie nie przyszed³?
		AI_Output (other, self,"Info_Alch_Lek_03_03"); //Dorm siedzi w obozie stra¿ników w kopalni. Nie mo¿e siê ruszyæ, wiêc wys³a³ mnie po jakieœ lekarstwa.
		AI_Output (self, other,"Info_Alch_Lek_03_04"); //Mówi³em temu g³upcowi ¿eby nie szed³ do Starego Obozu, ale ten dureñ mnie nie s³ucha³.
		AI_Output (self, other,"Info_Alch_Lek_03_05"); //No có¿, nie móg³ trafiæ w gorsze miejsce.
		AI_Output (other, self,"Info_Alch_Lek_15_06"); //Co z lekarstwem?
		AI_Output (self, other,"Info_Alch_Lek_03_07"); //Dam ci ten lek, za 60 bry³ek rudy.
		AI_Output (other, self,"Info_Alch_Lek_15_08"); //Mam ci p³aciæ?
		AI_Output (self, other,"Info_Alch_Lek_03_09"); //Ale¿ oczywiœcie. Nic. No, prawie nic nie ma za darmo ch³opcze.
		
	
		Log_SetTopicStatus	(CH1_Lek, LOG_RUNNING);
		B_LogEntry		(CH1_Lek, "Alchemik ¿yczy sobie 60 bry³ek rudy za lekarstwo. Chyba tego nie kupiê.");	
		
		
};


//////////////////////////////////////////////////////////// 
//////////////             co 
/////////////////////////////////////////////////////// 
instance Info_Alch_Lek_kup   (C_INFO) 
{ 
   npc     = Non_2008_Alchemik; 
   nr          =654; 
   condition   =   Info_Alch_Lek_kup_condition; 
   information     = Info_Alch_Lek_kup_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Oto 60 bry³ek rudy.";
}; 
 
func int Info_Alch_Lek_kup_condition () 
{ 
  	if ( (DORM == LOG_RUNNING) ) && (Npc_KnowsInfo(hero,Info_Alch_Lek)) && (NPC_HasItems(other,ItMiNugget)>=60)
   { 
   return TRUE; 
   }; 
}; 
 
func void Info_Alch_Lek_kup_info () 
{ 
   AI_Output (other,self,"Info_Alch_Lek_kup_00");  //Oto 60 bry³ek rudy, a teraz daj to lekarstwo.
   AI_Output (self, other,"Info_Alch_Lek_kup_01");  //Zaprawdê, dziwnym jesteœ cz³owiekiem.
   AI_Output (self,other,"Info_Alch_Lek_kup_02");  //Przejœæ taki kawa³ drogi i jeszcze p³aciæ za lekarstwo dla kogoœ innego.
   AI_Output (self, other,"Info_Alch_Lek_kup_03");  //Rzadko widujê tak¹ bezinteresownoœæ w Koloni. W sumie, to jeszcze nigdy czegoœ takiego nie widzia³em.
   AI_Output (other,self,"Info_Alch_Lek_kup_04");  //Dobra, przestañ glêdziæ i daj mi to lekarstwo.
   B_GiveInvItems(other,self,itminugget,60);
   CreateInvItems(self, LekarstwoDorma,1);
		B_GiveInvItems(self, other, LekarstwoDorma,1);
 DORM = LOG_RUNNING;
  	B_LogEntry		(CH1_Lek, "A jednak kupi³em lekarstwo dla Dorma. Mo¿e dostanê jak¹œ nagrodê?");
 B_GiveXP(100);
 	
}; 

