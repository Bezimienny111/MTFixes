

// *************Beware*******************

instance DIA_Eremita_Final (C_INFO)
{
	npc			= Non_2007_Eremita;
	condition	= DIA_Eremita_Final_Condition;
	information	= DIA_Eremita_Final_Info;
	important 	= 1;
	permanent	= 0;
};                       

FUNC int DIA_Eremita_Final_Condition()
{	
	if (eremita==8)&&(Npc_GetDistToWP (self,"EREMITA_FIGHT") < 5000 )
	
	{
	return 1;
	};
};
FUNC VOID  DIA_Eremita_Final_Info()
{
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Eremita_Final_02_01"); //�mier� upomnia�a si� o twoj� dusz� �miertelniku!
	AI_Output (other, self,"DIA_Eremita_Final_15_02"); //Nie s�dz�!
	AI_Output (self, other,"DIA_Eremita_Final_02_03"); //Nikt nie b�dzie niepokoi� mojego Pana!
	B_LogEntry		(P_Eremita, "Eremita strzeg� czego� lub kogo� w jakim� obozie na terenie ork�w. Rzuci� si� na mnie jak tylko mnie ujrza�. Czuj�, �e jego plugawy Pan jest ju� bardzo blisko.");
	Log_SetTopicStatus(P_Eremita, LOG_SUCCESS);
	self.Npctype			= NPCTYPE_MAIN;
	AI_StopProcessInfos (self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	AI_StartState (self,ZS_Attack,0,"");
	eremita=eremita+1;//eremita=9;
};
