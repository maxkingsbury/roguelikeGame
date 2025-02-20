global.money = 0;

global.wave_number = 1;

global.player_xp = 0;        // Current XP
global.player_level = 1;     // Player Level
global.player_speed = 4;
global.xp_needed = 30;      // XP needed for the next level
global.levelUpCount = 0;

global.fire_rate = 20;
global.damageScalar = 1;

global.enemy_count = 0;

global.weapon_pool = [
    {name: "Fire Staff", price: 10, weight: 5}, 
    {name: "Ice Scepter", price: 15, weight: 3}, 
    {name: "Lightning Rod", price: 20, weight: 2}, 
    {name: "Demonic Tome", price: 30, weight: 1}
];
global.acquired_weapons = ["Basic Wand"];