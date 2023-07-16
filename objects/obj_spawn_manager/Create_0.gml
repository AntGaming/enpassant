function spawn(type, num, delay)
{
	var spawn_target;
	switch(type)
	{
		case enemies.pawn:
			spawn_target = obj_pawn;
			break;
		case enemies.bishop:
			spawn_target = obj_bishop;
			break;
		case enemies.rook:
			spawn_target = obj_rook;
			break;
		case enemies.knight:
			spawn_target = obj_knight;
			break;
		case enemies.king:
			spawn_target = obj_king;
			break;
	}
	
	global.todefeat+=num;
	instance_create_layer(0,0,"Instances", obj_spawner, {"spawn_target": spawn_target, "delay": delay, "num_to_spawn": num})
}