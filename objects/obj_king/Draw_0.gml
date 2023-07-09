draw_self();

if(active)
{
	draw_set_color(c_black);
	draw_rectangle(x-210, y-210, x+210, y-140, false);
	draw_set_color(c_red);
	draw_rectangle(x-200, y-200, x+200, y-150, false);
	draw_set_color(c_lime);
	draw_rectangle(x-200, y-200, x-200 + (hp/start_hp * 400), y-150, false);

	draw_set_color(c_white);
}