if(active)
{
	move();	
	
	if(distance_to_point(obj_player.x, obj_player.y) < 2 && !obj_player.passanting)
	{
		with(obj_player)
		{
			apply_force(5, point_direction(other.x, other.y, x, y));
			damage(1);
		}
	}
	
	if(place_meeting(x, y, obj_sword) && obj_sword.extension >= 0.8)
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

rage = 1-(hp/start_hp);

if(!active)
{
	image_angle += angle_difference(-90, image_angle) * 0.04;
	if(vibratecount == 3)
	{
		vibratecount = 0;
		x = anchor_x - 3 + irandom(6);
	}
	vibratecount++;
}

depth = -bbox_bottom;

if(keyboard_check_pressed(vk_space)) damage(20);