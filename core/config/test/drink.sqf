{if(inv_drinks > 0 && thirst < 100) then {thirst = thirst + 8 + round(random 10); }; };
inv_drinks = inv_drinks-1;
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Boisson: %1",inv_drinks];
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Manger: %1",inv_food];