if(global.paused) exit
if(!master.passanting) 
{
	image_angle = point_direction(master.x, master.y, mouse_x, mouse_y);
	image_alpha = 0.1
}
else
{
	image_alpha = 1
}
depth = -99999
x = master.x
y = master.y

visible = master.passanting || master.can_passant;