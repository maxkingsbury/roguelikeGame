/// lightningObj Step Event
if (instance_exists(target)) { // Ensure target exists
    // Damage target
	if (!hit) {
	    if (target.hp != undefined) {
	        target.hp -= damage;
			hit = true;
		}
    }
} 
