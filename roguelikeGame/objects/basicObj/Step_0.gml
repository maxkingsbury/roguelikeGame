// Move the projectile in the specified direction
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
var basicDamage = 1

// Ensure the projectile only hits once
if (!hit) {
    var enemy_types = global.enemy_types; // Add all enemy objects here
    var enemy = noone;

    // Loop through enemy types and find the first one at the projectile's position
    for (var i = 0; i < array_length(enemy_types); i++) {
        enemy = instance_place(x, y, enemy_types[i]);
        if (enemy != noone) break; // Stop at the first found enemy
    }

    if (enemy != noone) { // If an enemy is found
        with (enemy) {
            if (hp != undefined) {
                hp -= basicDamage * global.damageScalar;  // Apply damage
            } 
        }

        hit = true;
        instance_destroy();
    }
}