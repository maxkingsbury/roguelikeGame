function fire_lightning() {
    if (fire_timer_lightning > 0) return;
    
    var max_jumps = 2; // How many enemies the lightning can chain to
    var damage = 2 * global.damageScalar;
    var chain_targets = [];
    
    // Find the first target
    var nearest_enemy = noone;
    var min_distance = 500;
    
    for (var i = 0; i < array_length(global.enemy_types); i++) {
        with (global.enemy_types[i]) { // Loop through each enemy type
            var dist = point_distance(other.x, other.y, x, y);
            if (dist < min_distance) {
                min_distance = dist;
                nearest_enemy = id;
            }
        }
    }

    // If no enemies exist, exit function
    if (nearest_enemy == noone) {
        return;
    }
    
    chain_targets[0] = nearest_enemy;
    
    // Find additional chain targets
    for (var j = 1; j < max_jumps; j++) {
        var last_target = chain_targets[j - 1];
        var next_enemy = noone;
        min_distance = 350;

        for (var i = 0; i < array_length(global.enemy_types); i++) {
            with (global.enemy_types[i]) {
                if (id != last_target && !array_contains(chain_targets, id)) {
                    var dist = point_distance(other.x, other.y, x, y);
                    if (dist < min_distance) {
                        min_distance = dist;
                        next_enemy = id;
                    }
                }
            }
        }

        if (next_enemy != noone) {
            chain_targets[j] = next_enemy;
        } else {
            break;
        }
    }

    // Create lightning instances
    for (var k = 0; k < array_length(chain_targets); k++) {
        var start_x = (k == 0) ? x : chain_targets[k - 1].x;
        var start_y = (k == 0) ? y : chain_targets[k - 1].y;
        var target = chain_targets[k];

        // Create the lightning object and pass target ID directly
        var lightning = instance_create_layer(start_x, start_y, "Instances", lightningObj);
        lightning.target = target;
        lightning.damage = damage;
        lightning.image_angle = point_direction(-start_x, -start_y, -target.x, -target.y) - 90;
        lightning.image_yscale = point_distance(-start_x, -start_y, -target.x, -target.y) / 64;
        lightning.image_xscale = 1;
        lightning.alarm[0] = 60;
    }

    fire_timer_lightning = 30; // Cooldown before firing again
}
