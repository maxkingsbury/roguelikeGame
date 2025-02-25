var lightningDamage = 3
var enemy = noone;
// Ensure the projectile only hits once
if (!hit) {
    var enemy_types = global.enemy_types; // Add all enemy objects here

    // Loop through enemy types and find the first one at the projectile's position
    for (var i = 0; i < array_length(enemy_types); i++) {
        enemy = instance_place(x, y, enemy_types[i]);
        if (enemy != noone) break; // Stop at the first found enemy
    }

    if (enemy != noone) { // If an enemy is found
        with (enemy) {
            if (hp != undefined) {
                hp -= lightningDamage * global.damageScalar;  // Apply damage
            } 
        }

        hit = true;
        instance_destroy();
    }
}

var player = instance_place(x,y,playerObj);
if (enemy != noone && player != noone) { // If an enemy is found
	// Calculate the position of obj1 and obj2
	var x1 = player.x;
	var y1 = player.y;
	var x2 = enemy.x;
	var y2 = enemy.y;

	// Calculate the direction and distance between the two objects
	var dir = point_direction(x1, y1, x2, y2);  // Angle from obj1 to obj2
	var distance = point_distance(x1, y1, x2, y2);  // Distance between obj1 and obj2

	// Create a new instance of the lightning (or any object to be stretched)
	// Assuming you want the lightning to be placed between the two objects
	var lightning = instance_create_layer(x1, y1, "Instances", lightningObj);

	// Stretch the lightning sprite by scaling it based on the distance
	lightning.image_angle = dir;  // Set the rotation of the sprite to point from obj1 to obj2
	lightning.image_xscale = distance / 64;  // Scale the sprite to the correct length (sprite height is 64)
	lightning.image_yscale = 1;  // Keep the height as 1 (since the sprite is long)
}