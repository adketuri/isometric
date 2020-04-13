/// @description Build the map
global.scale = 4
window_set_size(320 * global.scale, 240 * global.scale);
layer_set_visible("Map", false);

global.theMap = ds_grid_create(MAP_W, MAP_H);
global.mapObjects = ds_grid_create(MAP_W, MAP_H);

var tileMap = layer_tilemap_get_id("Map");

for (var tX = 0; tX < MAP_W; tX++){
	for (var tY = 0; tY < MAP_H; tY++){
		var tileMapData = tilemap_get(tileMap, tX, tY);
		// Format: [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = (tileMapData + 1) % 2 + 1;
		thisTile[TILE.Z] = (tileMapData - 1) / 2;
		global.theMap[# tX, tY] = thisTile;
		global.mapObjects[# tX, tY] = array_create(8);
	}
}