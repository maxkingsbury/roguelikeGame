// Manually set the clickable area coordinates for testing
weapon1_x_start = 700; // X start position for weapon 1
weapon1_x_end = 920;   // X end position for weapon 1
weapon1_y_start = 300; // Y start position for weapon 1
weapon1_y_end = 380;   // Y end position for weapon 1

weapon2_x_start = 1000; // X start position for weapon 2
weapon2_x_end = 1220;   // X end position for weapon 2
weapon2_y_start = 300; // Y start position for weapon 2
weapon2_y_end = 380;   // Y end position for weapon 2

// Create Event – Setup Shop Options
if (global.shop_reset) {
    // Step 1: Filter out already owned weapons
    var available_weapons = [];
    for (var i = 0; i < array_length(global.weapon_pool); i++) {
        var weapon = global.weapon_pool[i];
        if (!array_contains(global.acquired_weapons, weapon.name)) {
            array_push(available_weapons, weapon);
        }
    }

    // Step 2: Select two weapons based on rarity
    var shop_weapons = [];
    while (array_length(shop_weapons) < 2 && array_length(available_weapons) > 0) {
        var chosen = weighted_random(available_weapons); // Pick weapon by rarity
        
        // Add chosen weapon to the shop weapons list
        array_push(shop_weapons, chosen);

        // Remove chosen weapon from available_weapons to avoid duplicate picks
        var index_to_remove = -1;
        for (var j = 0; j < array_length(available_weapons); j++) {
            if (available_weapons[j] == chosen) {
                index_to_remove = j;
                break;
            }
        }
        if (index_to_remove != -1) {
            array_delete(available_weapons, index_to_remove, 1); // Remove weapon from available list
        }
    }

    // Step 3: Store the chosen weapons in globals for display in the shop
    global.shop_weapon_1 = array_length(shop_weapons) > 0 ? shop_weapons[0] : undefined;
    global.shop_weapon_2 = array_length(shop_weapons) > 1 ? shop_weapons[1] : undefined;

    // Step 4: Reset the shop flag after picking
    global.shop_reset = false;
}
