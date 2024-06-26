
//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	 (Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) > 3)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Jestem magiem. Nie wiem, czy potrafi� pos�ugiwa� si� mieczem takim jak URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Jest na to spos�b...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Ale najpierw na�aduj miecz magiczn� energi�. Wr�� jak najszybciej!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chc�, �eby� usun�� klejnot z URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Chc�, �eby� usun�� klejnot z URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Ale nie opanowa�e� jeszcze magii Sz�stego Kr�gu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Od tej decyzji nie ma odwrotu. Jeste� pewien, �e chcesz abym usun�� klejnot?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"TAK, zr�b to!"				,	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"Nie, nie chc�!"	,	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //TAK, zr�b to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Je�li tego w�a�nie chcesz... Prosz�, oto miecz i runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,	"Xardas usun�� magiczny kryszta� z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //Nie, nie chc�!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak sobie �yczysz. Ostrze zachowa sw� magiczn� moc!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Mo�esz mnie czego� nauczy�?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadz� ci� w Sz�sty Kr�g Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pami�taj, �e to przywilej zarezerwowany wy��cznie dla najbieglejszych mag�w. Mog� do niego przyst�pi� ci, kt�rych ca�e �ycie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie element�w.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Sz�sty Kr�g pozwala ci wykorzystywa� magi� dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest s�u�y� pot�dze magii, a nie j� wykorzystywa�.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_NONE;	
			Npc_SetTrueGuild	( hero, GIL_NONE );	
			TXT_GUILDS [0] = "Nekromanta";
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jeste� zdolny, ale brak ci niezb�dnego do�wiadczenia. Niech Saturas popracuje nad tob� przez jaki� czas. Wtedy zobaczymy.
		
		AI_StopProcessInfos	( self );
	};
};

	
