// Secret Agent Clank
// #ID = 2758

CharacterLookup = {
    0x00: "Ratchet",
    0x01: "Clank",
    0x04: "Qwark",
    0x08: "Gadgebots",
}

StageLookup = {
    0x00: "the Main Menu",
    0x01: "Boltaire Museum",
    0x02: "Boltaire Gem Wing",
    0x03: "Max-Security Cells",
    0x04: "Rooftop Deathtrap / Asyanica Rooftops",
    0x05: "Larger Than Life",
    0x07: "Countess's Villa",
    0x08: "Glaciara, Ski Slopes",
    0x09: "The Mess Hall",
    0x0a: "Azcotal Alley",
    0x0b: "Gondola Ascent / Suck and Jive",
    0x0d: "High-Rollers Casino",
    0x0e: "The Excercise Yard",
    0x0f: "High Stakes Room",
    0x10: "Venantonio Labs",
    0x11: "Venantonio Canals",
    0x12: "Madam Butterqwark",
    0x13: "Galactic Bolt Reserve",
    0x14: "Inside the A-Eye",
    0x15: "The Showers",
    0x16: "Spaceship Graveyard",
    0x17: "Saint Qwark",
    0x18: "The Quasar Fields",
    0x19: "Prison Breakout!",
    0x1a: "Dam's Edge, Hydrano",
    0x1b: "A Fiction Full Of Dollars!",
    0x1c: "Bulkhead Lock",
    0x1d: "Underwater Bunker",
    0x1e: "Klunks Lair",
    0x1f: "The HIG Treehouse",
}

ClankWeaponLookup = {
    0x0b: "Tie-a-Rang",
    0x0c: "Cufflink Bomb",
    0x0d: "Tanglevine Carnation",
    0x0e: "Holo-Knuckles",
    0x0f: "Blowtorch Briefcase",
    0x10: "Thunderstorm Umbrella",
    0x11: "Blackout Pen",
    0x12: "Hypno-Watch",
    0x18: "Holo-Monocle",
    0x19: "Therm-Optic Shades",
}

RatchetWeaponLookup = {
    0x01: "Wrench",
    0x02: "Dual Lancerator",
    0x03: "Shard Gun",
    0x04: "Bee Mine Mk.2",
    0x05: "Shock Rocket",
    0x06: "Walloper",
    0x07: "Plasma Whip",
    0x08: "Pork Bomb Gun",
    0x09: "Mine Launcher",
    0x0a: "RYNO",
}

function GameState() => byte(0x0084ec5c)

// Static Data Checks
function CurrentCharacter() => byte(0x00854cc0)
function StageID() => dword(0x008ee56c)
function TitaniumBoltCount() => dword(0x008edbb7)
function ThermOpticShades() => byte(0x008990e8)
function ChallengeModeActive() => byte(0x008ee574) >= 1
function PlayTime() => dword(0x00907078)

function CheckBit(offset, bit) {
    BitState = bit(bit, offset)
    
    return
    BitState
}

function AchievementTemplate(title, description, points, trigger) {
    achievement(
        title,
        description,
        points,
        trigger
    )
}

//
// Progression Achievements
//

function ProgressionTemplate(title, description, points, offset, bit, stage, cheevotype) {
    achievement(
    title,
    description,
    points,
    type=cheevotype,
    trigger=
    prev(CheckBit(offset, bit)) == 0 &&
    CheckBit(offset, bit) == 1 &&
    StageID() == stage &&
    GameState() != 0x04)
}

// Clank, Gadgebot and Qwark
CinematicsList = [
    0x008edbfe, 0x008edc00, 0x008edc02, 0x008edc04, 0x008edc06, 0x008edc08, 0x008edc0c, 0x008edc0e, 0x008edc10
]

CinematicsListConstruct = {
    1: {"title": "LOST and Found", "description": "Acquire the co-ordinates to Asyanica.", "points": 3, "offset": CinematicsList[0], "bit": 2, "stage": 0x02, "cheevotype": "progression"},
    3: {"title": "The Turkey Is in the Dishwasher", "description": "Rescue Clank from the trap laid by Number Woo.", "points": 3, "offset": CinematicsList[1], "bit": 1, "stage": 0x04, "cheevotype": "progression"},
    4: {"title": "Woo Got Played", "description": "Acquire the co-ordinates to the Countess' Villa.", "points": 3, "offset": CinematicsList[1], "bit": 2, "stage": 0x04, "cheevotype": "progression"},
    5: {"title": "Adjusting a Doo-hicky", "description": "Defeat the 50-feet tall winged menace.", "points": 3, "offset": CinematicsList[1], "bit": 4, "stage": 0x05, "cheevotype": "progression"},
    6: {"title": "Death Defying Dancing", "description": "Acquire the co-ordinates to Rionosis.", "points": 3, "offset": CinematicsList[2], "bit": 1, "stage": 0x07, "cheevotype": "progression"},
    8: {"title": "Ace up the Sleeve", "description": "Acquire the co-ordinates to the Casino.", "points": 3, "offset": CinematicsList[3], "bit": 2, "stage": 0x0b, "cheevotype": "progression"},
    9: {"title": "Publisher's Notes?", "description": "Defeat Jack of All Trades.", "points": 3, "offset": CinematicsList[3], "bit": 4, "stage": 0x0b, "cheevotype": "progression"},
    
    11: {"title": "An Exchange of Quips", "description": "Acquire the co-ordinates to Venantonio.", "points": 3, "offset": CinematicsList[4], "bit": 3, "stage": 0x0f, "cheevotype": "progression"},
    12: {"title": "Beam Me Up", "description": "Acquire the co-ordinates to the Bolt Foundry.", "points": 3, "offset": CinematicsList[5], "bit": 3, "stage": 0x10, "cheevotype": "progression"},
    13: {"title": "Good ol' Marv", "description": "Sing your heart out on Venantonio.", "points": 3, "offset": CinematicsList[5], "bit": 5, "stage": 0x12, "cheevotype": "progression"},


    16: {"title": "I Never Learned to Drive Stick", "description": "Catch up to the Kingpin in the Spaceship Graveyard.", "points": 3, "offset": CinematicsList[6], "bit": 1, "stage": 0x16, "cheevotype": "progression"},
    17: {"title": "Spacenuns and Orphans", "description": "Defeat the All-seeing SpaceEye.", "points": 3, "offset": CinematicsList[6], "bit": 3, "stage": 0x17, "cheevotype": "progression"},
    18: {"title": "The Iron Giant", "description": "Find your ship after flying through the Quasar Fields.", "points": 3, "offset": CinematicsList[7], "bit": 0, "stage": 0x18, "cheevotype": "progression"},
    19: {"title": "Clanks' Incredible Car", "description": "Discover the location of Klunk's lair.", "points": 3, "offset": CinematicsList[7], "bit": 2, "stage": 0x1a, "cheevotype": "progression"},
    20: {"title": "Down to His Skivvies", "description": "\"Save\" the dam and then take a dip.", "points": 3, "offset": CinematicsList[7], "bit": 4, "stage": 0x1b, "cheevotype": "progression"},
    
    23: {"title": "Evil Suck-Vac 3000", "description": "Witness Klunk's ultimate fate.", "points": 25, "offset": CinematicsList[1], "bit": 1, "stage": 0x1e, "cheevotype": "win_condition"},
}

for Cinematics in CinematicsListConstruct {
    ProgressionTemplate(
        CinematicsListConstruct[Cinematics]["title"],
        CinematicsListConstruct[Cinematics]["description"],
        CinematicsListConstruct[Cinematics]["points"],
        CinematicsListConstruct[Cinematics]["offset"],
        CinematicsListConstruct[Cinematics]["bit"],
        CinematicsListConstruct[Cinematics]["stage"],
        CinematicsListConstruct[Cinematics]["cheevotype"]
    )
}

// Ratchet and Gadgebots

ChallengesList = [
    0x008edbd4, 0x008edbdc, 0x008edbe4, 0x008edbec, 0x008edbf4, 0x008edc1f, 0x008edc23
]

ChallengesCompleteListConstruct = {
    2: {"title": "From Brushing Teeth to Smashing Them", "description": "Survive Ratchet's first day in prison and obtain the Fire Wrench mod, Walloper, and Shard Gun.", "points": 5, "offset": ChallengesList[0], "bit": 0, "stage": 0x03, "cheevotype": "progression"},
    7: {"title": "Messy Eaters", "description": "Live through the lunch rush in the Mess Hall.", "points": 3, "offset": ChallengesList[1], "bit": 0, "stage": 0x09, "cheevotype": "progression"},
    8: {"title": "Playtime!", "description": "Make it through your Prison Yard time.", "points": 3, "offset": ChallengesList[2], "bit": 0, "stage": 0x0e, "cheevotype": "progression"},
    9: {"title": "De-Briefing", "description": "Preserve your modesty in The Showers.", "points": 3, "offset": ChallengesList[3], "bit": 0, "stage": 0x15, "cheevotype": "progression"},
    10: {"title": "Catch Me If You Can!", "description": "Prevent the prisoners from escaping!", "points": 3, "offset": ChallengesList[4], "bit": 0, "stage": 0x19, "cheevotype": "progression"},
    11: {"title": "The Porcupine Has Eaten the Snowman", "description": "Free Clank from the vault at the Bolt Foundry.", "points": 5, "offset": ChallengesList[5], "bit": 0, "stage": 0x14, "cheevotype": "progression"},
    12: {"title": "Cold Call Bots", "description": "Find a way around the door in Klunk's lair.", "points": 3, "offset": ChallengesList[5], "bit": 0, "stage": 0x14, "cheevotype": "progression"},
}

for Challenge in ChallengesCompleteListConstruct {
    ProgressionTemplate(
        ChallengesCompleteListConstruct[Challenge]["title"],
        ChallengesCompleteListConstruct[Challenge]["description"],
        ChallengesCompleteListConstruct[Challenge]["points"],
        ChallengesCompleteListConstruct[Challenge]["offset"],
        ChallengesCompleteListConstruct[Challenge]["bit"],
        ChallengesCompleteListConstruct[Challenge]["stage"],
        ChallengesCompleteListConstruct[Challenge]["cheevotype"]
    )
}

