var _direction;
switch(argument0){
	case DIR_N:
		_direction = 0;
		break;
	case DIR_NE:
		_direction = 1;
		break;
	case DIR_E:
		_direction = 2;
		break;		
	case DIR_SE:
		_direction = 3;
		break;
	case DIR_S:
		_direction = 4;
		break;
	case DIR_SW:
		_direction = 5;
		break;
	case DIR_W:
		_direction = 6;
		break;
	case DIR_NW:
		_direction = 7;
		break;		
}
		
var _totalFrames = sprite_get_number(sprite_index) / 8;
image_index = localFrame + (_direction * _totalFrames);
localFrame += sprite_get_speed(sprite_index) / room_speed

// If animation would loop on next game step
if (localFrame >= _totalFrames){
	animationEnd = true;
	localFrame -= _totalFrames;
} else {
	animationEnd = false;
}