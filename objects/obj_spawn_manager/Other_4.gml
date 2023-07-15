audio_stop_all();

if(room == rm_battle)
{
	global.defeated = 0;
	global.todefeat = 0;
	var back_id = layer_background_get_id("Background");
	switch(global.level)
	{
		case -1:
			audio_play_sound(mus_tutorial, 1, true);
			layer_background_sprite(back_id, spr_grid);
			global.todefeat = 1;
			break;
		case 0:
			spawn(enemies.pawn, 30, 1);
			spawn(enemies.pawn, 10, 2);
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_grid);
			break;
		case 1:
			spawn(enemies.pawn, 15, 2);
			spawn(enemies.knight, 6, 5);
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_stables);
			break;
		case 2:
			spawn(enemies.pawn, 20, 2);
			spawn(enemies.knight, 3, 10);
			spawn(enemies.bishop, 5, 8);
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_church);
			break;
		case 3:
			spawn(enemies.rook, 1, 1);
			spawn(enemies.pawn, 22, 2);
			spawn(enemies.knight, 2, 25);
			spawn(enemies.bishop, 3, 15);
			spawn(enemies.rook, 5, 10);
			audio_play_sound(mus_battle, 1, true);
			layer_background_sprite(back_id, spr_castle);
			break;
		case 4:
			spawn(enemies.king, 1, 1);
			global.todefeat = -1;
			audio_play_sound(mus_fight, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
		case 5:
			spawn(enemies.king, 1, 1);
			global.todefeat = -1;
			audio_play_sound(mus_promotion, 1, true);
			layer_background_sprite(back_id, spr_throne);
			break;
	}
}