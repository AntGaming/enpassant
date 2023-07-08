if (instance_exists(follow))
{
	xTo = lerp(follow.x, mouse_x, 0.2);;
	yTo = lerp(follow.y, mouse_y, 0.2);;
}

x = lerp(x, xTo, 0.1);
y = lerp(y, yTo, 0.1);

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

camera_set_view_size(cam, 640/zoom, 360/zoom);
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
