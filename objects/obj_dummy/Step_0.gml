if(place_meeting(x, y, obj_sword) && obj_sword.extension >= 0.6)
{
	damage();
	spin += 10;
}
	
if(place_meeting(x, y, obj_enpassant) && obj_enpassant.master.passanting)
{
	damage();
	spin += 25;
}

image_speed = spin;
spin = lerp(spin, 0, 0.02);

if(spin <= 0.1)
{
	spin = 0;
	image_index = 0;
}