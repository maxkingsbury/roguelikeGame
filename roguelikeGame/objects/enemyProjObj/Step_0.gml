// Move the projectile
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Check for collision with player
var player_hit = instance_place(x, y, playerObj);
if (player_hit != noone) {
	global.player_hp -= 1;
    instance_destroy(); // Destroy the projectile
}

// Destroy if off-screen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}