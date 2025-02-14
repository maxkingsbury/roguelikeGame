// Reset speed each frame

speed_x = 0;
speed_y = 0;

// Movement input
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    speed_x = global.player_speed;
    last_direction = -1; // Facing right
} 
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    speed_x = -global.player_speed;
    last_direction = 1; // Facing left
}

if (keyboard_check(ord("W"))) {
    speed_y = -global.player_speed;
}
if (keyboard_check(ord("S"))) {
    speed_y = global.player_speed;
}

// Apply movement
x += speed_x;
y += speed_y;

image_index = 0; // Reset to idle frame

image_xscale = 5 * last_direction; // Keeps size 5 but flips left/right
image_yscale = 5; // Ensure vertical scale stays correct

// Decrease the fire timer by 1 each step
if (fire_timer > 0) {
    fire_timer--;
}

// Fire projectiles when the player is not moving and the cooldown is over
if (speed_x == 0 && speed_y == 0 && fire_timer == 0) {
    // Find the nearest enemy
    var nearest_enemy = instance_nearest(x, y, enemy1Obj);

    // If there is an enemy, fire toward it
    if (nearest_enemy != noone) {
        var angle_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
        
        // Fire a projectile toward the enemy
        var proj = instance_create_layer(x, y, "Instances", fireballObj);
        proj.direction = angle_to_enemy;
    }
    // If no enemy, fire in the last direction
    else {
        var proj = instance_create_layer(x, y, "Instances", fireballObj);
        proj.direction = (last_direction == -1) ? 0 : 180;
    }

    // Reset the fire timer to enforce the fire rate delay
    fire_timer = global.fire_rate;
}