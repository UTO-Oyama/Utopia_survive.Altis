while {alive player} do {
	sleep 60; //Chaque x secondes la faim et la soif diminue
	hunger=hunger-1; //perte de faim
	thirst=thirst-1; //perte de Soif
	(uiNameSpace getVariable "myUI_ThirstTitle") ctrlSetText format ["Soif: %1%2",thirst,prc];
	(uiNameSpace getVariable "myUI_HungerTitle") ctrlSetText format ["Faim: %1%2",hunger,prc];
};

while {!alive player} do {
hunger=100;
thirst=100;
(uiNameSpace getVariable "myUI_HungerTitle") ctrlSetText format ["Faim: %1%2",hunger,prc];
(uiNameSpace getVariable "myUI_ThirstTitle") ctrlSetText format ["Soif: %1%2",thirst,prc];
};

while {alive player} do {
if (thirst <= 0) then {
player setDamage (damage player)+0.01;
};
if (hunger <= 0) then {
player setDamage (damage player)+0.01;
};
if (thirst >= 110) then {
hint "Je suis hydraté ...";
};
if (thirst >= 115) then {
hint "Je ne pense pas avoir besoin de plus d'eau ...";
};
if (thirst >= 120) then {
hint "Je suis trop hydraté !";
};

if (hunger >= 110) then {
hint "Je suis plein d'énergie";
};
if (hunger >= 115) then {
hint "Je ne pense pas que j'ai besoin de plus de nourriture ...";
};
if (hunger >= 120) then {
hint "Je suis bourré !";
};
sleep 1;
};