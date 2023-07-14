layer_depth(layer_get_id("OldFilm"), -16000);
if(global.level == -1) layer_enable_fx(layer_get_id("OldFilm"), true);
else layer_enable_fx(layer_get_id("OldFilm"), false);

if(global.level == -1)
{
	switch(progress)
	{
		case 0:
			var move_h = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
			var move_v = (keyboard_check(ord("S")) || keyboard_check(vk_down)) - (keyboard_check(ord("W")) || keyboard_check(vk_up));
		
			if(move_h != 0 || move_v != 0)
			{
				if(alarm[0] == -1) alarm[0] = room_speed * 1;
			}
			break;
		case 1:
			if(stabcount >= 3 && alarm[0] == -1)	alarm[0] = room_speed * 3;
			break;
		case 2:
			if(alarm[0] == -1) alarm[0] = room_speed * 7;
			break;
		case 3:
			if(passantcount >= 2 && alarm[0] == -1)	alarm[0] = room_speed * 3;
			break;
		case 4:
			if(alarm[0] == -1) alarm[0] = room_speed * 7;
			break;
		case 5:
			if(!has_put_dummies)
			{
				for(var i = 0; i < 3; i++)
				{
					instance_create_layer(room_width/2 + -100 + i*100, room_height/2 - 100, "Instances", obj_dummy);
				}
				for(var i = 0; i < 3; i++)
				{
					instance_create_layer(room_width/2 + -100 + i*100, room_height/2 + 100, "Instances", obj_dummy);
				}
				has_put_dummies = true;
			}
			else if(active_dummies == 6 && alarm[0] == -1) alarm[0] = room_speed * 1;
			break;
		case 6:
			if(alarm[0] == -1) alarm[0] = room_speed * 7;
			break;
		case 7:
			if(alarm[0] == -1) alarm[0] = room_speed * 7;
			break;
		case 8:
			global.defeated = global.todefeat;
			break;
	}
}