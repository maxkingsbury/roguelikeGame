// Check if the shop needs to reset (only after a wave is completed)
if (global.shop_reset) {
    // Step 1: Filter out already owned weapons
    var available_weapons = [];
    for (var i = 0; i < array_length(global.weapon_pool); i++) {
        var weapon_name = global.weapon_pool[i].name;
        if (!array_contains(global.acquired_weapons, weapon_name)) {
            array_push(available_weapons, global.weapon_pool[i]);
        }
    }

    // Step 2: Select two weapons based on weight (rarity)
    var shop_weapons = [];
    while (array_length(shop_weapons) < 2 && array_length(available_weapons) > 0) {
        var chosen = weighted_random(available_weapons); // Function to pick based on weight
        array_push(shop_weapons, chosen);
        array_delete(available_weapons, chosen, 1); // Remove chosen weapon to avoid duplicates
    }

    // Store the chosen weapons for display in the shop
    global.shop_weapon_1 = shop_weapons[0];
    global.shop_weapon_2 = shop_weapons[1];

    // Reset the shop flag
    global.shop_reset = false;
}
