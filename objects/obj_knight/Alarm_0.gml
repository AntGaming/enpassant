active = true;
visible = true;

do
{
	x = irandom(room_width);
	y = irandom(room_height);
}
until(distance_to_object(obj_player) >= obj_cam.view_w_half);