//
// Challenge Completed Achievements
//

ChallengeListConstruct = {
    1: {"title": "Maximum OverLombax", "description": "Complete all the arena challenges in the Max-Security Cells.", "points": 5},
    2: {"title": "Chow Time", "description": "Complete all the arena challenges in the Mess Hall.", "points": 5},
    3: {"title": "Pumping Raritanium", "description": "Complete all the arena challenges in the Exercise Yard.", "points": 5},
    4: {"title": "Don't Drop the Soap", "description": "Complete all the arena challenges in The Showers.", "points": 5},
    5: {"title": "The Great Escape in Spaaaaace!", "description": "Complete all the arena challenges during the Prison Breakout.", "points": 5},
    6: {"title": "Small Bots, Big City", "description": "Complete all the Gadgebot challenges on Asyanica.", "points": 5},
    7: {"title": "Tiny Heist", "description": "Complete all the Gadgebot challenges at Fort Sprocket.", "points": 5},
    8: {"title": "Bots in a Bubble", "description": "Complete all the Gadgebot challenges at the Underwater Bunker.", "points": 5},
    9: {"title": "Extreme Sports Mode Activated", "description": "Complete all the snowboard challenges on Glaciara.", "points": 5},
    10: {"title": "Turning the Tide", "description": "Complete all the boating challenges on Venantonio.", "points": 5},
    11: {"title": "Rush Hour Rampage", "description": "Complete all the driving challenges on Hydrano.", "points": 5},
}

// Max-Security Cells
AchievementTemplate(
    ChallengeListConstruct[1]["title"],
    ChallengeListConstruct[1]["description"],
    ChallengeListConstruct[1]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x03 &&
    byte(0x008edbd4) >= 1 && byte(0x008edbd5) >= 1 && byte(0x008edbd6) >= 1 && byte(0x008edbd7) >= 1 && byte(0x008edbd8) == 1 &&
    prev(byte(0x008edbd8)) == 0
)

// Mess Hall
AchievementTemplate(
    ChallengeListConstruct[2]["title"],
    ChallengeListConstruct[2]["description"],
    ChallengeListConstruct[2]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x09 &&
    byte(0x008edbdc) >= 1 && byte(0x008edbdd) >= 1 && byte(0x008edbde) >= 1 && byte(0x008edbdf) >= 1 && byte(0x008edbe0) == 1 &&
    prev(byte(0x008edbe0)) == 0
)

// Exercise Yard
AchievementTemplate(
    ChallengeListConstruct[3]["title"],
    ChallengeListConstruct[3]["description"],
    ChallengeListConstruct[3]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x0e &&
    byte(0x008edbe4) >= 1 && byte(0x008edbe5) >= 1 && byte(0x008edbe6) >= 1 && byte(0x008edbe7) >= 1 && byte(0x008edbe8) == 1 &&
    prev(byte(0x008edbe8)) == 0
)

// The Showers
AchievementTemplate(
    ChallengeListConstruct[4]["title"],
    ChallengeListConstruct[4]["description"],
    ChallengeListConstruct[4]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x15 &&
    byte(0x008edbec) >= 1 && byte(0x008edbed) >= 1 && byte(0x008edbee) >= 1 && byte(0x008edbef) >= 1 && byte(0x008edbf0) == 1 &&
    prev(byte(0x008edbf0)) == 0
)

// Prison Breakout
AchievementTemplate(
    ChallengeListConstruct[5]["title"],
    ChallengeListConstruct[5]["description"],
    ChallengeListConstruct[5]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x19 &&
    byte(0x008edbf4) >= 1 && byte(0x008edbf5) >= 1 && byte(0x008edbf6) >= 1 && byte(0x008edbf7) >= 1 && byte(0x008edbf8) == 1 &&
    prev(byte(0x008edbf8)) == 0
)

// Gadgebots Asyanica
AchievementTemplate(
    ChallengeListConstruct[6]["title"],
    ChallengeListConstruct[6]["description"],
    ChallengeListConstruct[6]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x19 &&
    byte(0x008edc1a) >= 1 && byte(0x008edc1b) >= 1 && byte(0x008edc1c) == 1 &&
    prev(byte(0x008edc1c)) == 0
)

// Gadgebots Bolt Reserve
AchievementTemplate(
    ChallengeListConstruct[7]["title"],
    ChallengeListConstruct[7]["description"],
    ChallengeListConstruct[7]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x19 &&
    byte(0x008edc1f) >= 1 && byte(0x008edc20) >= 1 && byte(0x008edc21) == 1 &&
    prev(byte(0x008edc21)) == 0
)

// Gadgbots Bunker
AchievementTemplate(
    ChallengeListConstruct[8]["title"],
    ChallengeListConstruct[8]["description"],
    ChallengeListConstruct[8]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x19 &&
    byte(0x008edc23) >= 1 && byte(0x008edc24) == 1 &&
    prev(byte(0x008edc24)) == 0
)

// Snowboarding
AchievementTemplate(
    ChallengeListConstruct[9]["title"],
    ChallengeListConstruct[9]["description"],
    ChallengeListConstruct[9]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x08 &&
    byte(0x008edc3b) >= 1 &&
    byte(0x008edc3c) >= 1 && byte(0x008edc3d) >= 1 &&
    (prev(byte(0x008edc3c)) == 0 || prev(byte(0x008edc3d)) == 0)
)

// Boating
AchievementTemplate(
    ChallengeListConstruct[10]["title"],
    ChallengeListConstruct[10]["description"],
    ChallengeListConstruct[10]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x11 &&
    byte(0x008edc3e) >= 1 && byte(0x008edc3f) >= 1 && byte(0x008edc40) == 1 &&
    prev(byte(0x008edc40)) == 0
)

// Driving
AchievementTemplate(
    ChallengeListConstruct[11]["title"],
    ChallengeListConstruct[11]["description"],
    ChallengeListConstruct[11]["points"],
    trigger = 
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x19 &&
    byte(0x008edc41) >= 1 && byte(0x008edc42) >= 1 && byte(0x008edc43) == 1 &&
    prev(byte(0x008edc43)) == 0
)

//
// Weapon Unlock Achievements
//
WeaponUnlockListConstruct = {
    1: {"title": "Sharp Dresser", "description": "Obtain the Tie-A-Rang, then save the game.", "points": 3},
    2: {"title": "Off the Cuff", "description": "Obtain the Cufflink Bomb, then save the game.", "points": 3},
    3: {"title": "Melt the Locks Off", "description": "Obtain the Blowtorch Briefcase, then save the game.", "points": 3},
    4: {"title": "Plants Vs. Robots", "description": "Obtain the Tanglevine Carnation, then save the game.", "points": 3},
    5: {"title": "Loud Stick", "description": "Purchase the ThunderStorm Umbrella.", "points": 3},
    6: {"title": "Wham!", "description": "Purchase the Holo-Knuckles.", "points": 3},
    7: {"title": "Blotter", "description": "Obtain the Blackout Pen, then save the game.", "points": 3},
    8: {"title": "You Are Feeling Very Sleeeepyyyy", "description": "Purchase the Hypno-Watch.", "points": 3},
    9: {"title": "Spiffing Eyeware Old Chap", "description": "Obtain the Holo-Monocle.", "points": 3},
    10: {"title": "Pretty Dang Awesome", "description": "Purchase the Agency PDA.", "points": 3},
    11: {"title": "Nice Shades Dude!", "description": "Obtain the Therm-Optic Shades, then save the game.", "points": 3},
    12: {"title": "Do a Flip!", "description": "Obtain the Jet Boots, then enter the Gem Wing.", "points": 3},
    13: {"title": "Locks? HA!", "description": "Obtain the Omni-Key.", "points": 3},
    //14: {"title": "What am I Missing?", "description": "Obtain the Map-O-Matic.", "points": 5}, // The Map-O-Matic isn't obtainable in the game and does nothing when cheated in.
    15: {"title": "Attractive, for a Robot", "description": "Purchase the Bolt Grabber.", "points": 3},
    16: {"title": "Fleet Feet", "description": "Purchase the Clank Fu Kick.", "points": 3}, // Actual clank fu kick
    17: {"title": "A Fire in my Sole", "description": "Purchase the Clank Fu Hot Foot Download.", "points": 4},
    18: {"title": "An Inferno where I Tread", "description": "Purchase the Clank Fu Hot Foot 2.1 Beta Download.", "points": 5},
    //19: {"title": "The Spoils of Victory", "description": "Pick up the Shard Gun and Walloper then complete the first arena battle.", "points": 2}, // Grouped with first arena win
    //20: {"title": "Give 'em a Good Whack", "description": "Obtain the Walloper then complete the first arena battle.", "points": 2},
    21: {"title": "Dual Wieldable", "description": "Obtain the Dual Lancerators, then save the game or go to a checkpoint.", "points": 3},
    22: {"title": "Balls that Seek", "description": "Obtain the Mine Launcher, then save the game or go to a checkpoint.", "points": 3},
    23: {"title": "*Angry Bee Noises*", "description": "Obtain the Bee Mine Launcher Mk. II, then save the game or go to a checkpoint.", "points": 3},
    24: {"title": "Makin' Bacon", "description": "Purchase the Pork Bomb Gun.", "points": 3},
    25: {"title": "No Bottles Here", "description": "Purchase the Shock Rocket.", "points": 3},
    26: {"title": "Long, Hot and Flexible", "description": "Purchase the Plasma Whip.", "points": 3},
    27: {"title": "That One Gun", "description": "Purchase the RYNO.", "points": 10},
    28: {"title": "Public Display of Affection?", "description": "Obtain the Gadgetron PDA.", "points": 5},
    29: {"title": "Long Distance Change Collector", "description": "Obtain Slim Cognito's Bolt Extractor.", "points": 5},    
}

// Tie-A-Rang
AchievementTemplate(
    WeaponUnlockListConstruct[1]["title"],
    WeaponUnlockListConstruct[1]["description"],
    WeaponUnlockListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f98) >= 1 &&
    prev(byte(0x00898f98)) == 0 &&
    prior(GameState()) != 0x04
)

