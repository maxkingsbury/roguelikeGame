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

// Fire weapon function with individual cooldowns
function fire_weapon(weapon_name, direction) {
    var proj;

    if (weapon_name == "Basic Wand") {
        proj = instance_create_layer(x, y, "Instances", basicObj);
    } 
    else if (weapon_name == "Fire Staff") {
        proj = instance_create_layer(x, y, "Instances", fireballObj);
    }

    proj.direction = direction;
}

// Ensure fire timers properly count down for each weapon
if (fire_timer_basic > 0) {
    fire_timer_basic -= 1;
}
if (fire_timer_fireball > 0) {
    fire_timer_fireball -= 1;
}


// Auto-fire when the player is not moving and cooldown has passed
if (speed_x == 0 && speed_y == 0) {
    var nearest_enemy = noone;
    var min_distance = 999999;

    // Find nearest enemy
    var enemy_types = [enemy1Obj, enemy2Obj];
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

    // Fire each acquired weapon if the cooldown is over
    for (var i = 0; i < array_length(global.acquired_weapons); i++) {
        var weapon = global.acquired_weapons[i];
		var angle_to_enemy = 0;
        if (nearest_enemy != noone) {
            angle_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
        } else {
            if (last_direction == -1) {
                angle_to_enemy = 0; // Right
            } else {
                angle_to_enemy = 180; // Left
            }
        }
        // Check if cooldown for each weapon is done
        if (weapon == "Basic Wand" && fire_timer_basic <= 0) {
            fire_weapon("Basic Wand", angle_to_enemy);
            fire_timer_basic = global.fire_rate * 1; // Reset the cooldown for Basic Wand
        }
        else if (weapon == "Fire Staff" && fire_timer_fireball <= 0) {
            fire_weapon("Fire Staff", angle_to_enemy);
            fire_timer_fireball = global.fire_rate * 2; // Reset the cooldown for Fire Staff (longer cooldown)
        }
    }
}