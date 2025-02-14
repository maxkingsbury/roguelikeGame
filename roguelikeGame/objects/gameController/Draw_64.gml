// Get screen width and height
var screen_width = display_get_width();
var screen_height = display_get_height();

// Define bar size
var bar_width = 1000;
var bar_height = 20;

// Calculate centered position
var bar_x = (screen_width - bar_width) / 2;
var bar_y = screen_height - 100; // 100 pixels from the bottom

// Draw background bar
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Draw XP fill
draw_set_color(c_blue);
var xp_ratio = global.player_xp / global.xp_needed;
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * xp_ratio), bar_y + bar_height, false);

// Draw text
draw_set_color(c_blue);
draw_text(screen_width/2, bar_y -100, string(global.player_level));

draw_text(screen_width/2, 50, string(global.wave_timer));
