// Move the projectile in the specified direction
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Ensure the projectile only hits once
if (!hit) {
    var enemy = instance_place(x, y, enemy1Obj);  // Find the first enemy at the position
    if (enemy != noone) {  // If an enemy exists at the position
        with (enemy) {
            if (hp != undefined) {
                hp -= 1 * fireballObj.damageScalar;  // Decrease health by 1       
            } 
        }

        hit = true;
        instance_destroy();

    } 
}