// Cufflink Bomb
AchievementTemplate(
    WeaponUnlockListConstruct[2]["title"],
    WeaponUnlockListConstruct[2]["description"],
    WeaponUnlockListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898fb0) >= 1 &&
    prev(byte(0x00898fb0)) == 0 &&
    prior(GameState()) != 0x04
)

// Blowtorch Briefcase
AchievementTemplate(
    WeaponUnlockListConstruct[3]["title"],
    WeaponUnlockListConstruct[3]["description"],
    WeaponUnlockListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898ff8) >= 1 &&
    prev(byte(0x00898ff8)) == 0 &&
    prior(GameState()) != 0x04
)

// Tanglevine Carnation
AchievementTemplate(
    WeaponUnlockListConstruct[4]["title"],
    WeaponUnlockListConstruct[4]["description"],
    WeaponUnlockListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898fc8) >= 1 &&
    prev(byte(0x00898fc8)) == 0 &&
    prior(GameState()) != 0x04
)

// Thunderstorm Umbrella
AchievementTemplate(
    WeaponUnlockListConstruct[5]["title"],
    WeaponUnlockListConstruct[5]["description"],
    WeaponUnlockListConstruct[5]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899010) >= 1 &&
    prev(byte(0x00899010)) == 0 &&
    prior(GameState()) != 0x04
)

// Holo-Knuckles
AchievementTemplate(
    WeaponUnlockListConstruct[6]["title"],
    WeaponUnlockListConstruct[6]["description"],
    WeaponUnlockListConstruct[6]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898fe0) >= 1 &&
    prev(byte(0x00898fe0)) == 0 &&
    prior(GameState()) != 0x04
)

// Blackout Pen
AchievementTemplate(
    WeaponUnlockListConstruct[7]["title"],
    WeaponUnlockListConstruct[7]["description"],
    WeaponUnlockListConstruct[7]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899028) >= 1 &&
    prev(byte(0x00899028)) == 0 &&
    prior(GameState()) != 0x04
)

// Hypno-Watch
AchievementTemplate(
    WeaponUnlockListConstruct[8]["title"],
    WeaponUnlockListConstruct[8]["description"],
    WeaponUnlockListConstruct[8]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899040) >= 1 &&
    prev(byte(0x00899040)) == 0 &&
    prior(GameState()) != 0x04
)

// Holo-Monocle
AchievementTemplate(
    WeaponUnlockListConstruct[9]["title"],
    WeaponUnlockListConstruct[9]["description"],
    WeaponUnlockListConstruct[9]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x008990d0) >= 1 &&
    prev(byte(0x008990d0)) == 0 &&
    prior(GameState()) != 0x04
)

// Agency PDA
AchievementTemplate(
    WeaponUnlockListConstruct[10]["title"],
    WeaponUnlockListConstruct[10]["description"],
    WeaponUnlockListConstruct[10]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899100) >= 1 &&
    prev(byte(0x00899100)) == 0 &&
    prior(GameState()) != 0x04
)

// Thermoptic Shades
AchievementTemplate(
    WeaponUnlockListConstruct[11]["title"],
    WeaponUnlockListConstruct[11]["description"],
    WeaponUnlockListConstruct[11]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x008990e8) >= 1 &&
    prev(byte(0x008990e8)) == 0 &&
    ChallengeModeActive() &&
    prior(GameState()) != 0x04
)

// Jet Boots
AchievementTemplate(
    WeaponUnlockListConstruct[12]["title"],
    WeaponUnlockListConstruct[12]["description"],
    WeaponUnlockListConstruct[12]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899190) >= 1 &&
    prev(byte(0x00899190)) == 0 &&
    prior(GameState()) != 0x04
)

// Omni-Key
AchievementTemplate(
    WeaponUnlockListConstruct[13]["title"],
    WeaponUnlockListConstruct[13]["description"],
    WeaponUnlockListConstruct[13]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x008991a8) >= 1 &&
    prev(byte(0x008991a8)) == 0 &&
    prior(GameState()) != 0x04
)

// Map O Matic (Unobtainable)
//AchievementTemplate(
//    WeaponUnlockListConstruct[14]["title"],
//    WeaponUnlockListConstruct[14]["description"],
//    WeaponUnlockListConstruct[14]["points"],
//    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
//    byte(0x008991d8) >= 1 &&
//    prev(byte(0x008991d8)) == 0 &&
//    prior(GameState()) != 0x04
//)

// Bolt Grabber
AchievementTemplate(
    WeaponUnlockListConstruct[15]["title"],
    WeaponUnlockListConstruct[15]["description"],
    WeaponUnlockListConstruct[15]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x008991d8) >= 1 &&
    prev(byte(0x008991d8)) == 0 &&
    prior(GameState()) != 0x04
)

// Clank Fu Kick
AchievementTemplate(
    WeaponUnlockListConstruct[16]["title"],
    WeaponUnlockListConstruct[16]["description"],
    WeaponUnlockListConstruct[16]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899208) >= 1 &&
    prev(byte(0x00899208)) == 0 &&
    prior(GameState()) != 0x04
)

// Hot Foot
AchievementTemplate(
    WeaponUnlockListConstruct[17]["title"],
    WeaponUnlockListConstruct[17]["description"],
    WeaponUnlockListConstruct[17]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899220) >= 1 &&
    prev(byte(0x00899220)) == 0 &&
    prior(GameState()) != 0x04
)

// Hot Foot 2.1 Beta
AchievementTemplate(
    WeaponUnlockListConstruct[18]["title"],
    WeaponUnlockListConstruct[18]["description"],
    WeaponUnlockListConstruct[18]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00899238) >= 1 &&
    prev(byte(0x00899238)) == 0 &&
    prior(GameState()) != 0x04
)

// Shard Gun
//AchievementTemplate(
//    WeaponUnlockListConstruct[19]["title"],
//    WeaponUnlockListConstruct[19]["description"],
//    WeaponUnlockListConstruct[19]["points"],
//    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
//    byte(0x00898ed8) >= 1 && byte(0x00898f20) >= 1 &&
//    prev(byte(0x00898ed8)) == 0 && prev(byte(0x00898f20)) == 0 &&
//    prior(GameState()) != 0x04
//)

// Walloper (fused with shard gun obtain to stop spam)
//AchievementTemplate(
//    WeaponUnlockListConstruct[20]["title"],
//    WeaponUnlockListConstruct[20]["description"],
//    WeaponUnlockListConstruct[20]["points"],
//    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
//    byte(0x00898f20) >= 1 &&
//    prev(byte(0x00898f20)) == 0 &&
//    prior(GameState()) != 0x04
//)

// Dual Lancerators
AchievementTemplate(
    WeaponUnlockListConstruct[21]["title"],
    WeaponUnlockListConstruct[21]["description"],
    WeaponUnlockListConstruct[21]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898ec0) >= 1 &&
    prev(byte(0x00898ec0)) == 0 &&
    prior(GameState()) != 0x04
)

// Mine Launcher
AchievementTemplate(
    WeaponUnlockListConstruct[22]["title"],
    WeaponUnlockListConstruct[22]["description"],
    WeaponUnlockListConstruct[22]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f68) >= 1 &&
    prev(byte(0x00898f68)) == 0 &&
    prior(GameState()) != 0x04
)

// Bee Mine
AchievementTemplate(
    WeaponUnlockListConstruct[23]["title"],
    WeaponUnlockListConstruct[23]["description"],
    WeaponUnlockListConstruct[23]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898ef0) >= 1 &&
    prev(byte(0x00898ef0)) == 0 &&
    prior(GameState()) != 0x04
)

// Pork Bomb Gun
AchievementTemplate(
    WeaponUnlockListConstruct[24]["title"],
    WeaponUnlockListConstruct[24]["description"],
    WeaponUnlockListConstruct[24]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f50) >= 1 &&
    prev(byte(0x00898f50)) == 0 &&
    prior(GameState()) != 0x04
)

// Plasma Whip
AchievementTemplate(
    WeaponUnlockListConstruct[25]["title"],
    WeaponUnlockListConstruct[25]["description"],
    WeaponUnlockListConstruct[25]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f38) >= 1 &&
    prev(byte(0x00898f38)) == 0 &&
    prior(GameState()) != 0x04
)

// Shock Rocket
AchievementTemplate(
    WeaponUnlockListConstruct[26]["title"],
    WeaponUnlockListConstruct[26]["description"],
    WeaponUnlockListConstruct[26]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f08) >= 1 &&
    prev(byte(0x00898f08)) == 0 &&
    prior(GameState()) != 0x04
)

// RYNO
AchievementTemplate(
    WeaponUnlockListConstruct[27]["title"],
    WeaponUnlockListConstruct[27]["description"],
    WeaponUnlockListConstruct[27]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f80) >= 1 &&
    prev(byte(0x00898f80)) == 0 &&
    prior(GameState()) != 0x04
)

// PDA
AchievementTemplate(
    WeaponUnlockListConstruct[28]["title"],
    WeaponUnlockListConstruct[28]["description"],
    WeaponUnlockListConstruct[28]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899058) >= 1 &&
    prev(byte(0x00899058)) == 0 &&
    prior(GameState()) != 0x04
)

// Slims Bolt Collector
AchievementTemplate(
    WeaponUnlockListConstruct[29]["title"],
    WeaponUnlockListConstruct[29]["description"],
    WeaponUnlockListConstruct[29]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00899070) >= 1 &&
    prev(byte(0x00899070)) == 0 &&
    prior(GameState()) != 0x04
)

