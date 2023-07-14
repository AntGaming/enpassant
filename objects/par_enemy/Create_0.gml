destroy_after_death = true
start_time_dmg = 0
died = false
x_vel = 0;
y_vel = 0;
time_random_adj = random(999999);
time_step_scale = 1/144 * power(10,6)
active = false;
visible = false;
mass=1
speed_cap=99999


function bounds()
{
	if(bbox_right > room_width) apply_force(5, 180);
	if(bbox_left < 0) apply_force(5, 0);	
	if(bbox_bottom > room_height) apply_force(5, 90);	
	if(bbox_top < 0) apply_force(5, 270);	
}

function apply_force(mag, dir)
{
	x_vel += lengthdir_x(mag/mass, dir);
	y_vel += lengthdir_y(mag/mass, dir);
}

function exclude()
{
	if(instance_number(par_enemy) > 1)
	{
		var excluder = instance_nth_nearest(x, y, par_enemy, 2);
		if(distance_to_point(excluder.x, excluder.y) < 16)
		{;
			var mag = 1/distance_to_point(excluder.x, excluder.y);
			mag = clamp(mag, 0, 1);
			apply_force(mag, point_direction(excluder.x, excluder.y, x, y));
		}
	}
}

// returns true if the object took damage
function damage(dmg)
{
	//check immunity
	if(get_timer() - start_time_dmg > 0.25 * power(10, 6))
	{
		start_time_dmg = get_timer();
		audio_play_sound(sfx_slap, 1, false);
		hp -= dmg;
		died = hp <= 0 
		return true
	}
	return false
}
