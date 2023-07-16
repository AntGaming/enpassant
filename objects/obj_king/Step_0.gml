event_inherited()

if(global.difficulty == 3) rage = 1;
else if (global.difficulty == 0) rage = 0;
else rage = 1-(hp/start_hp);

//only reset the sprite once
if(died && active)
{
	active = false;
	anchor_x = x;
	image_index=1;
}


if(!active)
{
	image_angle += angle_difference(-90, image_angle) * 0.04;
	if(vibratecount == 3)
	{
		vibratecount = 0;
		x = anchor_x - 3 + irandom(6);
	}
	vibratecount++;
}

if(keyboard_check_pressed(vk_tab)) damage(20);

depth = -bbox_bottom;