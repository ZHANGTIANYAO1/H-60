/*
 * vtx_uh60_fms_fnc_updateWaypointInfo
 *
 * processes waypoint info
 *
 * params (array)[(object) vehicle]
 */

if (!isNil "test_fnc_waypts") exitWith {_this call test_fnc_waypts};
params ["_vehicle"];

private _wayPoint = [group player, currentWaypoint group player];
private _position = waypointPosition _wayPoint;
if ((count customWaypointPosition) > 0) then {
    _position = customWaypointPosition;
    [_vehicle, 7, "MAP MARK"] call vtx_uh60_mfd_fnc_setUserText;
} else {
    [_vehicle, 7, waypointDescription _wayPoint] call vtx_uh60_mfd_fnc_setUserText;
};

private _centered = _vehicle ammoOnPylon 4 == 0;
private _fixed = _vehicle ammoOnPylon 7 == 0;
private _selfAligned = _vehicle ammoOnPylon 5 == 0;
private _staticMap = _vehicle ammoOnPylon 7 > 0;
private _center = [_vehicle] call vtx_uh60_mfd_fnc_tac_getMapCenter;
private _rotation = if (_selfAligned) then {getDir _vehicle} else {0};

private _waypointDirection = (_center getDir _position) - _rotation;
_vehicle setUserMFDvalue [0, (_vehicle getDir _position)];
_vehicle setUserMFDvalue [1, _center distance2D _position];

private _zoomLevel = _vehicle getVariable ["MAP_ZoomMult", 1];
private ["_waypointPosition"];
private _worldSize = [] call BIS_fnc_mapSize;

private _positionToMfd = {
    params ["_pos", "_i1", "_i2"];
    // private _direction = (_center getDir _pos) - _rotation;
    // _vehicle setUserMFDvalue [_i1, if(_direction < 0) then {_direction + 360} else {_direction}];
    // _vehicle setUserMFDvalue [_i2, ((_center distance2D _pos) * _zoomLevel) / (vtx_uh60_fms_mapSize / 2)];

	private _diff = _pos vectordiff (getpos _vehicle);
	private _dir = direction player;
	private _rotated = [_diff, _dir] call BIS_fnc_rotateVector2D;
    _vehicle setUserMFDvalue [_i1, -1 * ((_rotated # 0) / (_worldSize/2)) * _zoomLevel];
    _vehicle setUserMFDvalue [_i2, (_rotated # 1)/ (_worldSize/2) * _zoomLevel];

};
private _clearPos = {
    _vehicle setUserMFDvalue [_this # 0, -1];
    _vehicle setUserMFDvalue [_this # 1, -1];
};

if (vtx_uh60_fms_renderWaypointsOnTAC) then {
    {
        _waypointPosition = waypointPosition [group player, (currentWaypoint group player) + _forEachIndex - 1];
        if (_forEachIndex == (currentWaypoint group player) && (count customWaypointPosition) > 0) then {
            _waypointPosition = customWaypointPosition;
        };
        if (!(_waypointPosition isEqualTo [0,0,0])) then {
            [_waypointPosition, _x # 0, _x # 1] call _positionToMfd;
        } else {
            _x call _clearPos;
        };
    } forEach [[2,3],[4,5],[6,7],[8,9],[33,34],[35,36]];

    if ((getPilotCameraTarget _vehicle) # 0) then {
        private _target = (getPilotCameraTarget _vehicle) # 1;
        [_target, 10, 11] call _positionToMfd;
    } else {
        [10, 11] call _clearPos;
    };

    //
    //43 44
    if (!isNil {VTX_JVMF_MESSAGES # VTX_JVMF_SELECTED_IDX}) then {
        (VTX_JVMF_MESSAGES # VTX_JVMF_SELECTED_IDX) params ["_ID", "_sender", "_recipient", "_type", "_text", "_data", "_replies"];
        if (_type == 2) then {
            _data params ["_position"];
            [_position, 43, 44] call _positionToMfd;
        } else {
            [43, 44] call _clearPos;
        };
    } else {
        [43, 44] call _clearPos;
    };
};

private _tofStr = "";
if (speed _vehicle > 2) then {
  private _speedMS = vectorMagnitude (velocity _vehicle);
  private _tofSecondsTotal = (_position distance _vehicle) / _speedMS;
  _tofStr = [_tofSecondsTotal] call CBA_fnc_formatElapsedTime;
} else {
  _tofStr = "--:--:--";
};
[_vehicle, 8, _tofStr] call vtx_uh60_mfd_fnc_setUserText;
