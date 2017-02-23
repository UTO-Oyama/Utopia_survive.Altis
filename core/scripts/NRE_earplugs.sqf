waitUntil {!isNull player};

NreEarplugsPath = "core\scripts\";

if (isNil "NreEarplugsActive") then {
	NreEarplugsActive = 0;
	1 fadeSound 1;
	_id = player addAction [("<t color=""#00FF00"">" + (localize "STR_NREEP_IN_ACTION") +"</t>"),NreEarplugsPath+"NRE_earplugs.sqf","",5,false,true,"",""];
	player setVariable ["NreEarplugsAction", _id];
	// Handle respawn
	player addEventHandler ["Respawn", {
		NreEarplugsActive = 0;
		1 fadeSound 1;
		_id = (_this select 1) getVariable "NreEarplugsAction";
		(_this select 1) removeAction _id;
		_id = (_this select 0) addAction [("<t color=""#00FF00"">" + (localize "STR_NREEP_IN_ACTION") +"</t>"),NreEarplugsPath+"NRE_earplugs.sqf","",5,false,true,"",""];
		(_this select 0) setVariable ["NreEarplugsAction", _id];
	}];
	breakto "firstInitFinished";
};

if ( NreEarplugsActive == 1 ) then {
	NreEarplugsActive = 0;
	1 fadeSound 1;
	hint format	[ localize "STR_NREEP_OUT_HINT" ];
	_id = player getVariable "NreEarplugsAction";
	player removeAction _id;
	_id = player addAction [("<t color=""#00FF00"">" + (localize "STR_NREEP_IN_ACTION") +"</t>"),NreEarplugsPath+"NRE_earplugs.sqf","",5,false,true,"",""];
	player setVariable ["NreEarplugsAction", _id];
} else {
	NreEarplugsActive = 1;
	1 fadeSound 0.4;
	hint format	[ localize "STR_NREEP_IN_HINT" ];
	_id = player getVariable "NreEarplugsAction";
	player removeAction _id;
	_id = player addAction [("<t color=""#FF0000"">" + (localize "STR_NREEP_OUT_ACTION") +"</t>"),NreEarplugsPath+"NRE_earplugs.sqf","",5,false,true,"",""];
	player setVariable ["NreEarplugsAction", _id];
};

scopename "firstInitFinished";