//
// Weapon Upgrade Achievments
//
WeaponUpgradeListConstruct = {
    1: {"title": "Razor Whit", "description": "Upgrade the ProtoWhirlwind Throwtie to max level, then save the game.", "points": 10},
    2: {"title": "Mortar-fyring", "description": "Upgrade the ProtoWrist Mortar to max level, then save the game.", "points": 10},
    3: {"title": "A Fire upon the Deep", "description": "Upgrade the ProtoHellfire Haversack to max level, then save the game.", "points": 10},
    4: {"title": "It's Deadly Fun", "description": "Upgrade the ProtoKudzu Tangle to max level, then save the game.", "points": 10},
    5: {"title": "Very, Very Frightening", "description": "Upgrade the ProtoLightning Rod to max level, then save the game.", "points": 10},
    6: {"title": "Ka-pow!", "description": "Upgrade the ProtoHardlight Fist to max level, then save the game.", "points": 10},
    7: {"title": "Broadside", "description": "Upgrade the TitanShard Cannon to max level, then save the game.", "points": 10},
    8: {"title": "One Hell of a Punch", "description": "Upgrade the TitanMaruder to max level, then save the game.", "points": 10},
    9: {"title": "Memories of Dreadzone", "description": "Upgrade the TitanDual Vindicators to max level, then save the game.", "points": 10},
    10: {"title": "Mine-d Your Business", "description": "Upgrade the TitanOrdnance Launcher to max level, then save the game.", "points": 10},
    11: {"title": "Oh Bother", "description": "Upgrade the TitanKiller Bee Mine to max level, then save the game.", "points": 10},
    12: {"title": "Meat Lovers", "description": "Upgrade the TitanMeat Mortar to max level, then save the game.", "points": 10},
    13: {"title": "It's Got a Lot of Kick", "description": "Upgrade the TitanShock Barrage to max level, then save the game.", "points": 10},
    14: {"title": "Quantam Foam", "description": "Upgrade the TitanPlasma Cord to max level, then save the game.", "points": 10},
    15: {"title": "Rip. Ya. New. One.", "description": "Upgrade the Ryno to max level, then save the game.", "points": 10}
    
}

// ProtoWhirlwind Throwtie
AchievementTemplate(
    WeaponUpgradeListConstruct[1]["title"],
    WeaponUpgradeListConstruct[1]["description"],
    WeaponUpgradeListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f84) == 7 &&
    prev(byte(0x00898f84)) <= 6 &&
    prior(GameState()) != 0x04
)

// ProtoWrist Mortar
AchievementTemplate(
    WeaponUpgradeListConstruct[2]["title"],
    WeaponUpgradeListConstruct[2]["description"],
    WeaponUpgradeListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f9c) == 7 &&
    prev(byte(0x00898f9c)) <= 6 &&
    prior(GameState()) != 0x04
)

// ProtoHellfire Haversack
AchievementTemplate(
    WeaponUpgradeListConstruct[3]["title"],
    WeaponUpgradeListConstruct[3]["description"],
    WeaponUpgradeListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898fe4) == 7 &&
    prev(byte(0x00898fe4)) <= 6 &&
    prior(GameState()) != 0x04
)

// ProtoKudzu Tangle
AchievementTemplate(
    WeaponUpgradeListConstruct[4]["title"],
    WeaponUpgradeListConstruct[4]["description"],
    WeaponUpgradeListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898fb4) == 7 &&
    prev(byte(0x00898fb4)) <= 6 &&
    prior(GameState()) != 0x04
)

// ProtoLightning Rod
AchievementTemplate(
    WeaponUpgradeListConstruct[5]["title"],
    WeaponUpgradeListConstruct[5]["description"],
    WeaponUpgradeListConstruct[5]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898ffc) == 7 &&
    prev(byte(0x00898ffc)) <= 6 &&
    prior(GameState()) != 0x04
)

// ProtoHardlight Fist
AchievementTemplate(
    WeaponUpgradeListConstruct[6]["title"],
    WeaponUpgradeListConstruct[6]["description"],
    WeaponUpgradeListConstruct[6]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898fcc) == 7 &&
    prev(byte(0x00898fcc)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanShard Cannon
AchievementTemplate(
    WeaponUpgradeListConstruct[7]["title"],
    WeaponUpgradeListConstruct[7]["description"],
    WeaponUpgradeListConstruct[7]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898ec4) == 7 &&
    prev(byte(0x00898ec4)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanMaruder
AchievementTemplate(
    WeaponUpgradeListConstruct[8]["title"],
    WeaponUpgradeListConstruct[8]["description"],
    WeaponUpgradeListConstruct[8]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f0c) == 7 &&
    prev(byte(0x00898f0c)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanDual Vindicators
AchievementTemplate(
    WeaponUpgradeListConstruct[9]["title"],
    WeaponUpgradeListConstruct[9]["description"],
    WeaponUpgradeListConstruct[9]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898eac) == 7 &&
    prev(byte(0x00898eac)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanOrdanence Launcher
AchievementTemplate(
    WeaponUpgradeListConstruct[10]["title"],
    WeaponUpgradeListConstruct[10]["description"],
    WeaponUpgradeListConstruct[10]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f54) == 7 &&
    prev(byte(0x00898f54)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanKiller Bee Mine
AchievementTemplate(
    WeaponUpgradeListConstruct[11]["title"],
    WeaponUpgradeListConstruct[11]["description"],
    WeaponUpgradeListConstruct[11]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898edc) == 7 &&
    prev(byte(0x00898edc)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanMeat Mortar
AchievementTemplate(
    WeaponUpgradeListConstruct[12]["title"],
    WeaponUpgradeListConstruct[12]["description"],
    WeaponUpgradeListConstruct[12]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f3c) == 7 &&
    prev(byte(0x00898f3c)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanShock Barrage
AchievementTemplate(
    WeaponUpgradeListConstruct[13]["title"],
    WeaponUpgradeListConstruct[13]["description"],
    WeaponUpgradeListConstruct[13]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f0c) == 7 &&
    prev(byte(0x00898f0c)) <= 6 &&
    prior(GameState()) != 0x04
)

// TitanPlasma Coil
AchievementTemplate(
    WeaponUpgradeListConstruct[14]["title"],
    WeaponUpgradeListConstruct[14]["description"],
    WeaponUpgradeListConstruct[14]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f24) == 7 &&
    prev(byte(0x00898f24)) <= 6 &&
    prior(GameState()) != 0x04
)

// RYNO
AchievementTemplate(
    WeaponUpgradeListConstruct[15]["title"],
    WeaponUpgradeListConstruct[15]["description"],
    WeaponUpgradeListConstruct[15]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898f6c) == 3 &&
    prev(byte(0x00898f6c)) <= 2 &&
    prior(GameState()) != 0x04
)

//
// Weapon Mod Achievements
//
WeaponModListConstruct = {
    1: {"title": "Inductive!", "description": "Purchase the Molten Bolt mod.", "points": 5},
    2: {"title": "Capacitive!", "description": "Purchase all the Lightning Rod mods.", "points": 5},
    3: {"title": "Piece of Mind", "description": "Obtain all the Shard Gun mods.", "points": 5},
    4: {"title": "Earthed Strike", "description": "Obtain all the Walloper mods.", "points": 5},
    5: {"title": "Dualie Noted", "description": "Purchase all the Dual Lancerator mods.", "points": 5},
    6: {"title": "Major Seekage", "description": "Purchase all the Mine Launcher mods.", "points": 5},
    7: {"title": "The Bee Does Not Care What Others Think", "description": "Obtain all the Bee Mine Glove mods.", "points": 5},
    8: {"title": "Butchers Delight", "description": "Purchase all the Pork Bomb Gun mods.", "points": 5},
    9: {"title": "The Fourth State of Kickass", "description": "Purchase all the Plasma Whip mods.", "points": 5},
    10: {"title": "EMP and Dynamite", "description": "Purchase all the Shock Rocket mods.", "points": 5}
}

// Molten Bolt
AchievementTemplate(
    WeaponModListConstruct[1]["title"],
    WeaponModListConstruct[1]["description"],
    WeaponModListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00898ff0) == 1 &&
    prev(byte(0x00898ff0)) == 0 &&
    prior(GameState()) != 0x04
)

// Lightning Rod
AchievementTemplate(
    WeaponModListConstruct[2]["title"],
    WeaponModListConstruct[2]["description"],
    WeaponModListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    byte(0x00899008) == 1 && byte(0x00899009) == 1 &&
    (prev(byte(0x00899008)) == 0 || prev(byte(0x00899009)) == 0) &&
    prior(GameState()) != 0x04
)

// Shard Gun
AchievementTemplate(
    WeaponModListConstruct[3]["title"],
    WeaponModListConstruct[3]["description"],
    WeaponModListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898ed0) == 1 && byte(0x00898ed1) == 1 &&
    (prev(byte(0x00898ed0)) == 0 || prev(byte(0x00898ed1)) == 0) &&
    prior(GameState()) != 0x04
)

// Walloper
AchievementTemplate(
    WeaponModListConstruct[4]["title"],
    WeaponModListConstruct[4]["description"],
    WeaponModListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f18) == 1 && byte(0x00898f19) == 1 &&
    (prev(byte(0x00898f18)) == 0 || prev(byte(0x00898f19)) == 0) &&
    prior(GameState()) != 0x04
)

// Dual Lancerators
AchievementTemplate(
    WeaponModListConstruct[5]["title"],
    WeaponModListConstruct[5]["description"],
    WeaponModListConstruct[5]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898eb8) == 1 && byte(0x00898eb9) == 1 &&
    (prev(byte(0x00898eb8)) == 0 || prev(byte(0x00898eb9)) == 0) &&
    prior(GameState()) != 0x04
)

// Mine Launcher
AchievementTemplate(
    WeaponModListConstruct[6]["title"],
    WeaponModListConstruct[6]["description"],
    WeaponModListConstruct[6]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f60) == 1 && byte(0x00898f61) == 1 &&
    (prev(byte(0x00898f60)) == 0 || prev(byte(0x00898f61)) == 0) &&
    prior(GameState()) != 0x04
)

// Bee Mine Glove
AchievementTemplate(
    WeaponModListConstruct[7]["title"],
    WeaponModListConstruct[7]["description"],
    WeaponModListConstruct[7]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898ee8) == 1 && byte(0x00898ee9) == 1 &&
    (prev(byte(0x00898ee8)) == 0 || prev(byte(0x00898ee9)) == 0) &&
    prior(GameState()) != 0x04
)

