spin = 0
start_time_dmg = 0;
isthisdummyactive = false;

function damage()
{
	//check immunity
	if(get_timer() - start_time_dmg > 0.25 * power(10, 6))
	{
		start_time_dmg = get_timer();
		audio_play_sound(sfx_slap, 1, false);
	}
	if(!isthisdummyactive)
	{
		isthisdummyactive = true;
		obj_tutorial_drawer.active_dummies++;
	}
	alarm[0] = room_speed * 0.1;
}