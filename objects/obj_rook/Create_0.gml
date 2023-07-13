event_inherited();

destroy_after_death=false



sprite_index = spr_rook_w;



hp = 1;

buddy = instance_create_layer(-999, -999, "Instances", obj_gun, {master: id});

alarm[0] = wait * room_speed;

function move()
{
	if(distance_to_object(obj_player) < 400) apply_force(0.2, point_direction(obj_player.x, obj_player.y, x, y));
	
	
	image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	
}