switch(global.character)
{
	case 0:
		sprite_index = spr_pawn_p;
		hp_max = 3;
		break;
}

hp = hp_max;

instance_create_layer(x, y, "Instances", obj_sword, {master: id});