player globalChat format ["Votre profile a été sauvegardé %1.",name player];

	["positionPlayer", getPosATL player] call fn_SaveStat;
	["directionPlayer", direction player] call fn_SaveStat;
	["gogglesPlayer", goggles player] call fn_SaveStat;
	["vestPlayer", vest player] call fn_SaveStat;
	["outfit", uniform player] call fn_SaveStat;
	["hat", headGear player] call fn_SaveStat;
	["weaponsPlayer", weapons player] call fn_SaveStat;
	["magazinesPlayer", magazines player] call fn_SaveStat;
	["itemsPlayer", items player] call fn_SaveStat;
	["backpackPlayer", backpack player] call fn_SaveStat;
