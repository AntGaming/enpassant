global.level = 0;
global.character = 0;

can_spawn = true;

function spawn(type, num, delay)
{
	for(var i = 0; i <= num; i++)
	{
		with instance_create_layer(1000, 1000, "Instances", obj_enemy, {wait: delay * i})
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