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
// 		Stra�nik Obozu
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
	AI_Output (self, other,"Info_EnterCamp_11_00"); //Czego tu szukasz w��cz�go?! I lepiej �eby� mia� dobry pow�d!
	
	if (FindHunter==LOG_SUCCESS)
		{	
			AI_RemoveWeapon (self);
			AI_Output (self, other,"Info_Korth_EnterCamp_11_09"); //S�ysza�em, �e pomog�e� jednemu z naszych i to zupe�nie bezinteresownie. To bardzo rzadka cecha w�r�d tutejszych szumowin. 
			B_GiveXP(XP*5);
			AI_Output (self, other,"Info_Korth_EnterCamp_11_10"); //Wi�kszo�� ze skaza�c�w poder�n�aby gard�o w�asnej matce, gdyby dostali za to cho� troch� rudy.
			
			if (DiegoHelp<=LOG_RUNNING)
			{
				AI_Output (self, other,"Info_Korth_EnterCamp_11_11"); //Mo�esz wej�� do obozu. Tylko lepiej �eby ci si� nic nie przyklei�o do r�czek. Dla z�odziei mamy tylko jedn� kar�. I uwierz mi, �e �mier� jest jej bezbolesnym epitafium...
				AI_Output (self, other,"Info_Korth_EnterCamp_11_12"); //Jak chcesz si� dowiedzie� czego� wi�cej to pogadaj z Servinem. Mo�e pozostali te� b�d� chcieli zamieni� z tob� s��wko. Pogadaj z Angharem, to nasz kowal. Ma chyba jaki� problem.
				AI_Output (other, self,"Info_Korth_EnterCamp_15_17"); //Dzi�ki...
				AI_Output (self, other,"Info_Korth_EnterCamp_11_18"); //Dobra, ju� dobra. Przesta� psu� powietrze i spadaj. Mam wa�niejsze sprawy na g�owie ni� pogaduchy.
			};
			NPC_ExchangeRoutine (self,"start");
			Log_CreateTopic	(P_OHCamp, LOG_MISSION);
			Log_SetTopicStatus	(P_OHCamp, LOG_RUNNING);
			if (DiegoHelp!=LOG_RUNNING)
			{
				B_LogEntry		(P_OHCamp, "W ko�cu odnalaz�em tych tajemniczych odludk�w. Trafienie na to zadupie ma�o nie kosztowa�o mnie �ycia. Pe�no tutaj dzikich zwierz�t. Korth, kt�ry jest tutaj stra�nikiem wys�a� mnie do jakiego� Servina, �ebym z nim pogada� o przesy�ce dla Diego. M�wi� te� �ebym zamieni� s��wko z jakim� Angharem.");
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
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie b�dzie si� tutaj pa��ta� bez powodu! Sam tego chcia�e� �achmyto...
			AI_StopProcessInfos	(self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_ATTACK,1,"");
		};
		
	if (DiegoHelp==LOG_RUNNING)
	{	
		B_GiveXP(XP*2);
		AI_Output (other, self,"Info_Korth_EnterCamp_15_01"); //Przysy�a mnie Diego. Mam dla niego odebra� jak�� przesy�k�. Nic wi�cej nie wiem...
		AI_RemoveWeapon (self);
		AI_Output (self, other,"Info_Korth_EnterCamp_11_02"); //Trzeba by�o tak od razu m�wi�. Jak masz odebra� co� dla Diega, to id� do Servina, on jest naszym kwatermistrzem.
		AI_Output (self, other,"Info_Korth_EnterCamp_11_03"); //Tylko �eby ci� r�czki nie �wierzbi�y. Jak zobacz�, �e co� kradniesz, to obetn� ci wszystkie pi�� cz�onk�w. Jasne?
		AI_Output (other, self,"Info_Korth_EnterCamp_15_04"); //Jak s�o�ce.
	/*	if (Kyro_rec == 2)
		{
		Kyro_1 = 5;
		AI_Output (self, other,"Info_Korth_EnterCamp_15_05"); //Kyro wspomnia� mi, �e mu pomog�e�. Pewnie zrobi�e� to tylko po to �eby zarobi�.
		AI_Output (self, other,"Info_Korth_EnterCamp_15_06"); //Ale to nie zmienia faktu, �e pomog�e� jednemu z nas. Dobrze zrobi�e�.
		};
		if (Kyro_rec == 1)
		{
		Kyro_1 = 5;
		};*/
		AI_Output (self, other,"Info_Korth_EnterCamp_11_07"); //A teraz spadaj, bo zas�aniasz mi widok. Id� pogadaj z Servinem i lepiej �eby� nic nie kombinowa�... 
		AI_Output (self, other,"Info_Korth_EnterCamp_11_08"); //Aha. Jak ju� tu jeste�, to zagadaj te� do Anghara. On ci powie o co chodzi.
		NPC_ExchangeRoutine (self,"start");
		Log_CreateTopic	(P_OHCamp, LOG_MISSION);
		Log_SetTopicStatus	(P_OHCamp, LOG_RUNNING);
		B_LogEntry		(P_OHCamp, "W ko�cu odnalaz�em tych tajemniczych odludk�w, o kt�rych m�wi� Diego.  Trafienie na to zadupie ma�o nie kosztowa�o mnie �ycia. Pe�no tutaj dzikich zwierz�t. Korth, kt�ry jest tutaj stra�nikiem wys�a� mnie do jakiego� Servina, �ebym z nim pogada� o przesy�ce dla Diego. M�wi� te� �ebym zamieni� s��wko z jakim� Angharem.");
		AngharHelp=LOG_RUNNING;
		OHCamp=LOG_RUNNING;
		//AI_StopProcessInfos	(self);
	}
	else
	if (FindHunter!=LOG_SUCCESS)
		{
			AI_Output (other, self,"Info_Korth_EnterCamp_15_13"); //Ja tylko...
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie b�dzie si� tutaj pa��ta� bez powodu! Sam tego chcia�e� �achmyto...
			AI_StopProcessInfos	(self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_ATTACK,1,"");
		};
		
		/*if (FindHunter!=LOG_SUCCESS) && (DiegoHelp!=LOG_RUNNING)
		{
			AI_Output (other, self,"Info_Korth_EnterCamp_15_13"); //Ja tylko...
			AI_Output (self, other,"Info_Korth_EnterCamp_11_14"); //Nikt nie b�dzie si� tutaj pa��ta� bez powodu! Sam tego chcia�e� �achmyto...
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
	description = "Nie chcia�bym si� narzuca�, ale...";
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
	AI_Output (self, other,"Info_Korth_Help_11_00"); //To znowu ty. No, skoro ju� tu jeste� to gadaj o co ci chodzi.

		if (FindHunter==LOG_SUCCESS)
		{
		AI_Output (other,self,"Info_Korth_Help_15_01"); //Musz� zdoby� zaufanie Thangora. Pomy�la�em, �e je�eli pomog� jego ludziom, to by� mo�e w ko�cu si� do mnie przekona.
		AI_Output (self, other,"Info_Korth_Help_11_02"); //Hmm. Za�atwi�e� ju� spraw� z tymi dwoma nieudacznikami. Servin te� ci� chwali...
		if (Korth_ring_find == TRUE)
		{
		AI_Output (self, other,"Info_Korth_Help_11_03"); //A przede wszystkim odnalaz�e� m�j pier�cie�. Dobra robota ch�opcze. Masz moje pe�ne poparcie.
		AI_Output (self, other,"Info_Korth_Help_11_04"); //Zas�u�y�e� te� na specjaln� nagrod�. We� ten miecz. To niezwykle solidna robota. Wyku� go Harad, kowal z Khorinis.
		CreateInvItems (self, ItMw_1H_Sword_Long_066,1);
		B_GiveInvItems(self,other, ItMw_1H_Sword_Long_066,1);
		AI_Output (other, self,"Info_Korth_Help_11_05"); //Dzi�ki. To wspania�a bro�.
		AI_Output (self, other,"Info_Korth_Help_11_06"); //Dobra, ju� dobra. Zas�u�y�e� na to �elazo. 
		AI_Output (self, other,"Info_Korth_Help_11_07"); //Id� do Thangora i powiedz mu, �e Korth uwa�a, �e porz�dny z ciebie ch�op.
		AI_Output (other, self,"Info_Korth_Help_11_08"); //Na pewno nie omieszkam.
		AI_Output (self, other,"Info_Korth_Help_11_09"); //S�uchaj. Widz�, �e niez�y z ciebie wojownik. Przyjd� do mnie po rozmowie z Thangorem, to poka�� ci jak zwi�kszy� si��.
		KorthHelp=LOG_SUCCESS;
		//NPC_ExchangeRoutine (self,"start");
		B_GiveXP(XP*15);
		B_LogEntry(P_OHCamp, "No prosz� chyba uda�o mi si� zdoby� uznanie Kortha. A przede wszystkim poprze mnie przed Thangorem. Da� mi za porz�dny miecz i jeszcze obieca� pokaza� mi kilka �wicze� na zwi�kszenie si�y. Mo�e go jeszcze polubi�...");	
		AI_StopProcessInfos	(self);
		}
		else//Edit By Fenix
		{
			AI_Output (self, other,"Info_Korth_Help_11_10"); //Mam dla ciebie co� specjalnego. 
			AI_Output (self, other,"Info_Korth_Help_11_11"); //Nawet Thangor o tym nic nie wie, wi�c jak mu wygadasz, to zanim on mnie zat�ucze, to tak ci z�oj� sk�r�, �e ci� rodzona matka nie pozna.
			AI_Output (self, other,"Info_Korth_Help_11_12"); //S�uchaj uwa�nie, bo nie b�d� powtarza�.
			AI_Output (self, other,"Info_Korth_Help_11_13"); //Niedaleko pla�y, jest wej�cie do starej jaskini. Mo�na si� tam te� dosta� przez zrujnowan� wie�� na klifie, ale tamt� drog� bym ci odradza�.
			AI_Output (self, other,"Info_Korth_Help_11_14"); //Te cholerne podziemie a� roi si� od umarlak�w. By�em tam raz. Do dzisiaj przechodz� mnie ciarki jak o tym pomy�l�...
			AI_Output (self, other,"Info_Korth_Help_11_15"); //Znalaz�em tam cia�o jakiego� starca, ale zanim zd��y�em je obszuka�, pojawi� si� cholerny szkielet-mag i przyzwa� ca�� pieprzon� armi� nieumar�ych.
			AI_Output (self, other,"Info_Korth_Help_11_16"); //Kilkunastu za�atwi�em, ale ten truposzczak ci�gle przyzywa� nowych. Wola�em wi�c wzi�� dup� w troki. Wiesz, taki strategiczny odwr�t na z g�ry upatrzone pozycje...
			AI_Output (self, other,"Info_Korth_Help_11_17"); //Tylko, �e podczas ucieczki zgubi�em m�j pier�cie�.
			AI_Output (other, self,"Info_Korth_Help_15_18"); //Przecie� to tylko jaka� b�yskotka...
			AI_Output (self, other,"Info_Korth_Help_11_19"); //M�wi�em �eby� mi nie przerywa�.
			AI_Output (self, other,"Info_Korth_Help_11_20"); //A co do sygnetu, to nie by�a zwyczajna b�yskotka. Ale jak zdradzisz to komukolwiek, to ci nogi z dupy powyrywam.
			AI_Output (other, self,"Info_Korth_Help_15_21"); //Dobra, ju� dobra. M�w co mam zrobi�...
			AI_Output (self, other,"Info_Korth_Help_11_22"); //Ten pier�cie� da� mi Thangor jeszcze w Khorinis. 
			AI_Output (self, other,"Info_Korth_Help_11_23"); //Ta magiczna zabawka jest kluczem do naszej, hmm... kryj�wki. Wi�cej ci i tak nie powiem.
			AI_Output (self, other,"Info_Korth_Help_11_24"); //Oczywi�cie Thangor ma orygina�, ale jak si� dowie, �e zgubi�em kopi�, to mnie na maszcie za jaja powiesi.
			AI_Output (other, self,"Info_Korth_Help_15_25"); //Zrozumia�em. Mam p�j�� do jaskini z umarlakami i odnale�� ten tw�j drogocenny klucz do tajemniczej kryj�wki Przemytnik�w.
			AI_Output (self, other,"Info_Korth_Help_11_26"); //Niech ci� szlag trafi. Masz szcz�cie, �e przynajmniej na razie ci� potrzebuj�. Bo za takie �arciki ju� niejedna g�owa potoczy�a si� po ziemi.
			AI_Output (self, other,"Info_Korth_Help_11_27"); //Ale masz racj�. Przynie� m�j pier�cie�, a zdob�dziesz moje uznanie. Jak Thangor zapyta mnie o ciebie, to powiem �e� sw�j ch�op.
			AI_Output (self, other,"Info_Korth_Help_11_28"); //Co ty na to?
			Info_ClearChoices (Info_Korth_Help);
			Info_AddChoice (Info_Korth_Help, "Raczej nie b�d� nara�a� si� dla jakiej� b�yskotki.", Info_Korth_Help_No);
			Info_AddChoice (Info_Korth_Help, "Niech b�dzie. Przynios� ten pier�cionek.", Info_Korth_Help_Yes);
			};
		}
		else if (FindHunter==LOG_RUNNING)
		{
		AI_Output (other, self,"Info_Korth_Help_15_29"); //S�ysza�em od Servina, �e co� ci zgin�o...
		AI_Output (self, other,"Info_Korth_Help_11_30"); //Tak, bardzo �mieszne. Ha ha. No to jak ju� si� po�miali�my, to mo�esz spada�.
		AI_Output (self, other,"Info_Korth_Help_11_31"); //Sam sobie poradz� z tymi gnojkami.
		AI_Output (other, self,"Info_Korth_Help_15_32"); //Jak chcesz, ale zdaje si�, �e Thangor ma ju� do�� czekania. Poza tym Servin naszykowa� ju� towar na nast�pn� transakcj�...
		AI_Output (self, other,"Info_Korth_Help_11_33"); //Cholera, masz racj�. 
		AI_Output (self, other,"Info_Korth_Help_11_34"); //Nie mog� ugania� si� za tymi sukinsynami i jednocze�nie pilnowa� obozu przed ciekawskimi gnojkami, jak nie przymierzaj�c ty.
		AI_Output (self, other,"Info_Korth_Help_11_35"); //Hmm... Wiesz co? Mo�e jednak si� przydasz. 
		AI_Output (self, other,"Info_Korth_Help_11_36"); //Jaki� tydzie� temu wys�ali�my Kyro i Nikolasa z towarem dla Quentina.
		AI_Output (other, self,"Info_Korth_Help_15_37"); //Tak, s�ysza�em ju� od Servina, �e tamci dwaj gdzie� si� zawieruszyli.
		AI_Output (self, other,"Info_Korth_Help_11_38"); //Ano w�a�nie. Thangor podejrzewa, �e dali nog� z nasz� rud�, ale mi si� wydaje, �e spotka�a ich jaka� niemi�a niespodzianka.
		AI_Output (self, other,"Info_Korth_Help_11_39"); //Znam Kyro od dw�ch lat i jestem pewien jego lojalno�ci.
		AI_Output (self, other,"Info_Korth_Help_11_40"); //A co do tego Nikolasa, to wcale bym si� nie zdziwi� jakby to on wywin�� jak�� sztuczk�.
		AI_Output (self, other,"Info_Korth_Help_11_41"); //Ten gnojek my�li, �e jak jego ojciec by� baronem to wszystko mu wolno.
		AI_Output (self, other,"Info_Korth_Help_11_42"); //Jak wiesz, zbli�a si� termin kolejnej dostawy, a my nie wiemy co si� sta�o z poprzedni�.
		AI_Output (other, self,"Info_Korth_Help_15_43"); //Niech zgadn�. I tu na scenie dramatu pojawiam si� ja.
		AI_Output (self, other,"Info_Korth_Help_11_44"); //Tak, jeste� bystry jak woda w kloace. Ale masz racj�. Potrzebujemy kogo� kto zbada t� spraw� i dowie si� co z t� cholern� dostaw� si� sta�o.
		AI_Output (other, self,"Info_Korth_Help_15_45"); //A co ja z tego b�d� mia�?
		AI_Output (self, other,"Info_Korth_Help_11_46"); //Ju� ty si� nie b�j o nagrod�. R�b swoje, a na pewno nie po�a�ujesz.
		AI_Output (self, other,"Info_Korth_Help_11_47"); //Aha. Kyro zawsze zatrzymywa� si� na odpoczynek w opuszczonym obozie my�liwych niedaleko Starego Obozu. 
		AI_Output (self, other,"Info_Korth_Help_11_48"); //Sprawd� tam. Jak b�dziesz mia� szcz�cie to mo�e tam go odnajdziesz.
		B_LogEntry(P_OHCamp, "Korth kaza� mi odnale�� zagubionych Przemytnik�w. Podejrzewa, �e co� mog�o si� im przydarzy� w drodze do obozu bandyt�w. Powiedzia�, �e Kyro, jeden z nich m�g� zatrzyma� si� w opuszczonym obozie my�liwych niedaleko Starego Obozu. Chyba tam rozpoczn� poszukiwania.");	
		KorthHelp=LOG_RUNNING;
		};	
};

		// -----------------------------------NoHelp--------------------------------

		FUNC VOID Info_Korth_Help_No()
			{
			AI_Output (other, self,"Info_Korth_Help_No_15_01"); //Nie mam zamiaru ugania� si� po jaskini, w kt�rej a� roi si� od umarlak�w.
			AI_Output (self, other,"Info_Korth_Help_No_11_02"); //Ty gnojku! Wol� si� upewni�, �e nikomu nie zdradzisz mojego sekretu.
			AI_Output (self, other,"Info_Korth_Help_No_11_03"); //Za chwil� sam staniesz si� jednym z umarlak�w!
			AI_StopProcessInfos (self);
			Npc_SetPermAttitude	(self, ATT_HOSTILE);
			Npc_SetTarget (self,other);
			AI_StartState (self,ZS_Attack,0,""); //�mier� wyci�ga po ciebie swoje drapie�ne szpony...
			KorthHelp=LOG_FAILED;
			};
			
		// -----------------------------------YesHelp--------------------------------

		FUNC VOID Info_Korth_Help_Yes()
			{
			Kyro_1 = 10;
			kor_agree = TRUE;
			AI_Output (other, self,"Info_Korth_Help_Yes_15_01"); //Rozejrz� si� za t� twoj� b�yskotk�.
			AI_Output (self, other,"Info_Korth_Help_Yes_11_02"); //Jednak r�wny z ciebie ch�op.
			B_LogEntry (P_OHCamp, "Korth bardzo grzecznie poprosi� mnie o to, �ebym odnalaz� jego pier�cie�. Podobno zgubi� go w starej jaskini niedaleko pla�y. Mam nadziej�, �e nie do��cz� do umar�ych, kt�rzy strzeg� tej groty.");
			AI_Output (self, other,"Info_Korth_Help_Yes_11_03"); //I uwa�aj na siebie. Ta jaskinia to nie jest zbyt przyjemnym miejscem na spacerowanie.
			AI_Output (other, self,"Info_Korth_Help_Yes_15_04"); //Dzi�ki za trosk�, ale jako� sobie poradz�. Zreszt�, jak zawsze...
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
	description = "Mam dobr� wiadomo��.";
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
	AI_Output (other, self,"Info_Korth_FindBoys_15_01"); //Znalaz�em twoje zguby.
	AI_Output (self, other,"Info_Korth_FindBoys_11_02"); //To gdzie oni s�?
	AI_Output (other, self,"Info_Korth_FindBoys_15_03"); //W�chaj� kwiatki od spodu.
	AI_Output (self, other,"Info_Korth_FindBoys_11_04"); //O kurwa. M�w co si� sta�o!
	AI_Output (other, self,"Info_Korth_FindBoys_15_05"); //Nie wiem co si� sta�o. Znalaz�em tylko ich cia�a. Chyba po prostu mieli pecha...
	AI_Output (self, other,"Info_Korth_FindBoys_11_06"); //Niech to szlag trafi. A obszuka�e� cia�a?
	AI_Output (other, self,"Info_Korth_FindBoys_15_07"); //Ba. To zrobi�em na samym pocz�tku.
	AI_Output (self, other,"Info_Korth_FindBoys_11_08"); //I co? Mieli przy sobie rud�?
	ore=2500;
	Info_ClearChoices (Info_Korth_FindBoys);
	Info_AddChoice (Info_Korth_FindBoys, "Niestety nie.", Info_Korth_FindBoys_No);
	Info_AddChoice (Info_Korth_FindBoys, "Ano mieli i to ca�kiem sporo.", Info_Korth_FindBoys_Yes);
	}
	else if (KyroGo==FALSE)
	{
	Kyro_1 = 3;
	AI_Output (other, self,"Info_Korth_FindBoys_15_09"); //Znalaz�em twoje zguby.
	AI_Output (self, other,"Info_Korth_FindBoys_11_10"); //To gdzie oni s�?
	AI_Output (other, self,"Info_Korth_FindBoys_15_11"); //Kyro powiedzia�, �e musi troch� nabra� si� po utarczce z goblinami.
	AI_Output (other, self,"Info_Korth_FindBoys_15_12"); //Jak poczuje si� lepiej to wr�ci i odda przesy�k� Thangorowi.
	AI_Output (self, other,"Info_Korth_FindBoys_11_13"); //Niech ci b�dzie. Kyro ju� tu by� i odda� szefowi co trzeba.
	AI_Output (self, other,"Info_Korth_FindBoys_11_14"); //Mo�e jednak na co� si� jeszcze przydasz...
	KorthHelp=LOG_SUCCESS;
	NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*8);
	B_LogEntry(P_OHCamp, "Korth jak zawsze marudzi�, ale w ko�cu zdoby�em jego poparcie u Thangora, a to jest najwa�niejsze.");	
	AI_StopProcessInfos	(self);

	};
};

// -----------------------------------No--------------------------------
	
	FUNC VOID Info_Korth_FindBoys_No()
	{
		AI_Output (other, self,"Info_Korth_FindBoys_No_15_01"); //Nic przy nich nie znalaz�em.
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_02"); //Kurwa, kurwa, kurwa! Ca�y transport szlag trafi�!
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_03"); //Ja tego Thangorowi nie powiem...
		AI_Output (other, self,"Info_Korth_FindBoys_No_15_04"); //To mo�e ja to zrobi�?
		AI_Output (self, other,"Info_Korth_FindBoys_No_11_05"); //Skoro �ycie ci niemi�e, to czemu nie. Ja tam o niczym nie wiem...
		B_GiveXP(Xp*2);
		NPC_ExchangeRoutine (self,"start");
		KorthHelp=LOG_FAILED;
		B_LogEntry(P_OHCamp, "Zatai�em przed Korthem, kilka spraw, ale tak b�dzie lepiej. Ciekawe tylko czy Thangor b�dzie chcia� ze mn� gada�?");	
		AI_StopProcessInfos	(self);
	};
//////////////////////////Edit By Fenix////////////////////////////////////////////////////////////////////////////////////////////////////////			
// -----------------------------------Yes--------------------------------

	FUNC VOID Info_Korth_FindBoys_Yes()
	{
		AI_Output (other, self,"Info_Korth_FindBoys_Yes_15_01"); //Oto ca�a ruda z transportu.
		AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_02"); //Dawaj to!
			if  (Npc_HasItems (other,ItMiNugget)>=ore)
			{
			B_GiveInvItems (other,self,ItMiNugget,ore);
			Npc_RemoveInvItems (self,ItMiNugget,ore);
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_03"); //Id� powiedz Thangorowi, �e odnalaz�em nasz towar.
			AI_Output (other, self,"Info_Korth_FindBoys_Yes_15_04"); //Jak to ty? Przecie�...
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_05"); //Zamknij si� ch�optasiu, bo ci zaraz bu�k� przefasonuj�. Ciesz si�, �e �yjesz.
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_06"); //A teraz spadaj, bo mam wa�niejsze rzeczy na g�owie.
			KorthHelp=LOG_SUCCESS;
			NPC_ExchangeRoutine (self,"start");
			B_GiveXP(Xp*8);
			B_LogEntry(P_OHCamp, "Korth najzwyczajniej w �wiecie przypisa� sobie ca�� zas�ug�. Ale przynajmniej poprze mnie przed Thangorem, a to ju� co�.");	
			AI_StopProcessInfos	(self);
			}
			else
			{
			AI_Output (self, other,"Info_Korth_FindBoys_Yes_11_07"); //Ty parszywy gnojku. Co zrobi�e� z nasz� rud�?! No to zdychaj...
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
	description = "By�em w tej cholernej jaskini.";
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
	AI_Output (other, self,"Info_Korth_FindRing_15_01"); //Znalaz�em tw�j pier�cie�.
	AI_Output (self, other,"Info_Korth_FindRing_11_02"); //To dawaj go!
	B_GiveInvItems(other,self,KorthRing,1);
	Npc_RemoveInvItems(self,KorthRing,1);
	AI_Output (self, other,"Info_Korth_FindRing_11_03"); //A niech mnie, zas�u�y�e� na nagrod�. We� ten miecz. To solidna robota. Wyku� go Harad, kowal z Khorinis.
	CreateInvItems (self, ItMw_1H_Sword_Long_05,1);
	B_GiveInvItems(self,other, ItMw_1H_Sword_Long_05,1);
	AI_Output (other, self,"Info_Korth_FindRing_15_04"); //Dzi�ki. To wspania�a bro�.
	AI_Output (self, other,"Info_Korth_FindRing_11_05"); //Dobra, ju� dobra. Zas�u�y�e� na to �elazo.
	AI_Output (self, other,"Info_Korth_FindRing_11_06"); //Id� do Thangora i powiedz mu, �e Korth uwa�a, �e porz�dny z ciebie ch�op.
	AI_Output (other, self,"Info_Korth_FindRing_15_07"); //Na pewno nie omieszkam.
	AI_Output (self, other,"Info_Korth_FindRing_11_08"); //S�uchaj. Widz�, �e niez�y z ciebie wojownik. Przyjd� do mnie po rozmowie z Thangorem, to poka�� ci jak zwi�kszy� si��.
	KorthHelp=LOG_SUCCESS;
	//NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*15);
	B_LogEntry(P_OHCamp, "No prosz� chyba uda�o mi si� zdoby� uznanie Kortha. A przede wszystkim poprze mnie przed Thangorem. Da� mi za ten pier�cie� porz�dny miecz i jeszcze obieca� pokaza� mi kilka �wicze� na zwi�kszenie si�y. Mo�e go jeszcze polubi�...");	
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
	description = "Czy to nie nale�y do ciebie?";
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
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_01"); //Czy to nie nale�y do ciebie?
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_02"); //To m�j pier�cie�! Sk�d go masz?
	B_GiveInvItems(other,self,KorthRing,1);
	Npc_RemoveInvItems(self,KorthRing,1);
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_03"); //Znalaz�em go w grocie pe�nej nieumar�ych.
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_04"); //Jeste� ca�kiem odwa�ny. Mo�e �le ci� oceni�em. 
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_05"); //Zamiast dobrego s�owa wola�bym bardziej namacaln� nagrod�
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_06"); //Niech b�dzie. Poka�e ci kilka �wicze�.
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_07"); //Jakich �wicze�?
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_08"); //Zaraz sam zobaczysz...
	PrintScreen	("Si�a +2", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+2;
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_09"); //Teraz b�dziesz troch� silniejszy. Uwa�aj na siebie.
	AI_Output (other, self,"Info_Korth_FindRingAlso_15_10"); //Dzi�ki Korth. Jeste� ca�kiem w porz�dku.
	AI_Output (self, other,"Info_Korth_FindRingAlso_11_11"); //Dobra ju� dobra. Przesta� sm�ci� bo si� rozp�acz�. Powodzenia na szlaku, przyjacielu.
	//KorthHelp=LOG_SUCCESS;
	//NPC_ExchangeRoutine (self,"start");
	B_GiveXP(XP*15);
	B_LogEntry(P_OHCamp, "Korth pokaza� mi jeszcze kilka �wicze�, kt�re zwi�kszy�y moj� si��. Mo�e go jeszcze polubi�...");	
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
	description = "I co z tymi �wiczeniami?";
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
	AI_Output (other, self,"Info_Korth_Improve_15_01"); //I co z tymi �wiczeniami?
	AI_Output (self, other,"Info_Korth_Improve_11_02"); //Zaraz poka�� ci kilka sztuczek...
	PrintScreen	("Si�a +2", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	AI_Output (self, other,"Info_Korth_Improve_11_03"); //Teraz b�dziesz troch� silniejszy. Uwa�aj na siebie.
	AI_Output (other, self,"Info_Korth_Improve_15_04"); //Dzi�ki Korth. Jeste� ca�kiem w porz�dku.
	AI_Output (self, other,"Info_Korth_Improve_11_05"); //Dobra ju� dobra. Przesta� sm�ci� bo si� rozp�acz�. Powodzenia na szlaku, przyjacielu.
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
	description = "Przysy�a mnie Thangor.";
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
	AI_Output (self, other,"Info_Korth_Pack_11_00"); //Niech zgadn�. Przysy�a ci� Thangor.
	AI_Output (other, self,"Info_Korth_Pack_15_01"); //Szef kaza� mi pogada� z ka�dym z was.
	AI_Output (self, other,"Info_Korth_Pack_11_02"); //Wiem, wiem. Dobra, mam tu co� specjalnego. To prezent tylko dla Quentina, wi�c lepiej na to uwa�aj.
	CreateInvItems (self, ItMi_GoldCup,4);
	CreateInvItems (self, ItMi_GoldChalice,4);
	CreateInvItems (self, ItMi_GoldRing,2);
	B_GiveInvItems(self,other, ItMi_GoldCup,4);
	B_GiveInvItems(self,other, ItMi_GoldChalice,4);
	B_GiveInvItems(self,other, ItMi_GoldRing,2);
	AI_Output (self, other,"Info_Korth_Pack_11_03"); //Quentin lubi b�yskotki, a te na pewno wpadn� mu w oko. Powodzenia.
	AI_Output (other, self,"Info_Korth_Pack_15_04"); //Dzi�ki. Postaram si� ich zbytnio nie pobrudzi�.
	B_LogEntry	 (P_OHCamp, "Korth przekaza� mi co� ekstra dla Quentina: 4 z�ote kielichy, 4 z�ote misy i 2 z�ote pier�cienie. Najwyra�niej szef bandyt�w lubi �wiecide�ka.");
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
	description = "Mam do ciebie ma�� pro�b�.";
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
	AI_Output (self, other,"Info_Korth_Attack_11_00"); //Co masz tak� zbola�� min�? M�w.
	AI_Output (other, self,"Info_Korth_Attack_15_01"); //Mam problem z tym gnojkiem Quentinem. Thangor kaza� mi si� go pozby�...
	AI_Output (self, other,"Info_Korth_Attack_11_02"); //Niech zgadn�. Nie czujesz si� za bardzo na si�ach �eby samemu posprz�ta� w obozie tych w��cz�g�w.
	AI_Output (other,self,"Info_Korth_Attack_15_03"); //Mniej wi�cej. To co, pomo�esz?
	AI_Output (self,other,"Info_Korth_Attack_11_04"); //Z najwy�sz� przyjemno�ci�. W ko�cu si� troch� rozerw�.
	B_GiveXP(XP*2);
	Korth_Go = Wld_GetDay();
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	self.flags			= NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GUIDE");
	B_LogEntry		(P_OreSecret, "Korth pomo�e mi w pozbyciu si� Quentina. Ju� nie mog� si� doczeka� co to b�dzie za walka...");

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
	AI_Output (other, self,"Info_Korth_Back_15_01"); //Dzi�ki za pomoc. 
	AI_Output (self, other,"Info_Korth_Back_11_02"); //Uwierz mi stary, �e ca�a przyjemno�� po mojej stronie.
	AI_Output (other,self,"Info_Korth_Back_15_03"); //Pokr�c� si� jeszcze troch� po okolicy.
	AI_Output (self,other,"Info_Korth_Back_11_04"); //To na razie. Musz� wraca� do obozu, bo Thangor si� w�cieknie. Trzymaj si� brachu.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags			= 0;
	B_GiveXP(XP*5);
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
	B_LogEntry		(P_OreSecret, "Quentin jest ju� przesz�o�ci�. Teraz nawet jak kt�ry� z bandyt�w prze�y� to i tak bez swojego szefa nie s� ju� gro�ni.");

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
	AI_Output (self, other,"Info_Korth_Late_11_00"); //Nie mam czasu, �eby si� z tob� szlaja� po ca�ej Kolonii.
	AI_Output (other, self,"Info_Korth_Late_15_01"); //Ale...
	AI_Output (self, other,"Info_Korth_Late_11_02"); //Musz� wraca� do obozu bo Thangor si� w�cieknie. Trzymaj si� brachu.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags			= 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
	B_LogEntry		(P_OreSecret, "No to da�em cia�a. Korth stwierdzi�, �e nie ma czasu na wa��sanie si� po okolicy. Teraz musz� sobie sam poradzi� z Quentinem.");
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
	AI_Output (self, other,"Info_Korth_Monk_11_00"); //S�ysza�em, �e masz zamiar zapolowa� na tego sukinsyna Monka.
	AI_Output (other, self,"Info_Korth_Monk_15_01"); //Mniej wi�cej. Musz� co� od niego odebra�.
	AI_Output (self, other,"Info_Korth_Monk_11_02"); //Wiem. Mog� ci powiedzie� gdzie ten gnojek si� ukrywa.
	AI_Output (other, self,"Info_Korth_Monk_15_03"); //To by mi bardzo u�atwi�o zadanie.
	AI_Output (self, other,"Info_Korth_Monk_11_04"); //Sam bym poszed� zrobi� porz�dek z tym bydlakiem, ale Thangor upar� si�, �e mam pilnowa� obozu.
	AI_Output (self, other,"Info_Korth_Monk_11_05"); //Kurde, on czasami przesadza. Chyba nie my�li, �e kto� nas tutaj napadnie...
	AI_Output (other, self,"Info_Korth_Monk_15_06"); //To co z tym Monkiem?
	AI_Output (self, other,"Info_Korth_Monk_11_07"); //Wydaje mi si�, �e ta szumowina zamelinowa�a si� w jaskini za wodospadem. To niedaleko miejsca gdzie spotka�e� Kyro.
	AI_Output (self, other,"Info_Korth_Monk_11_08"); //Naprzeciwko jaskini z goblinami. Na pewno trafisz.
	AI_Output (other, self,"Info_Korth_Monk_15_09"); //Dzi�ki Korth. Ta informacja bardzo mi si� przyda.
	AI_Output (self, other,"Info_Korth_Monk_11_10"); //Nie ma za co. Pomog�e� mi z pier�cieniem, to teraz moja kolej.
	AI_Output (self, other,"Info_Korth_Monk_11_11"); //Trzymaj si� brachu.
	B_LogEntry	 (P_OHCamp, "Korth powiedzia� mi, �e Monk mo�e ukrywa� si� w jaskini za wodospadem, niedaleko tej jaskini z goblinami. No prosz�, dobre uczynki w ko�cu zacz�y procentowa�...");
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
	description		= "Naucz mnie walki dwur�cznym or�em."; 
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
	AI_Output (other, self,"Korth_ZWEIHAND1s_15_01"); //Naucz mnie walki dwur�cznym or�em.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_02"); //Dobrze, najpierw zajmiemy si� podstawami.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_03"); //Wyci�gnij miecz przed siebie. Aby zaatakowa� wroga tak ci�k� broni�, musisz mocniej si� zamachn��.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_04"); //Unie� rami� i zdecydowanie opu�� miecz. To powinno wystarczy�, �eby powali� przeciwnika na ziemi�.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_05"); //Wykorzystaj bezw�adno�� broni, by unie�� j� ponownie do g�ry.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_06"); //Dwur�czne miecze �wietnie sprawdzaj� si� przy zadawaniu cios�w z boku. W ten spos�b mo�esz trzyma� przeciwnika na dystans.
		AI_Output (self, other,"Korth_ZWEIHAND1s_11_07"); //To ci powinno wystarczy� na pocz�tek. Teraz troch� po�wicz.
		learn_twoh = TRUE;
};



instance  Korth_ZWEIHAND1 (C_INFO)
{
	npc				= Non_2003_Korth;
	condition		= Korth_ZWEIHAND1_Condition;
	information		= Korth_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Walka dwur�cznym or�em."; 
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


