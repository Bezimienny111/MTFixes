// ************************************************************
// 			  				   EXIT 
// ************************************************************
var int ore;
var int kor_agree;

INSTANCE Info_Korth_EXIT(C_INFO)
{
	npc			= Non_2003_Korth;
	nr			= 999;
	condition	= Info_Korth_EXIT_Condition;
	information	= Info_Korth_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Korth_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Korth_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		Stra¿nik Obozu
// ************************************************************

INSTANCE Info_Korth_EnterCamp(C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 1;
	condition	= Info_Korth_EnterCamp_Condition;
	information	= Info_Korth_EnterCamp_Info;
	important	= 1;
	permanent	= 0;
};                       

FUNC INT Info_Korth_EnterCamp_Condition()
{	
	if (Npc_GetDistToWP (self,"SPAWN_KORTH") < 1000 )	
	{
		return 1;
	};
};

//Edit By Fenix
FUNC VOID Info_Korth_EnterCamp_Info()
{	
	B_FullStop (hero);
	AI_DrawWeapon (self);
	AI_GotoNpc(self,other);
	AI_Output (self, other,"Info_EnterCamp_11_00"); //Czego tu szukasz w³óczêgo?! I lepiej ¿ebyœ mia³ dobry powód!
	
	if (FindHunter==LOG_SUCCESS)
		{	
			AI_RemoveWeapon (self);
			AI_Output (self, other,"Info_Korth_EnterCamp_11_09"); //S³ysza³em, ¿e pomog³eœ jednemu z naszych i to zupe³nie bezinteresownie. To bardzo rzadka cecha wœród tutejszych szumowin. 
			B_GiveXP(XP*5);
			AI_Output (self, other,"Info_Korth_EnterCamp_11_10"); //Wiêkszoœæ ze skazañców poder¿nê³aby gard³o w³asnej matce, gdyby dostali za to choæ trochê rudy.
			
			if (DiegoHelp<=LOG_RUNNING)
			{
				AI_Output (self, other,"Info_Korth_EnterCamp_11_11"); //Mo¿esz wejœæ do obozu. Tylko lepiej ¿eby ci siê nic nie przyklei³o do r¹czek. Dla z³odziei mamy tylko jedn¹ karê. I uwierz mi, ¿e œmieræ jest jej bezbolesnym epitafium...
				AI_Output (self, other,"Info_Korth_EnterCamp_11_12"); //Jak chcesz siê dowiedzieæ czegoœ wiêcej to pogadaj z Servinem. Mo¿e pozostali te¿ bêd¹ chcieli zamieniæ z tob¹ s³ówko. Pogadaj z Angharem, to nasz kowal. Ma chyba jakiœ problem.
				AI_Output (other, self,"Info_Korth_EnterCamp_15_17"); //Dziêki...
				AI_Output (self, other,"Info_Korth_EnterCamp_11_18"); //Dobra, ju¿ dobra. Przestañ psuæ powietrze i spadaj. Mam wa¿niejsze sprawy na g³owie ni¿ pogaduchy.
			};
			NPC_ExchangeRoutine (self,"start");
			Log_CreateTopic	(P_OHCamp, LOG_MISSION);
			Log_SetTopicStatus	(P_OHCamp, LOG_RUNNING);
			if (DiegoHelp!=LOG_RUNNING)
			{
				B_LogEntry		(P_OHCamp, "W koñcu odnalaz³em tych tajemniczych odludków. Trafienie na to zadupie ma³o nie kosztowa³o mnie ¿ycia. Pe³no tutaj dzikich zwierz¹t. Korth, który jest tutaj stra¿nikiem wys³a³ mnie do jakiegoœ Servina, ¿ebym z nim pogada³ o przesy³ce dla Diego. Mówi³ te¿ ¿ebym zamieni³ s³ówko z jakimœ Angharem.");
			};
			Kyro_1 = 5;
			AngharHelp=LOG_RUNNING;
			OHCamp=LOG_RUNNING;
			//AI_StopProcessInfos	(self);
		}
		else
		if (DiegoHelp!=LOG_RUNNING)
		{
			AI_Output (other, self,"Info_Korth_EnterCamp_15_13"); //Ja tylko...
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie bêdzie siê tutaj pa³êta³ bez powodu! Sam tego chcia³eœ ³achmyto...
			AI_StopProcessInfos	(self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_ATTACK,1,"");
		};
		
	if (DiegoHelp==LOG_RUNNING)
	{	
		B_GiveXP(XP*2);
		AI_Output (other, self,"Info_Korth_EnterCamp_15_01"); //Przysy³a mnie Diego. Mam dla niego odebraæ jak¹œ przesy³kê. Nic wiêcej nie wiem...
		AI_RemoveWeapon (self);
		AI_Output (self, other,"Info_Korth_EnterCamp_11_02"); //Trzeba by³o tak od razu mówiæ. Jak masz odebraæ coœ dla Diega, to idŸ do Servina, on jest naszym kwatermistrzem.
		AI_Output (self, other,"Info_Korth_EnterCamp_11_03"); //Tylko ¿eby ciê r¹czki nie œwierzbi³y. Jak zobaczê, ¿e coœ kradniesz, to obetnê ci wszystkie piêæ cz³onków. Jasne?
		AI_Output (other, self,"Info_Korth_EnterCamp_15_04"); //Jak s³oñce.
	/*	if (Kyro_rec == 2)
		{
		Kyro_1 = 5;
		AI_Output (self, other,"Info_Korth_EnterCamp_15_05"); //Kyro wspomnia³ mi, ¿e mu pomog³eœ. Pewnie zrobi³eœ to tylko po to ¿eby zarobiæ.
		AI_Output (self, other,"Info_Korth_EnterCamp_15_06"); //Ale to nie zmienia faktu, ¿e pomog³eœ jednemu z nas. Dobrze zrobi³eœ.
		};
		if (Kyro_rec == 1)
		{
		Kyro_1 = 5;
		};*/
		AI_Output (self, other,"Info_Korth_EnterCamp_11_07"); //A teraz spadaj, bo zas³aniasz mi widok. IdŸ pogadaj z Servinem i lepiej ¿ebyœ nic nie kombinowa³... 
		AI_Output (self, other,"Info_Korth_EnterCamp_11_08"); //Aha. Jak ju¿ tu jesteœ, to zagadaj te¿ do Anghara. On ci powie o co chodzi.
		NPC_ExchangeRoutine (self,"start");
		Log_CreateTopic	(P_OHCamp, LOG_MISSION);
		Log_SetTopicStatus	(P_OHCamp, LOG_RUNNING);
		B_LogEntry		(P_OHCamp, "W koñcu odnalaz³em tych tajemniczych odludków, o których mówi³ Diego.  Trafienie na to zadupie ma³o nie kosztowa³o mnie ¿ycia. Pe³no tutaj dzikich zwierz¹t. Korth, który jest tutaj stra¿nikiem wys³a³ mnie do jakiegoœ Servina, ¿ebym z nim pogada³ o przesy³ce dla Diego. Mówi³ te¿ ¿ebym zamieni³ s³ówko z jakimœ Angharem.");
		AngharHelp=LOG_RUNNING;
		OHCamp=LOG_RUNNING;
		//AI_StopProcessInfos	(self);
	}
	else
	if (FindHunter!=LOG_SUCCESS)
		{
			AI_Output (other, self,"Info_Korth_EnterCamp_15_13"); //Ja tylko...
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie bêdzie siê tutaj pa³êta³ bez powodu! Sam tego chcia³eœ ³achmyto...
			AI_StopProcessInfos	(self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_ATTACK,1,"");
		};
		
		/*if (FindHunter!=LOG_SUCCESS) && (DiegoHelp!=LOG_RUNNING)
		{
			AI_Output (other, self,"Info_Korth_EnterCamp_15_13"); //Ja tylko...
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie bêdzie siê tutaj pa³êta³ bez powodu! Sam tego chcia³eœ ³achmyto...
			AI_StopProcessInfos	(self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_ATTACK,1,"");
		};*/
	
	AI_StopProcessInfos	(self);
	
};


var int Korth_ring_find;

// *********************************KorthHelp***********************

INSTANCE Info_Korth_Help (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 1;
	condition		= Info_Korth_Help_Condition;
	information		= Info_Korth_Help_Info;
	important		= 0;
	permanent		= 0;
	description = "Nie chcia³bym siê narzucaæ, ale...";
};                       

FUNC INT  Info_Korth_Help_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Servin_Kto_How_Beer))
	{
		return 1;
	};
};

