event_inherited();

sprite_index = spr_pawn_w;

hp = 2;
speed_cap = 13

function move()
{
	apply_force(0.2 + (0.1 * global.difficulty), point_direction(x, y, obj_player.x, obj_player.y))
	
	image_angle = sin(get_timer()/50000 + time_random_adj) * sqrt(power(x_vel, 2) + power(y_vel, 2)) * 2;	
}