player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
sleep 2;
inv_food = inv_food+1;
hint "J'ai trouvé quelque chose à manger !";
(uiNameSpace getVariable "myUI_DrinksTitle") ctrlSetText format ["Boisson: %1",inv_drinks];
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Manger: %1",inv_food];