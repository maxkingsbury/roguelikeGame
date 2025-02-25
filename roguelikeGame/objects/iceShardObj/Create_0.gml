// Set initial speed and direction
speed = 5; // Adjust as needed
direction = 0; // This will be set when the projectile is created
image_xscale = 2;
image_yscale = 2;
hit = false;  // Set to false initially, allowing the first collision to work
// Find the nearest enemy when the projectile is created

var nearest_enemy = noone;
var min_distance = 999999; 

var enemy_types = [enemy1Obj, enemy2Obj]; // Add all enemy objects here

for (var i = 0; i < array_length(enemy_types); i++) {
    var enemy_inst = instance_nearest(x, y, enemy_types[i]);
    if (enemy_inst != noone) {
        var dist = point_distance(x, y, enemy_inst.x, enemy_inst.y);
        if (dist < min_distance) {
            min_distance = dist;
            nearest_enemy = enemy_inst;
        }
    }
}

// If an enemy exists, set direction toward it
if (nearest_enemy != noone) {
    direction = point_direction(x, y, nearest_enemy.x, nearest_enemy.y);
}

// Ensure the projectile image rotates to face its direction
image_angle = direction;