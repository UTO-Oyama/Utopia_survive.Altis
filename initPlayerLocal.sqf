////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

remoteExecCall ["setSpeaker", 0];
enableSaving [false,false];
setViewdistance 2500;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

call compile preprocessFile "core\UI\HUD.sqf";
[] spawn ICE_HUD;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Mode survie manger boire fouiller ect
*/

[] execVM "core\config\test\statLevels.sqf";
player addaction ["Manger","core\config\test\eat.sqf"];
player addaction ["Boire","core\config\test\drink.sqf"];
[] execVM "core\config\test\survival.sqf";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Boot Message
if(local player) then {
    [
        [
             ["Bienvenue,","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
             ["sur le serveur Utopia Survivor","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
             ["Beta V0.1","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
        ]
        ] spawn BIS_fnc_typeText;
    };
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

execVM "core\spawn\spawn.sqf";  //Script de spawn Random
execVM "welcomecredits.sqf";    // Messages ecrans pub ect
execVM "core\scripts\NRE_earplugs.sqf";  // Bouchons d'oreille
execVM "core\scripts\lacrymo.sqf";  // Scripts des lacrymo (pas encore lié )
execVM "core\config\briefing.sqf";  // .....
execVM "core\fn_autoMessages.sqf";  // Message auto Pub
execVM "core\scripts\flashbang.sqf";  // Scripts des flash-bang ( pas encore lié )

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////