if(global.level == 5) 
{
	i_sprite = 1
	scale = 2
}
else 
{
	i_sprite = 0
	scale = 1.5
}

draw_sprite_ext(spr_pawn_f, i_sprite, 150*global.gui_scale, camera_get_view_height(view_camera[0])-64*global.gui_scale-56, scale*global.gui_scale, scale*global.gui_scale, 0, c_white, 1);