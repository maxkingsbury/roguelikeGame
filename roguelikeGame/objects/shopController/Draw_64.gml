var screen_width = display_get_width()

draw_set_halign(fa_center);

// Draw shop UI
draw_set_color(c_yellow);
draw_set_font(fnt_mainBig)
draw_text(screen_width / 2, 50, "SHOP");
draw_set_font(fnt_main)
draw_text(screen_width / 2, 100, "Coins: " + string(global.money));
draw_set_color(c_white);

// Weapon 1
draw_text(screen_width / 2 - 100, 200, global.shop_weapon_1.name);
draw_text(screen_width / 2 - 100, 220, "Price: " + string(global.shop_weapon_1.price));


// Weapon 2
draw_text(screen_width / 2 + 100, 200, global.shop_weapon_2.name);
draw_text(screen_width / 2 + 100, 220, "Price: " + string(global.shop_weapon_2.price));


draw_set_halign(fa_right);