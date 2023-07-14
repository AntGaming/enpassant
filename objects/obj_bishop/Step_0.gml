/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (damaged)
{
	if(dash_state != -1)
	{
		dash_state = -1;
		instance_destroy(buddy);
	}
	alarm[1] = room_speed * DASH_CD;
}