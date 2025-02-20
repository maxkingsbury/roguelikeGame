// Check if weapon 1 is clicked
if (mouse_check_button_pressed(mb_left) && 
    mouse_x > room_width / 2 - 110 && mouse_x < room_width / 2 - 50 &&
    mouse_y > 250 && mouse_y < 280) {
    
    var weapon = global.shop_weapon_1;
    
    if (global.coins >= weapon.price) {
        global.coins -= weapon.price;
        add_weapon(weapon.name);
        show_debug_message("Bought " + weapon.name);
    }
}

// Check if weapon 2 is clicked
if (mouse_check_button_pressed(mb_left) &&
    mouse_x > room_width / 2 + 90 && mouse_x < room_width / 2 + 150 &&
    mouse_y > 250 && mouse_y < 280) {
    
    var weapon = global.shop_weapon_2;
    
    if (global.coins >= weapon.price) {
        global.coins -= weapon.price;
        add_weapon(weapon.name);
        show_debug_message("Bought " + weapon.name);
    }
}