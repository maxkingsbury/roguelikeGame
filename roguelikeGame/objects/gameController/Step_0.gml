// STEP EVENT

global.enemy_count = 0

if (global.player_hp == 0) {room_goto(rStartMenu);}

// Update enemy count
var enemy_types = global.enemy_types;
for (var i = 0; i < array_length(enemy_types); i++) {
	global.enemy_count += instance_number(enemy_types[i]);
}

if (wave_active && global.wave_timer > 0) {
    global.wave_timer -= 1;
}

// Only start spawning when a new wave begins
if (!wave_active) {
    wave_active = true;
    enemies_to_spawn = 10 + (global.wave_number * 3); // Increase enemies per wave
    spawn_timer = 0;
}
// Enemy spawning system
if (wave_active && enemies_to_spawn > 0) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        spawn_timer = irandom(30)+ 15; // Spawn interval (adjust as needed)

        // Random spawn position around screen edge
        var spawn_x, spawn_y;
        var side = irandom(3);
        
        if (side == 0) { spawn_x = 0; spawn_y = irandom(room_height); } // Left
        else if (side == 1) { spawn_x = room_width; spawn_y = irandom(room_height); } // Right
        else if (side == 2) { spawn_x = irandom(room_width); spawn_y = 0; } // Top
        else { spawn_x = irandom(room_width); spawn_y = room_height; } // Bottom

        // Weighted random chance for enemy type
        var enemy_type;
		var temp = irandom(99);
        if (temp<60) { // 80% chance to spawn a melee enemy
            enemy_type = enemyMermanMelee;
        } else if (temp < 80 && temp >= 60) { // 20% chance to spawn a ranged enemy
            enemy_type = enemyMermanMage;
        } else if (temp >= 80){
            enemy_type = enemyMermanScout;
        }

        var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);

        enemies_to_spawn -= 1;
    }
}

// Check if wave is over and all enemies are gone

if ((enemies_to_spawn == 0 && wave_active && !waiting) && (global.wave_timer <= 0 || global.enemy_count <= 0)) {
	with (enemyMermanMelee) {
        instance_destroy();
    }
	with (enemyMermanMage) {
        instance_destroy();
    }
	with (enemyMermanScout) {
        instance_destroy();
    }
	with (fruitObj){
		instance_destroy();
	}
	
	global.enemy_count = instance_number(enemyMermanMelee);
	global.shop_reset = true; // Enable shop reset after wave completion
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


spawn_timer -= 1; // Decrease the timer

if (spawn_timer <= 0) { // If the timer has finished
    var chance = irandom(50); // Adjust probability (higher number = less frequent spawn)
	var wid = display_get_width();
	var hei = display_get_height();
    if (chance == 0) { // Small chance to spawn each step
        var random_x = irandom_range(50, wid - 50);
        var random_y = irandom_range(50, hei - 50);

        instance_create_layer(random_x, random_y, "Instances", fruitObj);
        spawn_timer = min_spawn_time;
    }
}