space_cooldown = 2*power(10,6)
time_last_skip = get_timer()
start_ind = 0
end_ind = 0
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
			end_ind=4
		}
		case 2:
		{
			
		}
	}
	with (obj_cutscene_holder)
	{
		image_index = start_ind
	}
}

function end_cutscene(cutscene_ind)
{
	switch(current_cutscene_ind)
	{
		case 1:
		{
			room_goto(rm_level_select)
		}
	}
}