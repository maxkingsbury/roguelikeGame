// Find the nearest player
var target = instance_nearest(x, y, playerObj);

if (target != noone) {
    // Move slowly towards the player
    var angle = point_direction(x, y, target.x, target.y);
    x += lengthdir_x(1, angle);
    y += lengthdir_y(1, angle);

    // Shooting Mechanic
    shoot_timer -= 1;
    if (shoot_timer <= 0) {
        shoot_timer = 120; // Shoots every 2 seconds

        var bullet = instance_create_layer(x, y, "Instances", enemyProjObj);
		bullet.image_xscale = 2
		bullet.image_yscale = 2
        bullet.direction = point_direction(x, y, target.x, target.y);
        bullet.speed = 2; // Slow-moving projectile
    }
}
// Only destroy the enemy once if its health reaches 0
if (hp <= 0 && alive) {
	
    alive = false;  // Set alive to false so it doesn't get destroyed repeatedly
    global.enemy_count -= 1;  // Decrease the enemy count
	
	// Drop a coin at the enemy's position
	var coin = instance_create_layer(x, y, "Instances", coinObj);
	coin.image_xscale = 2; // Adjust size if necessary
	coin.image_yscale = 2;
	
	global.player_xp += 10;
	
    // Destroy the enemy
    instance_destroy();
}