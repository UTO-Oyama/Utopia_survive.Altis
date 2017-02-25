pickupAxe={
private["_axe","_me","_anim0","_anim1","_anim2"];//"_atObj"
_axe=_this select 0;
_me=_this select 1;
if(currentWeapon _me=="")then{
if(count attachedObjects _me==0)then{
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
sleep 0.5;};
_axe attachTo[_me,[-0.01,0.12,0.005],"rightHandMiddle1"];
_axe setDir 90;
_axe setVectorUp[-12,-0.0,1];

axeDie=_me addEventHandler["Killed",{call dropAxe;
(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 1)removeAction CarryAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 1)removeAction WieldAxeAct;}];

vInAxeEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopAxeEH];
call vHideAxe;}];

waitUntil{not(isNull(findDisplay 46))};
chopAxeEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)||(stance player=="PRONE")})exitWith{};
[player]spawn chopAxe;}];
titleText["J'ai ramassé une hache","PLAIN DOWN"];

DropAxeAct=_me addAction["Lacher la hache",{call dropAxe;(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction CarryAxeAct;}];
CarryAxeAct=_me addAction["Porter la hache sur le dos",{(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 1)removeAction CarryAxeAct;call axeBack;}];};
}else{
_me removeAction DropAxeAct;_axe attachTo[_me,[0.2,-0.03,-0.1],"launcher"];_axe setDir 90;_axe setVectorUp[1,6.0,-1];
titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropAxeAct=_me addAction["Lacher la hache",{(_this select 0)removeAction DropAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;call dropAxe;}];
WieldAxeAct=_me addAction["Utiliser la hache",{(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 1)removeAction WieldAxeAct;call wieldAxe;}];};
};

vHideAxe={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_me removeEventHandler["GetInMan",vInAxeEH];
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal true;
vOutAxeEH=_me addEventHandler["GetOutMan",{call vShowAxe;}];
(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 0)removeAction WieldAxeAct;
(_this select 1)removeAction DropAxeAct;(_this select 1)removeAction CarryAxeAct;(_this select 1)removeAction WieldAxeAct;
};


vShowAxe={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal false;
_me removeEventHandler["GetOutMan",vOutAxeEH];
vInAxeEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopAxeEH];
call vHideAxe;}];
call axeBack;
};

dropAxe={
private["_me","_myAxe","_theAxe"];
_myAxe=_this select 1;
_me=_this select 0;
_myAxe=attachedObjects player;
_theAxe=_myAxe call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopAxeEH];
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";sleep 0.5;};
detach _theAxe;
titleText["J'ai laissé tomber ma hache","PLAIN DOWN"];
PickupAxeAct=_theAxe addAction["Prendre la hache",{(_this select 0)removeAction PickupAxeAct;(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;call pickupAxe;}];
_me removeAction DropAxeAct;_me removeAction WieldAxeAct;
_me removeEventHandler["GetInMan",vInAxeEH];_me removeEventHandler["GetOutMan",vOutAxeEH];_me removeEventHandler["Killed",axeDie];
};

chopAxe={
private["_me","_stam","_nearObj","_tarCond","_tar"];//"_LoS"
_me=_this select 0;
_me setAnimSpeedCoef 0.85;
_me playMove "AwopPercMstpSgthWnonDnon_end";
sleep 1.15;
_me setAnimSpeedCoef 1;
_stam=getStamina _me;_me setStamina(_stam-16);
_nearObj=nearestObjects[_me,["Man"],2];_tarCond=[];
{if((alive _x)&&{(_x!=_me)})then{_tarCond set[(count _tarCond),_x];};}forEach _nearObj;
if(count _tarCond==0)exitWith{};
_tar=_tarCond call BIS_fnc_selectRandom;
_LoS=[getPosATL _me,getDir _me,90,getPosATL _tar]call BIS_fnc_inAngleSector;
if(_LoS)then{
	if((alive _tar)&&(_tar!=_me))then{
		if(_me distance _tar<2.2)then{
		_tar setDamage((damage _tar)+(0.65));
			if(_stam>=75)then{_tar setDamage((damage _tar)+(0.10));};
				if(_stam>=90)then{_tar setDamage((damage _tar)+(0.05));};
					if(_stam==100)then{_tar setDamage((damage _tar)+(0.2));};
			};
		};
	};
};

axeBack={
private["_me","_myAxe","_theAxe"];
_me=_this select 0;
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_myAxe=attachedObjects _me;
_theAxe=_myAxe call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopAxeEH];
_theAxe attachTo[_me,[0.2,-0.03,-0.1],"launcher"];
_theAxe setDir 90;
_theAxe setVectorUp[1,6.0,-1];

titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropAxeAct=_me addAction["lacher la hache",{(_this select 0)removeAction DropAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;call dropAxe;}];
WieldAxeAct=_me addAction["Utiliser la hache",{(_this select 0)removeAction DropAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 1)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 1)removeAction CarryAxeAct;call wieldAxe;}];
};

wieldAxe={
private["_me","_myAxe","_theAxe"];
_me=_this select 0;
_myAxe=attachedObjects _me;
_theAxe=_myAxe call BIS_fnc_selectRandom;
if(currentWeapon _me=="")then{
_theAxe attachTo[_me,[-0.01,0.12,0.005],"rightHandMiddle1"];
_theAxe setDir 90;
_theAxe setVectorUp[-12,-0.0,1];
waitUntil{not(isNull(findDisplay 46))};
chopAxeEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)})exitWith{};
if(stance player=="PRONE")exitWith{};
[player]spawn chopAxe;}];

titleText["Reprendre la hache","PLAIN DOWN"];
DropAxeAct=_me addAction["lacher la hache",{(_this select 0)removeAction DropAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;call dropAxe;}];
CarryAxeAct=_me addAction["Porter la hache sur le dos",{(_this select 0)removeAction DropAxeAct;(_this select 0)removeAction WieldAxeAct;(_this select 0)removeAction CarryAxeAct;call axeBack;}];
}else{
(_this select 0)removeAction DropAxeAct;(_this select 1)removeAction DropAxeAct;(_this select 0)removeAction CarryAxeAct;(_this select 1)removeAction CarryAxeAct;call axeBack;};
};