spin = 0

isthisdummyactive = false;
immune=false

function damage()
{
	//check immunity
	if(!immune)
	{
		immune=true
		audio_play_sound(sfx_slap, 1, false);
	}
	if(!isthisdummyactive)
	{
		isthisdummyactive = true;
		obj_tutorial_drawer.active_dummies++;
	}
	alarm[0] = room_speed * 0.1;
}

function set_immune(obj, val)
{
	obj.immune=val
}

immune_cooldown = time_source_create(time_source_game, 0.25, time_source_units_seconds, set_immune, [self, false])