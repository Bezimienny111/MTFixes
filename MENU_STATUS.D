META
{
Parser = Menu;

};

instance MENU_STATUS(C_MENU_DEF) 
{
	// Spielername und Gilde		
	
	//items[0]	= "MENU_ITEM_PLAYERNAME_TITLE";
	//items[2]	= "MENU_ITEM_PLAYERNAME";
	
	items[0]	= "MENU_ITEM_PLAYERGUILD_TITLE";		
	items[1]	= "MENU_ITEM_PLAYERGUILD";					
			
	//
	// Level und Erfahrung
	//
	
	items[2]	= "MENU_ITEM_LEVEL_TITLE";
	items[3]	= "MENU_ITEM_EXP_TITLE";
	items[4]	= "MENU_ITEM_LEVEL_NEXT_TITLE";
	items[5]	= "MENU_ITEM_LEARN_TITLE";

	items[6]	= "MENU_ITEM_LEVEL";
	items[7]	= "MENU_ITEM_EXP";
	items[8]	= "MENU_ITEM_LEVEL_NEXT";
	items[9]	= "MENU_ITEM_LEARN";
	
	
	//
	// Attribute
	//
		
	
	
	items[10]	= "MENU_ITEM_ATTRIBUTE_HEADING";
				   
	items[11]	= "MENU_ITEM_ATTRIBUTE_1_TITLE";
	items[12]	= "MENU_ITEM_ATTRIBUTE_2_TITLE";
	items[13]	= "MENU_ITEM_ATTRIBUTE_3_TITLE";
	items[14]	= "MENU_ITEM_ATTRIBUTE_4_TITLE";
	
	items[15]	= "MENU_ITEM_ATTRIBUTE_1";
	items[16]	= "MENU_ITEM_ATTRIBUTE_2";
	items[17]	= "MENU_ITEM_ATTRIBUTE_3";
	items[18]	= "MENU_ITEM_ATTRIBUTE_4";

	// Schutz
	
	items[19]	=  "MENU_ITEM_ARMOR_HEADING";
	
	items[20]	= "MENU_ITEM_ARMOR_1_TITLE";
	items[21]	= "MENU_ITEM_ARMOR_2_TITLE";
	items[22]	= "MENU_ITEM_ARMOR_3_TITLE";
	items[23]	= "MENU_ITEM_ARMOR_4_TITLE";
	
	items[24]	= "MENU_ITEM_ARMOR_1";
	items[25]	= "MENU_ITEM_ARMOR_2";
	items[26]	= "MENU_ITEM_ARMOR_3";
	items[27]	= "MENU_ITEM_ARMOR_4";
	
	//
	// Waffentalente
	//
	
	// Ueberschriften
	items[28]	= "MENU_ITEM_TALENTS_WEAPON_HEADING";
	items[29]	= "MENU_ITEM_TALENTS_THIEF_HEADING";
	items[30]	= "MENU_ITEM_TALENTS_SPECIAL_HEADING";
	
	// Talent-Liste (Weapons)
	items[31]	= "MENU_ITEM_TALENT_1_TITLE";
	items[32]	= "MENU_ITEM_TALENT_1_SKILL";
	items[33]	= "MENU_ITEM_TALENT_1";
	
	items[34]	= "MENU_ITEM_TALENT_2_TITLE";
	items[35]	= "MENU_ITEM_TALENT_2_SKILL";
	items[36]	= "MENU_ITEM_TALENT_2";
	
	items[37]	= "MENU_ITEM_TALENT_3_TITLE";
	items[38]	= "MENU_ITEM_TALENT_3_SKILL";
	items[39]	= "MENU_ITEM_TALENT_3";
	
	items[40]	= "MENU_ITEM_TALENT_4_TITLE";
	items[41]	= "MENU_ITEM_TALENT_4_SKILL";
	items[42]	= "MENU_ITEM_TALENT_4";
	
	// Talent-Liste  Fortsetzung (Thief)
	items[43]	= "MENU_ITEM_TALENT_5_TITLE";
	items[44]	= "MENU_ITEM_TALENT_5_SKILL";
	items[45]	= "MENU_ITEM_TALENT_5";
	
	items[46]	= "MENU_ITEM_TALENT_6_TITLE";
	items[47]	= "MENU_ITEM_TALENT_6_SKILL";
	items[48]	= "MENU_ITEM_TALENT_6";
	
	// Talent-Liste Fortsetzung (Mage)
	items[49]	= "MENU_ITEM_TALENT_7_TITLE";
	items[50]	= "MENU_ITEM_TALENT_7_SKILL";


	
	// Talent-Liste Fortsetzung (Special)
	items[51]	= "MENU_ITEM_TALENT_8_TITLE";
	items[52]	= "MENU_ITEM_TALENT_8_SKILL";



	items[53]	= "MENU_ITEM_TALENT_9_TITLE";
	items[54]	= "MENU_ITEM_TALENT_9_SKILL";


	
	items[55]	= "MENU_ITEM_TALENT_10_TITLE";
	items[56]	= "MENU_ITEM_TALENT_10_SKILL";


	
	items[57]	= "MENU_ITEM_TALENT_11_TITLE";
	items[63]	= "MENU_ITEM_TALENT_11_SKILL";
	
	//Edit By Fenix

	items[59]	= "MENU_ITEM_TALENT_8";
	items[60]	= "MENU_ITEM_TALENT_9";
	
	items[61]	= "MENU_ITEM_TALENT_10";
	items[62]	= "MENU_ITEM_TALENT_11";

	////////////////////////////
		
	//
	// Eigenschaften
	//
		
	dimx		= 8192;
	dimy		= 8192;
	flags		= flags | MENU_OVERTOP|MENU_NOANI;	
	backPic		= STAT_BACK_PIC;
};

INSTANCE MENU_ITEM_TALENTS_WEAPON_HEADING(C_MENU_ITEM_DEF)
{
	text[0]	= "WALKA              RANGA  LVL  KRYT";
	posx	= STAT_B_X1; posy = STAT_TAL_Y + STAT_DY*0;
	fontName	=	STAT_FONT_TITLE;	
	flags		=	flags & ~IT_SELECTABLE;
};


// Talent 1
INSTANCE MENU_ITEM_TALENT_1_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2-400;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_8(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3-400;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_1(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3+200;posy = STAT_TAL_Y +  1*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
// Talent 2
INSTANCE MENU_ITEM_TALENT_2_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_2_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2-400;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_9(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3-400;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_2(C_MENU_ITEM_DEF) 	   { posx = STAT_B_X3+200;posy = STAT_TAL_Y +  2*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
// Talent 3
INSTANCE MENU_ITEM_TALENT_3_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_3_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2-400;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_10(C_MENU_ITEM_DEF)       { posx = STAT_B_X3-400;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_3(C_MENU_ITEM_DEF)       { posx = STAT_B_X3+200;posy = STAT_TAL_Y +  3*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
// Talent 4
INSTANCE MENU_ITEM_TALENT_4_TITLE(C_MENU_ITEM_DEF) { posx = STAT_B_X1;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
instance MENU_ITEM_TALENT_4_SKILL(C_MENU_ITEM_DEF) { posx = STAT_B_X2-400;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_11(C_MENU_ITEM_DEF)       { posx = STAT_B_X3-400;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };
INSTANCE MENU_ITEM_TALENT_4(C_MENU_ITEM_DEF)       { posx = STAT_B_X3+200;posy = STAT_TAL_Y +  4*STAT_DY;	fontName = STAT_FONT_DEFAULT;flags=flags & ~IT_SELECTABLE; };