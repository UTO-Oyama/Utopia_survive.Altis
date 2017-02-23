remoteExecCall ["setSpeaker", 0];
enableSaving [false,false];
setViewdistance 2500;
player addEventHandler ["Respawn",{player addAction ["Sauvegarder",fn_savePlayer]}];

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

fn_savePlayer = compile preprocessFileLineNumbers "savePlayer.sqf";


//----------------------------------------Save systems----------------------------------------------------------------
player addAction ["Sauvegarder",fn_savePlayer];
waitUntil {time > 0};

execVM "core\config\saveFuncs.sqf";
waitUntil {!isNil "saveFuncsLoaded"};

if(isServer) then
{
	_serverHasID = profileNameSpace getVariable ["ss_ServerID",nil];
	if(isNil "_serverHasID") then
	{
		_serverID = str(round((random(100000)) + random 10000));
		profileNameSpace setVariable ["SS_ServerID",_serverID];
	};
	serverID = profileNameSpace getVariable "ss_ServerID";
	publicVariable "serverID";
};

waitUntil {!isNil "serverID"};


if(!isDedicated) then
{
	execVM "core\config\loadAccount.sqf";
	execVM "core\config\saveLoop.sqf";
};
//----------------------------------------Save systems----------------------------------------------------------------
