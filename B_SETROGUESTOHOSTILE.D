func void B_SetRoguesToHostile ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(Org_858_Quentin); Npc_SetTempAttitude(Quentin,ATT_HOSTILE); Npc_SetAttitude(Quentin,ATT_HOSTILE);
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); Npc_SetTempAttitude(Rog863, ATT_HOSTILE); Npc_SetAttitude(Rog863, ATT_HOSTILE);
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Kosa); Npc_SetTempAttitude(Rog864, ATT_HOSTILE); Npc_SetAttitude(Rog864, ATT_HOSTILE);
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); Npc_SetTempAttitude(Rog865, ATT_HOSTILE); Npc_SetAttitude(Rog865, ATT_HOSTILE);
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(Org_866_Raeuber); Npc_SetTempAttitude(Rog866, ATT_HOSTILE); Npc_SetAttitude(Rog866, ATT_HOSTILE);
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber); Npc_SetTempAttitude(Rog867, ATT_HOSTILE); Npc_SetAttitude(Rog867, ATT_HOSTILE);
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); Npc_SetTempAttitude(Rog868, ATT_HOSTILE); Npc_SetAttitude(Rog868, ATT_HOSTILE);
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); Npc_SetTempAttitude(Rog869, ATT_HOSTILE); Npc_SetAttitude(Rog869, ATT_HOSTILE);
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); Npc_SetTempAttitude(Rog870, ATT_HOSTILE); Npc_SetAttitude(Rog870, ATT_HOSTILE);
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); Npc_SetTempAttitude(Rog871, ATT_HOSTILE); Npc_SetAttitude(Rog871, ATT_HOSTILE);
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); Npc_SetTempAttitude(Rog874, ATT_HOSTILE); Npc_SetAttitude(Rog874, ATT_HOSTILE);
	
	if (Stooges_fled == TRUE)
	{
		var C_NPC Renyu;	Renyu 	= Hlp_GetNpc(Org_860_Renyu	); if (Hlp_IsValidNpc(Renyu)) 	{	Npc_SetTempAttitude(Renyu,  ATT_HOSTILE); Npc_SetAttitude(Renyu,  ATT_HOSTILE);	};
		var C_NPC Killian;	Killian = Hlp_GetNpc(Org_861_Killian); if (Hlp_IsValidNpc(Killian))	{	Npc_SetTempAttitude(Killian,ATT_HOSTILE); Npc_SetAttitude(Killian,ATT_HOSTILE);	};
		var C_NPC Jacko;	Jacko 	= Hlp_GetNpc(Org_862_Jacko	); if (Hlp_IsValidNpc(Jacko))	{	Npc_SetTempAttitude(Jacko,  ATT_HOSTILE); Npc_SetAttitude(Jacko,  ATT_HOSTILE);	};
	};
};

