image_xscale = 5;
image_yscale = 5;
// Movement variables
speed_x = 0;
speed_y = 0;


// Animation variables
image_index = 0;
image_speed = 0; // We will manually control frame switching
last_direction = 1; // 1 = Right, -1 = Left
frame_timer = 0; // Helps with frame switching
frame_delay = 6; // Adjust for animation speed

// Fire rate variables
fire_timer = 0; // Timer to track the cooldown