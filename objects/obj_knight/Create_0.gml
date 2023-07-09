active = false;
visible = false;

time_random_adj = random(999999);

if(irandom(1) == 0) sprite_index = spr_knight_w;
else sprite_index = spr_knight_b;


x_vel = 0;
y_vel = 0;	

start_time_dmg = 0;
start_time_pound =-999* power(10,6) ;
hp = 4;
charge_time = 0.5* power(10, 6);
max_pound_dist = 300;
is_jumping=false;

alarm[0] = wait * room_speed;

function pound(pound_dur, d_t)
{
	pound_dur *= power(10,6)
	
	if ((get_timer()-start_time_pound)-charge_time> pound_dur)
	{
		//have we just finished a jump
		if(is_jumping == true)
		{
			//stomp damage/ shock wave code goes here
			audio_play_sound(sfx_knight, 1, 0);
		}
		is_jumping=false
		start_time_pound = get_timer();
		
		// dont let the knight jump too far
		calculated_dist = clamp(point_distance(x,y,obj_player.x, obj_player.y), 0, max_pound_dist)
		target_dir = point_direction(x,y,obj_player.x, obj_player.y)
	}
	
	//are we still mid jump
	if((get_timer()-start_time_pound)<pound_dur)
	{	
		is_jumping=true
		
		// t is a standardised time that scales from 0 to 1 through our pound duration
		t = (get_timer()-start_time_pound)/ (pound_dur);
		//funny function
		v = 8*t*exp(1-8*t)
		
		//magic number makes our scalar work, pls trust, makes the knight travel the correct distance
		scalar = calculated_dist/0.33875
		x_vel = lengthdir_x(scalar*v,target_dir)
		y_vel = lengthdir_y(scalar*v,target_dir)
		
		//funny function 2
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
