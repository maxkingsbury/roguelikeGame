// PRNG function based on the current time
function seeded_random(seed) {
    seed = (seed * 16807) mod 2147483647; // Using a simple linear congruential generator (LCG)
    return abs(seed) / 2147483647; // Normalize to a value between 0 and 1
}