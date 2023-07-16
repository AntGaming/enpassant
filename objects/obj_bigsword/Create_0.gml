state = 0;
spin = 0;

alarm[0] = room_speed * 2;
//alarm[3] = room_speed * 5;

fly_speed = 25;

x_vel = 0;
y_vel = 0;

trollcount = 0;

can_catch = false;
can_reset = false;

function pawnstorm(num, delay)
{	
	for(var i = 0; i < num; i++)
	{
		with instance_create_layer(master.x, master.y, "Instances", obj_pawn, {wait: 0.1})
		{
			depth = other.master.depth+1;
			sprite_index = spr_pawn_w;
		}
	}
}