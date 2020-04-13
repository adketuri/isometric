/// @description Render our game map
var tileData, screenX, screenY, tileIndex, tileZ;

for (var tX = 0; tX < MAP_W; tX++){
	for (var tY = 0; tY < MAP_H; tY++){
		tileData = global.theMap[# tX, tY];
		screenX = TileToScreenX(tX, tY); 
		screenY = TileToScreenY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
		if (tileIndex > 0){
			for (var tZ = 0; tZ <= tileZ; tZ++){
				draw_sprite(sprite_iso_tiles, tileIndex - 1, screenX, screenY + (tZ * - 16));
			}
		}
		

		var player = instance_find(obj_player, 0);
		if (player != undefined) {
			with (player) {
				var tileX = floor(x / GRID_SZ);
				var tileY = floor(y / GRID_SZ);
				//show_debug_message("YO " + string(tileX) + " " + string(tileY) + " " + string(tX) + " " + string(tY));
				if (tileX != tX || tileY != tY) break;
				var screenX = TileToScreenX(x / GRID_SZ, y / GRID_SZ);
				var screenY = TileToScreenY(x / GRID_SZ, y / GRID_SZ);
				var tile = global.theMap[# tileX, tileY];
				draw_sprite(character, 0, screenX, screenY - tile[TILE.Z] * GRID_SZ);
			}
		}
		
		//var objects = global.mapObjects[# tX, tY];
		//for (var i = 0; i < array_length_1d(objects); i++){
		//	if (objects[i] == 0) break;
		//	show_debug_message("YO " + string(objects));
		//}
		
	}
}
