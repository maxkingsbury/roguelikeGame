/// Player Step Event - Fire Lightning Staff
function fire_lightning() {
    if (fire_timer_lightning > 0) return;
    
    var max_jumps = 3; // How many enemies the lightning can chain to
    var damage = 3 * global.damageScalar;
    var chain_targets = [];
    
    // Find the first target
    var nearest_enemy = noone;
    var min_distance = 500;
    
    var enemy_types = global.enemy_types;
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

    // If no enemies exist, exit function
    if (nearest_enemy == noone) {
        return;
    }
    
    chain_targets[0] = nearest_enemy;
    
    // Find additional chain targets
    for (var j = 1; j < max_jumps; j++) {
        var last_target = chain_targets[j - 1];
        var next_enemy = noone;
        min_distance = 200;

        for (var i = 0; i < array_length(enemy_types); i++) {
            var obj_type = enemy_types[i];
            var enemy_inst = instance_nearest(last_target.x, last_target.y, obj_type);

            if (enemy_inst != noone && enemy_inst != last_target && !array_contains(chain_targets, enemy_inst)) {
                var dist = point_distance(last_target.x, last_target.y, enemy_inst.x, enemy_inst.y);
                if (dist < min_distance) {
                    min_distance = dist;
                    next_enemy = enemy_inst;
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

        var lightning = instance_create_layer(start_x, start_y, "Instances", lightningObj);
        lightning.target = target;
        lightning.damage = damage;

        // Set lightning to disappear after 10 frames
        lightning.alarm[0] = 60;
    }

    fire_timer_lightning = 30; // Cooldown before firing again
}