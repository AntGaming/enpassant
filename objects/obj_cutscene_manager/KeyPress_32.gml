if((get_timer()-time_last_skip> space_cooldown) && room == rm_cutscene)
{
	obj_text_marker.visible = false
	obj_continue_button.visible = false
	time_last_skip=get_timer()
	with (obj_cutscene_holder)
	{
		if (image_index+1< other.start_ind+other.num_frames)
		{
			image_index += 1
		}
		else
		{
			other.end_cutscene()
		}
	}
}