event_inherited();
destroy_after_death=false

active = true;
visible = true;
vibratecount = 0;

if(global.level == 5)
{
	start_hp = 50;
}
else
{
	start_hp = 18;
}

hp = start_hp;
rage = 1-(hp/start_hp);

instance_create_layer(x, y, "Instances", obj_bigsword, {master: id});

function move()
{
	apply_force(0.2 + (0.2 * rage), point_direction(x, y, obj_player.x, obj_player.y))

	image_angle = sin(get_timer()/250000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	
}

