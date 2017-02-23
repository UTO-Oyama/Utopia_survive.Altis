/* Random spawn item By [UTO]Oyama
execVM "itmRandom.sqf"; */

//items  de base
itm1 = ["ItemGPS","ItemRadio","ItemMap","Binocular"];

//medic
itm2 = ["FirstAidKit"];

//Sac
itm3 = ["B_AssaultPack_cbr","B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F","B_ViperHarness_khk_F","B_AssaultPack_dgtl","B_AssaultPack_blk","B_Kitbag_mcamo","B_FieldPack_blk","B_FieldPack_oucamo","B_Carryall_ghex_F","B_Carryall_oli","B_Carryall_oucamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_rgr"];

//uniform
itm4 = ["U_B_CombatUniform_mcam","U_B_PilotCoveralls","U_O_SpecopsUniform_blk","U_I_CombatUniform_tshirt","U_I_HeliPilotCoveralls","U_I_Wetsuit","U_KerryBody","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla3_1","U_OG_Guerilla1_1","U_OG_Guerilla3_1","U_I_G_Story_Protagonist_F","U_I_Wetsuit"];

//Casque
itm5 = ["H_HelmetB_light","H_Booniehat_khk","H_Booniehat_khk_hs","H_HelmetB_plain_blk","H_HelmetSpecB_blk","H_HelmetIA_camo","H_Cap_red","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_blk_Raven","H_PilotHelmetFighter_B","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_MilCap_dgtl","H_HelmetB_light_grass","H_BandMask_blk","H_BandMask_reaper","H_HelmetLeaderO_oucamo","H_HelmetSpecO_blk","H_Bandanna_cbr","H_Bandanna_sgg","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Beret_blk","H_Beret_02","H_TurbanO_blk","H_Hat_blue","H_Hat_camo","H_Hat_checker","H_RacingHelmet_1_orange_F","U_B_T_FullGhillie_tna_F"];

//Gillet
itm6 = ["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_PlateCarrier1_rgr","V_PlateCarrier2_rgr","V_PlateCarrierGL_rgr","V_PlateCarrier1_blk","V_Chestrig_khk","V_Chestrig_blk","V_TacVest_brn","V_TacVest_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_blk","V_PlateCarrierIA1_dgtl","V_RebreatherB","V_RebreatherIA"];

//items armes
itm7 = ["Rangefinder","NVGoggles_OPFOR","optic_Arco","optic_Hamr","optic_ACO_grn","optic_Holosight_smg","acc_flashlight","optic_MRCO","optic_DMS","optic_Yorris","optic_MRD","optic_KHS_blk","optic_Arco_blk_F","Binocular"];

//Lunettes
itm8 = ["G_Balaclava_combat","G_Bandanna_beast","G_Balaclava_TI_G_tna_F","G_Sport_Blackyellow","G_Squares_Tinted","G_Lady_Blue","G_Sport_Greenblack","G_Tactical_Black","G_Tactical_Clear","G_Lowprofile","G_Spectacles","G_Combat_Goggles_tna_F","G_B_Diving"];

//Configuration des marker
{
	if(_x select [0,5] == "itm1_") then {
	_theGun = itm1 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];
	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm2_") then {
	_theGun = itm2 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm3_") then {
	_theGun = itm3 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme addBackpackCargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm4_") then {
	_theGun = itm4 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm5_") then {
	_theGun = itm5 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm6_") then {
	_theGun = itm6 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm7_") then {
	_theGun = itm7 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme addWeaponCargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "itm8_") then {
	_theGun = itm8 call BIS_fnc_selectRandom;
	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme additemcargoGlobal [_theGun,1];

	};
}forEach allMapMarkers;