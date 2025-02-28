global.money = 50;

global.wave_number = 1;

global.player_hp = 5;
global.player_max_hp = 5;

global.player_xp = 0;        // Current XP
global.player_level = 1;     // Player Level

global.player_speed = 4;
global.xp_needed = 30;      // XP needed for the next level
global.levelUpCount = 0;

global.fire_rate = 20;
global.damageScalar = 1;

global.enemy_count = 0;

global.weapon_pool = [
    {name: "Fire Staff", price: 10, weight: 5, bought : false, sprite : sFireStaff}, 
    {name: "Ice Staff", price: 15, weight: 3, bought : false, sprite : sIceStaff}, 
    {name: "Lightning Staff", price: 20, weight: 2, bought : false, sprite : sLightningStaff}, 
];
global.acquired_weapons = ["Basic Wand"];
global.shop_reset = true;

global.enemy_types = [enemy1Obj, enemy2Obj];

global.iframes = 60;