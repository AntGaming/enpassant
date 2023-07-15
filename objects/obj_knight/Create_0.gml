event_inherited()

sprite_index = spr_knight_w;
mass =2
x_vel_pound=0
y_vel_pound=0
start_time_pound =-999* power(10,6) ;

pound_dur = 2 * power(10,6) / (2 +  global.difficulty)
hp = 4;
charge_time = 2 * power(10, 6) / (2 +  global.difficulty);
max_pound_dist = 300;
is_jumping=false;

function move()
{
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
		scalar = calculated_dist/(0.33875*pound_dur)
		
		x_vel_pound= lengthdir_x(scalar*v,target_dir)
		y_vel_pound = lengthdir_y(scalar*v,target_dir)
		
		//funny function 2
		image_xscale=(3-power(2*t-1,2))/2
		image_yscale=image_xscale
	}
}
