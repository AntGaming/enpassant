level_ind = global.level

function change_level(change)
{
	level_ind += change
	level_ind= clamp(level_ind, 0, global.max_level)
	image_index=level_ind
	
	obj_level_button_left.visible = true
	obj_level_button_right.visible = true
	if (level_ind==0)
	{
		obj_level_button_left.visible = false
	}
	if(level_ind==global.max_level)
	{
		obj_level_button_right.visible = false
	}
}
image_index = global.level
change_level(0)