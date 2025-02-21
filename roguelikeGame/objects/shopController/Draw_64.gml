// Calculate scaling factors
var scale_x = display_get_width() / 1920;
var scale_y = display_get_height() / 1080;

var screen_width = display_get_width();
var screen_height = display_get_height();

// Draw Shop UI
draw_set_halign(fa_center);
draw_set_color(c_yellow);
draw_set_font(fnt_mainBig);
draw_text(screen_width / 2, 50, "SHOP");
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(screen_width / 2, 100, "Coins: " + string(global.money));

draw_set_color(#4fd2ff); // Color for the clickable area rectangle
draw_rectangle(weapon1_x_start * scale_x, weapon1_y_start * scale_y, weapon1_x_end * scale_x, weapon1_y_end * scale_y, false); // Weapon 1
draw_rectangle(weapon2_x_start * scale_x, weapon2_y_start * scale_y, weapon2_x_end * scale_x, weapon2_y_end * scale_y, false); // Weapon 2

draw_set_color(c_black);
// Draw Weapon 1
draw_text(screen_width / 2 - 150, 200, global.shop_weapon_1.name);
draw_text(screen_width / 2 - 150, 240, "Price: " + string(global.shop_weapon_1.price));

// Show "Bought" if weapon is already purchased
if (global.shop_weapon_1.bought) {
	draw_set_color(c_red);
    draw_text(screen_width / 2 - 150, 280, "Bought");
	weapon1_y_start = 200; // Y start position for weapon 1
	weapon1_y_end = 320;   // Y end position for weapon 1
	draw_set_color(c_black);
}

// Draw Weapon 2
draw_text(screen_width / 2 + 150, 200, global.shop_weapon_2.name);
draw_text(screen_width / 2 + 150, 240, "Price: " + string(global.shop_weapon_2.price));

// Show "Bought" if weapon is already purchased
if (global.shop_weapon_2.bought) {
	draw_set_color(c_red);
    draw_text(screen_width / 2 + 150, 280, "Bought");
	weapon2_y_start = 200; // Y start position for weapon 1
	weapon2_y_end = 320;   // Y end position for weapon 1
	draw_set_color(c_black);
}
