shoot_state = -1;

boom = 0;

function shoot()
{
	audio_play_sound(sfx_shot, 1, 0);
	with instance_create_layer(x, y, "Gunshots", obj_bullet)
	{
		dir = point_direction(other.master.x, other.master.y, obj_player.x, obj_player.y);
		dir += irandom_range(-5, 5);
		image_angle = dir;
	}
}