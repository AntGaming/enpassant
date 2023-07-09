if(room == rm_battle && global.level == 0 && can_spawn)
{
	spawn(0, 30, 1);
	spawn(0, 10, 2);
	global.todefeat = 40;
	can_spawn = false;
}

if(room == rm_battle && global.todefeat == global.defeated)
{
	room_goto(rm_level_select);
	if(global.level == global.max_level)
	{
		global.max_level++;
		if(global.level == 0)
		{
			obj_cutscene_manager.start_cutscene(2)
		}
	}
}