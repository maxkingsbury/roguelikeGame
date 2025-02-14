wave_active = false;
waiting = false;
wait_time = 0;
spawn_timer = 0;
enemies_to_spawn = 0;
levelCompleteText = 0;
level_up_active = false;

global.wave_timer = 15 * game_get_speed(gamespeed_fps); // 30 seconds in frames