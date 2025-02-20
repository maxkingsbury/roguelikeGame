function pick_shop_weapons(available_weapons){
    var weighted_list = [];
    
    // Fill list with weapons based on rarity
    for (var i = 0; i < array_length(available_weapons); i++) {
        var weapon = available_weapons[i];
        for (var j = 0; j < weapon.rarity; j++) {
            array_push(weighted_list, weapon);
        }
    }

    // Randomly select two unique weapons
    global.shop_weapon_1 = weighted_list[irandom(array_length(weighted_list) - 1)];
    global.shop_weapon_2 = weighted_list[irandom(array_length(weighted_list) - 1)];

    // Ensure both selections are different
    while (global.shop_weapon_1.name == global.shop_weapon_2.name) {
        global.shop_weapon_2 = weighted_list[irandom(array_length(weighted_list) - 1)];
    }
}