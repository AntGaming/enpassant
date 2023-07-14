if(position_meeting(mouse_x, mouse_y, self))
{
	global.difficulty = image_index;
	room_goto(rm_battle);
}