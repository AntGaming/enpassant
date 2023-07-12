if(global.level == 5 && !obj_player.can_passant)
{
	draw_set_alpha(alarm[0]/room_speed/0.5);
	if(obj_player.alarm[0]/room_speed > 0.4) draw_sprite(spr_tpeffect, 0, 0, 0);
	else if(obj_player.alarm[0]/room_speed > 0.3) draw_sprite(spr_tpeffect, glitch, 0, 0);
	draw_set_alpha(1);
}