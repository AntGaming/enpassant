state = 0;
spin = 0;

alarm[0] = room_speed * 2;
alarm[3] = room_speed * 5;

fly_speed = 25;

x_vel = 0;
y_vel = 0;

trollcount = 0;

can_catch = false;
can_reset = false;

function spawn(type, num, delay)
{
	var spawn_target;
	switch(type)
	{
		case 0:
			spawn_target = obj_enemy;
			break;
		case 1:
			spawn_target = obj_bishop;
			break;
		case 2:
			spawn_target = obj_rook;
			break;
		case 3:
			spawn_target = obj_knight;
			break;
		case 4:
			spawn_target = obj_king;
			break;
	}
	
	for(var i = 0; i < num; i++)
	{
		with instance_create_layer(1000, 1000, "Instances", spawn_target, {wait: delay * (i+1)})
		{
			do
			{
				x = irandom(room_width);
				y = irandom(room_height);
			}
			until(distance_to_object(obj_player) >= obj_cam.view_w_half);
		}
	}
}