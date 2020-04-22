/// @description Handle input

// Move Player
var vel = 100 / room_speed;

var xV = 0;
var yV = 0;

var inputFlags = 0;
if (keyboard_check(vk_right)){
	inputFlags = inputFlags | 1
}
if (keyboard_check(vk_down)){
	inputFlags = inputFlags | 2
}
if (keyboard_check(vk_left)){
	inputFlags = inputFlags | 4
}
if (keyboard_check(vk_up)){
	inputFlags = inputFlags | 8
}

//show_debug_message(inputFlags)
var validDirection = true;
switch (inputFlags){
	case DIR_N:
		xV -= vel
		yV -= vel
		break;
	case DIR_NE:
		yV -= vel
		break;
	case DIR_E:
		xV += vel
		yV -= vel
		break;
	case DIR_SE:
		xV += vel
		break;
	case DIR_S:
		xV += vel
		yV += vel
		break;
	case DIR_SW:
		yV += vel
		break;		
	case DIR_W:
		xV -= vel
		yV += vel
		break;
	case DIR_NW:
		xV -= vel
		break;
	default:
		validDirection = false;
		break;
}
// Update our facing direction for animations
if (validDirection){
	facing = inputFlags;
}

if (xV != 0 && yV != 0){
	xV /= 2;
	yV /= 2;
}

if (HeightAt(x + xV + xPad, y) >= z && HeightAt(x + xV - xPad, y) >= z) {
	x += xV;
}
if (HeightAt(x, y + yV + yPad) >= z && HeightAt(x, y + yV - yPad) >= z) {
	y += yV;
}

if (keyboard_check_pressed(vk_space) && ground){
	ground = false;
	zV = JUMP;
}

// Set Z
var tileZ = min(HeightAt(x + xPad, y), HeightAt(x - xPad, y), HeightAt(x, y + yPad), HeightAt(x, y - yPad));

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

// Update Animation
var _oldSprite = sprite_index;
if (inputFlags != 0){
	sprite_index = spriteWalk
} else {
	sprite_index = spriteIdle;	
}
if (_oldSprite != sprite_index) localFrame = 0;
PlayerAnimateSprite(facing)
