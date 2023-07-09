x += lengthdir_x(move_speed, dir);
y += lengthdir_y(move_speed, dir);
	
if(distance_to_object(obj_king) < 2 && !hit)
{
	with(obj_king)
	{
		apply_force(5, point_direction(other.x, other.y, x, y));
		damage(2);
	}
	hit = true;
}

if(distance_to_object(par_enemy) < 2)
{
	with(par_enemy)
	{
		if(object_index != obj_king && active)
		damage(99);
	}
}

image_angle = dir;