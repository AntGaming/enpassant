x = mouse_x
y= mouse_y

if (room == rm_battle)
{
	x -= camera_get_view_x(view_camera[0]);
	y -= camera_get_view_y(view_camera[0]);
}
confine_cursor(string(window_handle()))