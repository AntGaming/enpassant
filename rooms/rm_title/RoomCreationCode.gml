window_set_fullscreen(true)
global.level = -1
global.max_level= -1
global.difficulty = 0;
keyboard_set_map(ord("W"), vk_up)
keyboard_set_map(ord("A"), vk_left)
keyboard_set_map(ord("S"), vk_down)
keyboard_set_map(ord("D"), vk_right)
global.paused = false
global.gui_scale = 0.6
window_set_cursor(cr_none)

global.debug=true
global.max_speed=0
fast_to_level = -2

if(global.debug)
{
	if(fast_to_level>-2)
	{
		global.level= fast_to_level
		room_goto(rm_battle)
	}
	else
	{
		room_goto(rm_level_select)
	}
}