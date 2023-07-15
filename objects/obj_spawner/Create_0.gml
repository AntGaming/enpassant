alarm[0] = delay*room_speed
num_spawned=0
function spawn()
{
	with instance_create_layer(1000, 1000, "Instances", spawn_target)
	{
		do
		{
			x = irandom(room_width);
			y = irandom(room_height);
		}
		until(point_distance(x, y, obj_player.x+obj_player.x_vel, obj_player.y+obj_player.y_vel) >= obj_cam.view_w_half+100);
	}
}