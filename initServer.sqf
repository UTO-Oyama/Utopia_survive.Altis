if ((!isServer) && (player != player)) then {waitUntil {player == player};};

addMissionEventHandler ["HandleDisconnect",{deleteVehicle (_this select 0)}];
addMissionEventHandler ["EntityRespawned",{deleteVehicle (_this select 1)}];
remoteExecCall ["setSpeaker", 0];

[] execVM "core\spawn\spawn.sqf";
[] execVM "core\spawn\wpsRandom.sqf";
[] execVM "core\spawn\itmRandom.sqf";