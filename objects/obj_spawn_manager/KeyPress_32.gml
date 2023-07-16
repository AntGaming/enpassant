global.paused = !global.paused
if (global.paused)
{
	time_source_pause(time_source_game)
}
else
{
	time_source_resume(time_source_game)
}
