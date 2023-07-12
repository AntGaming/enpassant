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
		if(global.max_level != 5) global.level++;
	}
}