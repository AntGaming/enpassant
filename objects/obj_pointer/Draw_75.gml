/// @description Insert description here
// You can write your code in this editor
sprite = 0;
switch (room)
{
	case rm_battle:
		sprite = spr_crosshair
		image_alpha=1
		break
	case rm_cutscene:
		image_alpha = 0
		break
	default:
		sprite = spr_cursor
		image_alpha=1
		break
}
scale = 1.75
draw_sprite_ext(sprite, 0, x, y, scale*size_x/initial_size_x, scale*size_y/initial_size_y, 0, c_white, image_alpha)