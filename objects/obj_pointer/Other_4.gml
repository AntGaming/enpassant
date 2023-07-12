size_x = room_width
size_y = room_height
if (room = rm_battle)
{
	size_x = camera_get_view_width(view_camera[0])
	size_y = camera_get_view_height(view_camera[0])
}

//display_set_gui_maximize(-1, -1)
display_set_gui_size(size_x, size_y)

