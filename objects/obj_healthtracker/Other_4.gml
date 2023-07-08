for(var i = 0; i < obj_player.hp_max; i++)
{
	instance_create_layer(250 + (i+1) * 80, 620, "Camera", obj_heart, {num: i});	
}