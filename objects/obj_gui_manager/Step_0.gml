y_lim_height = 128*scale+90

//distance from the bottom of the screen
// closest to the bottom of the scre en used to calculate how much to fade the gui
dist = min(room_height-obj_player.y, camera_get_view_height(view_camera[0])-obj_pointer.y)

if (dist < y_lim_height)
{
	y_fade_end = 0.25
	alpha = y_fade_end + (1-y_fade_end)*((dist)/y_lim_height)
	with (obj_bottom_gui)
	{
		image_alpha= other.alpha
	}
}
else
{
	with (obj_bottom_gui)
	{
		image_alpha= 1
	}
}