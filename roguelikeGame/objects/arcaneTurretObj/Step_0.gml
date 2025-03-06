if (instance_exists(playerObj)) {
    // Orbit around player
    angle += orbit_speed;
    x = playerObj.x + lengthdir_x(orbit_radius, angle);
    y = playerObj.y + lengthdir_y(orbit_radius, angle);
    
    // Fire projectile at set intervals
    fire_timer -= 1;
    if (fire_timer <= 0) {
        fire_arcane_projectile();
        fire_timer = global.fire_rate*2.5;
    }
}

// Function to fire a projectile
function fire_arcane_projectile() {
    var nearest_enemy = noone;
    var min_distance = 99999;

    // Find the nearest enemy
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

    // If an enemy exists, fire projectile
    if (nearest_enemy != noone) {
        var proj = instance_create_layer(x, y, "Instances", arcaneTurretProjObj);
        proj.direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
        proj.speed = 5;
    }
}