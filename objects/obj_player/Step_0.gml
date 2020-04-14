/// @description Handle input

// Move Player
var vel = 100 / room_speed;

//show_debug_message("HeightAt " + string(HeightAt(x + vel, y)) + " " + " Z " + string(z));

if (keyboard_check(vk_right) && HeightAt(x + vel, y) >= z) x += vel;
if (keyboard_check(vk_left) && HeightAt(x - vel, y) >= z) x -= vel;
if (keyboard_check(vk_up) && HeightAt(x, y - vel) >= z) y -= vel;
if (keyboard_check(vk_down) && HeightAt(x, y + vel) >= z) y += vel;

if (keyboard_check_pressed(vk_space) && ground){
	ground = false;
	zV = JUMP;
}

// Get current overlapping tile
var tileX = floor(x / GRID_SZ);
var tileY = floor(y / GRID_SZ);
var tile = global.theMap[# tileX, tileY];

// Set Z
var tileZ = tile[TILE.Z] * -GRID_SZ;
z += zV / room_speed;
if (z < tileZ) {
	ground = false;
	zV += GRAVITY;
} 
if (z >= tileZ) {
	ground = true;
	z = tileZ;
	zV = 0;
}
