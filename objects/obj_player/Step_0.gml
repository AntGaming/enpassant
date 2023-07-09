p_movement();

depth = -bbox_bottom;

if(global.level == 5)
{
	if(mouse_check_button_pressed(mb_right) && can_passant)
	{
		audio_play_sound(sfx_tp, 1, 0);
		x = mouse_x;
		y = mouse_y;
		alarm[0] = room_speed * 0.5;
		can_passant = false;
	}
	
	if(mouse_check_button(mb_left))
	{
			
	}
}
else if(mouse_check_button_pressed(mb_right) && can_passant && obj_sword.state == 0)
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
	damage(1);
}

if(global.level == 4)
{
	if(!obj_king.active && y <= 64)
	{
		global.level = 5;
		room_restart();
	}
}
else
{
	if(keyboard_check_pressed(vk_space)) global.defeated = global.todefeat;	
}