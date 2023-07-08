/// @description dash cooldown
dash_state = 0;
x_vel = 0;
y_vel = 0;
anchor_x = x;
alarm[2] = room_speed * DASH_WINDUP;
audio_play_sound(sfx_cross, 1, 0);
buddy = instance_create_layer(x, y, "Jesus", obj_cross, {master: id, type: 0});