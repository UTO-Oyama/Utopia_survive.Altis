/* Random spawn Weapons By [UTO]Oyama
pour des items mettre additemcargo, pour des chargeur addmagazinecargo
execVM "wpsRandom.sqf"; */

//Listes des armes et chargeurs.
//Armes de poings
gun1 = ["hgun_ACPC2_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F"];
char1 = ["30Rnd_9x21_Mag","6Rnd_45ACP_Cylinder","11Rnd_45ACP_Mag","9Rnd_45ACP_Mag"];
//Armes legere
gun2 = ["arifle_Mk20_plain_F","arifle_SPAR_02_blk_F","arifle_SPAR_01_blk_F"];
char2 = ["30Rnd_556x45_Stanag","150Rnd_556x45_Drum_Mag_Tracer_F","30Rnd_556x45_Stanag_Tracer_Red"];
//Armes moyennes (mili)
gun3 = ["arifle_ARX_blk_F","arifle_AKS_F","arifle_CTAR_blk_F","arifle_Katiba_C_F","arifle_MX_SW_F"];
char3 = ["30Rnd_65x39_caseless_green_mag_Tracer","30Rnd_545x39_Mag_Tracer_Green_F","30Rnd_580x42_Mag_F","30Rnd_65x39_caseless_green","100Rnd_65x39_caseless_mag_Tracer"];
//Armes Light Machine Gun
gun4 = ["arifle_AKM_FL_F","arifle_SPAR_02_blk_F","LMG_Mk200_F","LMG_03_F"];
char4 = ["30Rnd_762x39_Mag_Tracer_Green_F","150Rnd_556x45_Drum_Mag_F","200Rnd_65x39_cased_Box_Tracer","200Rnd_556x45_Box_Tracer_F"];

//Configuration des marker
{
	if(_x select [0,6] == "basic_") then {
	_theGun = gun1 call BIS_fnc_selectRandom;
	_theMag = char1 call BIS_fnc_selectRandom;

	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme AddweaponcargoGlobal [_theGun,1];
	_arme AddmagazinecargoGlobal [_theMag,2];
	};
}forEach allMapMarkers;

{
	if(_x select [0,6] == "Inter_") then {
	_theGun = gun2 call BIS_fnc_selectRandom;
	_theMag = char2 call BIS_fnc_selectRandom;

	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme AddweaponcargoGlobal [_theGun,1];
	_arme AddmagazinecargoGlobal [_theMag,2];
	};
}forEach allMapMarkers;

{
	if(_x select [0,5] == "Mgun_") then {
	_theGun = gun3 call BIS_fnc_selectRandom;
	_theMag = char3 call BIS_fnc_selectRandom;

	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme AddweaponcargoGlobal [_theGun,1];
	_arme AddmagazinecargoGlobal [_theMag,2];
	};
}forEach allMapMarkers;

{
	if(_x select [0,4] == "Mil_") then {
	_theGun = gun4 call BIS_fnc_selectRandom;
	_theMag = char4 call BIS_fnc_selectRandom;

	_arme = "weaponholdersimulated" createvehicle getMarkerPos _x;
	_arme setPosATL [(getMarkerPos _x) select 0,(getMarkerPos _x) select 1,0];
	_arme AddweaponcargoGlobal [_theGun,1];
	_arme AddmagazinecargoGlobal [_theMag,2];
	};
}forEach allMapMarkers;