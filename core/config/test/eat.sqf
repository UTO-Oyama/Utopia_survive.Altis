{if(inv_food > 0 && hunger < 100) then {hunger = hunger + 5 + round(random 5); }; };
inv_food = inv_food - 1;
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Boisson: %1",inv_drinks];
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Manger: %1",inv_food];