FUNC VOID Info_Korth_Help_Info()
{	
	AI_Output (self, other,"Info_Korth_Help_11_00"); //To znowu ty. No, skoro ju¿ tu jesteœ to gadaj o co ci chodzi.

		if (FindHunter==LOG_SUCCESS)
		{
		AI_Output (other,self,"Info_Korth_Help_15_01"); //Muszê zdobyæ zaufanie Thangora. Pomyœla³em, ¿e je¿eli pomogê jego ludziom, to byæ mo¿e w koñcu siê do mnie przekona.
		AI_Output (self, other,"Info_Korth_Help_11_02"); //Hmm. Za³atwi³eœ ju¿ sprawê z tymi dwoma nieudacznikami. Servin te¿ ciê chwali...
		if (Korth_ring_find == TRUE)
		{
		AI_Output (self, other,"Info_Korth_Help_11_03"); //A przede wszystkim odnalaz³eœ mój pierœcieñ. Dobra robota ch³opcze. Masz moje pe³ne poparcie.
		AI_Output (self, other,"Info_Korth_Help_11_04"); //Zas³u¿y³eœ te¿ na specjaln¹ nagrodê. WeŸ ten miecz. To niezwykle solidna robota. Wyku³ go Harad, kowal z Khorinis.
		CreateInvItems (self, ItMw_1H_Sword_Long_066,1);
		B_GiveInvItems(self,other, ItMw_1H_Sword_Long_066,1);
		AI_Output (other, self,"Info_Korth_Help_11_05"); //Dziêki. To wspania³a broñ.
		AI_Output (self, other,"Info_Korth_Help_11_06"); //Dobra, ju¿ dobra. Zas³u¿y³eœ na to ¿elazo. 
		AI_Output (self, other,"Info_Korth_Help_11_07"); //IdŸ do Thangora i powiedz mu, ¿e Korth uwa¿a, ¿e porz¹dny z ciebie ch³op.
		AI_Output (other, self,"Info_Korth_Help_11_08"); //Na pewno nie omieszkam.
		AI_Output (self, other,"Info_Korth_Help_11_09"); //S³uchaj. Widzê, ¿e niez³y z ciebie wojownik. PrzyjdŸ do mnie po rozmowie z Thangorem, to poka¿ê ci jak zwiêkszyæ si³ê.
		KorthHelp=LOG_SUCCESS;
		//NPC_ExchangeRoutine (self,"start");
		B_GiveXP(XP*15);
		B_LogEntry(P_OHCamp, "No proszê chyba uda³o mi siê zdobyæ uznanie Kortha. A przede wszystkim poprze mnie przed Thangorem. Da³ mi za porz¹dny miecz i jeszcze obieca³ pokazaæ mi kilka æwiczeñ na zwiêkszenie si³y. Mo¿e go jeszcze polubiê...");	
		AI_StopProcessInfos	(self);
		}
		else//Edit By Fenix
		{
			AI_Output (self, other,"Info_Korth_Help_11_10"); //Mam dla ciebie coœ specjalnego. 
			AI_Output (self, other,"Info_Korth_Help_11_11"); //Nawet Thangor o tym nic nie wie, wiêc jak mu wygadasz, to zanim on mnie zat³ucze, to tak ci z³ojê skórê, ¿e ciê rodzona matka nie pozna.
			AI_Output (self, other,"Info_Korth_Help_11_12"); //S³uchaj uwa¿nie, bo nie bêdê powtarza³.
			AI_Output (self, other,"Info_Korth_Help_11_13"); //Niedaleko pla¿y, jest wejœcie do starej jaskini. Mo¿na siê tam te¿ dostaæ przez zrujnowan¹ wie¿ê na klifie, ale tamt¹ drogê bym ci odradza³.
			AI_Output (self, other,"Info_Korth_Help_11_14"); //Te cholerne podziemie a¿ roi siê od umarlaków. By³em tam raz. Do dzisiaj przechodz¹ mnie ciarki jak o tym pomyœlê...
			AI_Output (self, other,"Info_Korth_Help_11_15"); //Znalaz³em tam cia³o jakiegoœ starca, ale zanim zd¹¿y³em je obszukaæ, pojawi³ siê cholerny szkielet-mag i przyzwa³ ca³¹ pieprzon¹ armiê nieumar³ych.
			AI_Output (self, other,"Info_Korth_Help_11_16"); //Kilkunastu za³atwi³em, ale ten truposzczak ci¹gle przyzywa³ nowych. Wola³em wiêc wzi¹æ dupê w troki. Wiesz, taki strategiczny odwrót na z góry upatrzone pozycje...
			AI_Output (self, other,"Info_Korth_Help_11_17"); //Tylko, ¿e podczas ucieczki zgubi³em mój pierœcieñ.
			AI_Output (other, self,"Info_Korth_Help_15_18"); //Przecie¿ to tylko jakaœ b³yskotka...
			AI_Output (self, other,"Info_Korth_Help_11_19"); //Mówi³em ¿ebyœ mi nie przerywa³.
			AI_Output (self, other,"Info_Korth_Help_11_20"); //A co do sygnetu, to nie by³a zwyczajna b³yskotka. Ale jak zdradzisz to komukolwiek, to ci nogi z dupy powyrywam.
			AI_Output (other, self,"Info_Korth_Help_15_21"); //Dobra, ju¿ dobra. Mów co mam zrobiæ...
			AI_Output (self, other,"Info_Korth_Help_11_22"); //Ten pierœcieñ da³ mi Thangor jeszcze w Khorinis. 
			AI_Output (self, other,"Info_Korth_Help_11_23"); //Ta magiczna zabawka jest kluczem do naszej, hmm... kryjówki. Wiêcej ci i tak nie powiem.
			AI_Output (self, other,"Info_Korth_Help_11_24"); //Oczywiœcie Thangor ma orygina³, ale jak siê dowie, ¿e zgubi³em kopiê, to mnie na maszcie za jaja powiesi.
			AI_Output (other, self,"Info_Korth_Help_15_25"); //Zrozumia³em. Mam pójœæ do jaskini z umarlakami i odnaleŸæ ten twój drogocenny klucz do tajemniczej kryjówki Przemytników.
			AI_Output (self, other,"Info_Korth_Help_11_26"); //Niech ciê szlag trafi. Masz szczêœcie, ¿e przynajmniej na razie ciê potrzebujê. Bo za takie ¿arciki ju¿ niejedna g³owa potoczy³a siê po ziemi.
			AI_Output (self, other,"Info_Korth_Help_11_27"); //Ale masz racjê. Przynieœ mój pierœcieñ, a zdobêdziesz moje uznanie. Jak Thangor zapyta mnie o ciebie, to powiem ¿eœ swój ch³op.
			AI_Output (self, other,"Info_Korth_Help_11_28"); //Co ty na to?
			Info_ClearChoices (Info_Korth_Help);
			Info_AddChoice (Info_Korth_Help, "Raczej nie bêdê nara¿a³ siê dla jakiejœ b³yskotki.", Info_Korth_Help_No);
			Info_AddChoice (Info_Korth_Help, "Niech bêdzie. Przyniosê ten pierœcionek.", Info_Korth_Help_Yes);
			};
		}
		else if (FindHunter==LOG_RUNNING)
		{
		AI_Output (other, self,"Info_Korth_Help_15_29"); //S³ysza³em od Servina, ¿e coœ ci zginê³o...
		AI_Output (self, other,"Info_Korth_Help_11_30"); //Tak, bardzo œmieszne. Ha ha. No to jak ju¿ siê poœmialiœmy, to mo¿esz spadaæ.
		AI_Output (self, other,"Info_Korth_Help_11_31"); //Sam sobie poradzê z tymi gnojkami.
		AI_Output (other, self,"Info_Korth_Help_15_32"); //Jak chcesz, ale zdaje siê, ¿e Thangor ma ju¿ doœæ czekania. Poza tym Servin naszykowa³ ju¿ towar na nastêpn¹ transakcjê...
		AI_Output (self, other,"Info_Korth_Help_11_33"); //Cholera, masz racjê. 
		AI_Output (self, other,"Info_Korth_Help_11_34"); //Nie mogê uganiaæ siê za tymi sukinsynami i jednoczeœnie pilnowaæ obozu przed ciekawskimi gnojkami, jak nie przymierzaj¹c ty.
		AI_Output (self, other,"Info_Korth_Help_11_35"); //Hmm... Wiesz co? Mo¿e jednak siê przydasz. 
		AI_Output (self, other,"Info_Korth_Help_11_36"); //Jakiœ tydzieñ temu wys³aliœmy Kyro i Nikolasa z towarem dla Quentina.
		AI_Output (other, self,"Info_Korth_Help_15_37"); //Tak, s³ysza³em ju¿ od Servina, ¿e tamci dwaj gdzieœ siê zawieruszyli.
		AI_Output (self, other,"Info_Korth_Help_11_38"); //Ano w³aœnie. Thangor podejrzewa, ¿e dali nogê z nasz¹ rud¹, ale mi siê wydaje, ¿e spotka³a ich jakaœ niemi³a niespodzianka.
		AI_Output (self, other,"Info_Korth_Help_11_39"); //Znam Kyro od dwóch lat i jestem pewien jego lojalnoœci.
		AI_Output (self, other,"Info_Korth_Help_11_40"); //A co do tego Nikolasa, to wcale bym siê nie zdziwi³ jakby to on wywin¹³ jak¹œ sztuczkê.
		AI_Output (self, other,"Info_Korth_Help_11_41"); //Ten gnojek myœli, ¿e jak jego ojciec by³ baronem to wszystko mu wolno.
		AI_Output (self, other,"Info_Korth_Help_11_42"); //Jak wiesz, zbli¿a siê termin kolejnej dostawy, a my nie wiemy co siê sta³o z poprzedni¹.
		AI_Output (other, self,"Info_Korth_Help_15_43"); //Niech zgadnê. I tu na scenie dramatu pojawiam siê ja.
		AI_Output (self, other,"Info_Korth_Help_11_44"); //Tak, jesteœ bystry jak woda w kloace. Ale masz racjê. Potrzebujemy kogoœ kto zbada tê sprawê i dowie siê co z t¹ cholern¹ dostaw¹ siê sta³o.
		AI_Output (other, self,"Info_Korth_Help_15_45"); //A co ja z tego bêdê mia³?
		AI_Output (self, other,"Info_Korth_Help_11_46"); //Ju¿ ty siê nie bój o nagrodê. Rób swoje, a na pewno nie po¿a³ujesz.
		AI_Output (self, other,"Info_Korth_Help_11_47"); //Aha. Kyro zawsze zatrzymywa³ siê na odpoczynek w opuszczonym obozie myœliwych niedaleko Starego Obozu. 
		AI_Output (self, other,"Info_Korth_Help_11_48"); //SprawdŸ tam. Jak bêdziesz mia³ szczêœcie to mo¿e tam go odnajdziesz.
		B_LogEntry(P_OHCamp, "Korth kaza³ mi odnaleŸæ zagubionych Przemytników. Podejrzewa, ¿e coœ mog³o siê im przydarzyæ w drodze do obozu bandytów. Powiedzia³, ¿e Kyro, jeden z nich móg³ zatrzymaæ siê w opuszczonym obozie myœliwych niedaleko Starego Obozu. Chyba tam rozpocznê poszukiwania.");	
		KorthHelp=LOG_RUNNING;
		};	
};

		// -----------------------------------NoHelp--------------------------------

		FUNC VOID Info_Korth_Help_No()
			{
			AI_Output (other, self,"Info_Korth_Help_No_15_01"); //Nie mam zamiaru uganiaæ siê po jaskini, w której a¿ roi siê od umarlaków.
			AI_Output (self, other,"Info_Korth_Help_No_11_02"); //Ty gnojku! Wolê siê upewniæ, ¿e nikomu nie zdradzisz mojego sekretu.
			AI_Output (self, other,"Info_Korth_Help_No_11_03"); //Za chwilê sam staniesz siê jednym z umarlaków!
			AI_StopProcessInfos (self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_Attack,0,""); //Œmieræ wyci¹ga po ciebie swoje drapie¿ne szpony...
			KorthHelp=LOG_FAILED;
			};
			
		// -----------------------------------YesHelp--------------------------------

		FUNC VOID Info_Korth_Help_Yes()
			{
			Kyro_1 = 10;
			kor_agree = TRUE;
			AI_Output (other, self,"Info_Korth_Help_Yes_15_01"); //Rozejrzê siê za t¹ twoj¹ b³yskotk¹.
			AI_Output (self, other,"Info_Korth_Help_Yes_11_02"); //Jednak równy z ciebie ch³op.
			B_LogEntry (P_OHCamp, "Korth bardzo grzecznie poprosi³ mnie o to, ¿ebym odnalaz³ jego pierœcieñ. Podobno zgubi³ go w starej jaskini niedaleko pla¿y. Mam nadziejê, ¿e nie do³¹czê do umar³ych, którzy strzeg¹ tej groty.");
			AI_Output (self, other,"Info_Korth_Help_Yes_11_03"); //I uwa¿aj na siebie. Ta jaskinia to nie jest zbyt przyjemnym miejscem na spacerowanie.
			AI_Output (other, self,"Info_Korth_Help_Yes_15_04"); //Dziêki za troskê, ale jakoœ sobie poradzê. Zreszt¹, jak zawsze...
			KorthHelp=LOG_RUNNING;
			AI_StopProcessInfos	(self);
			};

