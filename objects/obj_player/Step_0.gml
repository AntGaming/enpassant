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
	
	if(mouse_check_button(mb_left) && can_fist)
	{
		can_fist = false;
		var dire = point_direction(x, y, mouse_x, mouse_y);
		audio_play_sound(sfx_pawne, 1, 0);
		
		with(instance_create_layer(x - lengthdir_x(1000, dire), y - lengthdir_y(1000, dire), "Instances", obj_fist))
		{
			dir = point_direction(x, y, mouse_x, mouse_y);
		}
		
		alarm[2] = room_speed * 0.1;
	}
}
else if(mouse_check_button_pressed(mb_right) && can_passant)
{
	passanting = true;
	apply_force(25, point_direction(x, y, mouse_x, mouse_y));
	can_passant = false;
	alarm[1] = room_speed * 0.25;
	alarm[0] = room_speed * time_passant_cooldown;
	audio_play_sound(sfx_passant, 1, 0);
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
		obj_cutscene_manager.start_cutscene(3)
	}
}

if(global.level == 5)
{
	if(!obj_king.active)
	{
		room_goto(rm_end_screen)
	}
}

if(get_timer() - start_time_dmg > 0.8 * power(10, 6)) red = false;