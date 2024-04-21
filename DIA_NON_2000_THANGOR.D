
// ************************************************************
// 			  				   EXIT 
// ************************************************************
var int dead;

INSTANCE Info_Thangor_EXIT(C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 999;
	condition			= Info_Thangor_EXIT_Condition;
	information			= Info_Thangor_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Thangor_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thangor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Tha_hi;

// ************************************************************
// 		Boss
// ************************************************************
////////////Edit By Fenix
INSTANCE Info_Thangor_Hello (C_INFO)
{
	npc		= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_Hello_Condition;
	information		= Info_Thangor_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Witaj...";
};                       

FUNC INT Info_Thangor_Hello_Condition()
{	
	if (OHCamp==LOG_RUNNING)&&(Npc_KnowsInfo (other, Info_Korth_EnterCamp))&&(Tha_hi == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Hello_Info()
{	
	AI_Output (self, other,"Info_Thangor_Hello_11_00"); //Dlaczego marnotrawisz mÛj cenny czas ch≥optasiu?
	AI_Output (other, self,"Info_Thangor_Hello_15_01"); //Myúla≥em...
	AI_Output (self, other,"Info_Thangor_Hello_09_02"); //GÛwno mnie obchodzi co teø chodzi ci po g≥owie. Jeøeli otwierasz dziÛb w mojej obecnoúci, to albo masz bardzo waøki powÛd, albo jesteú skoÒczonym kretynem.
	if (AngharHelp==LOG_SUCCESS) && (ServinHelp==LOG_SUCCESS) && (KorthHelp==LOG_SUCCESS) && (MonkHelp==LOG_SUCCESS) && (FindHunter==LOG_SUCCESS)
	{	
		monk_problem = TRUE;
		Tha_hi = TRUE;
		dead=0;
		AI_Output (other, self,"Info_Thangor_Hello_15_03"); //Odnalaz≥em Kyro i Nikolasa...
		AI_Output (self, other,"Info_Thangor_Hello_09_04"); //Wiem, wiem. S≥ysza≥em juø najúwieøsze nowiny.
		AI_Output (self, other,"Info_Thangor_Hello_09_05"); //Korth jest z ciebie zadowolony, a jemu nieczÍsto siÍ zdarza chwaliÊ kogokolwiek.
		AI_Output (self, other,"Info_Thangor_Hello_09_06"); //Za≥atwi≥eú teø sprawÍ z Monkiem.
		AI_Output (self, other,"Info_Thangor_Hello_09_07"); //Anghar powiedzia≥ mi, øe jesteú ca≥kiem uøyteczny jak na øÛ≥todzioba.
		AI_Output (self, other,"Info_Thangor_Hello_09_08"); //A Servin wprost rozp≥ywa≥ siÍ w pochwa≥ach.
		AI_Output (other, self,"Info_Thangor_Hello_15_09"); //Servin powiedzia≥, øe ≥uki sπ juø gotowe.
		AI_Output (self, other,"Info_Thangor_Hello_09_10"); //Hmm... Moøe rzeczywiúcie na coú siÍ przydasz.
		B_GiveXP(XP*10);
		B_LogEntry (P_OHCamp, "Chyba uda≥o mi siÍ zwrÛciÊ na siebie uwagÍ Thangora. Mam nadziejÍ, øe nie bÍdÍ tego øa≥owa≥...");
		ThangorProof=LOG_RUNNING;
		AI_StopProcessInfos	(self);
	}
	else 
	{
		dead = 0;
		AI_Output (other, self,"Info_Thangor_Hello_15_11"); //S≥ysza≥em, øe to ty tutaj dowodzisz i chcia≥em...
		AI_Output (self, other,"Info_Thangor_Hello_09_12"); //Pos≥uchaj mnie gnojku. Mam dzisiaj dzieÒ dobroci dla b≥aznÛw, wiÍc tym razem nie obijÍ ci pyska.
		AI_Output (self, other,"Info_Thangor_Hello_09_13"); //Ale jeøeli jeszcze raz bÍdziesz mi przeszkadza≥ bez powodu, to nabijÍ twÛj pusty ≥eb na maszt tego cholernego wraku.
		AI_Output (self, other,"Info_Thangor_Hello_09_14"); //A teraz spadaj i ciesz siÍ øyciem...
		B_LogEntry (P_OHCamp, "Thangor zagrozi≥ mi, øe jak jeszcze raz zaczepiÍ go bez powodu to wyúle mnie do Beliara. Chyba by≥oby mπdrze uwierzyÊ mu na s≥owo...");
		dead = dead + 1;
			AI_StopProcessInfos	(self);
	};
Info_Thangor_Hello.permanent = 0;

};

INSTANCE Info_Thangor_MyHello (C_INFO)
{
	npc		= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_MyHello_Condition;
	information		= Info_Thangor_MyHello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "To znowu ja.";
};                       

FUNC INT Info_Thangor_MyHello_Condition()
{	
	if (AngharHelp==LOG_SUCCESS) && (ServinHelp==LOG_SUCCESS) && (KorthHelp==LOG_SUCCESS) && (MonkHelp==LOG_SUCCESS) && (FindHunter==LOG_SUCCESS)&&(Npc_KnowsInfo (other, Info_Thangor_Hello)) && (Tha_hi == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_MyHello_Info()
{	
	Tha_hi = TRUE;
	AI_Output (self, other,"Info_Thangor_MyHello_11_00"); //Czy poprzednim razem wys≥owi≥em siÍ niezrozumiale?
	AI_Output (other, self,"Info_Thangor_MyHello_15_01"); //Nie, ale zmieni≥y siÍ okolicznoúci i chcia≥em...
	AI_Output (self, other,"Info_Thangor_MyHello_09_02"); //Pos≥uchaj. Øyjesz tylko dlatego, øe wiem ile zrobi≥eú dla ch≥opakÛw.
		dead=0;
		AI_Output (other, self,"Info_Thangor_MyHello_15_03"); //Odnalaz≥em teø Kyro i Nikolasa...
		AI_Output (self, other,"Info_Thangor_MyHello_09_04"); //Wiem, wiem. S≥ysza≥em juø najúwieøsze nowiny.
		AI_Output (self, other,"Info_Thangor_MyHello_09_05"); //Korth jest z ciebie zadowolony, a jemu nieczÍsto siÍ zdarza chwaliÊ kogokolwiek.
		AI_Output (self, other,"Info_Thangor_MyHello_09_06"); ///Za≥atwi≥eú teø sprawÍ z Monkiem.
		AI_Output (self, other,"Info_Thangor_MyHello_09_07"); //Anghar powiedzia≥ mi, øe jesteú ca≥kiem uøyteczny jak na øÛ≥todzioba.
		AI_Output (self, other,"Info_Thangor_MyHello_09_08"); //A Servin wprost rozp≥ywa≥ siÍ w pochwa≥ach.
		AI_Output (other, self,"Info_Thangor_MyHello_15_09"); //Servin powiedzia≥, øe ≥uki sπ juø gotowe.
		AI_Output (self, other,"Info_Thangor_MyHello_09_10"); //Hmm... Moøe rzeczywiúcie na coú siÍ przydasz.
		B_GiveXP(XP*10);
		B_LogEntry (P_OHCamp, "Chyba uda≥o mi siÍ zwrÛciÊ na siebie uwagÍ Thangora. Mam nadziejÍ, øe nie bÍdÍ tego øa≥owa≥...");
		ThangorProof=LOG_RUNNING;
		AI_StopProcessInfos	(self);
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//**********Atak**************************************************

INSTANCE Info_Thangor_Attack (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 2;
	condition		= Info_Thangor_Attack_Condition;
	information		= Info_Thangor_Attack_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Moøe üle mnie zrozumia≥eú...";
};                       

FUNC INT Info_Thangor_Attack_Condition()
{	
	if (dead==1)	
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Attack_Info()
{	
	AI_Output (self, other,"Info_Thangor_Attack_09_00"); //Ostrzega≥em ciÍ gnojku, øebyú nie przychodzi≥ do mnie bez powodu.
	AI_Output (other, self,"Info_Thangor_Attack_15_01"); //Ale ja...
	AI_Output (self, other,"Info_Thangor_Attack_09_02"); //Teraz jest juø za pÛüno na myúlenie. Zdychaj psie!
	
	//Edit By Fenix
	Non_2000_Thangor.attribute[ATR_STRENGTH] = 1000;
	Non_2000_Thangor.attribute[ATR_HITPOINTS_MAX] = 5000;
	Non_2000_Thangor.attribute[ATR_HITPOINTS] = 5000;
	AI_StopProcessInfos (self);
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	///////////////
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_Attack,0,"");
};

//**********Proof**************************************************

INSTANCE Info_Thangor_Proof (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_Proof_Condition;
	information		= Info_Thangor_Proof_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Thangor_Proof_Condition()
{	
	if (ThangorProof==LOG_RUNNING)&&(Npc_KnowsInfo (other, Info_Servin_Booz ))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Proof_Info()
{	
	proof=0;
	AI_Output (self, other,"Info_Thangor_Proof_09_00"); //WidzÍ, øe wizja rych≥ego zarobku czÍsto zamienia cz≥owieka w zwierzÍ.
	AI_Output (other, self,"Info_Thangor_Proof_15_01"); //To nie tak...
	AI_Output (self, other,"Info_Thangor_Proof_09_02"); //Pobudki, ktÛre tobπ kierujπ gÛwno mnie obchodzπ. W koÒcu jesteúmy w parszywej Kolonii Karnej. 
	AI_Output (self, other,"Info_Thangor_Proof_09_03"); //Tutaj albo robisz coú dla rudy, albo prÛbujesz przetrwaÊ, albo zdychasz, a i tak nikt po tobie nie uroni nawet jednej ≥zy.
	AI_Output (self, other,"Info_Thangor_Proof_09_04"); //A øeby przetrwaÊ, taki nowicjusz jak ty, musi sobie znaleüÊ wp≥ywowych kumpli, ktÛrzy dadzπ mu ochronÍ.
	AI_Output (self, other,"Info_Thangor_Proof_09_05"); //Oczywiúcie za ochronÍ i swojπ przyjaüÒ, ci nowi kumple bÍdπ chcieli coú w zamian.
	AI_Output (other, self,"Info_Thangor_Proof_15_06"); //Ca≥y zamieniam siÍ w s≥uch.
	AI_Output (self, other,"Info_Thangor_Proof_09_07"); //Szybko siÍ uczysz. To dobrze. Moøe poøyjesz d≥uøej niø wiÍkszoúÊ ze skazaÒcÛw.
	AI_Output (self, other,"Info_Thangor_Proof_09_08"); //Ano jak juø wiesz od tego starego ochlaptusa Servina, nie jesteúmy tutaj z w≥asnej woli.
	AI_Output (self, other,"Info_Thangor_Proof_09_09"); //Udupi≥a nas ta cholerna bariera.
	AI_Output (self, other,"Info_Thangor_Proof_09_10"); //Ale nawet to magiczne gÛwno kiedyú musi stπd zniknπÊ.
	AI_Output (self, other,"Info_Thangor_Proof_09_11"); //Dlatego przez ca≥y czas skupujemy magicznπ rudÍ od zbirÛw Quentina.
	AI_Output (self, other,"Info_Thangor_Proof_09_12"); //W zamian dajemy tym gnojkom wszystko co moøe siÍ przydaÊ skazaÒcom zamkniÍtym w Kolonii Karnej.
	B_LogEntry (P_OHCamp, "Thangor potwierdzi≥ s≥owa Servina. Przemytnicy rzeczywiúcie wymieniajπ rÛøne dobra w zamian za rudÍ, ktÛrπ dostarcza im banda Quentina.");
	AI_Output (self, other,"Info_Thangor_Proof_09_13"); //Z ostatniπ dostawπ by≥ problem, bo Korthowi nie chcia≥o siÍ ruszyÊ dupska, øeby osobiúcie odebraÊ rudÍ od Quentina.
	AI_Output (self, other,"Info_Thangor_Proof_09_14"); //A ja bardzo nie lubiÍ takich pomy≥ek.
	AI_Output (self, other,"Info_Thangor_Proof_09_15"); //Zbliøa siÍ termin kolejnej dostawy i dziwnym zbiegiem okolicznoúci nagle pojawi≥eú siÍ ty.
	AI_Output (self, other,"Info_Thangor_Proof_09_16"); //Mam nadziejÍ, øe pomagasz nam tylko ze wzglÍdu na korzyúci z tego p≥ynπce.
	AI_Output (self, other,"Info_Thangor_Proof_09_17"); //ZapamiÍtaj sobie raz na zawsze, øe zdrajcÛw i z≥odziei karzemy tylko w jeden sposÛb.
	AI_Output (other, self,"Info_Thangor_Proof_15_18"); //WiÍc sprawdü mnie. Jeøeli zdradzÍ to i tak mnie znajdziecie i zabijecie.
	AI_Output (self, other,"Info_Thangor_Proof_09_19"); //W sumie masz racjÍ. Niech bÍdzie. Jestem gotÛw na takie poúwiÍcenie...
	AI_Output (self, other,"Info_Thangor_Proof_09_20"); //MuszÍ wys≥aÊ kogoú z dostawπ dla bandziorÛw, ale wszyscy ch≥opcy sπ zajÍci.
	AI_Output (other, self,"Info_Thangor_Proof_15_21"); //Bez obaw, nie zawiodÍ.
	AI_Output (self, other,"Info_Thangor_Proof_09_22"); //To siÍ dopiero okaøe. Pogadaj z kaødym z nich. Jak bÍdziesz mia≥ juø wszystko co trzeba to wrÛÊ do mnie po dalsze instrukcje.
	AI_Output (other, self,"Info_Thangor_Proof_15_23"); //ZrobiÍ jak kaøesz...
	B_LogEntry (P_OHCamp, "Thangor kaza≥ mi pogadaÊ z pozosta≥ymi Przemytnikami. Mam od nich odebraÊ te wszystkie úmieci dla Quentina.");
	proof=1;
};

//**********Deliver**************************************************

INSTANCE Info_Thangor_Deliver (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 5;
	condition		= Info_Thangor_Deliver_Condition;
	information		= Info_Thangor_Deliver_Info;
	important		= 0;
	permanent		= 1;
	description 		= "Mam juø chyba wszystko.";
};                       

FUNC INT Info_Thangor_Deliver_Condition()
{	
	if (ThangorProof==LOG_RUNNING)&&(Npc_KnowsInfo (other, Info_Thangor_Proof))&&(ThangorDeliver == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Deliver_Info()
{	
	if (proof==5)
	{
	AI_Output (self, other,"Info_Thangor_Deliver_09_00"); //Skoro masz juø wszystko co trzeba, to zdradzÍ ci has≥o, ktÛre podasz straønikowi bandytÛw.
	AI_Output (other, self,"Info_Thangor_Deliver_15_01"); //Grunt to konspiracja...
	AI_Output (self, other,"Info_Thangor_Deliver_09_02"); //Chodzi o to, øeby øaden cwaniaczek nie podszy≥ siÍ pod naszego kuriera i nie buchnπ≥ towaru. SposÛb jest prosty i skuteczny.
	AI_Output (self, other,"Info_Thangor_Deliver_09_03"); //Has≥o znam tylko ja, Quentin i straønik Kosa. Jeøeli coú pÛjdzie nie tak, to bÍdÍ mia≥ pewnoúÊ, øe to twoja wina. A wtedy bÍdziesz øa≥owa≥, øe mamusia wyda≥a ciÍ na úwiat..
	AI_Output (other, self,"Info_Thangor_Deliver_15_04"); //Za≥apa≥em o co chodzi. A teraz zdradü co to za has≥o.
	AI_Output (self, other,"Info_Thangor_Deliver_09_05"); //Has≥o brzmi: GOMEZ TO DZIWKA ROBHARA. Mam nadziejÍ, øe zapamiÍtasz...
	AI_Output (other, self,"Info_Thangor_Deliver_15_06"); //Hmm... Raczej na pewno.
	AI_Output (self, other,"Info_Thangor_Deliver_09_07"); //To moøesz wyruszaÊ. Przesy≥ka od Quentina bÍdzie wiÍksza niø zwykle, wiÍc postaraj siÍ nie zawieúÊ. A co do lokacji obozu bandytÛw, to znajduje siÍ niedaleko Kanionu Trolla.
	AI_Output (self, other,"Info_Thangor_Deliver_09_08"); //A i jeszcze jedno. Powodzenia ch≥opcze...
	B_LogEntry (P_OHCamp, "Mam juø ca≥π dostawÍ dla bandytÛw. ObÛz znajduje siÍ niedaleko Kanionu Trolli. Chyba wiem co to za miejsce. Thangor zdradzi≥ mi teø has≥o, ktÛrego nie sposÛb zapomnieÊ: GOMEZ TO DZIWKA ROBHARA... Trzeba przyznaÊ, øe nawet on ma poczucie humoru.");
	
	B_SetRoguesToNeutral ();
	QuentinBanditsBecomeNeutral ();
	
	B_GiveXP(XP*2);
	proof=10;
Info_Thangor_Deliver.permanent = 0;
ThangorDeliver = TRUE;
	}
	else if (proof < 5)
	{
	AI_Output (self, other,"Info_Thangor_Deliver_09_09"); //Na co czekasz. Pogadaj z ch≥opakami i przyjdü do mnie jak bÍdziesz mia≥ wszystko co trzeba.
Info_Thangor_Deliver.permanent = 1;

	};
};

//**********Problem**************************************************

INSTANCE Info_Thangor_Problem (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_Problem_Condition;
	information		= Info_Thangor_Problem_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co do tej przesy≥ki...";
};                       

FUNC INT Info_Thangor_Problem_Condition()
{	
	//if (ThangorProof==LOG_RUNNING)&&(proof==10)&&(quentin_hi == TRUE)
	if (quentin_hi == True)
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Problem_Info()
{	
	//Edit By Fenix
	//QuentinBanditsBecomeHostile ();
	
	AI_Output (self, other,"Info_Thangor_Problem_09_00"); //I jak tam? Masz przesy≥kÍ?
	AI_Output (other, self,"Info_Thangor_Problem_15_01"); //Wynik≥y ma≥e komplikacje...
	AI_DrawWeapon (self);
	AI_GotoNpc(self,other);
	var C_NPC Quentin; 
	Quentin = Hlp_GetNpc(ORG_858_Quentin);

	if (Npc_IsDead(Quentin))
	{
	AI_Output (self, other,"Info_Thangor_Problem_09_21"); //Øe kurwa co?
	AI_Output (other, self,"Info_Thangor_Problem_15_22"); //Quentin mnie wykiwa≥. Zabra≥ przesy≥kÍ i kaza≥ mi siÍ wynosiÊ...
	AI_Output (self, other,"Info_Thangor_Problem_09_23"); //A ty tak po prostu podwinπ≥eú ogon i zwia≥eú?
	AI_Output (other, self,"Info_Thangor_Problem_15_24"); //Niezupe≥nie. Wys≥a≥em tego gnojka do Beliara...
	AI_Output (self, other,"Info_Thangor_Problem_09_25"); //Dobre i to...
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Thangor_Problem_09_26"); //Mia≥em z≥e przeczucia odkπd ten zach≥anny dupek zaczπ≥ marudziÊ, øe za ma≥o dajemy mu w zamian.
	AI_Output (self, other,"Info_Thangor_Problem_09_27"); //Dosz≥y mnie s≥uchy, øe Quentin dogada≥ siÍ z Magami Wody na dostawy rudy.
	AI_Output (self, other,"Info_Thangor_Problem_09_28"); //Podobno poúredniczy≥ w tym jeden ze szkodnikÛw.
	AI_Output (self, other,"Info_Thangor_Problem_09_29"); //Pos≥uchaj, mam pewien plan. Wciπø jesteú po naszej stronie?
	AI_Output (other, self,"Info_Thangor_Problem_15_30"); //Raczej nie mam wyboru...
	AI_Output (self, other,"Info_Thangor_Problem_09_31"); //To dobrze. S≥uchaj wiÍc tego co mam ci do powiedzenia.
	AI_Output (self, other,"Info_Thangor_Problem_09_32"); //Po pierwsze, musisz ustaliÊ kto z kopalni sprzedawa≥ rudÍ bandytom.
	AI_Output (self, other,"Info_Thangor_Problem_09_33"); //Pogadaj z tymi dwoma szkodnikami co to niby polujπ na úcierwojady. Jestem pewien, øe jeden z nich brata≥ siÍ z Quentinem.
	AI_Output (self, other,"Info_Thangor_Problem_09_34"); //Po drugie, namÛw tego dostawcÍ, øeby zaczπ≥ pracowaÊ dla nas. Moøesz mu obiecaÊ z≥ote gÛry, musi siÍ zgodziÊ!
	AI_Output (self, other,"Info_Thangor_Problem_09_35"); //Dobrze, øe juø za≥atwi≥eú sprawÍ z Quentinem. BÍdzie o jeden problem mniej.
	AI_Output (self, other,"Info_Thangor_Problem_09_36"); //Weü ten pierúcieÒ. Dosta≥em go kilka lat temu od przyjaciela. Teraz dajÍ go tobie. To coú wiÍcej niø tylko dowÛd uznania...
	CreateInvItems (self, Thangor_Ring,1);
	B_GiveInvItems (self, other, Thangor_Ring,1);
	AI_Output (self, other,"Info_Thangor_Problem_09_37"); //Jak za≥atwisz sprawÍ z dostawcπ bandytÛw to niezw≥ocznie do mnie wracaj. Poza nagrodπ, bÍdÍ mia≥ dla ciebie jeszcze ma≥π proúbÍ.
	AI_Output (self, other,"Info_Thangor_Problem_09_38"); //Kto wie, moøe nawet zostaniesz jednym z nas.
	AI_Output (other, self,"Info_Thangor_Problem_15_39"); //ZobaczÍ co da siÍ zrobiÊ.
	Log_CreateTopic	(P_OreSecret, LOG_MISSION);
	Log_SetTopicStatus(P_OreSecret, LOG_RUNNING);
	B_LogEntry		(P_OreSecret, "Thangor poprosi≥ mnie o za≥atwienie sprawy z tym cholernym transportem rudy. Mam dowiedzieÊ siÍ kto z kopalni zajmuje siÍ dostawπ rudy dla bandytÛw. Thangor podarowa≥ mi wspania≥y pierúcieÒ. Chyba zdoby≥em jego uznanie wysy≥ajπc Quentina na tamten úwiat.");
	oresecret=LOG_RUNNING;
	}
	else
	{
	AI_Output (self, other,"Info_Thangor_Problem_09_02"); //Øe kurwa co?
	AI_Output (other, self,"Info_Thangor_Problem_15_03"); //Quentin mnie wykiwa≥. Zabra≥ przesy≥kÍ i kaza≥ mi siÍ wynosiÊ...
	AI_Output (self, other,"Info_Thangor_Problem_09_04"); //A ty tak po prostu podwinπ≥eú ogon i zwia≥eú?
	AI_Output (other, self,"Info_Thangor_Problem_15_05"); //PrÛbowa≥em z nim rozmawiaÊ, ale on nawet nie chcia≥ s≥uchaÊ.
  	AI_Output (self, other,"Info_Thangor_Problem_09_06"); //Niech to szlag trafi!
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Thangor_Problem_09_07"); //Mia≥em z≥e przeczucia odkπd ten gnojek zaczπ≥ marudziÊ, øe za ma≥o dajemy mu w zamian.
	AI_Output (self, other,"Info_Thangor_Problem_09_08"); //Dosz≥y mnie s≥uchy, øe Quentin dogada≥ siÍ z Magami Wody na dostawy rudy.
	AI_Output (self, other,"Info_Thangor_Problem_09_09"); //Podobno poúredniczy≥ w tym jeden ze szkodnikÛw.
	AI_Output (self, other,"Info_Thangor_Problem_09_10"); //Dobrze, øe jeszcze nie zabi≥eú tego gnojka. Mam pewien plan. Wciπø jesteú po naszej stronie?
	AI_Output (other, self,"Info_Thangor_Problem_15_11"); //Raczej nie mam wyboru...
	AI_Output (self, other,"Info_Thangor_Problem_09_12"); //To dobrze. S≥uchaj wiÍc tego, co mam ci do powiedzenia.
	AI_Output (self, other,"Info_Thangor_Problem_09_13"); //Po pierwsze, musisz ustaliÊ kto z kopalni sprzedaje rudÍ bandytom.
	AI_Output (self, other,"Info_Thangor_Problem_09_14"); //Pogadaj z tymi dwoma szkodnikami co to niby polujπ na úcierwojady. Jestem pewien, øe jeden z nich zbrata≥ siÍ z Quentinem.
	AI_Output (self, other,"Info_Thangor_Problem_09_15"); //Po drugie, namÛw tego dostawcÍ, øeby zaczπ≥ pracowaÊ dla nas. DziÍki temu pozbÍdziemy siÍ niewygodnych poúrednikÛw.
	AI_Output (self, other,"Info_Thangor_Problem_09_16"); //Po trzecie, policzysz siÍ w naszym imieniu z tym gnojkiem Quentinem i jego bandπ.
	AI_Output (self, other,"Info_Thangor_Problem_09_17"); //Jak nie czujesz siÍ na si≥ach, øeby walczyÊ z bandytami samemu, to pogadaj z Korthem. On z chÍciπ siÍ trochÍ rozerwie, a ja bÍdÍ mia≥ pewnoúÊ, øe te ≥achmyty juø wiÍcej nie sprawiπ nam k≥opotÛw.
	AI_Output (self, other,"Info_Thangor_Problem_09_18"); //Jak za≥atwisz sprawÍ z dostawcπ bandytÛw to niezw≥ocznie do mnie wracaj. Poza nagrodπ, bÍdÍ mia≥ dla ciebie jeszcze ma≥π proúbÍ.
	AI_Output (self, other,"Info_Thangor_Problem_09_19"); //Kto wie, moøe nawet zostaniesz jednym z nas.
	AI_Output (other, self,"Info_Thangor_Problem_15_20"); //ZobaczÍ co da siÍ zrobiÊ.
	Log_CreateTopic	(P_OreSecret, LOG_MISSION);
	Log_SetTopicStatus(P_OreSecret, LOG_RUNNING);
	B_LogEntry		(P_OreSecret, "Thangor poprosi≥ mnie o za≥atwienie sprawy z tym cholernym transportem rudy. Mam dowiedzieÊ siÍ kto z kopalni zajmuje siÍ dostawπ rudy dla bandytÛw. Thangor powiedzia≥ teø, øebym pozby≥ siÍ Quentina. Moøe Korth mi w tym pomoøe...");
	oresecret=LOG_RUNNING;	
	};
	
};

////////////////////////////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////
//**********Dostawa Final**************************************************

INSTANCE Info_Thangor_Final (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_Final_Condition;
	information		= Info_Thangor_Final_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam przesy≥kÍ.";
};                       

FUNC INT Info_Thangor_Final_Condition()
{	
	if 
//(oresecret==LOG_SUCCESS)&&
(Npc_HasItems(other, OrePack) == 1)
	&&(Npc_KnowsInfo (other, Info_Thangor_Problem))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Final_Info()
{
	CreateInvItems		(self, Non_RANGER, 1);

	AI_Output (other, self,"Info_Thangor_Final_15_01"); //Mam dostawÍ magicznej rudy.
	AI_Output (self, other,"Info_Thangor_Final_09_02"); //åwietna robota. Wiedzia≥em, øe mnie nie zawiedziesz.
	B_GiveInvItems (other, self, OrePack,1);
	AI_Output (other, self,"Info_Thangor_Final_15_03"); //Nie by≥o ≥atwo odnaleüÊ tego handlarza, ale w koÒcu siÍ uda≥o.
	AI_Output (self, other, "Info_Thangor_Final_09_04"); //Rozumiem, øe za≥atwi≥eú z nim sprawÍ regularnych dostaw.
	if (IanKnow==TRUE)
	{
		AI_Output (other, self,"Info_Thangor_Final_15_05"); //No, niezupe≥nie. Ian jakoú siÍ pokapowa≥, øe Alberto - ten kupiec, robi mu ko≥o piÛra.
		AI_Output (other, self,"Info_Thangor_Final_15_06"); //Teraz handlarz boi siÍ nawet pierdnπÊ bez pozwolenia Iana.
		AI_Output (self, other,"Info_Thangor_Final_09_07"); //TrochÍ szkoda, ale z drugiej strony mamy juø wystarczajπcπ iloúÊ magicznej rudy.
		AI_Output (self, other,"Info_Thangor_Final_09_08"); //Czekamy jeszcze tylko na to, øeby tπ cholernπ barierÍ szlag trafi≥, a wtedy p≥yniemy z towarem na kontynent.
		AI_Output (self, other,"Info_Thangor_Final_09_09"); //Jak chcesz moøesz siÍ z nami zabraÊ.
		AI_Output (other, self,"Info_Thangor_Final_15_10"); //Czemu nie.
	}
	else
	{
		AI_Output (other, self,"Info_Thangor_Final_15_11"); //Bez wiÍkszych problemÛw. Alberto bÍdzie nam jad≥ z rÍki.
		AI_Output (self, other,"Info_Thangor_Final_09_12"); //To úwietnie. NaprawdÍ wykona≥eú kawa≥ dobrej roboty.
		AI_Output (self, other,"Info_Thangor_Final_09_13"); //MuszÍ osobiúcie podziÍkowaÊ Diego, øe przys≥a≥ do nas kogoú takiego jak ty.
		AI_Output (self, other,"Info_Thangor_Final_09_14"); //Nied≥ugo bÍdziemy mieÊ juø wystarczajπcπ iloúÊ rudy. Budowa statku teø idzie do przodu.
		AI_Output (self, other,"Info_Thangor_Final_09_15"); //Czekamy jeszcze tylko na to, øeby tπ cholernπ barierÍ szlag trafi≥, a wtedy p≥yniemy z towarem na kontynent.
		AI_Output (self, other,"Info_Thangor_Final_09_16"); //Jak chcesz moøesz siÍ z nami zabraÊ.
		AI_Output (other, self,"Info_Thangor_Final_15_17"); //Czemu nie.
	};
	var C_NPC Quentin; 
	Quentin = Hlp_GetNpc(ORG_858_Quentin);
	if (Npc_IsDead(Quentin))
	{
	AI_Output (self, other,"Info_Thangor_Final_09_18"); //A jak tam sprawa z tym padalcem Quentinem?
	AI_Output (other, self,"Info_Thangor_Final_15_19"); //Quentin juø gryzie ziemiÍ. 
	};
	AI_Output (self, other,"Info_Thangor_Final_09_20"); //NaprawdÍ jestem pod wraøeniem.
	AI_Output (self, other,"Info_Thangor_Final_09_21"); //Zas≥uøy≥eú na specjalnπ nagrodÍ. Weü tÍ zbrojÍ.

	CreateInvItem 		(hero, Non_RANGER);

	CreateInvItem		(self,			ItAmArrow);
	B_GiveInvItems		(self, hero,	ItAmArrow, 1);
	Npc_RemoveInvItem	(hero,			ItAmArrow);


	AI_Output (self, other,"Info_Thangor_Final_09_22"); //Nosi≥ jπ jeden z naszych. Niestety mia≥ pecha bo prÛbowa≥ w niej p≥ywaÊ.
	AI_Output (self, other,"Info_Thangor_Final_09_23"); //Pancerz trochÍ úmierdzi truposzczakiem, ale to úwietna robota.
	AI_Output (other, self,"Info_Thangor_Final_15_24"); //DziÍki. CieszÍ siÍ, øe mog≥em pomÛc.
	AI_Output (self, other,"Info_Thangor_Final_09_25"); //PrzestaÒ juø z tπ skromnoúciπ. Kawa≥ z ciebie niebezpiecznego bydlaka. CieszÍ siÍ, øe jesteú po naszej stronie.
	AI_Output (other, self,"Info_Thangor_Final_15_26"); //To bywaj Thangor.
	AI_Output (self, other,"Info_Thangor_Final_09_27"); //Trzymaj siÍ przyjacielu. ByÊ moøe znajdÍ jeszcze dla ciebie jakπú ma≥π robÛtkÍ.
	B_LogEntry		(P_OreSecret, "W koÒcu uda≥o mi siÍ zakoÒczyÊ sprawÍ z dostawπ rudy. Thangor by≥ bardzo zadowolony. Zresztπ ja teø. To by≥a obopÛlna korzyúÊ.");
	Log_SetTopicStatus(P_OreSecret, LOG_SUCCESS);
	B_GiveXP(XP*10);
	B_LogEntry (P_OHCamp, "W koÒcu zdoby≥em pe≥ne zaufanie Thangora. Zdaje siÍ, øe by≥ pod wraøeniem tego jak za≥atwi≥em sprawÍ z rudπ. Thangor przebπknπ≥ coú o jakimú zadanku. Ciekawe co on jeszcze kombinuje...");
	ThangorProof=LOG_SUCCESS;
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//**********Dostawa Failed**************************************************

INSTANCE Info_Thangor_Failed (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 1;
	condition		= Info_Thangor_Failed_Condition;
	information		= Info_Thangor_Failed_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co do dostawy...";
};                       

FUNC INT Info_Thangor_Failed_Condition()
{	
	if (oresecret==LOG_FAILED)&&(!Npc_HasItems(other, OrePack) == 1)&&(Npc_KnowsInfo (other, Info_Thangor_Problem))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Failed_Info()
{	
	AI_Output (other, self,"Info_Thangor_Failed_15_01"); //Co do dostawy...
	AI_Output (self, other,"Info_Thangor_Failed_09_02"); //Zamknij siÍ pieprzony padalcu! Nie jestem idiotπ!
	AI_Output (self, other,"Info_Thangor_Failed_09_03"); //Wiem, øe opyli≥eú dostawÍ tym cholernym magom.
	AI_Output (other, self,"Info_Thangor_Failed_15_04"); //Ale...
	AI_Output (self, other,"Info_Thangor_Failed_09_05"); //Øadnego ale. Zdychaj podstÍpny gadzie!
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_Attack,0,"");
};





////////////////////////////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////
//******************************************************************************
var int Thangor_Merke_STR;
var int Thangor_Merke_DEX;
// ************Thangor teacher************************************************

INSTANCE Info_Thangor_Teach(C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 100;
	condition	= Info_Thangor_Teach_Condition;
	information	= Info_Thangor_Teach_Info;
	permanent	= 1;
	description = "Moøesz mnie czegoú nauczyÊ?";
};                       

FUNC INT Info_Thangor_Teach_Condition()
{
	if (Npc_KnowsInfo(other,  Info_Thangor_Final))&&(ThangorProof==LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID Info_Thangor_Teach_Info()
{	
	AI_Output(other,self,"Info_Thangor_Teach_15_00"); //Moøesz mnie czegoú nauczyÊ?
	AI_Output(self,other,"Info_Thangor_Teach_11_01"); //Czemu nie. MogÍ ci pokazaÊ, jak zwiÍkszyÊ si≥Í i zrÍcznoúÊ.
	
	Thangor_Merke_STR = hero.attribute[ATR_STRENGTH];
	Thangor_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Thangor_Teach);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_1);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_1);
	Info_AddChoice		(Info_Thangor_Teach,DIALOG_BACK									,Info_Thangor_Teach_BACK);	
};

func void Info_Thangor_Teach_BACK()
{
	if (Thangor_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"Info_Thangor_Teach_BACK_11_00"); //Jesteú coraz silniejszy. Tylko tak dalej, a nikt ci nie podskoczy.
	};
	if (Thangor_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"Info_Thangor_Teach_BACK_11_01"); //Twoja zrÍcznoúÊ teø jest coraz lepsza. ∆wicz dalej, a nie oprze ci siÍ øadna sakiewka.
	};
	AI_Output(self,other,"Info_Thangor_Teach_BACK_11_02"); //TrochÍ juø umiesz, ale wiele jeszcze przed tobπ przyjacielu.
	Info_ClearChoices	(Info_Thangor_Teach);
};

func void Info_Thangor_Teach_STR_1()
{
	B_BuyAttributePoints (other,self, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Thangor_Teach);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_1);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_1);
	Info_AddChoice		(Info_Thangor_Teach,DIALOG_BACK									,Info_Thangor_Teach_BACK);

};

func void Info_Thangor_Teach_STR_5()
{
	B_BuyAttributePoints (other,self, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Thangor_Teach);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_1);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_1);
	Info_AddChoice		(Info_Thangor_Teach,DIALOG_BACK									,Info_Thangor_Teach_BACK);

};

func void Info_Thangor_Teach_DEX_1()
{
	B_BuyAttributePoints (other,self, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Thangor_Teach);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_1);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_1);
	Info_AddChoice		(Info_Thangor_Teach,DIALOG_BACK									,Info_Thangor_Teach_BACK);

};

func void Info_Thangor_Teach_DEX_5()
{
	B_BuyAttributePoints (other,self, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Thangor_Teach);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Thangor_Teach_STR_1);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_5);
	Info_AddChoice		(Info_Thangor_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Thangor_Teach_DEX_1);
	Info_AddChoice		(Info_Thangor_Teach,DIALOG_BACK									,Info_Thangor_Teach_BACK);

};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//*****************Focus*******************

INSTANCE Info_Thangor_Focus (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 11;
	condition		= Info_Thangor_Focus_Condition;
	information		= Info_Thangor_Focus_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam do ciebie pytanie.";
};                       

FUNC INT Info_Thangor_Focus_Condition()
{	
	if (Kapitel == 3)&&(Npc_KnowsInfo (other, PC_Thief_GOTITWRONG))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Focus_Info()
{	
	AI_Output (other, self,"Info_Thangor_Focus_15_01"); //Mam do ciebie pytanie.
	AI_Output (self, other,"Info_Thangor_Focus_09_02"); //Ca≥y zamieniam siÍ w s≥uch.
	AI_Output (other, self,"Info_Thangor_Focus_15_03"); //Podobno jeden z was krÍci≥ siÍ w Kanionie Trolli.
	AI_Output (self, other,"Info_Thangor_Focus_09_04"); //Moøe i tak. A o co chodzi?
	AI_Output (other, self,"Info_Thangor_Focus_15_05"); //By≥em tam i nie znalaz≥em Kamienia Ogniskujπcego. Diego twierdzi, øe widzia≥ jak jeden z Was siÍ tam krÍci≥.
	AI_Output (self, other,"Info_Thangor_Focus_09_06"); //Diego dobrze widzia≥. To by≥ Monk. Mia≥ znaleüÊ ten kryszta≥ na moje polecenie.
	AI_Output (other, self,"Info_Thangor_Focus_15_07"); //I co, znalaz≥?
	AI_Output (self, other,"Info_Thangor_Focus_09_08"); //Ano znalaz≥, tylko pÛüniej bardzo szybko siÍ z nim ulotni≥.
	AI_Output (other, self,"Info_Thangor_Focus_15_09"); //Niech go szlag trafi!
	AI_Output (self, other,"Info_Thangor_Focus_09_10"); //Powiedzia≥em prawie to samo. Niestety, s≥owo nie chcia≥o zamieniÊ siÍ w cia≥o.
	AI_Output (other, self,"Info_Thangor_Focus_15_11"); //Ale ja muszÍ odzyskaÊ ten klejnot. Gdzie Monk mÛg≥ siÍ ukryÊ?
	AI_Output (self, other,"Info_Thangor_Focus_09_12"); //Uwierz mi, øe teø chcia≥bym to wiedzieÊ. Wtedy osobiúcie bym mu wyt≥umaczy≥ jak nagradzamy z≥odziei.
	AI_Output (self, other,"Info_Thangor_Focus_09_13"); //Pos≥uchaj. Zdaje siÍ, øe obaj coú straciliúmy. Ty ten klejnot, a ja sekstans, ktÛry ten gnojek zwinπ≥ razem z naszymi zapasami.
	AI_Output (self, other,"Info_Thangor_Focus_09_14"); //Kiedy odbudujemy statek, bez sekstansu nie opuúcimy tej cholernej wyspy. Nasz szyper wypad≥ za burtÍ podczas sztormu, a øaden z nas nie ma bladego pojÍcia o ustalaniu kierunkÛw na morzu.
	AI_Output (self, other,"Info_Thangor_Focus_09_15"); //Dogadajmy siÍ. Jak dorwiesz tego sukinsyna, to wszystko co przy nim znajdziesz naleøy do ciebie.
	AI_Output (self, other,"Info_Thangor_Focus_09_16"); //Wszystko prÛcz sekstansu, ma siÍ rozumieÊ, ktÛry oddasz mi. Oczywiúcie propozycja wspÛlnego wyp≥yniÍcia jest wciπø aktualna.
	AI_Output (self, other,"Info_Thangor_Focus_09_17"); //Co ty na to?
	AI_Output (other, self,"Info_Thangor_Focus_15_18"); //Chyba nie mam wyboru. Niech bÍdzie.
	AI_Output (self, other,"Info_Thangor_Focus_09_19"); //Wiedzia≥em, øe rÛwny z ciebie ch≥op.
	AI_Output (self, other,"Info_Thangor_Focus_09_20"); //Powodzenia na szlaku.
	AI_Output (self, other,"Info_Thangor_Focus_09_21"); //Aha, z tego co wiem Monk by≥ kiedyú p≥atnym zabÛjcπ na us≥ugach Gildii Z≥odziei z Khorinis.
	AI_Output (self, other,"Info_Thangor_Focus_09_22"); //Uwaøaj na niego, bo to cholernie niebezpieczny przeciwnik.
	AI_Output (self, other,"Info_Thangor_Focus_09_23"); //Jestem teø pewien, øe nie ukrywa siÍ na widoku. Przeszukaj wszystkie nory i zatÍch≥e dziury w Kolonii, a na pewno znajdziesz tego szczura.
	AI_Output (self, other,"Info_Thangor_Focus_09_24"); //Jeszcze raz øyczÍ powodzenia przyjacielu.
	B_LogEntry		(CH3_TrollCanyon,	"Thangor powiedzia≥ mi, øe Monk ulotni≥ siÍ razem z kryszta≥em i sekstansem PrzemytnikÛw. Poprosi≥ mnie øebym odszuka≥ zdrajcÍ i zrobi≥ z nim porzπdek. MogÍ zatrzymaÊ wszystko co przy nim znajdÍ prÛcz sekstansu, ktÛry jest potrzebny Przemytnikom do nawigacji na morzu. MuszÍ jednak uwaøaÊ, bo Monk by≥ kiedyú zabÛjcπ. Thangor powiedzia≥ teø, øe Monk pewnie schowa≥ siÍ w jakiejú jaskini, albo podziemiach.");

};

//*********Sekstans**************************************************

INSTANCE Info_Thangor_Seks (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 10;
	condition		= Info_Thangor_Seks_Condition;
	information		= Info_Thangor_Seks_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Odzyska≥em sekstans.";
};                       

FUNC INT Info_Thangor_Seks_Condition() 
{	
	if (Npc_KnowsInfo (other, Info_Monk_Seks ))&&(Npc_HasItems(other, sekstans) >= 1)&&(Npc_KnowsInfo (other, Info_Thangor_Focus))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Seks_Info()
{	
	AI_Output (other, self,"Info_Thangor_Seks_15_01"); //Odnalaz≥em TwÛj sekstans. Monk teø juø nie sprawi wam wiÍcej k≥opotÛw.
	AI_Output (self, other,"Info_Thangor_Seks_09_02"); //åwietna robota ch≥opcze. NaprawdÍ spisa≥eú siÍ wyúmienicie.
	B_GiveInvItems (other, self, sekstans, 1);
	AI_Output (self, other,"Info_Thangor_Seks_09_03"); //W moim obozie zawsze bÍdzie dla ciebie miejsce. Kiedy stπd odp≥yniemy mam nadziejÍ, øe bÍdziesz wúrÛd nas.
	AI_Output (other, self,"Info_Thangor_Seks_15_04"); //Ja teø mam takπ nadziejÍ. Poøyjemy, zobaczymy...
	AI_Output (self, other,"Info_Thangor_Seks_09_05"); //Bywaj przyjacielu.
	AI_Output (other, self,"Info_Thangor_Seks_15_06"); //Bywaj Przemytniku.
	B_GiveXP(XP*10);
	Log_SetTopicStatus	(P_OHCamp, LOG_SUCCESS);
	B_LogEntry (P_OHCamp, "Odda≥em Thangorowi sekstans. Teraz Przemytnicy bÍdπ mogli bez problemu odp≥ynπÊ. Thangor powiedzia≥, øe zawsze znajdzie siÍ dla mnie miejsce na jego ≥ajbie. Chyba znalaz≥em prawdziwego przyjaciela i to w takim miejscu jak Kolonia Karna! Ano nic nie dzieje siÍ bez powodu... Oczywiúcie najpierw trzeba zrobiÊ coú z tπ cholernπ barierπ.");
	AI_StopProcessInfos (self);
};

//*********Chromanin**************************************************

INSTANCE Info_Thangor_Book (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 7;
	condition		= Info_Thangor_Book_Condition;
	information		= Info_Thangor_Book_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Szukam pewnej ksiÍgi.";
};                       

FUNC INT Info_Thangor_Book_Condition() 
{	
	if (Npc_KnowsInfo (other, DIA_Eremita_Sixth ))&&(eremita==6)&&(Npc_KnowsInfo (other, Info_Korth_EnterCamp))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Book_Info()
{	
	AI_Output (other, self,"Info_Thangor_Book_15_00"); //PoszukujÍ pewnej ksiÍgi. Podobno jest ona w posiadaniu jakiegoú potÍønego úmiertelnika.
	AI_Output (other, self,"Info_Thangor_Book_15_01"); //Pomyúla≥em, øe moøe ty...
	AI_Output (self, other,"Info_Thangor_Book_09_02"); //èle pomyúla≥eú. Odejdü pÛki jeszcze moøesz...
	AI_Output (other, self,"Info_Thangor_Book_15_03"); //Pewien starzec powiedzia≥ mi, øe serce tego cz≥owieka wciπø broczy krwiπ. Øe skrywa on prawdÍ o samym sobie...
	AI_Output (self, other,"Info_Thangor_Book_09_04"); //Za duøo gadasz ch≥opcze. To moøe byÊ dla ciebie bardzo niebezpieczne.
	AI_Output (self, other,"Info_Thangor_Book_09_05"); //ProszÍ ciÍ ostatni raz, odejdü.
	AI_Output (other, self,"Info_Thangor_Book_15_06"); //Ten starzec powiedzia≥ takøe, øe Pradawni zostanπ przeklÍci na wieki...
	AI_Output (self, other,"Info_Thangor_Book_09_07"); //Skπd... Skπd to wiesz? 
	AI_Output (self, other,"Info_Thangor_Book_09_08"); //Zresztπ to nie moja tajemnica.
	AI_Output (self, other,"Info_Thangor_Book_09_09"); //Niech bÍdzie. Oto ksiÍga.
	CreateInvItems		(self, theriddle6, 1);
	B_GiveInvItems (self, other, theriddle6, 1);
	AI_Output (self, other,"Info_Thangor_Book_09_10"); //ByÊ moøe takie jest w≥aúnie Twoje przeznaczenie. A teraz zostaw mnie w spokoju.
	B_GiveXP(XP*5);
};



INSTANCE Info_Thangor_OreInv (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 11;
	condition		= Info_Thangor_OreInv_Condition;
	information		= Info_Thangor_OreInv_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia≥em pogadaÊ o przemycie rudy.";
};                       

FUNC INT Info_Thangor_OreInv_Condition()
{	
	if (ThangorProof==LOG_SUCCESS)&&(Npc_KnowsInfo (other, Info_RAVEN_Missing))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_OreInv_Info()
{	
	AI_Output (other, self,"Info_Thangor_OreInv_15_00"); //Chcia≥em pogadaÊ o przemycie rudy.
	AI_Output (self, other,"Info_Thangor_OreInv_09_01"); //Dopiero co zdoby≥eú moje zaufanie, a juø chcesz je wystawiÊ na prÛbÍ?
	AI_Output (other, self,"Info_Thangor_OreInv_15_02"); //To nie tak, jestem z tobπ. Jednak Kruk da≥ mi ultimatum...
	AI_Output (self, other,"Info_Thangor_OreInv_09_03"); //Kruk. Znam jego mrocznπ naturÍ. Tacy jak on mÛwiπ tylko to, co inni chcπ us≥yszeÊ.
	AI_Output (self, other,"Info_Thangor_OreInv_09_04"); //Dlatego Gomez tak ≥atwo da≥ mu siÍ omotaÊ. Strzeø siÍ Kruka ch≥opcze.
	AI_Output (self, other,"Info_Thangor_OreInv_09_05"); //PamiÍtaj, øe kruki øywiπ siÍ padlinπ, a padlinπ stajπ siÍ tylko g≥upcy.
	AI_Output (other, self,"Info_Thangor_OreInv_15_06"); //Co chcesz przez to powiedzieÊ?
	AI_Output (self, other,"Info_Thangor_OreInv_09_07"); //To co chcesz us≥yszeÊ...
	AI_Output (self, other,"Info_Thangor_OreInv_09_08"); //Kruk pewnie od niechcenia rzuci≥ coú o pozbycie siÍ niewygodnego szefa PrzemytnikÛw. Mam racjÍ?
	AI_Output (other, self,"Info_Thangor_OreInv_15_09"); //Skπd wiesz?
	AI_Output (self, other,"Info_Thangor_OreInv_09_10"); //Nie jesteú pierwszym g≥upcem, ktÛry da≥ siÍ na to nabraÊ. Ale najwaøniejsza jest odpowiedü na pytanie, czy moja úmierÊ rzeczywiúcie rozwiπøe problem z przemytem rudy.
	AI_Output (other, self,"Info_Thangor_OreInv_15_11"); //Hmm, chyba nie. Przecieø za samym przemytem stoi ktoú inny. Wy tylko skupujecie rudÍ.
	AI_Output (other, self,"Info_Thangor_OreInv_15_12"); //Jeøeli ktoú za≥atwi PrzemytnikÛw, to pewnie znajdπ siÍ inni chÍtni. Przecieø bariera kiedyú zniknie, a wtedy ten kto zgromadzi rudÍ bÍdzie prawdziwym bogaczem.
	AI_Output (self, other,"Info_Thangor_OreInv_09_13"); //Strza≥ w úrodek tarczy ch≥opcze. Kruk juø wysy≥a≥ tu swoich ludzi. Zapewne widzia≥eú úlady na palisadzie.
	AI_Output (self, other,"Info_Thangor_OreInv_09_14"); //Ale z tymi poradziliúmy sobie doúÊ ≥atwo.
	AI_Output (other, self,"Info_Thangor_OreInv_15_15"); //A kogo jeszcze wysy≥a≥?
	AI_Output (self, other,"Info_Thangor_OreInv_09_16"); //ZabÛjcÛw. Kilku z wiÍüniÛw trafi≥o tu za mniej lub bardziej spektakularne zamachy. Jednak øaden nie osiπgnπ≥ celu.
	AI_Output (self, other,"Info_Thangor_OreInv_09_17"); //Pos≥uchaj dobrej rady. Poszukaj tego, ktÛry stoi za handlem rudπ. Znajdziesz go w obozie przed kopalniπ.
	AI_Output (self, other,"Info_Thangor_OreInv_09_18"); //Quentin teø odpala≥ mu dzia≥Í. Teraz kiedy bandyci juø nie kontrolujπ odbioru rudy, ten ktoú bÍdzie chcia≥ upomnieÊ siÍ o swojπ dzia≥kÍ.
	AI_Output (other, self,"Info_Thangor_OreInv_15_19"); //Rozumiem. Ale wam teø powinno zaleøeÊ na tym, øeby ten ktoú nie zauwaøa≥ przemytu.
	AI_Output (self, other,"Info_Thangor_OreInv_09_20"); //Chyba, øe bÍdzie martwy. Umarli majπ s≥aby wzrok.
	AI_Output (self, other,"Info_Thangor_OreInv_09_21"); //WybÛr zostawiam tobie.
	AI_Output (other, self,"Info_Thangor_OreInv_15_22"); //Rozumiem Thangor i... dziÍkujÍ.
	AI_Output (self, other,"Info_Thangor_OreInv_09_23"); //Za co dziÍkujesz?
	AI_Output (other, self,"Info_Thangor_OreInv_15_24"); //Za øycie. Mog≥eú mnie zabiÊ tylko za to, øe bra≥em pod uwagÍ... twojπ úmierÊ.
	AI_Output (self, other,"Info_Thangor_OreInv_09_25"); //Ch≥opcze, gdybym zabija≥ wszystkich przyjaciÛ≥, ktÛrzy chcπ siÍ mnie pozbyÊ nie mia≥bym juø øadnego.
	AI_Output (self, other,"Info_Thangor_OreInv_09_26"); //A teraz bywaj i pamiÍtaj, øe najlepiej dla wszystkich by≥oby, gdyby ten ktoú stojπcy za przemytem mia≥ nieprzyjemny wypadek.
	AI_Output (self, other,"Info_Thangor_OreInv_09_27"); //Kruk w≥aúnie to mia≥ na myúli. Ale uwaøaj na siebie, mam pewne podejrzenia i jeøeli okaøπ siÍ s≥uszne to bÍdziesz walczy≥ z wrednym przeciwnikiem.
	AI_Output (self, other,"Info_Thangor_OreInv_09_28"); //Nie daj siÍ zabiÊ ch≥opcze.
	AI_Output (other, self,"Info_Thangor_OreInv_15_29"); //Nie mam zamiaru. Bywaj Thangor.
	B_LogEntry		(P_Missing, "Rozmawia≥em z Thangorem o przemycie rudy. Doradzi≥ mi øebym pozby≥ siÍ osoby stojπcej za przemytem rudy w obozie przed kopalniπ. Teraz muszÍ tylko znaleüÊ tÍ osobÍ.");
	B_GiveXP(XP*3);
};

INSTANCE Info_Thangor_OreInv1 (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 18;
	condition		= Info_Thangor_OreInv1_Condition;
	information		= Info_Thangor_OreInv1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Za≥atwi≥em Melkora.";
};                       

FUNC INT Info_Thangor_OreInv1_Condition()
{	
	var C_NPC mel; mel = Hlp_GetNpc(GRD_7607_MELKOR);

	if (Npc_KnowsInfo (other, Info_RAVEN_MelkorDead))&& (Npc_IsDead (mel))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_OreInv1_Info()
{	
	AI_Output (other, self,"Info_Thangor_OreInv1_15_00"); //Za≥atwi≥em Melkora.
	AI_Output (self, other,"Info_Thangor_OreInv1_09_01"); //Potwierdzi≥eú, øe s≥usznie uczyni≥em ufajπc ci. Teraz w Kolonii bÍdzie duøo bezpieczniej.
	AI_Output (self, other,"Info_Thangor_OreInv1_09_02"); //I pamiÍtaj, øe z≥o zawsze czai siÍ w cieniu dobra. 
	AI_Output (self, other,"Info_Thangor_OreInv1_09_03"); //Niewaøne jak duøo dobra uczynisz, z≥o zawsze bÍdzie nÍkaÊ twπ duszÍ. 
	B_GiveXP(XP*2);
	Log_SetTopicStatus	(P_Missing, LOG_SUCCESS);
	B_LogEntry		(P_Missing, "Kiedy powiedzia≥em Thangorowi, øe Melkor nie øyje, ten uraczy≥ mnie jakπú filozoficznπ gadkπ. MÛg≥ powiedzieÊ wprost, øe teraz bez przeszkÛd mogπ skupowaÊ rudÍ. tak czy inaczej, wszyscy na tym dobrze wyszli.");
};

INSTANCE Info_Thangor_Attack22 (C_INFO)
{
	npc			= Non_2000_Thangor;
	nr			= 22;
	condition		= Info_Thangor_Attack22_Condition;
	information		= Info_Thangor_Attack22_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Thangor_Attack22_Condition()
{	
	if (Npc_IsDead (WhiteWolf))
	{
		return 1;
	};
};
FUNC VOID Info_Thangor_Attack22_Info()
{	
	AI_Output (self, other,"Info_Thangor_Attack22_09_00"); //Zabi≥eú Puszka Okruszka!
	AI_Output (other, self,"Info_Thangor_Attack22_15_01"); //Jakiego Puszka? Nie zabi≥em, øadnego Okruszka.
	AI_Output (self, other,"Info_Thangor_Attack22_09_02"); //Zabi≥eú mojego wilka!
	if (ThangorProof==LOG_SUCCESS)
	{
	AI_Output (self, other,"Info_Thangor_Attack22_09_03"); //Masz szczÍúcie, øe uwaøam ciÍ za przyjaciela.
	AI_Output (self, other,"Info_Thangor_Attack22_09_04"); //Cholera, bÍdÍ teraz musia≥ poszukaÊ nowego Puszka Okruszka...
	AI_Output (other, self,"Info_Thangor_Attack22_15_05"); //Wszystkie swoje zwierzaki nazywasz tak samo?
	AI_Output (self, other,"Info_Thangor_Attack22_09_06"); //A co w tym z≥ego? Przynajmniej nigdy siÍ nie pomylÍ.
	AI_Output (other, self,"Info_Thangor_Attack22_15_07"); //W sumie racja.
	AI_Output (self, other,"Info_Thangor_Attack22_09_08"); //Tym razem chyba poszukam jakiegoú Cieniostwora. Albo Kuzuara...
	}
	else
	{
	AI_Output (self, other,"Info_Thangor_Attack22_09_09"); //Zap≥acisz mi za to!
	//Edit By Fenix
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	AI_StopProcessInfos (self);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_Attack,0,"");
	};
};