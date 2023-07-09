if((get_timer()-time_last_skip> space_cooldown) && room == rm_cutscene)
{
	obj_text_marker.visible = false
	time_last_skip=get_timer()
	with (obj_cutscene_holder)
	{
		if (image_index< end_ind)
		{
			image_index += 1
		}
		else
		{
			other.end_cutscene()
		}
	}
}