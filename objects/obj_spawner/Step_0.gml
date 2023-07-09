if(room == rm_battle && global.level == 0 && can_spawn)
{
	spawn(0, 30, 1);
	spawn(0, 10, 2);
	global.todefeat = 40;
	can_spawn = false;
}

if(room == rm_battle && global.todefeat == global.defeated)
{
	if(global.level == global.max_level) global.max_level++;
	room_goto(rm_level_select);
}