layer_set_fx(layer_get_id("OldFilm"), fx_create("_filter_old_film"));
if(global.level == -1) layer_enable_fx(layer_get_id("OldFilm"), true);
else layer_enable_fx(layer_get_id("OldFilm"), false);

progress = 0;
stabcount = 0;
passantcount = 0;
has_put_dummies = false;
active_dummies = 0;