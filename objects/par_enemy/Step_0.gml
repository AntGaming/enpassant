
event_inherited()

if(global.paused && active) 
{
	was_active = true
	active = false
}
else if (was_active && !global.paused)
{
	active = was_active
	was_active = false
}
damaged = false
if(active)
{
	move();	
	
	depth = -bbox_bottom;

	if(distance_to_point(obj_player.x, obj_player.y) < 2 && !obj_player.passanting)
	{
		with(obj_player)
		{
			apply_force(5, point_direction(other.x, other.y, x, y));
			damage(1);
		}
	}
	
	if(place_meeting(x, y, obj_sword) && obj_sword.extension >= 0.6)
	{
		apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
		damaged = damaged || damage(1);
	}
	
	if(place_meeting(x, y, obj_enpassant) && obj_enpassant.master.passanting)
	{
		apply_force(2, point_direction(obj_player.x, obj_player.y, x, y));
		damaged = damaged || damage(2);
	}	
	bounds()
	if(object_index != obj_king) exclude()
}
if(died&&destroy_after_death) instance_destroy()

