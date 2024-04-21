//Edit By Fenix

instance Non_2011_Sheer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Sheer'Ghar";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_BAB;
	level 		=  	90;
	voice 		=  	15;
	id 			=   2011;
	flags       =   NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 250;
	attribute[ATR_DEXTERITY] 	= 250;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 1280;
	attribute[ATR_HITPOINTS] 	= 1280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 0,"Hum_Head_Bald", 120,  0, AncientArmor);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
	//Mdl_SetModelScale(self, 1.2, 1.2, 1.2);

    	self.aivar[AIV_IMPORTANT] = TRUE;
    	aivar[AIV_PLUNDERED] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill	(self, NPC_TALENT_PICKPOCKET,1);Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill	(self, NPC_TALENT_SNEAK,	1);	
	Npc_SetTalentSkill	(self, NPC_TALENT_PICKLOCK,	1);Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 
		

	Npc_SetTalentSkill (self, NPC_TALENT_1H,FS_Master);	Npc_SetTalentValue(self,NPC_TALENT_SNEAK,Teacher_SMaster_1H);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,/**/FS_Master);	Npc_SetTalentValue(self,NPC_TALENT_REGENERATE,Teacher_SMaster_2H);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);Npc_SetTalentValue(self,NPC_TALENT_ACROBAT,100);			
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);

	Npc_SetTalentValue(self, NPC_TALENT_1H, Npc_GetTalentValue(self, NPC_TALENT_1H)+100);		
        	Npc_SetTalentValue(self, NPC_TALENT_2H, Npc_GetTalentValue(self, NPC_TALENT_2H)+100);
	Npc_SetTalentValue(self, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(self, NPC_TALENT_CROSSBOW)+100);		
        	Npc_SetTalentValue(self, NPC_TALENT_BOW, Npc_GetTalentValue(self, NPC_TALENT_BOW)+100);

        
	//-------- inventory --------
	
	EquipItem	(self, SheerGhar);
	CreateInvItems (self, ItKeLockpick,6);		
	CreateInvItems (self, HealCristal,1);
	CreateInvItems (self, SpeedCristal, 1);
	CreateInvItems (self, ItMiNugget,2500);
	CreateInvItems (self, ItFo_Potion_Health_03,6);
	CreateInvItems	(self,ItMi_Stuff_OldCoin_02, 1500);	

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_2011;
};

FUNC VOID Rtn_Start_2011 ()
{	
	TA_Position		(06,00,08,00,"SPAWN_SHEER");
	TA_Boss 		(08,00,12,00,"SHEER_BOSS");
	TA_SmallTalk 		(12,00,14,00,"SHEER_TALK");
	TA_Boss			(14,00,18,00,"SHEER_BOSS");
	TA_PracticeSword 	(18,00,20,00,"SHEER_SWORD");
	TA_SmallTalk 		(20,00,23,00,"SHEER_TALK1");
	TA_Guard 		(23,00,06,00,"SHEER_GUARD");
};

FUNC VOID Rtn_AFTER_2011 ()
{	
	TA_Boss 		(06,00,18,00,"SHEER_GUARD");
	TA_Boss 		(18,00,06,00,"SHEER_GUARD");
};

FUNC VOID Rtn_ENEMY_2011 ()
{	
	TA_HostileGuard 		(06,00,18,00,"SHEER_GUARD");
	TA_HostileGuard 		(18,00,06,00,"SHEER_GUARD");
};