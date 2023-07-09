level_ind = 0;

function change_level(change)
{
	level_ind += change
	level_ind= clamp(level_ind, 0, 4)
	image_index=level_ind
	
	obj_level_button_left.visible = true
	obj_level_button_right.visible = true
	if (level_ind==0)
	{
		obj_level_button_left.visible = false
	}
	else if(level_ind==4)
	{
		obj_level_button_right.visible = false
	}
}
image_index = 0