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
			layer_background_sprite(back_id, spr_grid);
			break;
		case 1:
			//spawnage
			layer_background_sprite(back_id, spr_stables);
			break;
		case 2:
			//spawnage
			layer_background_sprite(back_id, spr_church);
			break;
		case 3:
			//spawnage
			layer_background_sprite(back_id, spr_castle);
			break;
		case 4:
			spawn(4, 1, 1);
			audio_play_sound(mus_fight, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
		case 5:
			//spawnage
			audio_play_sound(mus_promotion, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
	}
}