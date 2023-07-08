randomise();

window_set_fullscreen(true);

cam = view_camera[0];
follow = obj_player;

x = follow.x;
y = follow.y;

zoom = 0.5;

camera_set_view_size(cam, 640/zoom, 360/zoom);
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;