// Draw the enemy sprite
draw_self();

// Define health bar properties
var bar_width = 30;  // Width of the health bar
var bar_height = 3;  // Height of the health bar
var bar_offset = 35; // Offset above the enemy (adjust as needed)
var health_percentage = hp / max_hp;  // Calculate health percentage

// Calculate bar position relative to the enemy's bounding box
var bar_x1 = x - bar_width / 2;
var bar_x2 = x + bar_width / 2;
var bar_y1 = bbox_top + bar_offset;
var bar_y2 = bar_y1 + bar_height;

// Draw the background (empty health bar)
draw_set_color(c_black);
draw_rectangle(bar_x1, bar_y1, bar_x2, bar_y2, false);

// Draw the foreground (current health)
draw_set_color(c_red);
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_width * health_percentage, bar_y2, false);