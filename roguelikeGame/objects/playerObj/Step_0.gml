// Reset speed each frame
speed_x = 0;
speed_y = 0;
var w = display_get_width()
var h = display_get_height()

if (!instance_exists(arcaneTurretObj) && (global.weapon_pool[2].bought == true)) {
    instance_create_layer(x, y, "Instances", arcaneTurretObj);
}

// Movement input
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    if (x + global.player_speed < room_width-45) { // Prevent moving out of bounds
        speed_x = global.player_speed;
        last_direction = -1; // Facing right
    }
} 
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    if (x - global.player_speed > 40) { // Prevent moving out of bounds
        speed_x = -global.player_speed;
        last_direction = 1; // Facing left
    }
}

if (keyboard_check(ord("W"))) {
    if (y - global.player_speed > 70) { // Prevent moving out of bounds
        speed_y = -global.player_speed;
    }
}
if (keyboard_check(ord("S"))) {
    if (y + global.player_speed < room_height-40) { // Prevent moving out of bounds
        speed_y = global.player_speed;
    }
}

// Apply movement
x += speed_x;
y += speed_y;

image_index = 0; // Reset to idle frame

image_xscale = 5 * last_direction; // Keeps size 5 but flips left/right
image_yscale = 5; // Ensure vertical scale stays correct

// Fire weapon function with individual cooldowns
function fire_weapon(weapon_name, base_direction) {
    var proj;

    if (weapon_name == "Basic Wand") {
        proj = instance_create_layer(x, y, "Instances", basicObj);
		proj.direction = base_direction;
    } 
    else if (weapon_name == "Fire Staff") {
        proj = instance_create_layer(x, y, "Instances", fireballObj);
    }
	else if (weapon_name == "Ice Staff") {
        proj = instance_create_layer(x, y, "Instances", iceShardObj);
		var spread_anglet = random_range(-8, 8);
		var angle_to_enemyt = base_direction + spread_anglet;
		proj.direction = angle_to_enemyt;
    }
	else if (weapon_name == "Lightning Staff") {
        fire_lightning();
    }
}

// Ensure fire timers properly count down for each weapon
if (fire_timer_basic > 0) {
    fire_timer_basic -= 1;
}
if (fire_timer_fireball > 0) {
    fire_timer_fireball -= 1;
}
if (fire_timer_iceShard > 0) {
    fire_timer_iceShard -= 1;
}
if (fire_timer_lightning > 0) {
    fire_timer_lightning -= 1;
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
            var base_direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
		    var spread_angle = random_range(-5, 5);
		    angle_to_enemy = base_direction + spread_angle;
			
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
            fire_timer_fireball = global.fire_rate * 3; // Reset the cooldown for Fire Staff (longer cooldown)
        }
		else if (weapon == "Ice Staff" && fire_timer_iceShard <= 0) {
            fire_weapon("Ice Staff", angle_to_enemy);
            fire_timer_iceShard = global.fire_rate * 0.5; // Reset the cooldown for Fire Staff (longer cooldown)
        }
		else if (weapon == "Lightning Staff" && fire_timer_lightning <= 0) {
            fire_weapon("Lightning Staff", angle_to_enemy);
            fire_timer_lightning = global.fire_rate * 5; // Adjusted cooldown
        }
    }
}