// *********************************FindOreHunters***********************

INSTANCE Info_Korth_FindBoys (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 5;
	condition		= Info_Korth_FindBoys_Condition;
	information		= Info_Korth_FindBoys_Info;
	important		= 0;
	permanent		= 0;
	description = "Mam dobr¹ wiadomoœæ.";
};                       

FUNC INT  Info_Korth_FindBoys_Condition()
{	
	if ((FindHunter==LOG_FAILED)||(FindHunter==LOG_SUCCESS))&&(KorthHelp==LOG_RUNNING)
	&&(Npc_KnowsInfo (other, Info_Korth_Help))&&(Kyro_1 < 5)
	{
		return 1;
	};
};


FUNC VOID Info_Korth_FindBoys_Info()
{	
	if (KyroGo==TRUE)
	{
	Kyro_1 = 3;
	AI_Output (other, self,"Info_Korth_FindBoys_15_01"); //Znalaz³em twoje zguby.
	AI_Output (self, other,"Info_Korth_FindBoys_11_02"); //To gdzie oni s¹?
	AI_Output (other, self,"Info_Korth_FindBoys_15_03"); //W¹chaj¹ kwiatki od spodu.
	AI_Output (self, other,"Info_Korth_FindBoys_11_04"); //O kurwa. Mów co siê sta³o!
	AI_Output (other, self,"Info_Korth_FindBoys_15_05"); //Nie wiem co siê sta³o. Znalaz³em tylko ich cia³a. Chyba po prostu mieli pecha...
	AI_Output (self, other,"Info_Korth_FindBoys_11_06"); //Niech to szlag trafi. A obszuka³eœ cia³a?
	AI_Output (other, self,"Info_Korth_FindBoys_15_07"); //Ba. To zrobi³em na samym pocz¹tku.
	AI_Output (self, other,"Info_Korth_FindBoys_11_08"); //I co? Mieli przy sobie rudê?
	ore=2500;
	Info_ClearChoices (Info_Korth_FindBoys);
	Info_AddChoice (Info_Korth_FindBoys, "Niestety nie.", Info_Korth_FindBoys_No);
	Info_AddChoice (Info_Korth_FindBoys, "Ano mieli i to ca³kiem sporo.", Info_Korth_FindBoys_Yes);
	}
	else if (KyroGo==FALSE)
	{
	Kyro_1 = 3;
	AI_Output (other, self,"Info_Korth_FindBoys_15_09"); //Znalaz³em twoje zguby.
	AI_Output (self, other,"Info_Korth_FindBoys_11_10"); //To gdzie oni s¹?
	AI_Output (other, self,"Info_Korth_FindBoys_15_11"); //Kyro powiedzia³, ¿e musi trochê nabraæ si³ po utarczce z goblinami.
	AI_Output (other, self,"Info_Korth_FindBoys_15_12"); //Jak poczuje siê lepiej to wróci i odda przesy³kê Thangorowi.
	AI_Output (self, other,"Info_Korth_FindBoys_11_13"); //Niech ci bêdzie. Kyro ju¿ tu by³ i odda³ szefowi co trzeba.
	AI_Output (self, other,"Info_Korth_FindBoys_11_14"); //Mo¿e jednak na coœ siê jeszcze przydasz...
	KorthHelp=LOG_SUCCESS;
	NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*8);
	B_LogEntry(P_OHCamp, "Korth jak zawsze marudzi³, ale w koñcu zdoby³em jego poparcie u Thangora, a to jest najwa¿niejsze.");	
	AI_StopProcessInfos	(self);

	};
};