// Pork Bomb Glove
AchievementTemplate(
    WeaponModListConstruct[8]["title"],
    WeaponModListConstruct[8]["description"],
    WeaponModListConstruct[8]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f48) == 1 && byte(0x00898f49) == 1 &&
    (prev(byte(0x00898f48)) == 0 || prev(byte(0x00898f49)) == 0) &&
    prior(GameState()) != 0x04
)

// Plasma Whip
AchievementTemplate(
    WeaponModListConstruct[9]["title"],
    WeaponModListConstruct[9]["description"],
    WeaponModListConstruct[9]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f30) == 1 && byte(0x00898f31) == 1 &&
    (prev(byte(0x00898f30)) == 0 || prev(byte(0x00898f31)) == 0) &&
    prior(GameState()) != 0x04
)

// Shock Rocket
AchievementTemplate(
    WeaponModListConstruct[10]["title"],
    WeaponModListConstruct[10]["description"],
    WeaponModListConstruct[10]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    byte(0x00898f00) == 1 && byte(0x00898f01) == 1 &&
    (prev(byte(0x00898f00)) == 0 || prev(byte(0x00898f01)) == 0) &&
    prior(GameState()) != 0x04
)


//
// Wrench Mod Achievements
//
WrenchUnlockListConstruct = {
    // 1: {"title": "Hot Works", "description": "Obtain the Fire-Bomb Wrench Mod.", "points": 1}, // Grouped with the first arena progression
    2: {"title": "Ride the Wave", "description": "Obtain the Triple Wave Wrench mod.", "points": 5},
    3: {"title": "Shock Horror", "description": "Obtain the Shock Crystal Wrench mod.", "points": 10},
    4: {"title": "Wild Wrench", "description": "Obtian the Wild Burst Wrench mod.", "points": 10}
}

//AchievementTemplate(
//    WrenchUnlockListConstruct[1]["title"],
//    WrenchUnlockListConstruct[1]["description"],
//    WrenchUnlockListConstruct[1]["points"],
//    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
//    PlayTime() > 0 &&
//    CurrentCharacter() == 0x00 &&
//    byte(0x008edc4c) == 1 &&
//    (prev(byte(0x008edc4c)) == 0 || prev(byte(0x008edc4c)) == 2 || prev(byte(0x008edc4c)) == 3 || prev(byte(0x008edc4c)) == 4) &&
//    prior(GameState()) != 0x04
//)

AchievementTemplate(
    WrenchUnlockListConstruct[2]["title"],
    WrenchUnlockListConstruct[2]["description"],
    WrenchUnlockListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    PlayTime() > 0 &&
    CurrentCharacter() == 0x00 &&
    byte(0x008edc4c) == 2 &&
    (prev(byte(0x008edc4c)) == 0 || prev(byte(0x008edc4c)) == 1 || prev(byte(0x008edc4c)) == 3 || prev(byte(0x008edc4c)) == 4) &&
    prior(GameState()) != 0x04
)

AchievementTemplate(
    WrenchUnlockListConstruct[3]["title"],
    WrenchUnlockListConstruct[3]["description"],
    WrenchUnlockListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    PlayTime() > 0 &&
    CurrentCharacter() == 0x00 &&
    byte(0x008edc4c) == 3 &&
    (prev(byte(0x008edc4c)) == 0 || prev(byte(0x008edc4c)) == 1 || prev(byte(0x008edc4c)) == 2 || prev(byte(0x008edc4c)) == 4) &&
    prior(GameState()) != 0x04
)

AchievementTemplate(
    WrenchUnlockListConstruct[4]["title"],
    WrenchUnlockListConstruct[4]["description"],
    WrenchUnlockListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    PlayTime() > 0 &&
    CurrentCharacter() == 0x00 &&
    byte(0x008edc4c) == 4 &&
    (prev(byte(0x008edc4c)) == 0 || prev(byte(0x008edc4c)) == 1 || prev(byte(0x008edc4c)) == 2 || prev(byte(0x008edc4c)) == 3) &&
    prior(GameState()) != 0x04
)

//
// Misc Achievements
//
MiscCheevosListConstruct = {
    1: {"title": "Jingling Pockets", "description": "Carry 5,000,000 bolts at once.", "points": 25},
    2: {"title": "Multiplicative Gains", "description": "Reach a bolt multiplyer of 12.", "points": 10},
    3: {"title": "Who Is Dallas?", "description": "Find all three keycards and aquire a very powerful cup.", "points": 10}
}

AchievementTemplate(
    MiscCheevosListConstruct[1]["title"],
    MiscCheevosListConstruct[1]["description"],
    MiscCheevosListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    prior(GameState()) != 0x04 &&
    StageID() != 0x00 &&
    prev(dword(0x008ee568)) < 5000000 &&
    dword(0x008ee568) >= 5000000
)

AchievementTemplate(
    MiscCheevosListConstruct[2]["title"],
    MiscCheevosListConstruct[2]["description"],
    MiscCheevosListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() != 0x00 &&
    prev(byte(0x008edbcd)) < 12 &&
    byte(0x008edbcd) == 12
)

AchievementTemplate(
    MiscCheevosListConstruct[3]["title"],
    MiscCheevosListConstruct[3]["description"],
    MiscCheevosListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x1f &&
    bitcount(0x008edc2a) == 3 &&
    prev(byte(0x008edc4b)) == 0 &&
    byte(0x008edc4b) == 1
)

//
// Skill Point Achievements
//
SkillPointsList = [
    0x008edb98, 0x008edb99, 0x008edb9a, 0x008edb9b, 0x008edb9c, 0x008edb9d, 0x008edb9e, 0x008edb9f, 0x008edba0
]

function SumSkillPoints() {
    Sum = 
        bitcount(SkillPointsList[0]) +
        bitcount(SkillPointsList[1]) +
        bitcount(SkillPointsList[2]) +
        bitcount(SkillPointsList[3]) +
        bitcount(SkillPointsList[4]) +
        bitcount(SkillPointsList[5]) +
        bitcount(SkillPointsList[6]) +
        bitcount(SkillPointsList[7]) +
        bitcount(SkillPointsList[8])
    
    return
    Sum
    }

