if(global.level == 5)
{
	spr = spr_teleport
}
else
{
	spr = spr_enpassant
}
draw_sprite_ext(spr, 0, 1200, 630, scale, scale, 0, c_white, 1);
draw_sprite_ext(spr, 0, 1200, 630, scale*obj_player.alarm[0]/room_speed/5, scale*obj_player.alarm[0]/room_speed/5, 0, c_black, 0.5);