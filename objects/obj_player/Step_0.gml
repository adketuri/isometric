/// @description Handle input

// Move Player
var vel = 70 / room_speed;
if (keyboard_check(vk_right)) x += vel;
if (keyboard_check(vk_left)) x -= vel;
if (keyboard_check(vk_up)) y -= vel;
if (keyboard_check(vk_down)) y += vel;

// Get current overlapping tile
var tileX = floor(x / GRID_SZ);
var tileY = floor(y / GRID_SZ);
var tile = global.theMap[# tileX, tileY];

// Set Z
z = tile[TILE.Z] * -GRID_SZ