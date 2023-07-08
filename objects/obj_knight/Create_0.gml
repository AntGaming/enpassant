active = true;
visible = true;

time_random_adj = random(999999);


x_vel = 0;
y_vel = 0;

start_time_dmg = 0;
start_time_pound =-999* power(10,6) ;
hp = 3;
charge_time = 0.5* power(10, 6);
max_pound_dist = 300;

function move()
{
	apply_force(0.3, point_direction(x, y, obj_player.x, obj_player.y))
	
	x += x_vel;
	y += y_vel;
	
	image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	

	x_vel = lerp(x_vel, 0, 0.1);
	y_vel = lerp(y_vel, 0, 0.1);

	bounds();
	exclude();
}

function pound(pound_dur, d_t)
{
	pound_dur *= power(10,6)
	magic_num = 0.33875
	if ((get_timer()-start_time_pound)-charge_time> pound_dur)
	{
		start_time_pound = get_timer();
		
		calculated_dist = clamp(point_distance(x,y,obj_player.x, obj_player.y), 0, max_pound_dist)
		target_dir = point_direction(x,y,obj_player.x, obj_player.y)
		//target_x =calculated_dist*cos(angle);
		//target_y = calculated_dist*sin(angle);
	}
	if((get_timer()-start_time_pound)<pound_dur)
	{	
		t = (get_timer()-start_time_pound)/ (pound_dur);
		v = 8*t*exp(1-8*t)
		scalar = calculated_dist/magic_num
		x_vel = lengthdir_x(scalar*v,target_dir)
		y_vel = lengthdir_y(scalar*v,target_dir)
		image_xscale=(3-power(2*t-1,2))/2
		image_yscale=image_xscale
	}
	
	x += x_vel*d_t/pound_dur;
	y += y_vel*d_t/pound_dur;
	x_vel = lerp(x_vel, 0, 0.1);
	y_vel = lerp(y_vel, 0, 0.1);
	bounds();
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
	if(instance_number(obj_enemy) > 1)
	{
		var excluder = instance_nth_nearest(x, y, obj_enemy, 2);
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
	}
}
