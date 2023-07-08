for(var i = 0; i < move_speed; i++)
{
	x += lengthdir_x(1, dir);
	y += lengthdir_y(1, dir);
	
	if(distance_to_point(obj_player.x, obj_player.y) < 2 && !obj_player.passanting && !hit)
	{
		with(obj_player)
		{
			apply_force(5, point_direction(other.x, other.y, x, y));
			damage(1);
		}
		hit = true;
	}
}