// -----------------------------------No--------------------------------
	
	FUNC VOID Info_Korth_FindBoys_No()
	{
		AI_Output (other, self,"Info_Korth_FindBoys_No_15_01"); //Nic przy nich nie znalaz³em.
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_02"); //Kurwa, kurwa, kurwa! Ca³y transport szlag trafi³!
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_03"); //Ja tego Thangorowi nie powiem...
		AI_Output (other, self,"Info_Korth_FindBoys_No_15_04"); //To mo¿e ja to zrobiê?
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_05"); //Skoro ¿ycie ci niemi³e, to czemu nie. Ja tam o niczym nie wiem...
		B_GiveXP(Xp*2);
		NPC_ExchangeRoutine (self,"start");
		KorthHelp=LOG_FAILED;
		B_LogEntry(P_OHCamp, "Zatai³em przed Korthem, kilka spraw, ale tak bêdzie lepiej. Ciekawe tylko czy Thangor bêdzie chcia³ ze mn¹ gadaæ?");	
		AI_StopProcessInfos	(self);
	};
//////////////////////////Edit By Fenix////////////////////////////////////////////////////////////////////////////////////////////////////////			
// -----------------------------------Yes--------------------------------

	FUNC VOID Info_Korth_FindBoys_Yes()
	{
		AI_Output (other, self,"Info_Korth_FindBoys_Yes_15_01"); //Oto ca³a ruda z transportu.
		AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_02"); //Dawaj to!
			if  (Npc_HasItems (other,ItMiNugget)>=ore)
			{
			B_GiveInvItems (other,self,ItMiNugget,ore);
			Npc_RemoveInvItems (self,ItMiNugget,ore);
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_03"); //IdŸ powiedz Thangorowi, ¿e odnalaz³em nasz towar.
			AI_Output (other, self,"Info_Korth_FindBoys_Yes_15_04"); //Jak to ty? Przecie¿...
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_05"); //Zamknij siê ch³optasiu, bo ci zaraz buŸkê przefasonujê. Ciesz siê, ¿e ¿yjesz.
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_06"); //A teraz spadaj, bo mam wa¿niejsze rzeczy na g³owie.
			KorthHelp=LOG_SUCCESS;
			NPC_ExchangeRoutine (self,"start");
			B_GiveXP(Xp*8);
			B_LogEntry(P_OHCamp, "Korth najzwyczajniej w œwiecie przypisa³ sobie ca³¹ zas³ugê. Ale przynajmniej poprze mnie przed Thangorem, a to ju¿ coœ.");	
			AI_StopProcessInfos	(self);
			}
			else
			{
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_07"); //Ty parszywy gnojku. Co zrobi³eœ z nasz¹ rud¹?! No to zdychaj...
			KorthHelp=LOG_FAILED;
			AI_StopProcessInfos (self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_Attack,0,"");
			};	
	};	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// *********************************FindRing***********************

