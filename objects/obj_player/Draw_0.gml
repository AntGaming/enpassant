draw_self();

if(global.level == 5 && !can_passant)
{
	draw_set_colour(c_red);
	draw_set_alpha(alarm[0] / room_speed / 0.5);
	draw_rectangle(0, 0, room_height, room_width, false);
	
	draw_set_colour(c_white);
}