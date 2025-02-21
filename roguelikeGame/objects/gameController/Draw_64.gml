// Get screen width and height
var screen_width = display_get_width();
var screen_height = display_get_height();

draw_set_font(fnt_mainBig)
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

var text_str = string(round(global.wave_timer / game_get_speed(gamespeed_fps)));
var text_width = string_width(text_str); // Get the width of the text
draw_text(((screen_width - text_width) / 2)+50, 50, text_str);

draw_set_color(c_black);
draw_set_alpha(0.5)
draw_rectangle(20, 30, 380, 200, false) 
draw_set_alpha(1)

draw_set_font(fnt_main)
draw_set_color(c_white);
var attSpd = string(global.fire_rate)
var attDmg = string(global.damageScalar)
draw_set_halign(fa_center);
draw_text(200, 50, "Attack Speed:   " + attSpd);
draw_text(200, 80, "Attack Multiplier:   " + attDmg);
draw_set_halign(fa_right);



