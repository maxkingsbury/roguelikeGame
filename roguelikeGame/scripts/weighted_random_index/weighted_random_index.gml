function weighted_random_index(arr) {
    if (array_length(arr) == 0) return -1;

    var total_weight = 0;
    for (var i = 0; i < array_length(arr); i++) {
        total_weight += arr[i].weight;
    }

    var rand_value = irandom(total_weight - 1);
    var accumulated_weight = 0;

    for (var i = 0; i < array_length(arr); i++) {
        accumulated_weight += arr[i].weight;
        if (rand_value < accumulated_weight) {
            return i; // Return the index of the chosen weapon
        }
    }
    
    return -1; // Should never reach this
}