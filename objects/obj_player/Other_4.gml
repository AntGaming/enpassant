if(global.level == 5)
{
	sprite_index = spr_queen;
	hp_max = 10;
	move_speed = 0.6;
}
else
{
	sprite_index = spr_pawn_p;
	hp_max = 5;
	move_speed = 0.4;
	instance_create_layer(x, y, "Instances", obj_sword, {master: id});
	instance_create_layer(x, y, "Instances", obj_enpassant, {master: id});
}

hp = hp_max;

obj_gui_manager.loadhp();