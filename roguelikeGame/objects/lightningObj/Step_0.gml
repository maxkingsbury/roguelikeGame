/// lightningObj Step Event

// Only initialize once when target exists
if (!initialized && instance_exists(target)) {
    var start_x = x;
    var start_y = y;
    var end_x = target.x;
    var end_y = target.y;
    initialized = true; // Prevents reassigning these values
}

if (instance_exists(target) && initialized) { // Ensure target exists
    // Damage target
	if (!hit) {
	    if (target.hp != undefined) {
	        target.hp -= damage;
			hit = true;
		}
    }
	
    // Stretch lightning sprite (adjust for vertical sprite)
    image_angle = point_direction(start_x, start_y, end_x, end_y) - 90;
    image_yscale = point_distance(start_x, start_y, end_x, end_y) / 64;
    image_xscale = 1;
} 
// Timer to linger before disappearing
lightning_timer -= 1;
if (lightning_timer <= 0) {
    instance_destroy();
}