function weighted_random(available_weapons){
    var total_weight = 0;
    for (var i = 0; i < array_length(available_weapons); i++) {
        total_weight += available_weapons[i].weight;
    }

    var rand_value = irandom(total_weight - 1);
    var cumulative_weight = 0;
    
    for (var i = 0; i < array_length(available_weapons); i++) {
        cumulative_weight += available_weapons[i].weight;
        if (rand_value < cumulative_weight) {
            return available_weapons[i]; // Return the selected weapon
        }
    }
}