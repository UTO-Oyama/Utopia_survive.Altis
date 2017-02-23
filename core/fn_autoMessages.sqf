/*
     Pub hint tralalal blabla ect...
     By [UTO]Oyamama
*/


[] spawn {
	_messages = [
		"Vennez discutez avec nous sur le Team Speak :<br/> <t color='#e32828' size='1.5'>ts.Utopiagaming.org</t>",
		"Notre TeamSpeak est:<br/><t color='#e32828' size='1.5'>ts.utopiagaming.org</t>"
	];

	_refreshTime = 300;
	_i = 0;
	while {true} do {
		_count = count _messages;
		_message = _messages select _i;
		hint parseText format["<t color='#ffffff' size='2'>Utopia</t><t color='#c45454' size='2'>Gaming</t><br/><br/><img shadown='false' size='6'image='core\resources\textures\pub_hud.jpg'/><br/><br/>%1", _message];
		sleep _refreshTime;
		if (_i == (_count - 1)) then {
			_i = 0;
		} else {
			_i = _i + 1;
		};
	};
};