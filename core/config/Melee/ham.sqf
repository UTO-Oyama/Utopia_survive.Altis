pickupHam={
private["_ham","_me","_anim0","_anim1","_anim2"];
_ham=_this select 0;
_me=_this select 1;
if(currentWeapon _me=="")then{
if(count attachedObjects _me==0)then{
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
sleep 0.5;};
_ham attachTo[_me,[-0.01,0.045,0.005],"rightHandMiddle1"];
_ham setDir 0;
_ham setVectorUp[0,-0.0,1];

hamDie=_me addEventHandler["Killed",{call dropHam;
(_this select 0)removeAction DropHamAct;(_this select 0)removeAction CarryHamAct;(_this select 1)removeAction DropHamAct;(_this select 1)removeAction CarryHamAct;(_this select 0)removeAction WieldHamAct;(_this select 1)removeAction WieldHamAct;}];

vInHamEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopHamEH];
call vHideHam;}];

waitUntil{not(isNull(findDisplay 46))};
chopHamEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)||(stance player=="PRONE")})exitWith{};
[player]spawn chopHam;}];
titleText["J'ai pris un marteau","PLAIN DOWN"];

DropHamAct=_me addAction["Lacher le Marteau",{call dropHam;(_this select 0)removeAction DropHamAct;(_this select 0)removeAction CarryHamAct;}];
CarryHamAct=_me addAction["Marteau a la ceinture",{(_this select 0)removeAction DropHamAct;(_this select 0)removeAction CarryHamAct;(_this select 1)removeAction DropHamAct;(_this select 1)removeAction CarryHamAct;call hamBack;}];};
}else{
_me removeAction DropHamAct;_ham attachTo[_me,[-0.18,-0.05,0],"pelvis"];_ham setDir 70;_ham setVectorUp[-12,0,1];
titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropHamAct=_me addAction["Lacher le Marteau",{(_this select 0)removeAction DropHamAct;(_this select 1)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;call dropHam;}];
WieldHamAct=_me addAction["Utiliser le Marteau",{(_this select 0)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;(_this select 1)removeAction WieldHamAct;call wieldHam;}];};
};

vHideHam={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_me removeEventHandler["GetInMan",vInHamEH];
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal true;
vOutHamEH=_me addEventHandler["GetOutMan",{call vShowHam;}];
(_this select 0)removeAction DropHamAct;(_this select 0)removeAction CarryHamAct;(_this select 0)removeAction WieldHamAct;
(_this select 1)removeAction DropHamAct;(_this select 1)removeAction CarryHamAct;(_this select 1)removeAction WieldHamAct;
};

vShowHam={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal false;
_me removeEventHandler["GetOutMan",vOutHamEH];
vInHamEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopHamEH];
call vHideHam;}];
call hamBack;
};

dropHam={
private["_me","_myHam","_theHam"];
_myHam=_this select 1;
_me=_this select 0;
_myHam=attachedObjects player;
_theHam=_myHam call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopHamEH];
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";sleep 0.5;};
detach _theHam;
titleText["J'ai laissé tomber mon marteau","PLAIN DOWN"];
PickupHamAct=_theHam addAction["Prendre le Marteau",{(_this select 0)removeAction PickupHamAct;(_this select 0)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;call pickupHam;}];
_me removeAction DropHamAct;_me removeAction WieldHamAct;
_me removeEventHandler["GetInMan",vInHamEH];_me removeEventHandler["GetOutMan",vOutHamEH];_me removeEventHandler["Killed",hamDie];
};

chopHam={
private["_me","_stam","_nearObj","_tarCond","_tar"];
_me=_this select 0;
_me setAnimSpeedCoef 1.1;
_me playMove "AwopPercMstpSgthWnonDnon_end";
sleep 1.12;
_me setAnimSpeedCoef 1;
_stam=getStamina _me;_me setStamina(_stam-16);
_nearObj=nearestObjects[_me,["Man"],1.8];_tarCond=[];
{if((alive _x)&&{(_x!=_me)})then{_tarCond set[(count _tarCond),_x];};}forEach _nearObj;//Sets condition for nearestObjects
if(count _tarCond==0)exitWith{};
_tar=_tarCond call BIS_fnc_selectRandom;
_LoS=[getPosATL _me,getDir _me,90,getPosATL _tar]call BIS_fnc_inAngleSector;
if(_LoS)then{
	if((alive _tar)&&(_tar!=_me))then{
		if(_me distance _tar<1.9)then{
		_tar setDamage((damage _tar)+(0.45));
			if(_stam>=75)then{_tar setDamage((damage _tar)+(0.05));};
				if(_stam>=90)then{_tar setDamage((damage _tar)+(0.05));};
					if(_stam==100)then{_tar setDamage((damage _tar)+(0.25));};
			};
		};
	};
};

hamBack={
private["_me","_myHam","_theHam"];
_me=_this select 0;
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_myHam=attachedObjects _me;
_theHam=_myHam call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopHamEH];
_theHam attachTo[_me,[-0.18,-0.05,0],"pelvis"];
_theHam setDir 70;
_theHam setVectorUp[-12,0,1];

titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropHamAct=_me addAction["Lacher le Marteau",{(_this select 0)removeAction DropHamAct;(_this select 1)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;call dropHam;}];
WieldHamAct=_me addAction["Utiliser le Marteau",{(_this select 0)removeAction DropHamAct;(_this select 1)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 1)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;(_this select 1)removeAction CarryHamAct;call wieldHam;}];
};

wieldHam={
private["_me","_myHam","_theHam"];
_me=_this select 0;
_myHam=attachedObjects _me;
_theHam=_myHam call BIS_fnc_selectRandom;
if(currentWeapon _me=="")then{
_theHam attachTo[_me,[-0.01,0.045,0.005],"rightHandMiddle1"];
_theHam setDir 0;
_theHam setVectorUp[0,0,1];
waitUntil{not(isNull(findDisplay 46))};
chopHamEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)})exitWith{};
if(stance player=="PRONE")exitWith{};
[player]spawn chopHam;}];

titleText["Reprendre le Marteau","PLAIN DOWN"];
DropHamAct=_me addAction["Lacher le marteau",{(_this select 0)removeAction DropHamAct;(_this select 1)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;call dropHam;}];
CarryHamAct=_me addAction["Marteau a la ceinture",{(_this select 0)removeAction DropHamAct;(_this select 0)removeAction WieldHamAct;(_this select 0)removeAction CarryHamAct;call hamBack;}];
}else{
(_this select 0)removeAction DropHamAct;(_this select 1)removeAction DropHamAct;(_this select 0)removeAction CarryHamAct;(_this select 1)removeAction CarryHamAct;call hamBack;};
};