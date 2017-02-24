player addEventHandler ["Respawn",{player addAction ["Sauvegarder",fn_savePlayer]}];
removeAllWeapons player;
removeGoggles player;
removeHeadgear player;
removeVest player;
removeUniform player;
//removeAllAssignedItems player;
clearAllItemsFromBackpack player;
removeBackpack player;