remoteExecCall ["setSpeaker", 0];
enableSaving [false,false];
setViewdistance 2500;


if(local player) then {
    [
        [
             ["Bienvenue,","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
             ["sur le serveur Utopia Survivor","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
             ["Beta V0.1","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]
        ]
        ] spawn BIS_fnc_typeText;
    };

execVM "core\spawn\spawn.sqf";
execVM "welcomecredits.sqf";
execVM "core\scripts\NRE_earplugs.sqf";
execVM "core\scripts\lacrymo.sqf";
execVM "core\config\briefing.sqf";
execVM "core\fn_autoMessages.sqf";
execVM "core\scripts\flashbang.sqf";
