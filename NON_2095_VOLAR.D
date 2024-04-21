instance Non_2095_Volar (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Volar";
	Npctype =						3;
	guild =							GIL_EBR;      
	level =							25;

	voice =							13;
	id =							2095;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	260;
	attribute[ATR_HITPOINTS] =		260;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald", 36, 1, BAN_ARMOR_M);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,FS_Master);

	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,8);		
	CreateInvItems(self, ItMiNugget, 135);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 4);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_03, 6);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, MagicOreSword2);
	EquipItem (self, ItRw_Bow_Long_02);
	CreateInvItems (self, ItAmArrow, 220);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2095;
	};

FUNC VOID Rtn_start_2095 ()
{
	TA_GUARD		(01,00,07,30,"LOCATION_11_09");
	TA_GUARD		(07,30,01,00,"LOCATION_11_09");
};
