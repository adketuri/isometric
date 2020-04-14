var _X = floor(argument0 / GRID_SZ);
var _Y = floor(argument1 / GRID_SZ);
var tile = global.theMap[# _X, _Y];
return tile[TILE.Z] * -GRID_SZ;