audio_stop_all();

if(room == rm_battle)
{
	global.defeated = 0;
	global.todefeat = -1;
	var back_id = layer_background_get_id("Background");
	switch(global.level)
	{
		case 0:
			can_spawn = false;
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_grid);
			break;
		case 1:
			spawn(0, 15, 2);
			spawn(3, 6, 5);
			global.todefeat = 21;
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_stables);
			break;
		case 2:
			spawn(0, 20, 2);
			spawn(3, 3, 10);
			spawn(1, 5, 8);
			global.todefeat = 28;
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_church);
			break;
		case 3:
			spawn(2, 1, 1);
			spawn(0, 22, 2);
			spawn(3, 2, 25);
			spawn(1, 3, 15);
			spawn(2, 5, 10);
			global.todefeat = 33;
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_castle);
			break;
		case 4:
			spawn(4, 1, 1);
			global.todefeat = -1;
			audio_play_sound(mus_fight, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
		case 5:
			spawn(4, 1, 1);
			global.todefeat = -1;
			audio_play_sound(mus_promotion, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
	}
}