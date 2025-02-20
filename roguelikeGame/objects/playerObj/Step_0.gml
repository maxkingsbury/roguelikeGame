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

// Ensure fire_timer properly counts down
if (fire_timer > 0) {
    fire_timer -= 1;
}

// Fire projectiles when the player is not moving and the cooldown is over
if (speed_x == 0 && speed_y == 0 && fire_timer <= 0) {
    var nearest_enemy = noone;
    var min_distance = 999999; // Large starting value

    var enemy_types = [enemy1Obj, enemy2Obj]; // List of enemy types

    // Find the nearest enemy
    for (var i = 0; i < array_length(enemy_types); i++) {
        var obj_type = enemy_types[i];
        var enemy_inst = instance_nearest(x, y, obj_type);

        if (enemy_inst != noone) {
            var dist = point_distance(x, y, enemy_inst.x, enemy_inst.y);
            if (dist < min_distance) {
                min_distance = dist;
                nearest_enemy = enemy_inst;
            }
        }
    }

    // Fire at the nearest enemy or in last direction
    var proj = instance_create_layer(x, y, "Instances", fireballObj);
    proj.direction = (nearest_enemy != noone) ? point_direction(x, y, nearest_enemy.x, nearest_enemy.y) : (last_direction == -1 ? 0 : 180);

    // Reset fire timer
    fire_timer = global.fire_rate; // This ensures cooldown resets properly
}
