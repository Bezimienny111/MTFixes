// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int help1;

INSTANCE Info_Quentin_EXIT(C_INFO)
{
	npc			= 		ORG_858_Quentin;
	nr			= 999;
	condition			= 		Info_Quentin_EXIT_Condition;
	information			= 		Info_Quentin_EXIT_Info;
	permanent			= 		1;
	description 		= 		DIALOG_ENDE;
};                       

FUNC INT Info_Quentin_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Quentin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



var int quentin_none;


// ************************Quentin hello************************************

INSTANCE Info_Quentin_Hello (C_INFO)
{
	npc		= ORG_858_Quentin;
	nr			= 1;
	condition		= Info_Quentin_Hello_Condition;
	information		= Info_Quentin_Hello_Info;
	permanent		= 1;
	important		= 0;
	description = "�adny obozik.";
};                       

FUNC INT Info_Quentin_Hello_Condition()
{	
		return 1;

};
FUNC VOID Info_Quentin_Hello_Info()
{

	if (ThangorProof==LOG_RUNNING)&&(ThangorDeliver == TRUE)&&(quentin_hi == FALSE)
	{
	quentin_hi = TRUE;
	quentin_none = TRUE;
	help1=100;
	AI_Output (other,self,"Info_Quentin_Hello_15_00"); //�adnie si� tutaj urz�dzili�cie.
	AI_Output (self, other,"Info_Quentin_Hello_07_01"); //Co ty pierdolisz? Sk�d si� tu w og�le wzi��e� gnojku?!
	AI_Output (other,self,"Info_Quentin_Hello_15_02"); //Przysy�a mnie Thangor.
	AI_Output (self, other,"Info_Quentin_Hello_07_03"); //To pewnie znasz has�o...
	AI_Output (other, self,"Info_Quentin_Hello_15_04"); //GOMEZ TO DZIWKA RHOBARA!
	AI_Output (self, other,"Info_Quentin_Hello_07_05"); //Ano masz racj�...
	if (corect_answer == TRUE)
	{
	AI_Output (self, other,"Info_Quentin_Hello_07_06"); //Kosa ci� przepu�ci�? Mia�e� szcz�cie, bo on przewa�nie najpierw zabija, a dopiero p�niej pyta.
	};
	AI_Output (other, self,"Info_Quentin_Hello_15_07"); //Jestem kurierem Thangora i mam dla ciebie przesy�k�...
	AI_Output (self, other,"Info_Quentin_Hello_07_08"); //No w ko�cu! A ju� mia�em opyli� rud� tym cholernym magom z Nowego Obozu. Dawaj to!
//*******from Anghar***********	
	B_GiveInvItems(other,self,ItMw_1H_Sword_Long_01, help1/10);
	Npc_RemoveInvItems(self,ItMw_1H_Sword_Long_01, help1/10);
//*******from Monk***********	
	B_GiveInvItems(other,self,drugs,1);
	Npc_RemoveInvItems(self,drugs,1);
//*******from Korth***********	
	B_GiveInvItems(other,self,ItMi_GoldCup,4);
	B_GiveInvItems(other,self,ItMi_GoldChalice,4);
	B_GiveInvItems(other,self,ItMi_GoldRing,2);
//*******from Servin***********	
	B_GiveInvItems(other,self,ItFoMuttonRaw,help1/2-10);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,help1/2-10);
	B_GiveInvItems(other,self,ItAt_Wolf_01,help1/5);
	Npc_RemoveInvItems(self,ItAt_Wolf_01,help1/5);
	B_GiveInvItems(other,self,ItFoBooze,help1/5+10);
	Npc_RemoveInvItems(self,ItFoBooze,help1/5+10);
	B_GiveInvItems(other,self,ItRw_Bow_Long_01,help1/20);
	Npc_RemoveInvItems(self,ItRw_Bow_Long_01,help1/20);
	B_GiveXP(XP*5);
	help1=0;
	B_LogEntry (P_OHCamp, "Przekaza�em Quentinowi ca�� przesy�k�: 10 d�ugich mieczy, paczk� ziela, z�ot� zastaw� i 2 z�ote pier�cienie, 40 sztuk mi�sa, 20 wilczych sk�r, 30 butelek ry��wki i 5 d�ugich �uk�w. Uff, troch� tego by�o.");
	AI_Output (other, self,"Info_Quentin_Hello_15_09"); //Teraz twoja kolej.
	AI_Output (self, other,"Info_Quentin_Hello_07_10"); //Bo co gnojku? Mo�esz mi skoczy� na dyszel wyw�oko!
	AI_Output (self, other,"Info_Quentin_Hello_07_11"); //Ci cholerni przemytnicy dali za ma�o towaru. Powiedz temu dupkowi Thangorowi, �e ju� nie potrzebuj� jego z�omu.
	AI_Output (self, other,"Info_Quentin_Hello_07_12"); //Mam ju� wszystko co potrzeba. A ty lepiej st�d spadaj, bo ka�� ch�opakom si� tob� zaj��...
	AI_Output (other, self,"Info_Quentin_Hello_15_13"); //A co z transportem rudy dla Thangora?
	AI_Output (self, other,"Info_Quentin_Hello_07_14"); //Ano g�wno! Zaczynasz mnie wkurza�. Wynocha, bo poszczuj� moimi psami bura suko!
	B_LogEntry (P_OHCamp, "Niech to szlag trafi. Ten pieprzony Quentin najzwyczajniej w �wiecie obrobi� mnie z ca�ego towaru. Co ja teraz powiem Thangorowi?");
	quentinattack=false;
	AI_StopProcessInfos	(self);
	}
	else if (quentin_none == FALSE)
	{
	quentin_none = TRUE;
	AI_Output (other,self,"Info_Quentin_Hello_15_15"); //�adnie si� tutaj urz�dzili�cie.
	AI_Output (self, other,"Info_Quentin_Hello_07_16"); //Co ty pierdolisz? Sk�d si� tu w og�le wzi��e� gnojku?!
	AI_Output (other,self,"Info_Quentin_Hello_15_17"); //Tak sobie zwiedzam okolic�. Poczu�em dym z ogniska i pomy�la�em...
	AI_Output (self, other,"Info_Quentin_Hello_07_18"); //�e wpadniesz sobie do przyjaci� na pieczyste? Tak?
	AI_Output (other,self,"Info_Quentin_Hello_15_19"); //A co, przeszkadzam?
	AI_Output (self, other,"Info_Quentin_Hello_07_20"); //Nie, wcale... Co za kretyn.
	AI_StopProcessInfos	(self);
	}
	else if (quentin_none == TRUE)
	{
	AI_Output (self, other,"Info_Quentin_Hello_07_21"); //Spadaj durniu!
	AI_StopProcessInfos	(self);
	};
};

