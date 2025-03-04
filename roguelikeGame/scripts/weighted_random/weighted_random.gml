function weighted_random(available_weapons) {
    var total_weight = 0;
    
    // Calculate total weight of all weapons
    for (var i = 0; i < array_length(available_weapons); i++) {
        total_weight += available_weapons[i].weight;
    }

    // Generate a random value between 0 and total_weight - 1 using the dynamic seed
    var rand_value = irandom(total_weight - 1);  // Random value in the range of 0 to total_weight-1

    var cumulative_weight = 0;

    // Loop through the weapons and accumulate weight
    for (var i = 0; i < array_length(available_weapons); i++) {
        cumulative_weight += available_weapons[i].weight;
        
        // Check if rand_value is within the cumulative weight range
        if (rand_value < cumulative_weight) {
            return available_weapons[i]; // Return the selected weapon
        }
    }
}