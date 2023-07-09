event_inherited();

active = false;
visible = false;

time_random_adj = random(999999);

sprite_index = spr_bishop_w;

x_vel = 0;
y_vel = 0;

start_time_dmg = 0;

hp = 3;

dash_state = -1;
vibratecount = 0;

#macro DASH_CD 2
#macro DASH_WINDUP 1

alarm[0] = wait * room_speed;

function move()
{
	apply_force(0.2, point_direction(x, y, obj_player.x, obj_player.y))
	
	x += x_vel;
	y += y_vel;
	
	image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	

	x_vel = lerp(x_vel, 0, 0.1);
	y_vel = lerp(y_vel, 0, 0.1);

	bounds();
	exclude();
}

//functions
function apply_force(mag, dir)
{
	x_vel += lengthdir_x(mag, dir);
	y_vel += lengthdir_y(mag, dir);
}

function bounds()
{
	if(bbox_right > room_width) apply_force(5, 180);
	if(bbox_left < 0) apply_force(5, 0);	
	if(bbox_bottom > room_height) apply_force(5, 90);	
	if(bbox_top < 0) apply_force(5, 270);	
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