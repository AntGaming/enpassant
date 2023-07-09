space_cooldown = 0.2*power(10,6)
time_last_skip = get_timer()
start_ind = 0
num_frames = 0
current_cutscene_ind = 0

function start_cutscene(cutscene_ind)
{
	room_goto(rm_cutscene)
	time_last_skip = get_timer()
	current_cutscene_ind = cutscene_ind
	switch(cutscene_ind)
	{
		case 1:
		{
			start_ind=0
			num_frames=4
			break
		}
		case 2:
		{
			start_ind=4
			num_frames=7
			break
		}
		case 3:
		{
			start_ind=11
			num_frames=6
			break
		}
	}
}

function end_cutscene(cutscene_ind)
{
	switch(current_cutscene_ind)
	{
		case 1:
		case 2:
		{
			room_goto(rm_level_select)
			break
		}
		case 3:
		{
			global.level = 5
			room_goto(rm_battle)
			break
		}
	}
}