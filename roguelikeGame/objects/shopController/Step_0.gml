// Step Event – Handle Buying Weapons
var mx = mouse_x;
var my = mouse_y;

// Use a flag to track if the mouse button was just pressed
var clicked_weapon_1 = false;
var clicked_weapon_2 = false;

// Calculate scaling factors
var scale_x = display_get_width() / 1920;
var scale_y = display_get_height() / 1080;

// Check if weapon 1 is clicked
if (mouse_check_button_pressed(mb_left) && 
    mouse_x > (weapon1_x_start * scale_x) && mouse_x < (weapon1_x_end * scale_x) &&
    mouse_y > (weapon1_y_start * scale_y) && mouse_y < (weapon1_y_end * scale_y)) {

    if (!global.shop_weapon_1.bought && global.money >= global.shop_weapon_1.price) {
        // Deduct money and mark the weapon as bought
        global.money -= global.shop_weapon_1.price;
        add_weapon(global.shop_weapon_1.name);
        global.shop_weapon_1.bought = true; // Mark weapon as bought
        show_debug_message("Bought " + global.shop_weapon_1.name);
    }
}

// Check if weapon 2 is clicked
if (mouse_check_button_pressed(mb_left) && 
    mouse_x > (weapon2_x_start * scale_x) && mouse_x < (weapon2_x_end * scale_x) &&
    mouse_y > (weapon1_y_start * scale_y) && mouse_y < (weapon1_y_end * scale_y)) {

    if (!global.shop_weapon_2.bought && global.money >= global.shop_weapon_2.price) {
        // Deduct money and mark the weapon as bought
        global.money -= global.shop_weapon_2.price;
        add_weapon(global.shop_weapon_2.name);
        global.shop_weapon_2.bought = true; // Mark weapon as bought
        show_debug_message("Bought " + global.shop_weapon_2.name);
    }
}
if (mouse_check_button_pressed(mb_left)){
	show_debug_message(mouse_x);
	show_debug_message(mouse_y);
}
// Reset clicked flags when mouse is released
if (!mouse_check_button(mb_left)) {
    clicked_weapon_1 = false;
    clicked_weapon_2 = false;
}
