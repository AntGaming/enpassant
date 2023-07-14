event_inherited();

sprite_index = spr_bishop_w;

hp = 3;

dash_state = -1;
vibratecount = 0;

#macro DASH_CD 2
#macro DASH_WINDUP 2

alarm[0] = wait * room_speed;

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
		apply_force(80, point_direction(x, y, obj_player.x, obj_player.y));
		instance_destroy(buddy);
		dash_state = -1;
		alarm[1] = room_speed * DASH_CD;
	}
	else
	{
		apply_force(0.2, point_direction(x, y, obj_player.x, obj_player.y))
	
		image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;
	}
}

//functions
function damage(dmg)
{
	//check immunity
	if(get_timer() - start_time_dmg > 0.25 * power(10, 6))
	{
		start_time_dmg = get_timer();
		audio_play_sound(sfx_slap, 1, false);
		hp -= dmg;
		if(hp <= 0) instance_destroy();
		
		if(dash_state != -1)
		{
			dash_state = -1;
			instance_destroy(buddy);
		}
		alarm[1] = room_speed * DASH_CD;
		
	}
}