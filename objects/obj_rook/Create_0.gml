event_inherited();

destroy_after_death=false
spin_clockwise = true
alarm[1] = time_random_adj
alarm[0] = wait * room_speed;
sprite_index = spr_rook_w;
hp = 1;

buddy = instance_create_layer(-999, -999, "Instances", obj_gun, {master: id});

function move()
{
	point_direction(obj_player.x, obj_player.y, x, y)
	dist_player = distance_to_object(obj_player)
	
	// apply a force to keep the rooks on the screen but not too close
	if(dist_player< 400)
	{
		dir = point_direction(obj_player.x, obj_player.y, x, y)
		mag = 0.1
	}
	else if (dist_player>500)
	{
		dir = point_direction(x, y, obj_player.x, obj_player.y)
		mag = 0.5* power(dist_player-450, 2)/power(camera_get_view_width(view_camera[0]), 2)
	}	
	apply_force(mag, dir)
	
	
	// make them spin around the player in an arbitrary direction
	dir = point_direction(x, y, obj_player.x, obj_player.y)
	dir = spin_clockwise ? dir-90 : dir +90
	apply_force(0.1, dir)
	
	
	image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	
}