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
	description = "£adny obozik.";
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
	AI_Output (other,self,"Info_Quentin_Hello_15_00"); //£adnie siê tutaj urz¹dziliœcie.
	AI_Output (self, other,"Info_Quentin_Hello_07_01"); //Co ty pierdolisz? Sk¹d siê tu w ogóle wzi¹³eœ gnojku?!
	AI_Output (other,self,"Info_Quentin_Hello_15_02"); //Przysy³a mnie Thangor.
	AI_Output (self, other,"Info_Quentin_Hello_07_03"); //To pewnie znasz has³o...
	AI_Output (other, self,"Info_Quentin_Hello_15_04"); //GOMEZ TO DZIWKA RHOBARA!
	AI_Output (self, other,"Info_Quentin_Hello_07_05"); //Ano masz racjê...
	if (corect_answer == TRUE)
	{
	AI_Output (self, other,"Info_Quentin_Hello_07_06"); //Kosa ciê przepuœci³? Mia³eœ szczêœcie, bo on przewa¿nie najpierw zabija, a dopiero póŸniej pyta.
	};
	AI_Output (other, self,"Info_Quentin_Hello_15_07"); //Jestem kurierem Thangora i mam dla ciebie przesy³kê...
	AI_Output (self, other,"Info_Quentin_Hello_07_08"); //No w koñcu! A ju¿ mia³em opyliæ rudê tym cholernym magom z Nowego Obozu. Dawaj to!
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
	B_LogEntry (P_OHCamp, "Przekaza³em Quentinowi ca³¹ przesy³kê: 10 d³ugich mieczy, paczkê ziela, z³ot¹ zastawê i 2 z³ote pierœcienie, 40 sztuk miêsa, 20 wilczych skór, 30 butelek ry¿ówki i 5 d³ugich ³uków. Uff, trochê tego by³o.");
	AI_Output (other, self,"Info_Quentin_Hello_15_09"); //Teraz twoja kolej.
	AI_Output (self, other,"Info_Quentin_Hello_07_10"); //Bo co gnojku? Mo¿esz mi skoczyæ na dyszel wyw³oko!
	AI_Output (self, other,"Info_Quentin_Hello_07_11"); //Ci cholerni przemytnicy dali za ma³o towaru. Powiedz temu dupkowi Thangorowi, ¿e ju¿ nie potrzebujê jego z³omu.
	AI_Output (self, other,"Info_Quentin_Hello_07_12"); //Mam ju¿ wszystko co potrzeba. A ty lepiej st¹d spadaj, bo ka¿ê ch³opakom siê tob¹ zaj¹æ...
	AI_Output (other, self,"Info_Quentin_Hello_15_13"); //A co z transportem rudy dla Thangora?
	AI_Output (self, other,"Info_Quentin_Hello_07_14"); //Ano gówno! Zaczynasz mnie wkurzaæ. Wynocha, bo poszczujê moimi psami bura suko!
	B_LogEntry (P_OHCamp, "Niech to szlag trafi. Ten pieprzony Quentin najzwyczajniej w œwiecie obrobi³ mnie z ca³ego towaru. Co ja teraz powiem Thangorowi?");
	quentinattack=false;
	AI_StopProcessInfos	(self);
	}
	else if (quentin_none == FALSE)
	{
	quentin_none = TRUE;
	AI_Output (other,self,"Info_Quentin_Hello_15_15"); //£adnie siê tutaj urz¹dziliœcie.
	AI_Output (self, other,"Info_Quentin_Hello_07_16"); //Co ty pierdolisz? Sk¹d siê tu w ogóle wzi¹³eœ gnojku?!
	AI_Output (other,self,"Info_Quentin_Hello_15_17"); //Tak sobie zwiedzam okolicê. Poczu³em dym z ogniska i pomyœla³em...
	AI_Output (self, other,"Info_Quentin_Hello_07_18"); //¯e wpadniesz sobie do przyjació³ na pieczyste? Tak?
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
	description = "Chyba mnie nie zrozumia³eœ!";
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
	AI_Output (other, self,"Info_Quentin_Attack_15_01"); //Tak ³atwo siê mnie nie pozbêdziesz!
	AI_Output (self, other,"Info_Quentin_Attack_07_02"); //To siê zaraz oka¿e. Ch³opaki, wywróæcie tego przyg³upa na lew¹ stronê!
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
	description = "Szukam pewnego pierœcienia.";
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
	AI_Output (other, self,"Info_Quentin_KolRing_15_00"); //Szukam pewnego pierœcienia.
	AI_Output (self, other,"Info_Quentin_KolRing_07_01"); //Zobaczymy. Mo¿e jak mi siê zechce, to dostaniesz pierœcieñ.
	AI_Output (self, other,"Info_Quentin_KolRing_07_02"); //A teraz zje¿d¿aj.
	AI_Output (other, self,"Info_Quentin_KolRing_15_03"); //Jeszcze tu wrócê.
	B_LogEntry( kol_Ring, "Quentin udawa³, ¿e nic nie wie o pierœcieniu. Mam do niego wróciæ jak bêdê mia³ konkretn¹ sprawê. Ciekawe co chcia³ przez to powiedzieæ? Mo¿e na razie lepiej go nie zabijaæ.");
	}
	else
	{
	AI_Output (other, self,"Info_Quentin_KolRing_15_04"); //Szukam pewnego pierœcienia.
	AI_Output (self, other,"Info_Quentin_KolRing_07_05"); //Mam w dupie to czego szukasz. Wróæ jak bêdziesz mia³ do mnie jakiœ konkretny interes.
	AI_Output (self, other,"Info_Quentin_KolRing_07_06"); //Nie prowadzê inwentarza rzeczy zaginionych. A teraz zje¿d¿aj.
	AI_Output (other, self,"Info_Quentin_KolRing_15_07"); //Jeszcze tu wrócê.
	B_LogEntry( kol_Ring, "Quentin udawa³, ¿e nic nie wie o pierœcieniu. Mam do niego wróciæ jak bêdê mia³ konkretn¹ sprawê. Ciekawe co chcia³ przez to powiedzieæ? Mo¿e na razie lepiej go nie zabijaæ.");
	
	};
};