if (place_meeting(x, y, playerObj)) {
    global.money += 1;  // Increase money
    instance_destroy();  // Destroy the coin
}