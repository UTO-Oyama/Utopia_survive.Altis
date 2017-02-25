pickupfAxe={
private["_axe","_me","_anim0","_anim1","_anim2"];
_axe=_this select 0;
_me=_this select 1;
if(currentWeapon _me=="")then{
if(count attachedObjects _me==0)then{
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
sleep 0.5;};
_axe attachTo[_me,[-0.01,0.12,0.07],"rightHandMiddle1"];
_axe setDir 90;
_axe setVectorUp[-12,-0.0,1];

fAxeDie=_me addEventHandler["Killed",{call dropfAxe;
(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 1)removeAction CarryfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 1)removeAction WieldfAxeAct;}];

vInfAxeEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopfAxeEH];
call vHidefAxe;}];

waitUntil{not(isNull(findDisplay 46))};
chopfAxeEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)||(stance player=="PRONE")})exitWith{};
[player]spawn chopfAxe;}];
titleText["J'ai ramassé une hache","PLAIN DOWN"];

DropfAxeAct=_me addAction["Lacher la hache",{call dropfAxe;(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction CarryfAxeAct;}];
CarryfAxeAct=_me addAction["Porter la hache sur le dos",{(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 1)removeAction CarryfAxeAct;call fAxeBack;}];};
}else{
_me removeAction DropfAxeAct;_axe attachTo[_me,[0.2,-0.03,-0.1],"launcher"];_axe setDir 90;_axe setVectorUp[1,6.0,-1];
titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropfAxeAct=_me addAction["Lacher la hache",{(_this select 0)removeAction DropfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;call dropfAxe;}];
WieldfAxeAct=_me addAction["Utiliser la hache",{(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 1)removeAction WieldfAxeAct;call wieldfAxe;}];};
};

vHidefAxe={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_me removeEventHandler["GetInMan",vInfAxeEH];
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal true;
vOutfAxeEH=_me addEventHandler["GetOutMan",{call vShowfAxe;}];
(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 0)removeAction WieldfAxeAct;
(_this select 1)removeAction DropfAxeAct;(_this select 1)removeAction CarryfAxeAct;(_this select 1)removeAction WieldfAxeAct;
};

vShowfAxe={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal false;
_me removeEventHandler["GetOutMan",vOutfAxeEH];
vInfAxeEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopfAxeEH];
call vHidefAxe;}];
call fAxeBack;
};

dropfAxe={
private["_me","_myAxe","_theAxe"];
_myAxe=_this select 1;
_me=_this select 0;
_myAxe=attachedObjects _me;
_theAxe=_myAxe call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopAxeEH];
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";sleep 0.5;};
detach _theAxe;
titleText["J'ai laissé tomber ma hache","PLAIN DOWN"];
PickupfAxeAct=_theAxe addAction["Prendre la hache",{(_this select 0)removeAction PickupfAxeAct;(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;call pickupfAxe;}];
_me removeAction DropfAxeAct;_me removeAction WieldfAxeAct;
_me removeEventHandler["GetInMan",vInfAxeEH];_me removeEventHandler["GetOutMan",vOutfAxeEH];_me removeEventHandler["Killed",fAxeDie];
};

chopfAxe={
private["_me","_stam","_nearObj","_tarCond","_tar"];//"_LoS"
_me=_this select 0;
_me setAnimSpeedCoef 0.9;
_me playMove "AwopPercMstpSgthWnonDnon_end";
sleep 1.3;
_me setAnimSpeedCoef 1;
_stam=getStamina _me;_me setStamina(_stam-15);
_nearObj=nearestObjects[_me,["Man"],2];_tarCond=[];
{if((alive _x)&&{(_x!=_me)})then{_tarCond set[(count _tarCond),_x];};}forEach _nearObj;//Sets condition for nearestObjects
if(count _tarCond==0)exitWith{};
_tar=_tarCond call BIS_fnc_selectRandom;
_LoS=[getPosATL _me,getDir _me,90,getPosATL _tar]call BIS_fnc_inAngleSector;
if(_LoS)then{
	if((alive _tar)&&(_tar!=_me))then{
		if(_me distance _tar<2.2)then{
		_tar setDamage((damage _tar)+(0.6));
			if(_stam>=75)then{_tar setDamage((damage _tar)+(0.15));};
				if(_stam>=90)then{_tar setDamage((damage _tar)+(0.05));};
					if(_stam==100)then{_tar setDamage((damage _tar)+(0.15));};
			};
		};
	};
};

fAxeBack={
private["_me","_myAxe","_theAxe"];
_me=_this select 0;
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_myAxe=attachedObjects _me;
_theAxe=_myAxe call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopfAxeEH];
_theAxe attachTo[_me,[0.2,-0.03,-0.1],"launcher"];
_theAxe setDir 90;
_theAxe setVectorUp[1,6.0,-1];

titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropfAxeAct=_me addAction["lacher la hache",{(_this select 0)removeAction DropfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;call dropfAxe;}];
WieldfAxeAct=_me addAction["Utiliser la hache",{(_this select 0)removeAction DropfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 1)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 1)removeAction CarryfAxeAct;call wieldfAxe;}];
};

wieldfAxe={
private["_me","_myAxe","_theAxe"];
_me=_this select 0;
_myAxe=attachedObjects _me;
_theAxe=_myAxe call BIS_fnc_selectRandom;
if(currentWeapon _me=="")then{
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_theAxe attachTo[_me,[-0.01,0.12,0.005],"rightHandMiddle1"];
_theAxe setDir 90;
_theAxe setVectorUp[-12,-0.0,1];
waitUntil{not(isNull(findDisplay 46))};
chopfAxeEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)})exitWith{};
if(stance player=="PRONE")exitWith{};
[player]spawn chopfAxe;}];

titleText["Reprendre la hache","PLAIN DOWN"];
DropfAxeAct=_me addAction["lacher la hache",{(_this select 0)removeAction DropfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;call dropfAxe;}];
CarryfAxeAct=_me addAction["Porter la hache sur le dos",{(_this select 0)removeAction DropfAxeAct;(_this select 0)removeAction WieldfAxeAct;(_this select 0)removeAction CarryfAxeAct;call axefBack;}];
}else{
(_this select 0)removeAction DropfAxeAct;(_this select 1)removeAction DropfAxeAct;(_this select 0)removeAction CarryfAxeAct;(_this select 1)removeAction CarryfAxeAct;call fAxeBack;};
};