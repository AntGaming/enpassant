if (global.paused)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	width=camera_get_view_width(view_camera[0])
	height=camera_get_view_height(view_camera[0])
	draw_rectangle(0,0, width, height, false)
	draw_set_alpha(1)
	x=width/2
	y=height/2
	draw_sprite(spr_pause_button, 0, width/2, height/2)
}