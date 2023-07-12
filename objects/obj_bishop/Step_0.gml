if(active)
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
		move();	
	}
	
	depth = -bbox_bottom;

	if(distance_to_point(obj_player.x, obj_player.y) < 2 && !obj_player.passanting)
	{
		with(obj_player)
		{
			apply_force(5, point_direction(other.x, other.y, x, y));
			damage(1);
		}
	}
	
	if(place_meeting(x, y, obj_sword) && obj_sword.extension >= 0.6)
	{
		apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
		damage(1);
	}
	
	if(place_meeting(x, y, obj_enpassant) && obj_enpassant.master.passanting)
	{
		apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
		damage(2);
	}
}