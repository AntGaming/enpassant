
damaged = false
if(active)
{
	move();	
	
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
		other.damaged |= damage(1);
	}
	
	if(place_meeting(x, y, obj_enpassant) && obj_enpassant.master.passanting)
	{
		apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
		other.damaged |= damage(2);
	}
	x += x_vel*delta_time/time_step_scale;
	y += y_vel*delta_time/time_step_scale;
	
	x_vel = lerp(x_vel, 0, 0.1);
	y_vel = lerp(y_vel, 0, 0.1);
	
	bounds()
	exclude()
}
if(died&&destroy_after_death) instance_destroy()