/*
Zomb configuration.sqf
By Oyama.
*/

zombielimit=20;		//Limite de zombies qui respawn après la mort
zombiedamage=20;	//% de dégâts d un un coup de poing de zombie
zombierun = 1; 		//1 si le zombie doit courir, 0 si ils doivent marcher
respawntime = 60;	//Temps de respawn d un zombies tués
zdebugging = 0;	    //Afficher les statistiques de débogage 1 = Activer

//Avec cette fonction, les zombies spawn que près des marqueurs
zombiemkr=[];	   //Marqueurs ou les zombies spawn
markerdist = 600;  //Distance des marqueurs où les zombies spawn et despawn

//Unité de Zombie //
/* Coté civil
SideZMB = createCenter civilian;
groupZMB = createGroup civilian;

*/
SideZMB = createCenter independent;
groupZMB = createGroup independent;

sleep 0.1;

fncZcontact = compile preprocessFile "core\config\fnc_Zcontact.sqf";
fncZproximity = compile preprocessFile "core\config\fnc_ZProximity.sqf";
fncZMarkers = compile preprocessFile "core\config\fnc_ZMarkers.sqf";


zarray=[];

if (count zombiemkr > 0) then
{[]call fncZMarkers;}
else
{[]call fncZproximity;};