
// Simple AI to follow the player
var target_x = playerObj.x;
var target_y = playerObj.y;

// Move towards the player
move_towards_point(target_x, target_y, move_speed);

// Flip sprite based on movement direction
if (target_x < x) {
    image_xscale = -3; // Flip left
} else {
    image_xscale = 3;  // Default right
}

// Only destroy the enemy once if its health reaches 0
if (hp <= 0 && alive) {
	
    alive = false;  // Set alive to false so it doesn't get destroyed repeatedly
    global.enemy_count -= 1;  // Decrease the enemy count
	
	// Drop a coin at the enemy's position
	var coin = instance_create_layer(x, y, "Instances", coinObj);
	coin.image_xscale = 2; // Adjust size if necessary
	coin.image_yscale = 2;
	
	global.player_xp += 5;
	
    // Destroy the enemy
    instance_destroy();
}