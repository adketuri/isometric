/// @description Build the map

layer_set_visible("Map", false);

global.theMap = ds_grid_create(RoomWidth(), RoomHeight());

var tileMap = layer_tilemap_get_id("Map");

for (var tX = 0; tX < RoomWidth(); tX++){
	for (var tY = 0; tY < RoomHeight(); tY++){
		var tileMapData = tilemap_get(tileMap, tX, tY);
		// Format: [Sprite, Z]
		var thisTile = [-1, 0];
		thisTile[TILE.SPRITE] = (tileMapData + 1) % 2 + 1;
		thisTile[TILE.Z] = floor((tileMapData - 1) / 2);
		global.theMap[# tX, tY] = thisTile;
	}
}