switch(state)
{
	case -1:
		visible = false;
		break;
	/*
	case 0:
		visible = true;
		sprite_index = spr_t_move;
		var move_h = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
		var move_v = (keyboard_check(ord("S")) || keyboard_check(vk_down)) - (keyboard_check(ord("W")) || keyboard_check(vk_up));
		
		if(move_h != 0 || move_v != 0) state = 1;
		break;
	case 1:
		visible = true;
		sprite_index = spr_t_stab;
		
		if(mouse_check_button_pressed(mb_left)) state = 2;
		break;
	case 2:
		visible = true;
		sprite_index = spr_t_enpassant;
		
		if(mouse_check_button_pressed(mb_right) && obj_player.can_passant)
		{
			state = 3;
			obj_spawner.can_spawn = true;
		}
		break;
	case 3:
		visible = false;
		break;
	*/
	case 4:
		visible = false;
		if(instance_exists(obj_king))
		{
			if(!obj_king.active) state = 5;
		}
		break;
	case 5:
		visible = true;
		sprite_index = spr_t_promote;
		break;
	default:
		visible = false;
}

depth = -99999999;

x = obj_player.x;
y = obj_player.y - 200;