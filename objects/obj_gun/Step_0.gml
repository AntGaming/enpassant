if(!instance_exists(master)) instance_destroy();
else
{
	x = master.x + lengthdir_x(32, point_direction(master.x, master.y, obj_player.x, obj_player.y));
	y = master.y + lengthdir_y(32, point_direction(master.x, master.y, obj_player.x, obj_player.y));

	image_angle = point_direction(master.x, master.y, obj_player.x, obj_player.y);

	visible = master.active;

	if(shoot_state == 0)
	{
		boom++;
		if(boom % 10 == 0)
		{
			shoot();
		}
		if(boom == 30)
		{
			shoot_state = -1;
			alarm[0] = room_speed * 4;
		}
	}
}