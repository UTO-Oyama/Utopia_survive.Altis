waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};


player createDiarySubject ["controls","Controls"];

// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Roulette: bouchons d'oreilles<br/>
				I: Inventaire<br/>
				"
		]
	];