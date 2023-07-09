if( (get_timer()-time_last_skip> space_cooldown) && (room == rm_cutscene))
{
	obj_text_marker.visible = true
	obj_continue_button.visible = true
}

if(!audio_is_playing(mus_title) && room != rm_battle)
{
	if(room == rm_cutscene && current_cutscene_ind == 3)
	{
		audio_play_sound(mus_pre_promo, 1, true);	
	}
	else
	{
		 audio_play_sound(mus_title, 1, true);	
	}
}