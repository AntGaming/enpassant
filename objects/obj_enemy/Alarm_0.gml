/// @description activate
visible = true;
active = true;

if(global.level != 4)
{
	do
	{
		x = irandom(room_width);
		y = irandom(room_height);
	}
	until(distance_to_object(obj_player) >= obj_cam.view_w_half);
}