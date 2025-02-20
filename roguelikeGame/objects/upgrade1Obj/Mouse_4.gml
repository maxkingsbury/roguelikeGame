global.fire_rate = max(global.fire_rate * 0.9, 5); // Ensures fire rate stays reasonable
global.levelUpCount -= 1;
room_goto(rGameMenu);