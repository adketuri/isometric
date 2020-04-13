/// @description Handle input

// Move Player
var vel = 70 / room_speed;
if (keyboard_check(vk_right)) x += vel;
if (keyboard_check(vk_left)) x -= vel;
if (keyboard_check(vk_up)) y -= vel;
if (keyboard_check(vk_down)) y += vel;

// Get New Tile
var tileX = floor(x / GRID_SZ);
var tileY = floor(y / GRID_SZ);

// Check if we update our global objects
if (tileX != lastX || tileY != lastY){
	
	// Remove old reference
	var last = global.mapObjects[# lastX, lastY];
	show_debug_message("last " + string(last));
	for (var i = 0; i < array_length_1d(last); i++){
		if (last[i] == id){
			show_debug_message("REMOVE ID " + string(id));
			last[i] = 0;	
			break;
		}
	}
	
	// Add new reference
	var objects = global.mapObjects[# tileX, tileY];
	for (var i = 0; i < array_length_1d(objects); i++){
		if (objects[i] == 0){
			show_debug_message("SET ID " + string(id));
			objects[i] = id;	
			break;
		}
	}

	// Update lastX/lastY
	lastX = tileX;
	lastY = tileY;
}