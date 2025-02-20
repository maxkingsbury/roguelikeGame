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

function fire_weapon(weapon_name, direction) {
    var proj;
    
    if (weapon_name == "Basic Wand") {
        proj = instance_create_layer(x, y, "Instances", basicObj);
    } 
    else if (weapon_name == "Fire Staff") {
        proj = instance_create_layer(x, y, "Instances", fireballObj);
        proj.speed *= 1.2; // Fireball moves faster
        proj.damage *= 1.5; // Fireball deals more damage
    }
    else if (weapon_name == "Ice Scepter") {
        proj = instance_create_layer(x, y, "Instances", iceShardObj);
        proj.speed *= 0.8; // Ice moves slower
        proj.freeze_chance = 20; // 20% chance to slow enemy
    }
    else if (weapon_name == "Lightning Rod") {
        proj = instance_create_layer(x, y, "Instances", lightningBoltObj);
        proj.chain_hits = 2; // Chains to extra enemies
    }
    else if (weapon_name == "Demonic Tome") {
        proj = instance_create_layer(x, y, "Instances", darkOrbObj);
        proj.pierce = 3; // Hits multiple enemies
    }
    
    proj.direction = direction;
}

// Ensure fire_timer properly counts down
if (fire_timer > 0) {
    fire_timer -= 1;
}

// Auto-fire when the player is not moving
if (speed_x == 0 && speed_y == 0 && fire_timer == 0) {
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

    // Fire each acquired weapon
    for (var i = 0; i < array_length(global.acquired_weapons); i++) {
        var weapon = global.acquired_weapons[i];

        if (nearest_enemy != noone) {
            var angle_to_enemy = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
            fire_weapon(weapon, angle_to_enemy);
        } else {
            fire_weapon(weapon, (last_direction == -1) ? 0 : 180);
        }
    }

    fire_timer = global.fire_rate; // Reset attack cooldown
}
