if (place_meeting(x, y, playerObj)) {
    
	if global.player_hp < global.player_max_hp {
		global.player_hp += 1;
	}
	
    instance_destroy();  // Destroy the coin
}