SkillPointsListConstruct = {
    1: {"title": "Furious Fists of Fury", "description": "Use only melee attacks to complete Boltair Museum.", "points": 5, "offset": SkillPointsList[0], "bit": 0, "stage": 0x01},
    2: {"title": "Silent Night", "description": "Defeat every possible guard in Boltair Museum using stealth takedowns. ", "points": 10, "offset": SkillPointsList[0], "bit": 1, "stage": 0x01},
    3: {"title": "Pyrrhic Victory", "description": "Get damaged on the very last segment of the Gem Wing rhythm minigame.", "points": 5, "offset": SkillPointsList[0], "bit": 2, "stage": 0x02},
    4: {"title": "Triple Platinum Record", "description": "Get through the whole Gem Wing rhythm minigame without missing any button presses.", "points": 10, "offset": SkillPointsList[0], "bit": 3, "stage": 0x02},
    5: {"title": "Stainless Steel", "description": "Take no damage during the Mega Challenge in the Max-Security Cells.", "points": 5, "offset": SkillPointsList[0], "bit": 4, "stage": 0x03},
    6: {"title": "Playing with Fire", "description": "Kill 5 enemies by luring them into Lizard Thug molotov cocktails.", "points": 5, "offset": SkillPointsList[0], "bit": 5, "stage": 0x03},
    7: {"title": "Speed Demon", "description": "Complete the \"Rescue Clank\" challenge in under 1 minute and 25 seconds.", "points": 10, "offset": SkillPointsList[0], "bit": 6, "stage": 0x04},
    8: {"title": "Perfect Chrome Finish", "description": "Complete \"Rescue Clank!\" without any Gadgebot taking damage.", "points": 10, "offset": SkillPointsList[0], "bit": 7, "stage": 0x04},
    9: {"title": "Robot Finds Ninja", "description": "Get all possible stealth kills during \"Number Woo works for..?\".", "points": 10, "offset": SkillPointsList[1], "bit": 0, "stage": 0x04},
    10: {"title": "Black Tie Affair", "description": "Complete \"Number Woo works for..?\" while defeating all enemies with only the Tie-A-Rang or its upgrades.", "points": 5, "offset": SkillPointsList[1], "bit": 1, "stage": 0x04},
    11: {"title": "Like the Wind", "description": "Complete \"Number Woo works for..?\" without taking damage.", "points": 5, "offset": SkillPointsList[1], "bit": 2, "stage": 0x04},
    12: {"title": "Inverse Ninja Law", "description": "Defeat 99 Giant Ninjas during \"Larger than Life\".", "points": 5, "offset": SkillPointsList[1], "bit": 3, "stage": 0x05},
    13: {"title": "Blaster Overload", "description": "Complete \"Larger than Life\" without using the blaster.", "points": 10, "offset": SkillPointsList[1], "bit": 4, "stage": 0x05},
    14: {"title": "Perfect Tango", "description": "Complete the Tango at the Countesses Villa without missing any button presses.", "points": 10, "offset": SkillPointsList[1], "bit": 5, "stage": 0x07},
    15: {"title": "Black Diamond", "description": "Complete \"Villa Escape\" without hitting any obstacles.", "points": 5, "offset": SkillPointsList[1], "bit": 6, "stage": 0x08},
    16: {"title": "Smooth Moves", "description": "Kill 15 guards on the Glaciara ski slopes with attacks from another guard.", "points": 5, "offset": SkillPointsList[1], "bit": 7, "stage": 0x08},
    17: {"title": "Ringleader", "description": "Collect all the rings in \"Go for Gold\" on the Galciara ski slopes.", "points": 5, "offset": SkillPointsList[2], "bit": 0, "stage": 0x08},
    18: {"title": "Empty the Warrens", "description": "Kill 89 tyhrranoids during \"Tyhrranoid Recycling\".", "points": 5, "offset": SkillPointsList[2], "bit": 1, "stage": 0x09},
    19: {"title": "Antaeus", "description": "Complete \"Mega Challenge: Cafeteria\" without jumping.", "points": 5, "offset": SkillPointsList[2], "bit": 2, "stage": 0x09},
    20: {"title": "Master of Disguise", "description": "Use all 8 of the disguises at the tourist carts in the mission \"All the Kingpin's Men\".", "points": 5, "offset": SkillPointsList[2], "bit": 3, "stage": 0x0a},
    21: {"title": "Trash Talk", "description": "Kill all of Kingpin's guards by luring them with a trash can.", "points": 5, "offset": SkillPointsList[2], "bit": 4, "stage": 0x0a},
    22: {"title": "Deadly Hands", "description": "Kill all of Kingpin's guards before reaching the fourth tourist cart.", "points": 10, "offset": SkillPointsList[2], "bit": 5, "stage": 0x0a},
    23: {"title": "Steel Rain", "description": "Smack 10 henchbots off of the gondolas in the mission \"Get a Lift\".", "points": 5, "offset": SkillPointsList[2], "bit": 6, "stage": 0x0b},
    24: {"title": "52 Card Pickup", "description": "Only use melee attacks or his own cards to defeat Jack of All Trades.", "points": 10, "offset": SkillPointsList[2], "bit": 7, "stage": 0x0b},
    25: {"title": "Dress for Success", "description": "Hit Jack of All Trades with his own hat three times.", "points": 5, "offset": SkillPointsList[3], "bit": 0, "stage": 0x0b},
    26: {"title": "Beat the House", "description": "Perform a stealth takedown on all the guards in the Casino during the mission \"Paradise Exploited\".", "points": 10, "offset": SkillPointsList[3], "bit": 1, "stage": 0x0d},
    27: {"title": "Indian Burn", "description": "Kill 10 enemies using the dodgeball cannons in the Prison Planet Exercise Yard.", "points": 5, "offset": SkillPointsList[3], "bit": 2, "stage": 0x0e},
    28: {"title": "The Law Can't Touch Me", "description": "Complete \"Mega Challenge: Exercise Yard\" without being damaged by the giant turrets.", "points": 5, "offset": SkillPointsList[3], "bit": 3, "stage": 0x0e},
    29: {"title": "Lucky Sevens", "description": "Complete \"High Risk vs. High Stakes\" with a score of exactly 77,700 points.", "points": 5, "offset": SkillPointsList[3], "bit": 4, "stage": 0x0f},
    30: {"title": "A Gadgebot Stands Alone", "description": "Complete the Gadgebot section of \"High Risk vs. High Stakes\" without reviving the other Gadgebots.", "points": 10, "offset": SkillPointsList[3], "bit": 5, "stage": 0x0f},
    31: {"title": "All Slime Must Burn", "description": "Kill all the Amoeboids during \"Crashing the Party\" using only the Blowtorch Briefcase or Hellfire Haversack.", "points": 5, "offset": SkillPointsList[3], "bit": 6, "stage": 0x10},
    32: {"title": "Ramming Speed!", "description": "Kill 10 Amoeboids using a floating platform in \"Crashing the Party\".", "points": 5, "offset": SkillPointsList[3], "bit": 7, "stage": 0x10},
    33: {"title": "Evasive Manoeuvres", "description": "Avoid 8 torpedoes using the Hydrofoil move during \"Great Escape\".", "points": 5, "offset": SkillPointsList[4], "bit": 0, "stage": 0x11},
    34: {"title": "Deep Six", "description": "Avoid all the mines during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 1, "stage": 0x11},
    35: {"title": "Wake of Destruction", "description": "Destroy every object during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 2, "stage": 0x11},
    36: {"title": "Ringmaster", "description": "Collect all the rings in \"Threading the Needle\".", "points": 5, "offset": SkillPointsList[4], "bit": 3, "stage": 0x11},
    37: {"title": "Twinkle Toes", "description": "Get 5 butterfly bounces in a row during \"Madame Butterqwark\".", "points": 5, "offset": SkillPointsList[4], "bit": 4, "stage": 0x12},
    38: {"title": "Magnum Opus", "description": "Complete \"Madame Butterqwark\" without taking damage.", "points": 10, "offset": SkillPointsList[4], "bit": 5, "stage": 0x12},
    39: {"title": "Sold Out", "description": "Get a score of 150,000 or higher during \"Madame Butterqwark\".", "points": 10, "offset": SkillPointsList[4], "bit": 6, "stage": 0x12},
    40: {"title": "With Interest", "description": "Kill 5 Static Midges with friendly fire from Bolt Thieves.", "points": 5, "offset": SkillPointsList[4], "bit": 7, "stage": 0x13},
    41: {"title": "Androids in Disguise", "description": "Stealth kill two disguised Doppelgangers in Fort Sprocket while being disguised as a Doppelganger.", "points": 5, "offset": SkillPointsList[5], "bit": 0, "stage": 0x13},
    42: {"title": "Vault Vault", "description": "Complete the \"Vaultbreakers\" challenge in under 8 minutes and 25 seconds.", "points": 10, "offset": SkillPointsList[5], "bit": 1, "stage": 0x14},
    43: {"title": "El Dia de los Muertos", "description": "Have all three Gadgebots wear Static Midge helmets at the same time during \"Vaultbreakers\".", "points": 5, "offset": SkillPointsList[5], "bit": 2, "stage": 0x14},
    44: {"title": "Ruba-Dub Club", "description": "Kill the Amoeboid King using only the OmniWrench.", "points": 10, "offset": SkillPointsList[5], "bit": 3, "stage": 0x15},
    45: {"title": "Modesty", "description": "Complete \"Mega Challenge: Shower\" without taking damage.", "points": 10, "offset": SkillPointsList[5], "bit": 4, "stage": 0x15},
    46: {"title": "It's a Delicacy Somewhere", "description": "Destroy all the Sargasso spores during \"Tracking the Kingpin\".", "points": 5, "offset": SkillPointsList[5], "bit": 5, "stage": 0x16},
    47: {"title": "Revenant", "description": "Destroy every enemy in the Salvage Yard before the final door opens without being seen.", "points": 10, "offset": SkillPointsList[5], "bit": 6, "stage": 0x16},
    48: {"title": "Punchy", "description": "Defeat all pirates using only punches.", "points": 10, "offset": SkillPointsList[5], "bit": 7, "stage": 0x17},
    49: {"title": "Sour Victory", "description": "Kill the Kudzu Monster using only lemons.", "points": 10, "offset": SkillPointsList[6], "bit": 0, "stage": 0x17},
    50: {"title": "Min-Maxing", "description": "Score 1,075 points in the Giant Clank level (1,550 in Challenge Mode).", "points": 5, "offset": SkillPointsList[6], "bit": 1, "stage": 0x18},
    51: {"title": "I Kill the Rock", "description": "Kill all 3 MegaRock-class dreadnoughts.", "points": 10, "offset": SkillPointsList[6], "bit": 2, "stage": 0x18},
    52: {"title": "Whip It Good", "description": "Get 40 kills with the Plasma Whip or Plasma Chord during any Prison Breakout challenge.", "points": 5, "offset": SkillPointsList[6], "bit": 3, "stage": 0x19},
    53: {"title": "Hanging Judge", "description": "Don't let any prisoners escape during \"Mega Challenge: Battle Royale\".", "points": 10, "offset": SkillPointsList[6], "bit": 4, "stage": 0x19},
    54: {"title": "Yeeee Haaaaaw!", "description": "Perform a roll after jumping off a cliff in one of the Hydrano vehicle challenges.", "points": 2, "offset": SkillPointsList[6], "bit": 5, "stage": 0x1a},
    55: {"title": "Offensive Driver", "description": "Complete the \"Rush Hour\" challenge with at least 60 seconds remaining.", "points": 5, "offset": SkillPointsList[6], "bit": 6, "stage": 0x1a},
    56: {"title": "Slippery Slope", "description": "Hit 5 oil slicks without dying.", "points": 5, "offset": SkillPointsList[6], "bit": 7, "stage": 0x1a},
    57: {"title": "Ring around the Rosie", "description": "Collect all the rings in the \"Driving Test\" challenge.", "points": 5, "offset": SkillPointsList[7], "bit": 0, "stage": 0x1a},
    58: {"title": "He Cleans Pools, Too!", "description": "Kill 20 enemies with a single lawnmower.", "points": 10, "offset": SkillPointsList[7], "bit": 1, "stage": 0x1b},
    59: {"title": "Perfect Mirror", "description": "Complete \"A Fiction Full of Dollars!\" without the dam taking any damage.", "points": 10, "offset": SkillPointsList[7], "bit": 2, "stage": 0x1b},
    60: {"title": "Cereal Decoder Ring", "description": "Complete \"Knockin' on Klunk's Door\" in under 4 minutes and 30 seconds.", "points": 10, "offset": SkillPointsList[7], "bit": 3, "stage": 0x1c},
    61: {"title": "l33t h4xx0r", "description": "Don't fail any OmniKey puzzles.", "points": 5, "offset": SkillPointsList[7], "bit": 4, "stage": 0x1d},
    62: {"title": "Rust Proof", "description": "Don't fall in the water at any point during \"Clank under Glass\".", "points": 5, "offset": SkillPointsList[7], "bit": 5, "stage": 0x1d},
    63: {"title": "I'm Not There", "description": "Complete \"Clank under Glass\" without being spotted by any enemies, fish, or lasers.", "points": 5, "offset": SkillPointsList[7], "bit": 6, "stage": 0x1d},
    64: {"title": "Turn the Tables", "description": "Perform 4 successful takedowns in a row on Klunk during \"All the Marbles\".", "points": 10, "offset": SkillPointsList[7], "bit": 7, "stage": 0x1e},
    65: {"title": "A Pretty Good Likeness", "description": "Complete \"All the Marbles\" without damaging Robo-Ratchet at all.", "points": 5, "offset": SkillPointsList[8], "bit": 0, "stage": 0x1e}
}

function SkillPointUnlock(offset, bit) {
    return
    (GameState() == 0x0b || GameState() == 0x08) &&
    CheckBit(offset, bit) > prev(CheckBit(offset, bit))
    
}

function SkillPointAchievementTemplate(title, description, points, offset, bit, stage) {
    achievement(
    title,
    description,
    points,
    SkillPointUnlock(offset, bit) &&
    StageID() == stage)
}

for SkillPoint in SkillPointsListConstruct {
    SkillPointAchievementTemplate(
        SkillPointsListConstruct[SkillPoint]["title"],
        SkillPointsListConstruct[SkillPoint]["description"],
        SkillPointsListConstruct[SkillPoint]["points"],
        SkillPointsListConstruct[SkillPoint]["offset"],
        SkillPointsListConstruct[SkillPoint]["bit"],
        SkillPointsListConstruct[SkillPoint]["stage"])
}

achievement(
    "Spymaster", "Obtain every skill point.",
    50,
    (GameState() == 0x0b || GameState() == 0x08) &&
    SumSkillPoints() == 65 &&
    prev(SumSkillPoints()) == 64
)

//
// Titanium Bolt Achievements
//
TitaniumBoltList = [
    0x008edba8, 0x008edba9, 0x008edbac, 0x008edbad, 0x008edbae, 0x008edbaf, 0x008edbb1, 0x008edbb2, 0x008edbb4, 0x008edbb6
]

TitaniumBoltListConstruct = {
    1: {"title": "These Belong in a...Wait a Minute", "description": "Obtain all the Titanium Bolts on Boltair.", "points": 10},
    2: {"title": "Who Leaves Change This High Up?", "description": "Obtain the Titanium Bolt on the Asyanica Rooftops.", "points": 5},
    3: {"title": "Tourists Will Lose Anything", "description": "Obtain all the Titanium Bolts on Rionosis.", "points": 10},
    4: {"title": "Now These Are Real Chips", "description": "Obtain the Titanium Bolt in the High-Rollers Casino.", "points": 5},
    5: {"title": "Experimental Currency", "description": "Obtain all the Titanium Bolts on Vanantonio.", "points": 10},
    6: {"title": "Straight from the Source", "description": "Obtain all the Titanium Bolts in Fort Sprocket.", "points": 10},
    7: {"title": "Prison Dosh", "description": "Obtain all the Titanium Bolts on the Prison Planet.", "points": 10},
    8: {"title": "Graverobbing", "description": "Obtain all the Titanium Bolts in the Spaceship Graveyard.", "points": 10},
    9: {"title": "Stealing from the Villan", "description": "Obtain the Titanium Bolt on Hydrano.", "points": 5},
}

// Boltair
AchievementTemplate(
    TitaniumBoltListConstruct[1]["title"],
    TitaniumBoltListConstruct[1]["description"],
    TitaniumBoltListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x01 &&
    CheckBit(TitaniumBoltList[0], 0) + CheckBit(TitaniumBoltList[0], 1) == 2 &&
    prev(CheckBit(TitaniumBoltList[0], 0) + CheckBit(TitaniumBoltList[0], 1)) == 1
)

// Asyanica Rooftops
AchievementTemplate(
    TitaniumBoltListConstruct[2]["title"],
    TitaniumBoltListConstruct[2]["description"],
    TitaniumBoltListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x04 &&
    CheckBit(TitaniumBoltList[1], 4) == 1 &&
    prev(CheckBit(TitaniumBoltList[1], 4)) == 0
)

// Azcotal
AchievementTemplate(
    TitaniumBoltListConstruct[3]["title"],
    TitaniumBoltListConstruct[3]["description"],
    TitaniumBoltListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    (StageID() == 0x0a || StageID() == 0x0b) &&
    CheckBit(TitaniumBoltList[2], 4) + CheckBit(TitaniumBoltList[2], 5) + CheckBit(TitaniumBoltList[2], 6) + CheckBit(TitaniumBoltList[3], 0) == 4 &&
    prev(CheckBit(TitaniumBoltList[2], 4) + CheckBit(TitaniumBoltList[2], 5) + CheckBit(TitaniumBoltList[2], 6) + CheckBit(TitaniumBoltList[3], 0)) == 3
)

// High-Rollers Casino
AchievementTemplate(
    TitaniumBoltListConstruct[4]["title"],
    TitaniumBoltListConstruct[4]["description"],
    TitaniumBoltListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x0d &&
    CheckBit(TitaniumBoltList[4], 0) == 1 &&
    prev(CheckBit(TitaniumBoltList[4], 0)) == 0
)

// Venantonio
AchievementTemplate(
    TitaniumBoltListConstruct[5]["title"],
    TitaniumBoltListConstruct[5]["description"],
    TitaniumBoltListConstruct[5]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x10 &&
    CheckBit(TitaniumBoltList[5], 4) + CheckBit(TitaniumBoltList[5], 5) == 2 &&
    prev(CheckBit(TitaniumBoltList[5], 4) + CheckBit(TitaniumBoltList[5], 5)) == 1
)

// Galactic Bolt Reserve
AchievementTemplate(
    TitaniumBoltListConstruct[6]["title"],
    TitaniumBoltListConstruct[6]["description"],
    TitaniumBoltListConstruct[6]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x13 &&
    CheckBit(TitaniumBoltList[6], 0) + CheckBit(TitaniumBoltList[6], 1) + CheckBit(TitaniumBoltList[6], 2) == 3 &&
    prev(CheckBit(TitaniumBoltList[6], 0) + CheckBit(TitaniumBoltList[6], 1) + CheckBit(TitaniumBoltList[6], 1)) == 2
)

// Prison Bolts
AchievementTemplate(
    TitaniumBoltListConstruct[7]["title"],
    TitaniumBoltListConstruct[7]["description"],
    TitaniumBoltListConstruct[7]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    (StageID() == 0x03 || StageID() == 0x09 || StageID() == 0x0e || StageID() == 0x15 || StageID() == 0x19) &&
    CheckBit(TitaniumBoltList[1], 0) + CheckBit(TitaniumBoltList[2], 0) + CheckBit(TitaniumBoltList[4], 4) + CheckBit(TitaniumBoltList[7], 0) + CheckBit(TitaniumBoltList[8], 0)== 5 &&
    prev(CheckBit(TitaniumBoltList[1], 0) + CheckBit(TitaniumBoltList[2], 0) + CheckBit(TitaniumBoltList[4], 4) + CheckBit(TitaniumBoltList[7], 0) + CheckBit(TitaniumBoltList[8], 0)) == 4
)

// Spaceship Graveyard
AchievementTemplate(
    TitaniumBoltListConstruct[8]["title"],
    TitaniumBoltListConstruct[8]["description"],
    TitaniumBoltListConstruct[8]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x16 &&
    CheckBit(TitaniumBoltList[7], 4) + CheckBit(TitaniumBoltList[7], 5) + CheckBit(TitaniumBoltList[7], 6) + CheckBit(TitaniumBoltList[7], 7) == 4 &&
    prev(CheckBit(TitaniumBoltList[7], 4) + CheckBit(TitaniumBoltList[7], 5) + CheckBit(TitaniumBoltList[7], 6) + CheckBit(TitaniumBoltList[7], 7)) == 3
)

// Underwater Bunker
AchievementTemplate(
    TitaniumBoltListConstruct[9]["title"],
    TitaniumBoltListConstruct[9]["description"],
    TitaniumBoltListConstruct[9]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x1d &&
    CheckBit(TitaniumBoltList[9], 0) == 1 &&
    prev(CheckBit(TitaniumBoltList[9], 0)) == 0
)

// 
// Alien Code Achievements
//
AlienCodeList = [
    0x008edbb8, 0x008edbb9, 0x008edbbc, 0x008edbbd, 0x008edbbe, 0x008edbbf, 0x008edbc1, 0x008edbc2, 0x008edbc6
]

function SumAlienCodes() {
    Sum =
    bitcount(AlienCodeList[0]) +
    bitcount(AlienCodeList[1]) +
    bitcount(AlienCodeList[2]) +
    bitcount(AlienCodeList[3]) +
    bitcount(AlienCodeList[4]) +
    bitcount(AlienCodeList[5]) +
    bitcount(AlienCodeList[6]) +
    bitcount(AlienCodeList[7]) +
    bitcount(AlienCodeList[8])
    
    return
    Sum
}

AlienCodeListConstruct = {
    1: {"title": "Boltair Alien Codes", "description": "Find all the Alien Codes in Boltair Museum.", "points": 10},
    2: {"title": "Asyanica Alien Codes", "description": "Find all the Alien Codes on the Asyanica Rooftops.", "points": 10},
    3: {"title": "Azcotal Alien Codes", "description": "Find all the Alien Codes in Azcotal Alley.", "points": 10},
    4: {"title": "Gondola Alien Codes", "description": "Find all the Alien Codes on the Gondola Ascent.", "points": 10},
    5: {"title": "Casino Alien Codes", "description": "Find all the Alien Codes in the High-Rollers Casino.", "points": 10},
    6: {"title": "Venantonio Alien Codes", "description": "Find all the Alien Codes in Venantonio Labs.", "points": 10},
    7: {"title": "Reserve Alien Codes", "description": "Find all the Alien Codes in the Galactic Bolt Reserve.", "points": 10},
    8: {"title": "Graveyard Alien Codes", "description": "Find all the Alien Codes in the Spaceship Graveyard.", "points": 10},
    9: {"title": "Bunker Alien Codes", "description": "Find all the Alien Codes in the Underwater Bunker.", "points": 10}
}

// Boltair
AchievementTemplate(
    AlienCodeListConstruct[1]["title"],
    AlienCodeListConstruct[1]["description"],
    AlienCodeListConstruct[1]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() == 0x01 &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[0], 0) + CheckBit(AlienCodeList[0], 1) + CheckBit(AlienCodeList[0], 2) == 3 &&
    prev(CheckBit(AlienCodeList[0], 0) + CheckBit(AlienCodeList[0], 1) + CheckBit(AlienCodeList[0], 2)) == 2
)

// Asyanica
AchievementTemplate(
    AlienCodeListConstruct[2]["title"],
    AlienCodeListConstruct[2]["description"],
    AlienCodeListConstruct[2]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x04 &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[1], 4) + CheckBit(AlienCodeList[1], 5) + CheckBit(AlienCodeList[1], 6) == 3 &&
    prev(CheckBit(AlienCodeList[1], 4) + CheckBit(AlienCodeList[1], 5) + CheckBit(AlienCodeList[1], 6)) == 2
)

