if(room == rm_battle && global.level == 0 && can_spawn)
{
	spawn(0, 20, 2);
	
	can_spawn = false;
}