INSTANCE Info_Korth_FindRing (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 3;
	condition		= Info_Korth_FindRing_Condition;
	information		= Info_Korth_FindRing_Info;
	important		= 0;
	permanent		= 0;
	description = "By³em w tej cholernej jaskini.";
};                       

FUNC INT  Info_Korth_FindRing_Condition()
{	
	if (KorthHelp==LOG_RUNNING)&& (Kyro_1 == 10) && (Korth_ring_find == FALSE)
	&&(!Npc_KnowsInfo (other, Info_Korth_FindBoys))&& (Npc_HasItems (other,KorthRing)==1)
	{
		return 1;
	};
};
FUNC VOID Info_Korth_FindRing_Info()
{	
	Korth_ring_find = TRUE;
	AI_Output (other, self,"Info_Korth_FindRing_15_01"); //Znalaz³em twój pierœcieñ.
	AI_Output (self, other,"Info_Korth_FindRing_11_02"); //To dawaj go!
	B_GiveInvItems(other,self,KorthRing,1);
	Npc_RemoveInvItems(self,KorthRing,1);
	AI_Output (self, other,"Info_Korth_FindRing_11_03"); //A niech mnie, zas³u¿y³eœ na nagrodê. WeŸ ten miecz. To solidna robota. Wyku³ go Harad, kowal z Khorinis.
	CreateInvItems (self, ItMw_1H_Sword_Long_05,1);
	B_GiveInvItems(self,other, ItMw_1H_Sword_Long_05,1);
	AI_Output (other, self,"Info_Korth_FindRing_15_04"); //Dziêki. To wspania³a broñ.
	AI_Output (self, other,"Info_Korth_FindRing_11_05"); //Dobra, ju¿ dobra. Zas³u¿y³eœ na to ¿elazo.
	AI_Output (self, other,"Info_Korth_FindRing_11_06"); //IdŸ do Thangora i powiedz mu, ¿e Korth uwa¿a, ¿e porz¹dny z ciebie ch³op.
	AI_Output (other, self,"Info_Korth_FindRing_15_07"); //Na pewno nie omieszkam.
	AI_Output (self, other,"Info_Korth_FindRing_11_08"); //S³uchaj. Widzê, ¿e niez³y z ciebie wojownik. PrzyjdŸ do mnie po rozmowie z Thangorem, to poka¿ê ci jak zwiêkszyæ si³ê.
	KorthHelp=LOG_SUCCESS;
	//NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*15);
	B_LogEntry(P_OHCamp, "No proszê chyba uda³o mi siê zdobyæ uznanie Kortha. A przede wszystkim poprze mnie przed Thangorem. Da³ mi za ten pierœcieñ porz¹dny miecz i jeszcze obieca³ pokazaæ mi kilka æwiczeñ na zwiêkszenie si³y. Mo¿e go jeszcze polubiê...");	
	AI_StopProcessInfos	(self);
};
//////////////////////////Edit By Fenix////////////////////////////////////////////////////////////////////////////////////////////////////////
// *********************************FindRingAlso***********************

