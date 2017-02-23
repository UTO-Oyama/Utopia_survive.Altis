 _baseMarkers = [];

{
    if(_x select [0,8] == "respawn_") then {
        _baseMarkers pushBackUnique _x;
    };
}forEach allMapMarkers;

player setPosATL getMarkerPos (_baseMarkers select floor (random (count _baseMarkers - 1)));
