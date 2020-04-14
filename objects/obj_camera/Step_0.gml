/// @description Interpolate camera

x += (xTo - x)/25;
y += (yTo - y)/25;

var player = instance_find(obj_player, 0);
if (player != undefined) {
	var screenX = TileToScreenX(player.x / GRID_SZ, player.y / GRID_SZ);
	var screenY = TileToScreenY(player.x / GRID_SZ, player.y / GRID_SZ);		
	xTo = screenX;
	yTo = screenY;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
