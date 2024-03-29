event_inherited();

sprite_index = spr_bishop_w;

hp = 3;

dash_state = -1;
vibratecount = 0;

#macro DASH_CD 4 / (1 +  global.difficulty)
#macro DASH_WINDUP 4 / (2 +  global.difficulty)
alarm[1] = room_speed * DASH_CD;


function move()
{
	if(dash_state == 0)
	{
		image_angle = 0;
		if(vibratecount == 2)
		{
			vibratecount = 0;
			x = anchor_x - 3 + irandom(6);
		}
		vibratecount++;
		x_vel=0
		y_vel=0
	}
	else if(dash_state == 1)
	{
		image_angle = 0;
		audio_play_sound(sfx_charge, 1, 0);
		apply_force(60 + (20 * global.difficulty), point_direction(x, y, obj_player.x, obj_player.y));
		instance_destroy(buddy);
		dash_state = -1;
		alarm[1] = room_speed * DASH_CD;
	}
	else
	{
		apply_force(0.1 + (0.1 * global.difficulty), point_direction(x, y, obj_player.x, obj_player.y))
	
		image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;
	}
}