/* Lacrymo By Utopia Gaming for Baylife
Author : [UTO]Oyama , [UTO]Amaury
execVM "fn_lacrymo.sqf"; //Gaz Lacrymo
Listes de masque
"H_CrewHelmetHeli_B" // Casque Helico Police
"H_PilotHelmetFighter_B" // pilote Swatt Police
"G_Balaclava_TI_G_blk_F"; // Cagoule furtive Noir + lunettes Apex Police
"H_HelmetB_TI_tna_F" // Casque de combat Apex Rebele
"H_CrewHelmetHeli_I" // Casque Helico AAF Rebele
"H_ShemagOpen_tan" //rebel Keffieh Marron claire
"H_Shemag_olive" // rebel Keffieh olive
"H_ShemagOpen_khk" // rebel Keffieh blanc
"G_Balaclava_TI_G_tna_F" // Cagoule Furtive Verte + lunettes Apex Rebel
*/
fn_lacrymo_last_effect = 0;

While{true} do {
    "dynamicBlur" ppEffectEnable true; // Active  ppeffect
    "dynamicBlur" ppEffectAdjust [0]; // Active  normal vision
    "dynamicBlur" ppEffectCommit 15; // Le temps qu'il faut
    resetCamShake; // Réinitialise le shake
    20 fadeSound 1;  //Fait diminuer le son de 20 a 1

    _allowed = ["H_CrewHelmetHeli_B","H_PilotHelmetFighter_B","G_Balaclava_TI_G_blk_F","H_HelmetB_TI_tna_F","H_CrewHelmetHeli_I","H_ShemagOpen_tan","H_Shemag_olive","H_ShemagOpen_khk","G_Balaclava_TI_G_tna_F"];  //Type de masque contre les lacrymo

    waituntil{
        sleep 0.1;
        ((nearestObject [getPosATL player, "SmokeShellBlue"]) distance player < 10) // Type de munitions
        and
        (getPosATL (nearestObject [getpos player, "SmokeShellBlue"]) select 2 < 0.5) // Type de munitions
    };

    if (!(headgear player in _allowed) && !(goggles player in _allowed)) then
    {
        "dynamicBlur" ppEffectEnable true; // Active ppeffect
        "dynamicBlur" ppEffectAdjust [20]; // Intensité du flou
        "dynamicBlur" ppEffectCommit 3; // Temps jusqu'à ce que la vision soit complètement floue
        enableCamShake true;     // Permet de secouer l'ecran
        addCamShake [10, 45, 10];    // Définit des valeurs de secousse d'ecrans
        player setFatigue 0.8; // Fixe la fatigue à 80%
        5 fadeSound 0.1;     // Diminue le son à 10% en 5 secondes

        fn_lacrymo_last_effect = time;
    };

    sleep 5;
};