//Edit By Fenix
func void B_SetRoguesToNeutral ()
{
	
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(Org_858_Quentin); Npc_SetTempAttitude(Quentin,ATT_NEUTRAL); Npc_SetAttitude(Quentin,ATT_NEUTRAL); Quentin.npctype 		= 3;
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); Npc_SetTempAttitude(Rog863, ATT_NEUTRAL); Npc_SetAttitude(Rog863, ATT_NEUTRAL); Rog863.npctype 		= 3;
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Kosa); Npc_SetTempAttitude(Rog864, ATT_NEUTRAL); Npc_SetAttitude(Rog864, ATT_NEUTRAL); Rog864.npctype 		= 3;
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); Npc_SetTempAttitude(Rog865, ATT_NEUTRAL); Npc_SetAttitude(Rog865, ATT_NEUTRAL); Rog865.npctype 		= 3;
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(Org_866_Raeuber); Npc_SetTempAttitude(Rog866, ATT_NEUTRAL); Npc_SetAttitude(Rog866, ATT_NEUTRAL); Rog866.npctype 		= 3;
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber); Npc_SetTempAttitude(Rog867, ATT_NEUTRAL); Npc_SetAttitude(Rog867, ATT_NEUTRAL); Rog867.npctype 		= 3;
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); Npc_SetTempAttitude(Rog868, ATT_NEUTRAL); Npc_SetAttitude(Rog868, ATT_NEUTRAL); Rog868.npctype 		= 3;
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); Npc_SetTempAttitude(Rog869, ATT_NEUTRAL); Npc_SetAttitude(Rog869, ATT_NEUTRAL); Rog869.npctype 		= 3;
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); Npc_SetTempAttitude(Rog870, ATT_NEUTRAL); Npc_SetAttitude(Rog870, ATT_NEUTRAL); Rog870.npctype 		= 3;
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); Npc_SetTempAttitude(Rog871, ATT_NEUTRAL); Npc_SetAttitude(Rog871, ATT_NEUTRAL); Rog871.npctype 		= 3;
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); Npc_SetTempAttitude(Rog874, ATT_NEUTRAL); Npc_SetAttitude(Rog874, ATT_NEUTRAL); Rog874.npctype 		= 3;
	var C_NPC Volar_test;	Volar_test	= Hlp_GetNpc(Non_2095_Volar); Npc_SetTempAttitude(Volar_test, ATT_NEUTRAL); Npc_SetAttitude(Volar_test, ATT_NEUTRAL); Volar_test.npctype 		= 3;
	
	if (Stooges_fled == TRUE)
	{
		var C_NPC Renyu;	Renyu 	= Hlp_GetNpc(Org_860_Renyu	); if (Hlp_IsValidNpc(Renyu)) 	{	Npc_SetTempAttitude(Renyu,  ATT_NEUTRAL); Npc_SetAttitude(Renyu,  ATT_NEUTRAL);  Renyu.npctype 		= 3;	};
		var C_NPC Killian;	Killian = Hlp_GetNpc(Org_861_Killian); if (Hlp_IsValidNpc(Killian))	{	Npc_SetTempAttitude(Killian,ATT_NEUTRAL); Npc_SetAttitude(Killian,ATT_NEUTRAL); Killian.npctype 		= 3;	};
		var C_NPC Jacko;	Jacko 	= Hlp_GetNpc(Org_862_Jacko	); if (Hlp_IsValidNpc(Jacko))	{	Npc_SetTempAttitude(Jacko,  ATT_NEUTRAL); Npc_SetAttitude(Jacko,  ATT_NEUTRAL); Jacko.npctype 		= 3;	};
	};
};


func int B_DieFromQuentinCamp (var C_npc slf)
{
	if 	(	slf.id	==	Org_858_Quentin.id	)	||
		(	slf.id	==	Org_863_Raeuber.id	)	||
		(	slf.id	==	Org_864_Kosa.id	)	||
		(	slf.id	==	Org_865_Raeuber.id	)	||
		(	slf.id	==	Org_866_Raeuber.id	)	||
		(	slf.id	==	Org_867_Raeuber.id	)	||
		(	slf.id	==	Org_868_Raeuber.id	)	||
		(	slf.id	==	Org_869_Raeuber.id	)	||
		(	slf.id	==	Org_870_Raeuber.id	)	||
		(	slf.id	==	Org_871_Raeuber.id	)	||
		(	slf.id	==	Org_874_Raeuber.id	)	
		{
			return True;
		};
		
	if (Stooges_fled == TRUE)
	{	
		if	(	slf.id	==	Org_860_Renyu.id	)	||
			(	slf.id	==	Org_861_Killian.id	)	||
			(	slf.id	==	Org_862_Jacko.id	)	
			{
				return True;	
			};
	};
};

