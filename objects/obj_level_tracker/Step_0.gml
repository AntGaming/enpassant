debug =  (keyboard_check(ord("E")) && keyboard_check(ord("Z"))) || global.debug

if(room == rm_level_select && global.debug)
{
	global.max_level = 4;
	if(level_ind != 4) obj_level_button_right.visible = true
}