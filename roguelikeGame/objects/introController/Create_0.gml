// Set a random seed based on the current time (milliseconds)
var random_seed = current_time;
random_set_seed(random_seed);

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
    {name: "Fire Staff", price: 10, weight: 10, bought : false, sprite : sFireStaff, 
		description : "Shoots a large high damage\n fireball randomly"}, 
    {name: "Ice Staff", price: 15, weight: 6, bought : false, sprite : sIceStaff,
		description : "Shoots a fast moving\n icicle that slows the enemy"}, 
    {name: "Lightning Staff", price: 20, weight: 4, bought : false, sprite : sLightningStaff,
		description : "A lightning bolt that\n chains between enemies"},
	{name: "Ancient Spell", price: 45, weight : 1, bought : false, sprite : sAncientSpell,
		description : "idk lol"},
	{name: "Arcane Turret", price: 25, weight : 5, bought : false, sprite : sArcaneTurretShop,
		description : "An autofiring turret\n with low damage"},
];
global.acquired_weapons = ["Basic Wand"];
global.shop_reset = true;

global.enemy_types = [enemy1Obj, enemy2Obj];

global.iframes = 60;
global.frame_count = 0;
