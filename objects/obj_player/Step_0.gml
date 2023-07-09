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

if(place_meeting(x, y, obj_bigsword) && !passanting)
{
	apply_force(30, point_direction(obj_bigsword.x, obj_bigsword.y, x, y));
	damage(2);
}