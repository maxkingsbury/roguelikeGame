// Move the projectile
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Keep the projectile image rotated in the direction it moves
image_angle = direction;
var iceShardDamage = 0.3;

// Ensure the projectile only hits once
if (!hit) {
    var enemy_types = [enemy1Obj, enemy2Obj]; // Add all enemy objects here
    var enemy = noone;

    // Loop through enemy types and find the first one at the projectile's position
    for (var i = 0; i < array_length(enemy_types); i++) {
        enemy = instance_place(x, y, enemy_types[i]);
        if (enemy != noone) break; // Stop at the first found enemy
    }

    if (enemy != noone) { // If an enemy is found
        with (enemy) {
			if(slow_count == 0){
				move_speed *= 0.75;
				slow_count++;
			}
			
            if (hp != undefined) {
                hp -= iceShardDamage * global.damageScalar;  // Apply damage
            } 
        }

        hit = true;
        instance_destroy();
    }
}