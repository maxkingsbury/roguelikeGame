// Draw the enemy sprite
draw_self();

// Draw the health bar above the enemy
var bar_width = 50;  // Width of the health bar
var bar_height = 5;  // Height of the health bar
var health_percentage = hp / max_hp;  // Calculate health percentage

// Draw the background (empty health bar)
draw_set_color(c_black);
draw_rectangle(x - bar_width / 2, y - sprite_height / 2 +50, x + bar_width / 2, y - sprite_height / 2 +50 + bar_height, false);

// Draw the foreground (current health)
draw_set_color(c_red);  // Color for the health bar
draw_rectangle(x - bar_width / 2, y - sprite_height / 2 +50, x - bar_width / 2 + bar_width * health_percentage, y - sprite_height / 2 +50 + bar_height, false);