if(global.paused) exit
switch(state)
{
	case 0:
		x = master.x + lengthdir_x(44, point_direction(master.x, master.y, mouse_x, mouse_y));
		y = master.y + lengthdir_y(44, point_direction(master.x, master.y, mouse_x, mouse_y));
		
		if(mouse_check_button(mb_left))
		{
			state = 1;
			obj_tutorial_drawer.stabcount++;
		}
		break;
	
	case 1:
		x = master.x + lengthdir_x(44, point_direction(master.x, master.y, mouse_x, mouse_y)) + lengthdir_x(64*extension, point_direction(master.x, master.y, mouse_x, mouse_y));
		y = master.y + lengthdir_y(44, point_direction(master.x, master.y, mouse_x, mouse_y)) + lengthdir_y(64*extension, point_direction(master.x, master.y, mouse_x, mouse_y));
		extension = lerp(extension, 1, 0.5);
		if(extension > 0.99) state = 2;
		break;
	
	case 2:
		x = master.x + lengthdir_x(44, point_direction(master.x, master.y, mouse_x, mouse_y)) + lengthdir_x(64*extension, point_direction(master.x, master.y, mouse_x, mouse_y));
		y = master.y + lengthdir_y(44, point_direction(master.x, master.y, mouse_x, mouse_y)) + lengthdir_y(64*extension, point_direction(master.x, master.y, mouse_x, mouse_y));
		extension = lerp(extension, 0, 0.1);
		if(extension < 0.01) state = 0;
		break;
}

image_angle = point_direction(master.x, master.y, mouse_x, mouse_y);
depth = -bbox_bottom;