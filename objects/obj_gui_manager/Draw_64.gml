if(global.level == 5)
{
	ability_spr = spr_teleport
	face_spr_ind = 1
	face_spr_scale = 2
}
else
{
	ability_spr = spr_enpassant
	face_spr_ind = 0
	face_spr_scale = 1.5
}

draw_sprite_ext(spr_pawn_f, face_spr_ind, 150*scale, camera_get_view_height(view_camera[0])-64*scale-56, face_spr_scale*scale, face_spr_scale*scale, 0, c_white, image_alpha);

draw_sprite_ext(ability_spr, 0, 1200, camera_get_view_height(view_camera[0])-64*scale-36, scale, scale, 0, c_white, image_alpha);
draw_sprite_ext(ability_spr, 0, 1200, camera_get_view_height(view_camera[0])-64*scale-36, scale*obj_player.alarm[0]/room_speed/5, scale*obj_player.alarm[0]/room_speed/5, 0, c_black, image_alpha*0.5);