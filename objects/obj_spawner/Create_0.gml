global.level = 0;
global.character = 0;

can_spawn = true;

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
	}
	
	for(var i = 0; i <= num; i++)
	{
		with instance_create_layer(1000, 1000, "Instances", spawn_target, {wait: delay * i})
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