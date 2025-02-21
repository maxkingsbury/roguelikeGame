function add_weapon(weapon_name) {
    // Assuming global.acquired_weapons is an array where acquired weapon names are stored
    array_push(global.acquired_weapons, weapon_name);
    show_debug_message("Weapon " + weapon_name + " added to inventory.");
}