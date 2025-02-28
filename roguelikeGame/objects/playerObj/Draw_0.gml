draw_self();

draw_set_color(c_red);
draw_set_font(fnt_mainSmall);
var temp = string(global.player_hp);
var temp2 = string(global.player_max_hp);

draw_text(x+20, y-50, temp + " / " + temp2);