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

draw_set_color(#333333); // Color for the clickable area rectangle
draw_rectangle(650, 175, 1270, 450, false); // Weapons
draw_rectangle(400, 575, 1520, 850, false);


draw_set_color(#4fd2ff); // Color for the clickable area rectangle
draw_rectangle(weapon1_x_start * scale_x, weapon1_y_start * scale_y, weapon1_x_end * scale_x, weapon1_y_end * scale_y, false); // Weapon 1
draw_rectangle(weapon2_x_start * scale_x, weapon2_y_start * scale_y, weapon2_x_end * scale_x, weapon2_y_end * scale_y, false); // Weapon 2

draw_set_color(c_black);
// Draw Weapon 1
draw_text(screen_width / 2 - 150, 300, global.shop_weapon_1.name);
draw_text(screen_width / 2 - 150, 340, "Price: " + string(global.shop_weapon_1.price));

// Show "Bought" if weapon is already purchased
if (global.shop_weapon_1.bought) {
	draw_set_color(c_red);
    draw_text(screen_width / 2 - 150, 380, "Bought");
	weapon1_y_start = 300; // Y start position for weapon 1
	weapon1_y_end = 420;   // Y end position for weapon 1
	draw_set_color(c_black);
}

// Draw Weapon 2
draw_text(screen_width / 2 + 150, 300, global.shop_weapon_2.name);
draw_text(screen_width / 2 + 150, 340, "Price: " + string(global.shop_weapon_2.price));

// Show "Bought" if weapon is already purchased
if (global.shop_weapon_2.bought) {
	draw_set_color(c_red);
    draw_text(screen_width / 2 + 150, 380, "Bought");
	weapon2_y_start = 300; // Y start position for weapon 1
	weapon2_y_end = 420;   // Y end position for weapon 1
	draw_set_color(c_black);
}

// Calculate the center of the clickable area for each weapon
var weapon1_x_center = (weapon1_x_start + weapon1_x_end) / 2;
var weapon1_y_center = weapon1_y_start; // Use the top of the box as a reference

var weapon2_x_center = (weapon2_x_start + weapon2_x_end) / 2;
var weapon2_y_center = weapon2_y_start;

// Draw Weapon 1 Sprite Above Its Box
if (global.shop_weapon_1.sprite != noone) {
    draw_sprite_ext(global.shop_weapon_1.sprite, 0, weapon1_x_center, weapon1_y_center - 55, 5, 5, 0, c_white, 1);
}

// Draw Weapon 2 Sprite Above Its Box
if (global.shop_weapon_2.sprite != noone) {
    draw_sprite_ext(global.shop_weapon_2.sprite, 0, weapon2_x_center, weapon2_y_center - 55, 5, 5, 0, c_white, 1);
}