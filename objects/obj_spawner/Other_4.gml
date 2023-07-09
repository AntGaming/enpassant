if(room == rm_battle)
{
	switch(global.level)
	{
		case 0:
			//spawn(0, 20, 2);
			//spawn(1, 6, 10);
			//spawn(2, 3, 20);
			//spawn(3, 2, 15);
			spawn(4, 1, 1);
			break;
	}
}

audio_play_sound(mus_fight, 1, true);