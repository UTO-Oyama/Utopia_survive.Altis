_onScreenTime = 8;
sleep 15; //Wait in seconds before the credits start after player is in-game
_role1 = "Bienvenue sur le serveur Utopia";
_role1names = ["Survivre ou mourir..."];
_role2 = "Site/Forum";
_role2names = ["http://Utopigaming.fr/"];
_role3 = "TeamSpeak3";
_role3names = ["ts.utopiagaming.org"];
_role4 = "Attention";
_role4names = ["Kills en Safe Zone = Ban"];
_role5 = "Règle";
_role5names = ["Les règles sont sur le forum, Merci de les lire avant de jouer !"];
_role6 = "Attention";
_role6names = ["Serveur en beta test !!!"];
{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.60' color='#007e00' align='center'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.80' color='#FFFFFF' align='center'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 1.0,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names]
];