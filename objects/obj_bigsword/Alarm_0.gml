/// @description trolling
if(state == 0)
{
	switch(trollcount)
	{
		case 0:
			state = 3;
			break;
		case 1:
			state = 1;
			spin = 0;
			audio_play_sound(sfx_swordcharge, 1, 0);
			break;
		case 2:
			state = 2;
			break;
		case 3:
			state = 1;
			spin = 0;
			audio_play_sound(sfx_swordcharge, 1, 0);
			break;
	}
	
	trollcount++;
	if(trollcount > 3) trollcount = 0;
}

alarm[0] = room_speed * 3 - (1 * master.rage);