INSTANCE Info_Korth_FindRingAlso (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 3;
	condition		= Info_Korth_FindRingAlso_Condition;
	information		= Info_Korth_FindRingAlso_Info;
	important		= 0;
	permanent		= 0;
	description = "Czy to nie nale¿y do ciebie?";
};                       

FUNC INT  Info_Korth_FindRingAlso_Condition()
{	
	if (Npc_HasItems (other,KorthRing)==1)&&(Korth_ring_find == FALSE)&&(kor_agree==FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Korth_FindRingAlso_Info()
{	
	Korth_ring_find = TRUE;
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_01"); //Czy to nie nale¿y do ciebie?
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_02"); //To mój pierœcieñ! Sk¹d go masz?
	B_GiveInvItems(other,self,KorthRing,1);
	Npc_RemoveInvItems(self,KorthRing,1);
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_03"); //Znalaz³em go w grocie pe³nej nieumar³ych.
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_04"); //Jesteœ ca³kiem odwa¿ny. Mo¿e Ÿle ciê oceni³em. 
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_05"); //Zamiast dobrego s³owa wola³bym bardziej namacaln¹ nagrodê
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_06"); //Niech bêdzie. Poka¿e ci kilka æwiczeñ.
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_07"); //Jakich æwiczeñ?
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_08"); //Zaraz sam zobaczysz...
	PrintScreen	("Si³a +2", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+2;
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_09"); //Teraz bêdziesz trochê silniejszy. Uwa¿aj na siebie.
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_10"); //Dziêki Korth. Jesteœ ca³kiem w porz¹dku.
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_11"); //Dobra ju¿ dobra. Przestañ smêciæ bo siê rozp³aczê. Powodzenia na szlaku, przyjacielu.
	//KorthHelp=LOG_SUCCESS;
	//NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*15);
	B_LogEntry(P_OHCamp, "Korth pokaza³ mi jeszcze kilka æwiczeñ, które zwiêkszy³y moj¹ si³ê. Mo¿e go jeszcze polubiê...");	
	AI_StopProcessInfos	(self);
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// *********************************ImproveStrength***********************

INSTANCE Info_Korth_Improve (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 20;
	condition		= Info_Korth_Improve_Condition;
	information		= Info_Korth_Improve_Info;
	important		= 0;
	permanent		= 0;
	description = "I co z tymi æwiczeniami?";
};                       

FUNC INT  Info_Korth_Improve_Condition()
{	
	if (ThangorProof==LOG_RUNNING)&&(KorthHelp==LOG_SUCCESS)
	&&(Npc_KnowsInfo (other, Info_Korth_FindRing))
	{
		return 1;
	};
};
FUNC VOID Info_Korth_Improve_Info()
{	
	AI_Output (other, self,"Info_Korth_Improve_15_01"); //I co z tymi æwiczeniami?
	AI_Output (self, other,"Info_Korth_Improve_11_02"); //Zaraz poka¿ê ci kilka sztuczek...
	PrintScreen	("Si³a +2", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	AI_Output (self, other,"Info_Korth_Improve_11_03"); //Teraz bêdziesz trochê silniejszy. Uwa¿aj na siebie.
	AI_Output (other, self,"Info_Korth_Improve_15_04"); //Dziêki Korth. Jesteœ ca³kiem w porz¹dku.
	AI_Output (self, other,"Info_Korth_Improve_11_05"); //Dobra ju¿ dobra. Przestañ smêciæ bo siê rozp³aczê. Powodzenia na szlaku, przyjacielu.
};

// *********************************ThangorProoff***********************

INSTANCE Info_Korth_Pack (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 4;
	condition		= Info_Korth_Pack_Condition;
	information		= Info_Korth_Pack_Info;
	important		= 0;
	permanent		= 0;
	description = "Przysy³a mnie Thangor.";
};                       

FUNC INT  Info_Korth_Pack_Condition()
{	
	if (ThangorProof==LOG_RUNNING)&&(Npc_KnowsInfo (other, Info_Thangor_Proof))	
	{
		return 1;
	};
};

FUNC VOID Info_Korth_Pack_Info()
{	
	AI_Output (self, other,"Info_Korth_Pack_11_00"); //Niech zgadnê. Przysy³a ciê Thangor.
	AI_Output (other, self,"Info_Korth_Pack_15_01"); //Szef kaza³ mi pogadaæ z ka¿dym z was.
	AI_Output (self, other,"Info_Korth_Pack_11_02"); //Wiem, wiem. Dobra, mam tu coœ specjalnego. To prezent tylko dla Quentina, wiêc lepiej na to uwa¿aj.
	CreateInvItems (self, ItMi_GoldCup,4);
	CreateInvItems (self, ItMi_GoldChalice,4);
	CreateInvItems (self, ItMi_GoldRing,2);
	B_GiveInvItems(self,other, ItMi_GoldCup,4);
	B_GiveInvItems(self,other, ItMi_GoldChalice,4);
	B_GiveInvItems(self,other, ItMi_GoldRing,2);
	AI_Output (self, other,"Info_Korth_Pack_11_03"); //Quentin lubi b³yskotki, a te na pewno wpadn¹ mu w oko. Powodzenia.
	AI_Output (other, self,"Info_Korth_Pack_15_04"); //Dziêki. Postaram siê ich zbytnio nie pobrudziæ.
	B_LogEntry	 (P_OHCamp, "Korth przekaza³ mi coœ ekstra dla Quentina: 4 z³ote kielichy, 4 z³ote misy i 2 z³ote pierœcienie. NajwyraŸniej szef bandytów lubi œwiecide³ka.");
	B_GiveXP(XP);
	proof = proof + 1;
};

// *********************************Attack***********************

INSTANCE Info_Korth_Attack (C_INFO)
{
	npc		= Non_2003_Korth;
	nr			= 2;
	condition		= Info_Korth_Attack_Condition;
	information		= Info_Korth_Attack_Info;
	important		= 0;
	permanent		= 0;
	description = "Mam do ciebie ma³¹ proœbê.";
};                       

FUNC INT  Info_Korth_Attack_Condition()
{	
	if (OreSecret==LOG_RUNNING)&&(quentinattack==false)&&(Npc_KnowsInfo (other, Info_Thangor_Problem))	
	{
		return 1;
	};
};

FUNC VOID Info_Korth_Attack_Info()
{	
	AI_Output (self, other,"Info_Korth_Attack_11_00"); //Co masz tak¹ zbola³¹ minê? Mów.
	AI_Output (other, self,"Info_Korth_Attack_15_01"); //Mam problem z tym gnojkiem Quentinem. Thangor kaza³ mi siê go pozbyæ...
	AI_Output (self, other,"Info_Korth_Attack_11_02"); //Niech zgadnê. Nie czujesz siê za bardzo na si³ach ¿eby samemu posprz¹taæ w obozie tych w³óczêgów.
	AI_Output (other,self,"Info_Korth_Attack_15_03"); //Mniej wiêcej. To co, pomo¿esz?
	AI_Output (self,other,"Info_Korth_Attack_11_04"); //Z najwy¿sz¹ przyjemnoœci¹. W koñcu siê trochê rozerwê.
	B_GiveXP(XP*2);
	Korth_Go = Wld_GetDay();
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	self.flags			= NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GUIDE");
	B_LogEntry		(P_OreSecret, "Korth pomo¿e mi w pozbyciu siê Quentina. Ju¿ nie mogê siê doczekaæ co to bêdzie za walka...");

};

// *********************************Back***********************

INSTANCE Info_Korth_Back (C_INFO)
{
	npc		= Non_2003_Korth;
	condition		= Info_Korth_Back_Condition;
	information		= Info_Korth_Back_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT  Info_Korth_Back_Condition()
{	
//quentinattack==true)&&(

	var C_NPC Quentin; 
	Quentin = Hlp_GetNpc(ORG_858_Quentin);
	if (Npc_IsDead(Quentin))&&(Npc_KnowsInfo (other, Info_Thangor_Problem))&&(Npc_KnowsInfo (other, Info_Korth_Attack))
	{
		return 1;
	};
};

FUNC VOID Info_Korth_Back_Info()
{	
	AI_Output (self, other,"Info_Korth_Back_11_00"); //No i po sprawie.
	AI_Output (other, self,"Info_Korth_Back_15_01"); //Dziêki za pomoc. 
	AI_Output (self, other,"Info_Korth_Back_11_02"); //Uwierz mi stary, ¿e ca³a przyjemnoœæ po mojej stronie.
	AI_Output (other,self,"Info_Korth_Back_15_03"); //Pokrêcê siê jeszcze trochê po okolicy.
	AI_Output (self,other,"Info_Korth_Back_11_04"); //To na razie. Muszê wracaæ do obozu, bo Thangor siê wœcieknie. Trzymaj siê brachu.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags			= 0;
	B_GiveXP(XP*5);
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
	B_LogEntry		(P_OreSecret, "Quentin jest ju¿ przesz³oœci¹. Teraz nawet jak któryœ z bandytów prze¿y³ to i tak bez swojego szefa nie s¹ ju¿ groŸni.");

};


// *********************************ToLate***********************

INSTANCE Info_Korth_Late (C_INFO)
{
	npc		= Non_2003_Korth;
	condition		= Info_Korth_Late_Condition;
	information		= Info_Korth_Late_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT  Info_Korth_Late_Condition()
{	
	if (Korth_Go <=(Wld_GetDay()-2)) && (Npc_KnowsInfo (other, Info_Thangor_Problem)) && (!Npc_KnowsInfo (other, Info_Korth_Back)) && (Npc_KnowsInfo (other, Info_Korth_Attack))

	{
		return 1;
	};
};

FUNC VOID Info_Korth_Late_Info()
{	
	AI_Output (self, other,"Info_Korth_Late_11_00"); //Nie mam czasu, ¿eby siê z tob¹ szlajaæ po ca³ej Kolonii.
	AI_Output (other, self,"Info_Korth_Late_15_01"); //Ale...
	AI_Output (self, other,"Info_Korth_Late_11_02"); //Muszê wracaæ do obozu bo Thangor siê wœcieknie. Trzymaj siê brachu.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags			= 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
	B_LogEntry		(P_OreSecret, "No to da³em cia³a. Korth stwierdzi³, ¿e nie ma czasu na wa³êsanie siê po okolicy. Teraz muszê sobie sam poradziæ z Quentinem.");
};

// *********************************Monk Clue***********************

INSTANCE Info_Korth_Monk (C_INFO)
{
	npc		= Non_2003_Korth;
	condition		= Info_Korth_Monk_Condition;
	information		= Info_Korth_Monk_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT  Info_Korth_Monk_Condition()
{	
	if (Npc_KnowsInfo (other, Info_Korth_FindRing))&&(Npc_KnowsInfo (other, Info_Thangor_Focus))&&(!Npc_KnowsInfo (other, Info_Monk_Seks))
	{
		return 1;
	};   
};

FUNC VOID Info_Korth_Monk_Info()
{	
	AI_Output (self, other,"Info_Korth_Monk_11_00"); //S³ysza³em, ¿e masz zamiar zapolowaæ na tego sukinsyna Monka.
	AI_Output (other, self,"Info_Korth_Monk_15_01"); //Mniej wiêcej. Muszê coœ od niego odebraæ.
	AI_Output (self, other,"Info_Korth_Monk_11_02"); //Wiem. Mogê ci powiedzieæ gdzie ten gnojek siê ukrywa.
	AI_Output (other, self,"Info_Korth_Monk_15_03"); //To by mi bardzo u³atwi³o zadanie.
	AI_Output (self, other,"Info_Korth_Monk_11_04"); //Sam bym poszed³ zrobiæ porz¹dek z tym bydlakiem, ale Thangor upar³ siê, ¿e mam pilnowaæ obozu.
	AI_Output (self, other,"Info_Korth_Monk_11_05"); //Kurde, on czasami przesadza. Chyba nie myœli, ¿e ktoœ nas tutaj napadnie...
	AI_Output (other, self,"Info_Korth_Monk_15_06"); //To co z tym Monkiem?
	AI_Output (self, other,"Info_Korth_Monk_11_07"); //Wydaje mi siê, ¿e ta szumowina zamelinowa³a siê w jaskini za wodospadem. To niedaleko miejsca gdzie spotka³eœ Kyro.
	AI_Output (self, other,"Info_Korth_Monk_11_08"); //Naprzeciwko jaskini z goblinami. Na pewno trafisz.
	AI_Output (other, self,"Info_Korth_Monk_15_09"); //Dziêki Korth. Ta informacja bardzo mi siê przyda.
	AI_Output (self, other,"Info_Korth_Monk_11_10"); //Nie ma za co. Pomog³eœ mi z pierœcieniem, to teraz moja kolej.
	AI_Output (self, other,"Info_Korth_Monk_11_11"); //Trzymaj siê brachu.
	B_LogEntry	 (P_OHCamp, "Korth powiedzia³ mi, ¿e Monk mo¿e ukrywaæ siê w jaskini za wodospadem, niedaleko tej jaskini z goblinami. No proszê, dobre uczynki w koñcu zaczê³y procentowaæ...");
	B_GiveXP(XP*3);
};


//--------------2H fighting-----------------------------------------------------------


instance  Korth_ZWEIHAND1s (C_INFO)
{
	npc				= Non_2003_Korth;
	condition		= Korth_ZWEIHAND1s_Condition;
	information		= Korth_ZWEIHAND1s_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naucz mnie walki dwurêcznym orê¿em."; 
};

FUNC int  Korth_ZWEIHAND1s_Condition()
{		//Edit By Fenix
	if /*(Npc_GetTalentValue  (hero,NPC_TALENT_2H) >= 0)&&*/ (ThangorProof==LOG_SUCCESS)//&&(learn_twoh == FALSE)

	{
		return TRUE;
	};

};


FUNC void  Korth_ZWEIHAND1s_Info()
{
	AI_Output (other, self,"Korth_ZWEIHAND1s_15_01"); //Naucz mnie walki dwurêcznym orê¿em.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_02"); //Dobrze, najpierw zajmiemy siê podstawami.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_03"); //Wyci¹gnij miecz przed siebie. Aby zaatakowaæ wroga tak ciê¿k¹ broni¹, musisz mocniej siê zamachn¹æ.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_04"); //Unieœ ramiê i zdecydowanie opuœæ miecz. To powinno wystarczyæ, ¿eby powaliæ przeciwnika na ziemiê.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_05"); //Wykorzystaj bezw³adnoœæ broni, by unieœæ j¹ ponownie do góry.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_06"); //Dwurêczne miecze œwietnie sprawdzaj¹ siê przy zadawaniu ciosów z boku. W ten sposób mo¿esz trzymaæ przeciwnika na dystans.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_07"); //To ci powinno wystarczyæ na pocz¹tek. Teraz trochê poæwicz.
		learn_twoh = TRUE;
};



instance  Korth_ZWEIHAND1 (C_INFO)
{
	npc				= Non_2003_Korth;
	condition		= Korth_ZWEIHAND1_Condition;
	information		= Korth_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Walka dwurêcznym orê¿em."; 
};

FUNC int  Korth_ZWEIHAND1_Condition()
{		//Edit By Fenix
	if /*(Npc_GetTalentValue  (hero,NPC_TALENT_2H) >= 0)&&*/ (ThangorProof==LOG_SUCCESS) && (Npc_KnowsInfo (other, Korth_ZWEIHAND1s))//(learn_twoh == TRUE)

	{
		return TRUE;
	};

};


FUNC void  Korth_ZWEIHAND1_Info()
{
	//Edit By Fenix
	mnozenie ();
	Info_ClearChoices	(Korth_ZWEIHAND1);    
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Korth_ZWEIHAND1_1);
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Korth_ZWEIHAND1_5);		
	Info_AddChoice		(Korth_ZWEIHAND1,DIALOG_BACK, Korth_ZWEIHAND1_BACK);
	Info_AddChoice		(Korth_ZWEIHAND1,"Koniec", Korth_ZWEIHAND1_EXIT);

};

func void Korth_ZWEIHAND1_EXIT()
{
	AI_StopProcessInfos	(self);
};

func void Korth_ZWEIHAND1_BACK()
{
	
	Info_ClearChoices	(Korth_ZWEIHAND1);
};


func void Korth_ZWEIHAND1_1()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1*miecz2h,self);
	//B_GiveSkill(other,NPC_TALENT_2H,0,1);
	Info_ClearChoices	(Korth_ZWEIHAND1);
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Korth_ZWEIHAND1_1);
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Korth_ZWEIHAND1_5);
	Info_AddChoice		(Korth_ZWEIHAND1,DIALOG_BACK, Korth_ZWEIHAND1_BACK);
	Info_AddChoice		(Korth_ZWEIHAND1,"Koniec", Korth_ZWEIHAND1_EXIT);

};

func void Korth_ZWEIHAND1_5()
{
	//Edit By Fenix
	mnozenie ();
	B_GiveprocentSkill (other,NPC_TALENT_2H,5,LPCOST_TALENT_2H_2*miecz2h,self);
	//B_GiveSkill(other,NPC_TALENT_2H,0,5);
	Info_ClearChoices	(Korth_ZWEIHAND1);
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1*miecz2h,0), Korth_ZWEIHAND1_1);
	Info_AddChoice		(Korth_ZWEIHAND1,B_BuildLearnString(NAME_Learn2h_5,LPCOST_TALENT_2H_2*miecz2h,0), Korth_ZWEIHAND1_5);
	Info_AddChoice		(Korth_ZWEIHAND1,DIALOG_BACK, Korth_ZWEIHAND1_BACK);
	Info_AddChoice		(Korth_ZWEIHAND1,"Koniec", Korth_ZWEIHAND1_EXIT);

};


