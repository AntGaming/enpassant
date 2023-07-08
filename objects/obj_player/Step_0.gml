p_movement();

depth = -bbox_bottom;

if(mouse_check_button_pressed(mb_right) && can_passant && obj_sword.state == 0)
{
	passanting = true;
	apply_force(25, point_direction(x, y, mouse_x, mouse_y));
	can_passant = false;
	alarm[1] = room_speed * 0.25;
	alarm[0] = room_speed * 5;
}