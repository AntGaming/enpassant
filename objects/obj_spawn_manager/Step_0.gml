if(room == rm_battle && (global.todefeat == global.defeated || (global.level == -1 && keyboard_check(vk_escape))))
{
	if(global.difficulty == 3)
	{
		var name;
		switch(global.level)
		{
			case 0:
				name = "The Frontlines";
				break;
			case 1:
				name = "Royal Stables";
				break;
			case 2:
				name = "The Cathedral";
				break;
			case 3:
				name = "Citadel";
				break;
			case 5:
				name = "The Throneroom";
				break;
			default:
				name = "some level";
		}
		show_message("This message verifies that you indeed completed " + name + " on Grandmaster difficulty.");
	}
	
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