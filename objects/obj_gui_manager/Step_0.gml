y_lim_height = 128*scale+90
y_lim = room_height-y_lim_height
if (obj_player.y > y_lim)
{
	y_fade_end = 0.25
	alpha = 1- (1-y_fade_end)*((obj_player.y-y_lim)/y_lim_height)
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