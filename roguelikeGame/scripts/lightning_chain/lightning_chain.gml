/// lightning_chain(start_enemy, remaining_jumps)
function lightning_chain(start_enemy, jumps) {
    if (jumps <= 0) return; // Stop if no jumps remain

    var nearest_enemy = noone;
    var min_distance = 999999;

    var enemy_types = [enemy1Obj, enemy2Obj];

    // Find the closest enemy (excluding the one that was just hit)
    for (var i = 0; i < array_length(enemy_types); i++) {
        var enemy_inst = instance_nearest(start_enemy.x, start_enemy.y, enemy_types[i]);
        
        if (enemy_inst != noone && enemy_inst != start_enemy) {
            var dist = point_distance(start_enemy.x, start_enemy.y, enemy_inst.x, enemy_inst.y);
            if (dist < min_distance) {
                min_distance = dist;
                nearest_enemy = enemy_inst;
            }
        }
    }

    // If another enemy is found, create a new lightning projectile instantly
    if (nearest_enemy != noone) {
        var lightning = instance_create_layer(start_enemy.x, start_enemy.y, "Instances", obj_lightning);
        lightning.image_angle = point_direction(start_enemy.x, start_enemy.y, nearest_enemy.x, nearest_enemy.y);
        lightning.target = nearest_enemy;

        // Chain again instantly
        lightning_chain(nearest_enemy, jumps - 1);
    }
}