// Azcotal
AchievementTemplate(
    AlienCodeListConstruct[3]["title"],
    AlienCodeListConstruct[3]["description"],
    AlienCodeListConstruct[3]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x0a &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[2], 4) + CheckBit(AlienCodeList[2], 5) + CheckBit(AlienCodeList[2], 6) == 3 &&
    prev(CheckBit(AlienCodeList[2], 4) + CheckBit(AlienCodeList[2], 5) + CheckBit(AlienCodeList[2], 6)) == 2
)

// Gondola
AchievementTemplate(
    AlienCodeListConstruct[4]["title"],
    AlienCodeListConstruct[4]["description"],
    AlienCodeListConstruct[4]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x0b &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[3], 0) + CheckBit(AlienCodeList[3], 1) + CheckBit(AlienCodeList[3], 2) == 3 &&
    prev(CheckBit(AlienCodeList[3], 0) + CheckBit(AlienCodeList[3], 1) + CheckBit(AlienCodeList[3], 2)) == 2
)

// Casino
AchievementTemplate(
    AlienCodeListConstruct[5]["title"],
    AlienCodeListConstruct[5]["description"],
    AlienCodeListConstruct[5]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x0d &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[4], 0) + CheckBit(AlienCodeList[4], 1) + CheckBit(AlienCodeList[4], 2) == 3 &&
    prev(CheckBit(AlienCodeList[4], 0) + CheckBit(AlienCodeList[4], 1) + CheckBit(AlienCodeList[4], 2)) == 2
)

