function loadhp()
{
	for(var i = 0; i < obj_player.hp_max; i++)
	{
		instance_create_layer(global.gui_scale*(250 + (i+1) * 80), camera_get_view_height(view_camera[0])-64*global.gui_scale-56, "Camera", obj_heart, {num: i});	
	}	
}