/// @description activate
visible = true;
active = true;
buddy.alarm[0] = room_speed * 4;

buddy_mark = instance_create_layer(x, y, "Jesus", obj_cross, {master: id, type: 1});
audio_play_sound(sfx_rook, 1, 0);

do
{
	x = irandom(room_width);
	y = irandom(room_height);
}
until(distance_to_object(obj_player) >= obj_cam.view_w_half);