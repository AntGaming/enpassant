x_vel = 0;
y_vel = 0;

start_time_dmg = 0;

can_passant = true;
passanting = false;

function p_movement()
{
	var move_h = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
	var move_v = (keyboard_check(ord("S")) || keyboard_check(vk_down)) - (keyboard_check(ord("W")) || keyboard_check(vk_up));
		
	if(move_h != 0 || move_v != 0)
	{
		x_vel += move_h * move_speed;
		y_vel += move_v * move_speed;
		image_angle = sin(get_timer()/50000) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	
	}
	else
	{
		image_angle = 0;	
	}
	
	//velocity

	x += x_vel;
	y += y_vel;

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

function damage(dmg)
{
	//check immunity
	if(get_timer() - start_time_dmg > 0.5 * power(10, 6))
	{
		start_time_dmg = get_timer();
		audio_play_sound(sfx_slap, 1, false);
		hp -= dmg;
		if(hp <= 0) game_restart();
	}
}