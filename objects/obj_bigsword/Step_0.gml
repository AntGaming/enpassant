fly_speed = 20 + (10 * master.rage);

switch(state)
{
	case 0:
		x = master.x + lengthdir_x(150, point_direction(master.x, master.y , obj_player.x, obj_player.y));
		y = master.y + lengthdir_y(160, point_direction(master.x, master.y , obj_player.x, obj_player.y)) ;
		image_angle = point_direction(master.x, master.y , obj_player.x, obj_player.y);
		break;
	
	case 1:
		x = master.x + lengthdir_x(150, point_direction(master.x, master.y , x, y) + spin);
		y = master.y + lengthdir_y(160, point_direction(master.x, master.y , x, y) + spin) ;
		image_angle = point_direction(master.x, master.y , x, y);
		
		spin = lerp(spin, 10, 0.01 + (0.02 * master.rage));
		
		if(spin >= 9.8)
		{
			throwdir = point_direction(x, y, obj_player.x, obj_player.y);
			audio_play_sound(sfx_swordthrow, 1, 0);
			x_vel = lengthdir_x(fly_speed, throwdir);
			y_vel = lengthdir_y(fly_speed, throwdir);
			alarm[1] = room_speed * 1;

			
			state = 10;
		}
		break;
		
	case 2:
		obj_spawn_manager.spawn(2, 1 + round((2 * master.rage)), 2 - (1 * master.rage));
		state = 0;
		break;
	
	case 3:
		pawnstorm(3 + (4 * master.rage), 1 - (0.8 * master.rage));
		state = 0;
	
	case 10:
		spin = 10;
		image_angle += spin;
		
		x += x_vel;
		y += y_vel;
		
		x_vel = lerp(x_vel, 0, 0.01);
		y_vel = lerp(y_vel, 0, 0.01);

		x += lengthdir_x(4 + (3 * master.rage), point_direction(x, y, master.x, master.y ));
		y += lengthdir_y(4 + (3 * master.rage), point_direction(x, y, master.x, master.y ));
		
		if(distance_to_object(master) < 2 && can_catch)
		{
			state = 11;
			can_catch = false;
			image_angle = point_direction(master.x, master.y , x, y);
			alarm[2] = room_speed * 1;
		}
		break;
		
	case 11:
		diff = angle_difference(point_direction(master.x, master.y, obj_player.x, obj_player.y), image_angle);
		image_angle += diff*(0.03 + 0.05 * master.rage);
		
		
		x = master.x + lengthdir_x(150, image_angle);
		y = master.y + lengthdir_y(160, image_angle) ;

		if(diff < 1 && can_reset)
		{
			state = 0;
			can_reset = false;
		}
		break;
}

depth = master.depth-10;

if(!master.active) instance_destroy();