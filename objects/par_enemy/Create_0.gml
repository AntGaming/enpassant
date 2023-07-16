was_active=true
destroy_after_death = true
died = false
x_vel = 0;
y_vel = 0;
time_random_adj = random(999999);
time_step_scale = 1/room_speed * power(10,6)
active = true;
mass=1
speed_cap=99999
immune = false
enum enemies
{
	pawn=0,
	bishop=1,
	rook=2,
	knight=3,
	king=4
}


function bounds()
{
	if(bbox_right > room_width) apply_force(5, 180);
	if(bbox_left < 0) apply_force(5, 0);	
	if(bbox_bottom > room_height) apply_force(5, 90);	
	if(bbox_top < 0) apply_force(5, 270);	
}

function apply_force(mag, dir)
{
	x_vel += lengthdir_x(mag/mass, dir);
	y_vel += lengthdir_y(mag/mass, dir);
}

function exclude()
{
	if(instance_number(par_enemy) > 1)
	{
		var excluder = instance_nth_nearest(x, y, par_enemy, 2);
		if(distance_to_point(excluder.x, excluder.y) < 16)
		{
			var mag = 1/distance_to_point(excluder.x, excluder.y);
			mag = clamp(mag, 0, 1);
			dir = point_direction(excluder.x, excluder.y, x, y)
			p_x=lengthdir_x(mag, dir)
			p_y=lengthdir_y(mag, dir)
			
			// if the pawn is being pushed towards the player, do not allow it
			if(dot_product(p_x,p_y,obj_player.x-x, obj_player.y-y) < 0)
			{
				apply_force(mag, dir);
			}
		}
	}
}

// returns true if the object took damage
function damage(dmg)
{
	//check immunity
	if(!immune)
	{
		immune=true
		time_source_start(immune_cooldown)
		audio_play_sound(sfx_slap, 1, false);
		if(global.difficulty == 0 && object_index != obj_king) hp = 0;
		else hp -= dmg;
		died = hp <= 0 
		return true
	}
	return false
}

function set_immune(obj, val)
{
	obj.immune=val
}

immune_cooldown = time_source_create(time_source_game, 0.25, time_source_units_seconds, set_immune, [self, false])
//function save()
//{
//	ini_open("Enemies.ini")
//	ini_write_real(id, "x", x)
//	ini_write_real(id, "y", x)
//	ini_write_real(id, "x_vel", x_vel)
//	ini_write_real(id, "y_vel", y_vel)

//	ini_write_string()
//}