// ************************Quentin hello************************************

INSTANCE Info_Quentin_Attack (C_INFO)
{
	npc		= ORG_858_Quentin;
	nr			= 2;
	condition		= Info_Quentin_Attack_Condition;
	information		= Info_Quentin_Attack_Info;
	permanent		= 0;
	important		= 0;
	description = "Chyba mnie nie zrozumia�e�!";
};                       

FUNC INT Info_Quentin_Attack_Condition()
{	
	if (quentin_hi == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Quentin_Attack_Info()
{
	AI_Output (other, self,"Info_Quentin_Attack_15_01"); //Tak �atwo si� mnie nie pozb�dziesz!
	AI_Output (self, other,"Info_Quentin_Attack_07_02"); //To si� zaraz oka�e. Ch�opaki, wywr��cie tego przyg�upa na lew� stron�!
	quentinattack=true;
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_Attack,0,"");
	B_SetRoguesToHostile ();
	 QuentinBanditsBecomeHostile ();
If (Npc_KnowsInfo (other, Info_Korth_Attack))&& (!Npc_KnowsInfo (other, Info_Korth_Late))
{
	Npc_SetTarget (Non_2003_Korth,self);
	AI_StartState (Non_2003_Korth,ZS_Attack,0,"");
};

};


// ************************Quentin KolRing************************************

INSTANCE Info_Quentin_KolRing (C_INFO)
{
	npc		= ORG_858_Quentin;
	nr			= 13;
	condition		= Info_Quentin_KolRing_Condition;
	information		= Info_Quentin_KolRing_Info;
	permanent		= 0;
	important		= 0;
	description = "Szukam pewnego pier�cienia.";
};                       

FUNC INT Info_Quentin_KolRing_Condition()
{	
	if (Npc_KnowsInfo (other, Info_BaalKolis_ring))	
	{
		return 1;
	};
};
FUNC VOID Info_Quentin_KolRing_Info()
{
	B_GiveXP (Xp*2);
	if (ThangorProof==LOG_RUNNING)
	{
	AI_Output (other, self,"Info_Quentin_KolRing_15_00"); //Szukam pewnego pier�cienia.
	AI_Output (self, other,"Info_Quentin_KolRing_07_01"); //Zobaczymy. Mo�e jak mi si� zechce, to dostaniesz pier�cie�.
	AI_Output (self, other,"Info_Quentin_KolRing_07_02"); //A teraz zje�d�aj.
	AI_Output (other, self,"Info_Quentin_KolRing_15_03"); //Jeszcze tu wr�c�.
	B_LogEntry( kol_Ring, "Quentin udawa�, �e nic nie wie o pier�cieniu. Mam do niego wr�ci� jak b�d� mia� konkretn� spraw�. Ciekawe co chcia� przez to powiedzie�? Mo�e na razie lepiej go nie zabija�.");
	}
	else
	{
	AI_Output (other, self,"Info_Quentin_KolRing_15_04"); //Szukam pewnego pier�cienia.
	AI_Output (self, other,"Info_Quentin_KolRing_07_05"); //Mam w dupie to czego szukasz. Wr�� jak b�dziesz mia� do mnie jaki� konkretny interes.
	AI_Output (self, other,"Info_Quentin_KolRing_07_06"); //Nie prowadz� inwentarza rzeczy zaginionych. A teraz zje�d�aj.
	AI_Output (other, self,"Info_Quentin_KolRing_15_07"); //Jeszcze tu wr�c�.
	B_LogEntry( kol_Ring, "Quentin udawa�, �e nic nie wie o pier�cieniu. Mam do niego wr�ci� jak b�d� mia� konkretn� spraw�. Ciekawe co chcia� przez to powiedzie�? Mo�e na razie lepiej go nie zabija�.");
	
	};
};