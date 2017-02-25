pickupSvl={
private["_svl","_me","_anim0","_anim1","_anim2"];
_svl=_this select 0;
_me=_this select 1;
if(currentWeapon _me=="")then{
if(count attachedObjects _me==0)then{
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";
sleep 0.5;};
_svl attachTo[_me,[-0.01,0.1,0.01],"rightHandMiddle1"];
_svl setDir 0;
_svl setVectorUp[6,-0.0,0];

svlDie=_me addEventHandler["killed",{call dropSvl;
(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 1)removeAction DropSvlAct;(_this select 1)removeAction CarrySvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 1)removeAction WieldSvlAct;}];

vInSvlEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopSvlEH];
call vHideSvl;}];

waitUntil{not(isNull(findDisplay 46))};
chopSvlEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)||(stance player=="PRONE")})exitWith{};
[player]spawn chopSvl;}];
titleText["J'ai ramassé une pelle","PLAIN DOWN"];

DropSvlAct=_me addAction["Lacher la pelle",{call dropSvl;(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction CarrySvlAct;}];
CarrySvlAct=_me addAction["Pelle dans le dos",{(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 1)removeAction DropSvlAct;(_this select 1)removeAction CarrySvlAct;call svlBack;}];};
}else{
_me removeAction DropSvlAct;_svl attachTo[_me,[0.2,-0.03,-0.1],"launcher"];_svl setDir 90;_svl setVectorUp[1,6.0,-1];
titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropSvlAct=_me addAction["Lacher la pelle",{(_this select 0)removeAction DropSvlAct;(_this select 1)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;call dropSvl;}];
WieldSvlAct=_me addAction["Utiliser la pelle",{(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 1)removeAction WieldSvlAct;call wieldSvl;}];};
};

vHideSvl={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_me removeEventHandler["GetInMan",vInSvlEH];
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal true;
vOutSvlEH=_me addEventHandler["GetOutMan",{call vShowSvl;}];
(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 0)removeAction WieldSvlAct;
(_this select 1)removeAction DropSvlAct;(_this select 1)removeAction CarrySvlAct;(_this select 1)removeAction WieldSvlAct;
};

vShowSvl={
private["_me","_atObjs","_atObj"];
_me=_this select 0;
_atObjs=attachedObjects _me;_atObj=_atObjs call BIS_fnc_selectRandom;
_atObj hideObjectGlobal false;
_me removeEventHandler["GetOutMan",vOutSvlEH];
vInSvlEH=_me addEventHandler["GetInMan",{
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopSvlEH];
call vHideSvl;}];
call svlBack;
};

dropSvl={
private["_me","_mySvl","_theSvl"];
_mySvl=_this select 1;
_me=_this select 0;
_mySvl=attachedObjects player;
_theSvl=_mySvl call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopSvlEH];
if(stance _me!="PRONE")then{
_me playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon";sleep 0.5;};
detach _theSvl;
titleText["J'ai laissé tomber ma pelle","PLAIN DOWN"];
PickupSvlAct=_theSvl addAction["Prendre la pelle",{(_this select 0)removeAction PickupSvlAct;(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 0)removeEventHandler["GetInMan",vInSvlEH];call pickupSvl;}];
_me removeAction DropSvlAct;_me removeAction WieldSvlAct;
_me removeEventHandler["GetInMan",vInSvlEH];_me removeEventHandler["GetOutMan",vOutSvlEH];_me removeEventHandler["Killed",svlDie];
};

chopSvl={
private["_me","_stam","_nearObj","_tarCond","_tar"];//"_LoS"
_me=_this select 0;
_me playMove "AwopPercMstpSgthWnonDnon_end";
sleep 1.25;
_stam=getStamina _me;_me setStamina(_stam-10);
_nearObj=nearestObjects[_me,["Man"],2];_tarCond=[];
{if((alive _x)&&{(_x!=_me)})then{_tarCond set[(count _tarCond),_x];};}forEach _nearObj;//Sets condition for nearestObjects
if(count _tarCond==0)exitWith{};
_tar=_tarCond call BIS_fnc_selectRandom;
_LoS=[getPosATL _me,getDir _me,90,getPosATL _tar]call BIS_fnc_inAngleSector;
if(_LoS)then{
	if((alive _tar)&&(_tar!=_me))then{
		if(_me distance _tar<2.2)then{
		_tar setDamage((damage _tar)+(0.55));
			if(_stam>=75)then{_tar setDamage((damage _tar)+(0.15));};
				if(_stam>=90)then{_tar setDamage((damage _tar)+(0.05));};
					if(_stam==100)then{_tar setDamage((damage _tar)+(0.1));};
			};
		};
	};
};

svlBack={
private["_me","_mySvl","_theSvl"];
_me=_this select 0;
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_mySvl=attachedObjects _me;
_theSvl=_mySvl call BIS_fnc_selectRandom;
(findDisplay 46)displayRemoveEventHandler["MouseButtonDown",chopSvlEH];
_theSvl attachTo[_me,[0.2,-0.03,-0.1],"launcher"];
_theSvl setDir 0;
_theSvl setVectorUp[1,6.0,-1];

titleText["Je vais l'utiliser plus tard","PLAIN DOWN"];
DropSvlAct=_me addAction["Lacher la pelle",{(_this select 0)removeAction DropSvlAct;(_this select 1)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;call dropSvl;}];
WieldSvlAct=_me addAction["Utiliser la pelle",{(_this select 0)removeAction DropSvlAct;(_this select 1)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 1)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 1)removeAction CarrySvlAct;call wieldSvl;}];
};

wieldSvl={
private["_me","_mySvl","_theSvl"];
_me=_this select 0;
_mySvl=attachedObjects _me;
_theSvl=_mySvl call BIS_fnc_selectRandom;
if(currentWeapon _me=="")then{
if((stance _me!="PRONE")||{(_me!=vehicle _me)})then{_me playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};
_theSvl attachTo[_me,[-0.01,0.1,0.01],"rightHandMiddle1"];
_theSvl setDir 0;
_theSvl setVectorUp[6,-0.0,0];
waitUntil{not(isNull(findDisplay 46))};
chopSvlEH=(findDisplay 46)displayAddEventHandler["MouseButtonDown",{
_anim0="AwopPercMstpSgthWnonDnon_start";_anim1="AwopPercMstpSgthWnonDnon_throw";_anim2="AwopPercMstpSgthWnonDnon_end";
if((animationState player==_anim0)||{(animationState player==_anim1)||(animationState player==_anim2)})exitWith{};
if(stance player=="PRONE")exitWith{};
[player]spawn chopSvl;}];

titleText["je reprend ma pelle","PLAIN DOWN"];
DropSvlAct=_me addAction["Lacher ma pelle",{(_this select 0)removeAction DropSvlAct;(_this select 1)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;call dropSvl;}];
CarrySvlAct=_me addAction["Pelle dans le dos",{(_this select 0)removeAction DropSvlAct;(_this select 0)removeAction WieldSvlAct;(_this select 0)removeAction CarrySvlAct;call svlBack;}];
}else{
(_this select 0)removeAction DropSvlAct;(_this select 1)removeAction DropSvlAct;(_this select 0)removeAction CarrySvlAct;(_this select 1)removeAction CarrySvlAct;call svlBack;};
};