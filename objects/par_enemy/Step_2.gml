if(active)
{
	dir = point_direction(0, 0, x_vel, y_vel)
	v = clamp(point_distance(0, 0, x_vel, y_vel), 0, speed_cap)
	x_vel = lengthdir_x(v, dir)
	y_vel = lengthdir_y(v, dir)
	x += x_vel*delta_time/time_step_scale;
	y += y_vel*delta_time/time_step_scale;
	
	x_vel = lerp(x_vel, 0, 0.1);
	y_vel = lerp(y_vel, 0, 0.1);
}
