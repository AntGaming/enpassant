/// @description Insert description here
// You can write your code in this editor
//flicker_dur = 2*power(10, 6)
//image_alpha = power(sin(get_timer()*2*pi/flicker_dur),2)

if(keyboard_check_pressed(vk_space))
{
	if(room == rm_title) room_goto_next();
	else
	{
		global.level = obj_level_tracker.level_ind;
		room_goto_next();
	}
}