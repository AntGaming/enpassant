if(active)
{
	pound(1.5, delta_time);	
	
	depth = -bbox_bottom;

	//if(distance_to_point(obj_player.x, obj_player.y) < 2)
	//{
	//	with(obj_player)
	//	{
	//		apply_force(5, point_direction(other.x, other.y, x, y));
	//		damage(1);
	//	}
	//}
	
	//if(place_meeting(x, y, obj_sword) && obj_sword.extension >= 0.8)
	//{
	//	apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
	//	damage(1);
	//}
}