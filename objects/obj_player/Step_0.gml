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
	// Update lastX/lastY
	lastX = tileX;
	lastY = tileY;
}