//Edit By Fenix
func void QuentinBanditsBecomeNeutral ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(Org_858_Quentin); 	Quentin.guild 	= GIL_NONE; Npc_SetTrueGuild	( Quentin, GIL_NONE );
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); 	Rog863.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog863, GIL_NONE );
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Kosa);	   	Rog864.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog864, GIL_NONE );
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); 	Rog865.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog865, GIL_NONE );
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(Org_866_Raeuber); 	Rog866.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog866, GIL_NONE );
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber); 	Rog867.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog867, GIL_NONE );
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); 	Rog868.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog868, GIL_NONE );
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); 	Rog869.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog869, GIL_NONE );
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); 	Rog870.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog870, GIL_NONE );
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); 	Rog871.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog871, GIL_NONE );
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); 	Rog874.guild 	= GIL_NONE; Npc_SetTrueGuild	( Rog874, GIL_NONE );
	var C_NPC Volar_test;	Volar_test	= Hlp_GetNpc(Non_2095_Volar); 	Volar_test.guild 	= GIL_NONE; Npc_SetTrueGuild	( Volar_test, GIL_NONE );
	
	if (Stooges_fled == TRUE)
	{
		var C_NPC Renyu;	Renyu 	= Hlp_GetNpc(Org_860_Renyu	); if (Hlp_IsValidNpc(Renyu)) 	{		Renyu.guild 	= GIL_NONE; Npc_SetTrueGuild	( Renyu, GIL_NONE );	};
		var C_NPC Killian;	Killian = Hlp_GetNpc(Org_861_Killian); if (Hlp_IsValidNpc(Killian))	{		Killian.guild 	= GIL_NONE; Npc_SetTrueGuild	( Killian, GIL_NONE );	};
		var C_NPC Jacko;	Jacko 	= Hlp_GetNpc(Org_862_Jacko	); if (Hlp_IsValidNpc(Jacko))	{		Jacko.guild 	= GIL_NONE; Npc_SetTrueGuild	( Jacko, GIL_NONE );	};
	};
	
};	

func void QuentinBanditsBecomeHostile ()
{
	var C_NPC Quentin;	Quentin = Hlp_GetNpc(Org_858_Quentin); 	Quentin.guild 	= GIL_EBR; Npc_SetTrueGuild	( Quentin, GIL_EBR );
	var C_NPC Rog863;	Rog863	= Hlp_GetNpc(Org_863_Raeuber); 	Rog863.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog863, GIL_EBR );
	var C_NPC Rog864;	Rog864	= Hlp_GetNpc(Org_864_Kosa);	   	Rog864.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog864, GIL_EBR );
	var C_NPC Rog865;	Rog865	= Hlp_GetNpc(Org_865_Raeuber); 	Rog865.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog865, GIL_EBR );
	var C_NPC Rog866;	Rog866	= Hlp_GetNpc(Org_866_Raeuber); 	Rog866.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog866, GIL_EBR );
	var C_NPC Rog867;	Rog867	= Hlp_GetNpc(Org_867_Raeuber); 	Rog867.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog867, GIL_EBR );
	var C_NPC Rog868;	Rog868	= Hlp_GetNpc(Org_868_Raeuber); 	Rog868.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog868, GIL_EBR );
	var C_NPC Rog869;	Rog869	= Hlp_GetNpc(Org_869_Raeuber); 	Rog869.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog869, GIL_EBR );
	var C_NPC Rog870;	Rog870	= Hlp_GetNpc(Org_870_Raeuber); 	Rog870.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog870, GIL_EBR );
	var C_NPC Rog871;	Rog871	= Hlp_GetNpc(Org_871_Raeuber); 	Rog871.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog871, GIL_EBR );
	var C_NPC Rog874;	Rog874	= Hlp_GetNpc(Org_874_Raeuber); 	Rog874.guild 	= GIL_EBR; Npc_SetTrueGuild	( Rog874, GIL_EBR );
	
	if (Stooges_fled == TRUE)
	{
		var C_NPC Renyu;	Renyu 	= Hlp_GetNpc(Org_860_Renyu	); if (Hlp_IsValidNpc(Renyu)) 	{		Renyu.guild 	= GIL_EBR; Npc_SetTrueGuild	( Renyu, GIL_EBR );	};
		var C_NPC Killian;	Killian = Hlp_GetNpc(Org_861_Killian); if (Hlp_IsValidNpc(Killian))	{		Killian.guild 	= GIL_EBR; Npc_SetTrueGuild	( Killian, GIL_EBR );	};
		var C_NPC Jacko;	Jacko 	= Hlp_GetNpc(Org_862_Jacko	); if (Hlp_IsValidNpc(Jacko))	{		Jacko.guild 	= GIL_EBR; Npc_SetTrueGuild	( Jacko, GIL_EBR );	};
	};
	
};	


