// STEP EVENT

global.enemy_count = 0

// Update enemy count
var enemy_types = [enemy1Obj, enemy2Obj]
for (var i = 0; i < array_length(enemy_types); i++) {
	global.enemy_count += instance_number(enemy_types[i]);
}

if (wave_active && global.wave_timer > 0) {
    global.wave_timer -= 1;
}

// Only start spawning when a new wave begins
if (!wave_active) {
    wave_active = true;
    enemies_to_spawn = 3 + (global.wave_number * 2); // Increase enemies per wave
    spawn_timer = 0;
}
// Enemy spawning system
if (wave_active && enemies_to_spawn > 0) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        spawn_timer = 60; // Spawn interval (adjust as needed)

        // Random spawn position around screen edge
        var spawn_x, spawn_y;
        var side = irandom(3);
        
        if (side == 0) { spawn_x = 0; spawn_y = irandom(room_height); } // Left
        else if (side == 1) { spawn_x = room_width; spawn_y = irandom(room_height); } // Right
        else if (side == 2) { spawn_x = irandom(room_width); spawn_y = 0; } // Top
        else { spawn_x = irandom(room_width); spawn_y = room_height; } // Bottom

        // Weighted random chance for enemy type
        var enemy_type;
        if (irandom(99) < 80) { // 80% chance to spawn a melee enemy
            enemy_type = enemy1Obj;
        } else { // 20% chance to spawn a ranged enemy
            enemy_type = enemy2Obj;
        }

        var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);
        enemy.image_xscale = 4;  // Make spawned enemies bigger
        enemy.image_yscale = 4;

        enemies_to_spawn -= 1;
    }
}

// Check if wave is over and all enemies are gone

if ((enemies_to_spawn == 0 && wave_active && !waiting) && (global.wave_timer <= 0 || global.enemy_count <= 0)) {
	with (enemy1Obj) {
        instance_destroy();
    }
	with (enemy2Obj) {
        instance_destroy();
    }
	global.enemy_count = instance_number(enemy1Obj);
    waiting = true;
    levelCompleteText = instance_create_layer(room_width / 2, room_height / 2, "Instances", levelCompleteObj);

    // Set timer for 3 seconds
    wait_time = game_get_speed(gamespeed_fps) * 3;
}

// Handle waiting before switching to menu
if (waiting) {
	wait_time -= 1;
	if (wait_time <= 0) {
		waiting = false;
		wave_active = false;  // Reset wave status
		global.wave_number += 1;  // Increase wave count
		room_goto(rGameMenu); // Go to menu
	}
}

// Level-up logic (triggers the menu when XP is enough)
if (global.player_xp >= global.xp_needed) {
    global.player_xp -= global.xp_needed; // Reset XP
    global.xp_needed *= 1.5; // Increase XP needed
	global.player_level += 1;
	global.levelUpCount += 1;
}