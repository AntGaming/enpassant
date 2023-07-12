draw_sprite_ext(spr_pawn_p, 0, x, y, 1, 1, image_angle, (red ? c_red : c_white), 1);

if(global.level == 5 && !can_passant)
{
	draw_set_colour(c_black);
	draw_set_alpha(alarm[0] / room_speed / 0.5);
	draw_rectangle(0, 0, room_height, room_width, false);
	draw_set_alpha(1);
	
	draw_set_colour(c_white);
}