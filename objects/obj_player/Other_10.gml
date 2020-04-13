/// @description Render our player
var tileX = x / GRID_SZ;
var tileY = y / GRID_SZ;
var screenX = TileToScreenX(tileX, tileY);
var screenY = TileToScreenY(tileX, tileY);
var tile = global.theMap[# tileX, tileY];

if (tile != undefined){
	draw_sprite(character, 0, screenX, screenY - tile[TILE.Z] * GRID_SZ);
}