// Venantonio
AchievementTemplate(
    AlienCodeListConstruct[6]["title"],
    AlienCodeListConstruct[6]["description"],
    AlienCodeListConstruct[6]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x10 &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[5], 4) + CheckBit(AlienCodeList[5], 5) + CheckBit(AlienCodeList[5], 6) == 3 &&
    prev(CheckBit(AlienCodeList[5], 4) + CheckBit(AlienCodeList[5], 5) + CheckBit(AlienCodeList[5], 6)) == 2
)

// Reserve
AchievementTemplate(
    AlienCodeListConstruct[7]["title"],
    AlienCodeListConstruct[7]["description"],
    AlienCodeListConstruct[7]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x13 &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[6], 0) + CheckBit(AlienCodeList[6], 1) + CheckBit(AlienCodeList[6], 2) == 3 &&
    prev(CheckBit(AlienCodeList[6], 0) + CheckBit(AlienCodeList[6], 1) + CheckBit(AlienCodeList[6], 2)) == 2
)

// Graveyard
AchievementTemplate(
    AlienCodeListConstruct[8]["title"],
    AlienCodeListConstruct[8]["description"],
    AlienCodeListConstruct[8]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x16 &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[7], 4) + CheckBit(AlienCodeList[7], 5) + CheckBit(AlienCodeList[7], 6) == 3 &&
    prev(CheckBit(AlienCodeList[7], 4) + CheckBit(AlienCodeList[7], 5) + CheckBit(AlienCodeList[7], 6)) == 2
)

// Bunker
AchievementTemplate(
    AlienCodeListConstruct[9]["title"],
    AlienCodeListConstruct[9]["description"],
    AlienCodeListConstruct[9]["points"],
    trigger = (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x1d &&
    ThermOpticShades() == 0x01 &&
    CheckBit(AlienCodeList[8], 0) + CheckBit(AlienCodeList[8], 1) + CheckBit(AlienCodeList[8], 2) == 3 &&
    prev(CheckBit(AlienCodeList[8], 0) + CheckBit(AlienCodeList[8], 1) + CheckBit(AlienCodeList[8], 2)) == 2
)

AchievementTemplate(
    "No Gurlz Alowd",
    "Visit the HIG Treehouse after collecting all of the Alien Codes.",
    25,
    trigger =
    (GameState() == 0x0b || GameState() == 0x08) &&
    ChallengeModeActive() &&
    StageID() == 0x1f &&
    SumAlienCodes() == 27    
)

//
// Skin Unlock Achievments
//
SkinList = [
    0x00907074, 0x00907075, 0x00907076
]

SkinListConstruct = {
    //1: {"title": "Prison Scrubs Ratchet", "description": "Unlock the Prison Scrubs Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 0},
    2: {"title": "Lombaxxx", "description": "Unlock the Towel Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 1},
    3: {"title": "Hang 6!", "description": "Unlock the Tropical Vacation skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 2},
    4: {"title": "Ratchetzilla", "description": "Unlock the Ratchetzilla skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 3},
    5: {"title": "Quest of Booty", "description": "Unlock the Plundering Pirate Captain skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 4},
    6: {"title": "Intergalactic Lombax of Mystery", "description": "Unlock the Super Incognito Skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 5},
    7: {"title": "Robo-Hero", "description": "Unlock the Robo-Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 6},
    8: {"title": "I Know Clank-Fu", "description": "Unlock the Kung Fu Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 7},
    9: {"title": "Rotten Lombax", "description": "Unlock the Zombie Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 0},
    10: {"title": "A Friend, Dearly Missed", "description": "Unlock the Dan Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 1},
    //11: {"title": "Suit Clank", "description": "", "points": 3, "offset": SkinList[1], "bit": 2},
    12: {"title": "Giddy Up Robo-Bronco", "description": "Unlock the Cowboy Clank skin.", "points": 3, "offset": SkinList[1], "bit": 3},
    13: {"title": "Clan-Klunk!?", "description": "Unlock the Klunk Clank skin.", "points": 3, "offset": SkinList[1], "bit": 4},
    14: {"title": "Let's Boogie", "description": "Unlock the 70s Clank skin.", "points": 3, "offset": SkinList[1], "bit": 5},
    15: {"title": "The Long Metal Arm of the Law", "description": "Unlock the Cop Clank skin.", "points": 3, "offset": SkinList[1], "bit": 6},
    16: {"title": "Will it Blend?", "description": "Unlock the Blender Clank skin.", "points": 3, "offset": SkinList[1], "bit": 7},
    17: {"title": "Zoni!", "description": "Unlock the Zoni Clank skin.", "points": 3, "offset": SkinList[2], "bit": 0},
    //18: {"title": "Regular Qwark", "description": "", "points": 3, "offset": SkinList[2], "bit": 1},
    19: {"title": "20 Gallon Hat", "description": "Unlock the Cowboy Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 2},
    20: {"title": "Housekeeping!", "description": "Unlock the Maid Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 3},
    21: {"title": "EL QWARKO", "description": "Unlock the Lucha Libre Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 4},
}

function SkinUnlock(offset, bit) {
    return
    (GameState() == 0x0b || GameState() == 0x08) &&
    StageID() != 0x00 &&
    GameState() != 0x04 &&
    CheckBit(offset, bit) > prev(CheckBit(offset, bit))
    
}

function SkinAchievementTemplate(title, description, points, offset, bit)
{
    achievement(title,
    description,
    points,
    SkinUnlock(offset, bit))
    
}

for SkinUnlocked in SkinListConstruct {
    SkinAchievementTemplate(
        SkinListConstruct[SkinUnlocked]["title"],
        SkinListConstruct[SkinUnlocked]["description"],
        SkinListConstruct[SkinUnlocked]["points"],
        SkinListConstruct[SkinUnlocked]["offset"],
        SkinListConstruct[SkinUnlocked]["bit"]
    )
}

//
// Rich Presence
//

rich_presence_conditional_display(byte(0x854CC0) == 0 && byte(0x8EE56C) == 0, "In the main menu")

rich_presence_conditional_display(byte(0x854CC0) == 8 && byte(0x8EE56C) == 4, "Gadgebots | Rooftop Deathtrap | Bolts: {0}",
    rich_presence_value("Number", word(0x8EE568))
)

rich_presence_conditional_display(byte(0x854CC0) == 1 && byte(0x8EE56C) == 4, "Clank | Asyanica Rooftops | Bolts: {0} | Equipped: {1}",
    rich_presence_value("Number", word(0x8EE568)),
    rich_presence_lookup("ClankWeapon", word(0x906FA4), ClankWeaponLookup, fallback="Kung Fu")
)

rich_presence_conditional_display(byte(0x854CC0) == 1 && byte(0x8EE56C) == 11, "Clank | Gondola Ascent | Bolts: {0} | Equipped: {1}",
    rich_presence_value("Number", word(0x8EE568)),
    rich_presence_lookup("ClankWeapon", word(0x906FA4), ClankWeaponLookup, fallback="Kung Fu")
)

rich_presence_conditional_display(byte(0x854CC0) == 4 && byte(0x8EE56C) == 11, "Qwark | Suck and Jive | Bolts: {0}",
    rich_presence_value("Number", word(0x8EE568))
)

rich_presence_conditional_display(byte(0x854CC0) == 0, "{0} | {1} | Bolts: {2} | Equipped: {3}",
    rich_presence_lookup("Character", word(0x854CC0), CharacterLookup),
    rich_presence_lookup("Stage", word(0x8EE56C), StageLookup),
    rich_presence_value("Number", word(0x8EE568)),
    rich_presence_lookup("RatchetWeapon", word(0x906F70), RatchetWeaponLookup)
)

rich_presence_conditional_display(byte(0x854CC0) == 1, "{0} | {1} | Bolts: {2} | Equipped: {3}",
    rich_presence_lookup("Character", word(0x854CC0), CharacterLookup),
    rich_presence_lookup("Stage", word(0x8EE56C), StageLookup),
    rich_presence_value("Number", word(0x8EE568)),
    rich_presence_lookup("ClankWeapon", word(0x906FA4), ClankWeaponLookup, fallback="Kung Fu")
)

rich_presence_display("{0} | {1} | Bolts: {2} | Equipped: {3}",
    rich_presence_lookup("Character", word(0x854CC0), CharacterLookup),
    rich_presence_lookup("Stage", word(0x8EE56C), StageLookup),
    rich_presence_value("Number", word(0x8EE568)),
    rich_presence_lookup("ClankWeapon", word(0x906FA4), ClankWeaponLookup, fallback="Kung Fu")
)
