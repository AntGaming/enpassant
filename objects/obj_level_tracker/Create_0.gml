level_ind = global.level
max_level = 0
function change_level(change)
{
	level_ind += change
	level_ind= clamp(level_ind, 0, max_level)
	image_index=level_ind
	
	obj_level_button_left.visible = true
	obj_level_button_right.visible = true
	if (level_ind==0)
	{
		obj_level_button_left.visible = false
	}
	else if(level_ind==max_level)
	{
		obj_level_button_right.visible = false
	}
}
image_index = global.level