/// @description immunity flashes
if(get_timer() - start_time_dmg <= 0.8 * power(10, 6))
{
	red = !red;
}
alarm[3] = room_speed * 0.1;