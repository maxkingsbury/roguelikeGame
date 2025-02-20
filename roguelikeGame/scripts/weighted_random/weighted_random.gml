function weighted_random(){
    var total_weight = 0;
    for (var i = 0; i < array_length(global.weapon_pool); i++) {
        total_weight += global.weapon_pool[i].weight;
    }

    var rand_value = irandom(total_weight - 1);
    var cumulative_weight = 0;
    
    for (var i = 0; i < array_length(global.weapon_pool); i++) {
        cumulative_weight += global.weapon_pool[i].weight;
        if (rand_value < cumulative_weight) {
            return global.weapon_pool[i]; // Return the selected weapon
        }
    }
}