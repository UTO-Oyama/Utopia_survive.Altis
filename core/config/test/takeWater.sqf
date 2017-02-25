player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 6;
inv_drinks = inv_drinks+1;
(uiNameSpace getVariable "myUI_DrinksTitle") ctrlSetText format ["Boissons: %1",inv_drinks];
(uiNameSpace getVariable "myUI_FoodTitle") ctrlSetText format ["Manger: %1",inv_food];