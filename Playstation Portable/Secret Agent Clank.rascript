// Secret Agent Clank
// #ID = 2758


// Static Data Checks
function GameState() => byte(0x0084ec5c)
function CurrentCharacter() => byte(0x00854cc0)
function StageID() => dword(0x008ee56c)
function TitaniumBoltCount() => dword(0x008edbb7)
function ThermOpticShadesObtained() => byte(0x008990e8) == 0x01
function ChallengeModeActive() => byte(0x008ee574) >= 1
function PlayTime() => dword(0x00907078)
function AllKeyCards() => bitcount(0x008edc2a) == 3

function CheckBit(offset, b) {
    return
    bit(b % 8, offset + b / 8)
}

// GameState | 0x02 is the saving state flag, while the save and load screens look the same the flag is different
//           | 0x04 is the loading state flag
//           | 0x08 is used then the level initially loads and no other load operation occurs such as the open world levels
//           | 0x0b is used when a challenge is loaded from a menu within a level such as Max-Security Cells
function InGame() => (GameState() == 0x0b || GameState() == 0x08)
function GameNotLoading() => GameState() != 0x04

//
// Level Names
//

MAIN_MENU               = 0x00
BOLTAIRE_MUSEUM         = 0x01
BOLTAIRE_GEM_WING       = 0x02
MAX_SECURITY_CELLS      = 0x03
ASYANICA                = 0x04
LARGER_THAN_LIFE        = 0x05
COUNTESSES_VILLA        = 0x07
GLACIARA                = 0x08
MESS_HALL               = 0x09
AZCOTAL_ALLEY           = 0x0a
GONDOLA_AND_JIVE        = 0x0b
CASINO                  = 0x0d
EXERCISE_YARD           = 0x0e
HIGH_STAKES_ROOM        = 0x0f
VENANTONIO_LABS         = 0x10
VENANTONIO_CANALS       = 0x11
BUTTERQWARK             = 0x12
BOLT_RESERVE            = 0x13
A_EYE                   = 0x14
THE_SHOWERS             = 0x15
SPACESHIP_GRAVEYARD     = 0x16
SAINT_QWARK             = 0x17
QUASAR_FIELDS           = 0x18
PRISON_BREAKOUT         = 0x19
DAMS_EDGE               = 0x1a
FICTION_FULL_OF_DOLLARS = 0x1b
BULKHEAD_LOCK           = 0x1c
UNDERWATER_BUNKER       = 0x1d
KLUNK_BOSS_ARENA        = 0x1e
HIG_TREEHOUSE           = 0x1f


//
// Weapon IDs
//
// Note that the gadgets at the end of the block are spaced wierdly so they have higher indexes to account for that and the applied offset from the WeaponStats() obj.

TIEARANG                = 9
CUFFLINK                = 10
BLOWTORCH               = 13
TANGLEVINE              = 11
UMBRELLA                = 14
KNUCKLES                = 12
BLACKOUTPEN             = 15
HYPNOWATCH              = 16
MONOCLE                 = 22
CLANKPDA                = 24
THERMOSHADES            = 23
JETBOOTS                = 30
OMNIKEY                 = 31
CLANKBOLTGRABBER        = 33
CLANKFUKICK             = 35
CLANKFUHOTFOOT          = 36
CLANKFUHOTFOOTUPDATE    = 37
SHARDGUN                = 1
WALLOPER                = 4
LANCERATORS             = 0
MINELAUNCHER            = 7
BEEMINES                = 2
PORKBOMB                = 6
SHOCKROCKET             = 3
PLASMAWHIP              = 5
RYNO                    = 8
RATCHETPDA              = 17
RATCHETBOLTGRABBER      = 18

//
// Wrench IDs
//

NORMAL_WRENCH           = 0x00
FIRE_BOMB               = 0x01
TRIPLE_WAVE             = 0x02
SHOCK_WRENCH            = 0x03
WILD_WRENCH             = 0x04


//
// Character ID
//

RATCHET                 = 0x00
CLANK                   = 0x01
QWARK                   = 0x04
GADGEBOTS               = 0x08


//
// Misc
//

DallasChalice = byte(0x008edc4b)
BoltCount = dword(0x008ee568)
BoltMultiplier = byte(0x008edbcd)
CurrentWrench = byte(0x008edc4c)
ClankCurrentWeapon = word(0x906FA4)
RatchetCurrentWeapon = word(0x906F70)
CurrentCharacter = byte(0x854CC0)
CurrentStage = byte(0x008ee56c)


// Create address list for challenges, progression etc
function CreateAddrList(base_addr, length) {
    list = []
    for i in range (0, length - 1) {
        array_push(list, base_addr + i)
    }
    return list
}

// Stuct to return weapon data from a buffer, ammo and exp are currently unused but have been marked for the future.
// Not all exp is in the code notes but it's easy to find next to the ammo
function WeaponStats(addr) {
    obj = {
        "level": byte(addr),
        "ammo": byte(addr + 0x04),
        "exp": dword(addr + 0x08),
        "mod1": byte(addr + 0x0c),
        "mod2": byte(addr + 0x0d),
        "obtained": byte(addr + 0x14)
    }
    
    return obj
} 

function WeaponStatsBuf(addr) {
    buf = []
    SIZEOF_WeaponStats = 0x18
    numWeapons = 60
    
    for i in range(0, numWeapons - 1)
    {
        array_push(buf, WeaponStats(addr + SIZEOF_WeaponStats * i))
    }
    
    return buf
}

WeaponStats = WeaponStatsBuf(0x00898eac)


function AchievementTemplate(title, description, points, trigger) {
    achievement(
        title,
        description,
        points,
        trigger
    )
}

// Performs a comparison on bits to see if they have changed, used in for loops
function CheckUnlock(offset, bit) {
    return
    CheckBit(offset, bit) > prev(CheckBit(offset, bit))
    
}

//
// Progression Achievements
//

// These achievements check for the cinematic bitflag specified in the ListConstruct, the StageID address
// and if the game is currently in the load state when the cinematic bitflag is set (this is the save protection).
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
    GameNotLoading())
}

// Clank, Gadgebot and Qwark
CinematicsList = [
    0x008edbfe, 0x008edc00, 0x008edc02, 0x008edc04, 0x008edc06, 0x008edc08, 0x008edc0c, 0x008edc0e, 0x008edc10
]

CinematicsListConstruct = [
    {"title": "LOST and Found", "description": "Acquire the co-ordinates to Asyanica.", "points": 3, "offset": CinematicsList[0], "bit": 2, "stage": BOLTAIRE_GEM_WING, "cheevotype": "progression"},
    {"title": "The Turkey Is in the Dishwasher", "description": "Rescue Clank from the trap laid by Number Woo.", "points": 3, "offset": CinematicsList[1], "bit": 1, "stage": ASYANICA, "cheevotype": "progression"},
    {"title": "Woo Got Played", "description": "Acquire the co-ordinates to the Countess' Villa.", "points": 3, "offset": CinematicsList[1], "bit": 2, "stage": ASYANICA, "cheevotype": "progression"},
    {"title": "Adjusting a Doo-hicky", "description": "Defeat the 50-feet tall winged menace.", "points": 3, "offset": CinematicsList[1], "bit": 4, "stage": LARGER_THAN_LIFE, "cheevotype": "progression"},
    {"title": "Death Defying Dancing", "description": "Acquire the co-ordinates to Rionosis.", "points": 3, "offset": CinematicsList[2], "bit": 1, "stage": COUNTESSES_VILLA, "cheevotype": "progression"},
    {"title": "Ace up the Sleeve", "description": "Acquire the co-ordinates to the Casino.", "points": 3, "offset": CinematicsList[3], "bit": 2, "stage": GONDOLA_AND_JIVE, "cheevotype": "progression"},
    {"title": "Publisher's Notes?", "description": "Defeat Jack of All Trades.", "points": 3, "offset": CinematicsList[3], "bit": 4, "stage": GONDOLA_AND_JIVE, "cheevotype": "progression"},
    {"title": "An Exchange of Quips", "description": "Acquire the co-ordinates to Venantonio.", "points": 3, "offset": CinematicsList[4], "bit": 3, "stage": HIGH_STAKES_ROOM, "cheevotype": "progression"},
    {"title": "Beam Me Up", "description": "Acquire the co-ordinates to the Bolt Foundry.", "points": 3, "offset": CinematicsList[5], "bit": 3, "stage": VENANTONIO_LABS, "cheevotype": "progression"},
    {"title": "Good ol' Marv", "description": "Sing your heart out on Venantonio.", "points": 3, "offset": CinematicsList[5], "bit": 5, "stage": BUTTERQWARK, "cheevotype": "progression"},
    {"title": "I Never Learned to Drive Stick", "description": "Catch up to the Kingpin in the Spaceship Graveyard.", "points": 3, "offset": CinematicsList[6], "bit": 1, "stage": SPACESHIP_GRAVEYARD, "cheevotype": "progression"},
    {"title": "Spacenuns and Orphans", "description": "Defeat the All-seeing SpaceEye.", "points": 3, "offset": CinematicsList[6], "bit": 3, "stage": SAINT_QWARK, "cheevotype": "progression"},
    {"title": "The Iron Giant", "description": "Find your ship after flying through the Quasar Fields.", "points": 3, "offset": CinematicsList[7], "bit": 0, "stage": QUASAR_FIELDS, "cheevotype": "progression"},
    {"title": "Clanks' Incredible Car", "description": "Discover the location of Klunk's lair.", "points": 3, "offset": CinematicsList[7], "bit": 2, "stage": DAMS_EDGE, "cheevotype": "progression"},
    {"title": "Down to His Skivvies", "description": "\"Save\" the dam and then take a dip.", "points": 3, "offset": CinematicsList[7], "bit": 4, "stage": FICTION_FULL_OF_DOLLARS, "cheevotype": "progression"},
    {"title": "Evil Suck-Vac 3000", "description": "Witness Klunk's ultimate fate.", "points": 25, "offset": CinematicsList[1], "bit": 1, "stage": KLUNK_BOSS_ARENA, "cheevotype": "win_condition"},
]

for Cinematic in CinematicsListConstruct {
    ProgressionTemplate(
        Cinematic["title"],
        Cinematic["description"],
        Cinematic["points"],
        Cinematic["offset"],
        Cinematic["bit"],
        Cinematic["stage"],
        Cinematic["cheevotype"]
    )
}

// Ratchet and Gadgebots

ChallengesList = [
    0x008edbd4, 0x008edbdc, 0x008edbe4, 0x008edbec, 0x008edbf4, 0x008edc1f, 0x008edc23
]

ChallengesCompleteListConstruct = [
    {"title": "From Brushing Teeth to Smashing Them", "description": "Survive Ratchet's first day in prison and obtain the Fire Wrench mod, Walloper, and Shard Gun.", "points": 5, "offset": ChallengesList[0], "bit": 0, "stage": MAX_SECURITY_CELLS, "cheevotype": "progression"},
    {"title": "Messy Eaters", "description": "Live through the lunch rush in the Mess Hall.", "points": 3, "offset": ChallengesList[1], "bit": 0, "stage": MESS_HALL, "cheevotype": "progression"},
    {"title": "Playtime!", "description": "Make it through your Prison Yard time.", "points": 3, "offset": ChallengesList[2], "bit": 0, "stage": EXERCISE_YARD, "cheevotype": "progression"},
    {"title": "De-Briefing", "description": "Preserve your modesty in The Showers.", "points": 3, "offset": ChallengesList[3], "bit": 0, "stage": THE_SHOWERS, "cheevotype": "progression"},
    {"title": "Catch Me If You Can!", "description": "Prevent the prisoners from escaping!", "points": 3, "offset": ChallengesList[4], "bit": 0, "stage": PRISON_BREAKOUT, "cheevotype": "progression"},
    {"title": "The Porcupine Has Eaten the Snowman", "description": "Free Clank from the vault at the Bolt Foundry.", "points": 5, "offset": ChallengesList[5], "bit": 0, "stage": A_EYE, "cheevotype": "progression"},
    {"title": "Cold Call Bots", "description": "Find a way around the door in Klunk's lair.", "points": 3, "offset": ChallengesList[5], "bit": 0, "stage": BULKHEAD_LOCK, "cheevotype": "progression"},
]

for Challenge in ChallengesCompleteListConstruct {
    ProgressionTemplate(
        Challenge["title"],
        Challenge["description"],
        Challenge["points"],
        Challenge["offset"],
        Challenge["bit"],
        Challenge["stage"],
        Challenge["cheevotype"]
    )
}

//
// Challenge Completed Achievements
//

MaxSecurityCellsChallenges = array_map(CreateAddrList(0x008edbd4, 5), byte)
MessHallChallenges = array_map(CreateAddrList(0x008edbdc, 5), byte)
ExerciseYardChallenges = array_map(CreateAddrList(0x008edbe4, 5), byte)
TheShowersChallenges = array_map(CreateAddrList(0x008edbec, 5), byte)
PrisonBreakoutChallenges = array_map(CreateAddrList(0x008edbf4, 5), byte)
GadgebotAsyanicaChallenges = array_map(CreateAddrList(0x008edc1a, 3), byte)
GadgebotBoltReserveChallenges = array_map(CreateAddrList(0x008edc1f, 3), byte)
GadgeBotBunkerChallenges = array_map(CreateAddrList(0x008edc23, 2), byte)
SnowboardingChallenges = array_map(CreateAddrList(0x008edc3b, 3), byte)
BoatingChallenges = array_map(CreateAddrList(0x008edc3e, 3), byte)
DrivingChallenges = array_map(CreateAddrList(0x008edc41, 3), byte)

ChallengeListConstruct = [
    {"title": "Maximum OverLombax", "description": "Complete all the arena challenges in the Max-Security Cells.", "points": 5, "stage": MAX_SECURITY_CELLS, "challenge_list": MaxSecurityCellsChallenges},
    {"title": "Chow Time", "description": "Complete all the arena challenges in the Mess Hall.", "points": 5, "stage": MESS_HALL, "challenge_list": MessHallChallenges},
    {"title": "Pumping Raritanium", "description": "Complete all the arena challenges in the Exercise Yard.", "points": 5, "stage": EXERCISE_YARD, "challenge_list": ExerciseYardChallenges},
    {"title": "Don't Drop the Soap", "description": "Complete all the arena challenges in The Showers.", "points": 5, "stage": THE_SHOWERS, "challenge_list": TheShowersChallenges},
    {"title": "The Great Escape in Spaaaaace!", "description": "Complete all the arena challenges during the Prison Breakout.", "points": 5, "stage": PRISON_BREAKOUT, "challenge_list": PrisonBreakoutChallenges},
    {"title": "Small Bots, Big City", "description": "Complete all the Gadgebot challenges on Asyanica.", "points": 5, "stage": ASYANICA, "challenge_list": GadgebotAsyanicaChallenges    },
    {"title": "Tiny Heist", "description": "Complete all the Gadgebot challenges at Fort Sprocket.", "points": 5, "stage": BOLT_RESERVE, "challenge_list": GadgebotBoltReserveChallenges},
    {"title": "Bots in a Bubble", "description": "Complete all the Gadgebot challenges at the Underwater Bunker.", "points": 5, "stage": BULKHEAD_LOCK, "challenge_list": GadgeBotBunkerChallenges},
    {"title": "Extreme Sports Mode Activated", "description": "Complete all the snowboard challenges on Glaciara.", "points": 5, "stage": GLACIARA, "challenge_list": SnowboardingChallenges},
    {"title": "Turning the Tide", "description": "Complete all the boating challenges on Venantonio.", "points": 5, "stage": VENANTONIO_CANALS, "challenge_list": BoatingChallenges},
    {"title": "Rush Hour Rampage", "description": "Complete all the driving challenges on Hydrano.", "points": 5, "stage": DAMS_EDGE, "challenge_list": DrivingChallenges},
]

for i in range(0, length(ChallengeListConstruct) - 1)
{
  Challenge = ChallengeListConstruct[i]
  AchievementTemplate(
    Challenge["title"],
    Challenge["description"],
    Challenge["points"],
    trigger = 
    InGame() &&
    StageID() == Challenge["stage"] &&
    all_of(Challenge["challenge_list"], c => c >= 1) &&
    prev(Challenge["challenge_list"][length(Challenge["challenge_list"]) - 1]) == 0
  )
}


//
// Weapon Unlock Achievements
//
WeaponUnlockListConstruct = [
    {"title": "Sharp Dresser", "description": "Obtain the Tie-A-Rang, then save the game.", "points": 3, "weapon": TIEARANG, "challenge_mode_needed": 0},
    {"title": "Off the Cuff", "description": "Obtain the Cufflink Bomb, then save the game.", "points": 3, "weapon": CUFFLINK, "challenge_mode_needed": 0},
    {"title": "Melt the Locks Off", "description": "Obtain the Blowtorch Briefcase, then save the game.", "points": 3, "weapon": BLOWTORCH, "challenge_mode_needed": 0},
    {"title": "Plants Vs. Robots", "description": "Obtain the Tanglevine Carnation, then save the game.", "points": 3, "weapon": TANGLEVINE, "challenge_mode_needed": 0},
    {"title": "Loud Stick", "description": "Purchase the ThunderStorm Umbrella.", "points": 3, "weapon": UMBRELLA, "challenge_mode_needed": 0},
    {"title": "Wham!", "description": "Purchase the Holo-Knuckles.", "points": 3, "weapon": KNUCKLES, "challenge_mode_needed": 0},
    {"title": "Blotter", "description": "Obtain the Blackout Pen, then save the game.", "points": 3, "weapon": BLACKOUTPEN, "challenge_mode_needed": 0},
    {"title": "You Are Feeling Very Sleeeepyyyy", "description": "Purchase the Hypno-Watch.", "points": 3, "weapon": HYPNOWATCH, "challenge_mode_needed": 0},
    {"title": "Spiffing Eyeware Old Chap", "description": "Obtain the Holo-Monocle.", "points": 3, "weapon": MONOCLE, "challenge_mode_needed": 0},
    {"title": "Pretty Dang Awesome", "description": "Purchase the Agency PDA.", "points": 3, "weapon": CLANKPDA, "challenge_mode_needed": 0},
    {"title": "Nice Shades Dude!", "description": "Obtain the Therm-Optic Shades, then save the game.", "points": 3, "weapon": THERMOSHADES, "challenge_mode_needed": 1},
    {"title": "Do a Flip!", "description": "Obtain the Jet Boots, then enter the Gem Wing.", "points": 3, "weapon": JETBOOTS, "challenge_mode_needed": 0},
    {"title": "Locks? HA!", "description": "Obtain the Omni-Key.", "points": 3, "weapon": OMNIKEY, "challenge_mode_needed": 0},
    //{"title": "[VOID] What am I Missing?", "description": "Obtain the Map-O-Matic.", "points": 5,  "weapon": WeaponID}, // The Map-O-Matic isn't obtainable in the game and does nothing when cheated in.
    {"title": "Attractive, for a Robot", "description": "Purchase the Bolt Grabber.", "points": 3, "weapon": CLANKBOLTGRABBER, "challenge_mode_needed": 0},
    {"title": "Fleet Feet", "description": "Purchase the Clank Fu Kick.", "points": 3, "weapon": CLANKFUKICK, "challenge_mode_needed": 0}, // Actual clank fu kick
    {"title": "A Fire in my Sole", "description": "Purchase the Clank Fu Hot Foot Download.", "points": 4, "weapon": CLANKFUHOTFOOT, "challenge_mode_needed": 0},
    {"title": "An Inferno where I Tread", "description": "Purchase the Clank Fu Hot Foot 2.1 Beta Download.", "points": 5, "weapon": CLANKFUHOTFOOTUPDATE, "challenge_mode_needed": 1},
    //{"title": "[VOID] The Spoils of Victory", "description": "Pick up the Shard Gun and Walloper then complete the first arena battle.", "points": 2, "weapon": WeaponID}, // Grouped with first arena win
    //{"title": "[VOID] Give 'em a Good Whack", "description": "Obtain the Walloper then complete the first arena battle.", "points": 2,  "weapon": WeaponID},
    {"title": "Dual Wieldable", "description": "Obtain the Dual Lancerators, then save the game or go to a checkpoint.", "points": 3, "weapon": LANCERATORS, "challenge_mode_needed": 0},
    {"title": "Balls that Seek", "description": "Obtain the Mine Launcher, then save the game or go to a checkpoint.", "points": 3, "weapon": MINELAUNCHER, "challenge_mode_needed": 0},
    {"title": "*Angry Bee Noises*", "description": "Obtain the Bee Mine Launcher Mk. II, then save the game or go to a checkpoint.", "points": 3, "weapon": BEEMINES, "challenge_mode_needed": 0},
    {"title": "Makin' Bacon", "description": "Purchase the Pork Bomb Gun.", "points": 3, "weapon": PORKBOMB, "challenge_mode_needed": 0},
    {"title": "No Bottles Here", "description": "Purchase the Shock Rocket.", "points": 3, "weapon": SHOCKROCKET, "challenge_mode_needed": 0},
    {"title": "Long, Hot and Flexible", "description": "Purchase the Plasma Whip.", "points": 3, "weapon": PLASMAWHIP, "challenge_mode_needed": 0},
    {"title": "That One Gun", "description": "Purchase the RYNO.", "points": 10, "weapon": RYNO, "challenge_mode_needed": 1},
    {"title": "Public Display of Affection?", "description": "Obtain the Gadgetron PDA.", "points": 5, "weapon": RATCHETPDA, "challenge_mode_needed": 0},
    {"title": "Long Distance Change Collector", "description": "Obtain Slim Cognito's Bolt Extractor.", "points": 5, "weapon": RATCHETBOLTGRABBER, "challenge_mode_needed": 0} 
]

for Weapon in WeaponUnlockListConstruct
{
  ChallengeModeCheck = always_true()
  if(Weapon["challenge_mode_needed"] == 1) {
    ChallengeModeCheck = ChallengeModeActive()
  }
  
  AchievementTemplate(
    Weapon["title"],
    Weapon["description"],
    Weapon["points"],
    trigger = 
    InGame() &&
    ChallengeModeCheck &&
    WeaponStats[Weapon["weapon"]]["obtained"] >= 1 &&
    prev(WeaponStats[Weapon["weapon"]]["obtained"]) == 0 &&
    prior(GameNotLoading())
  )
}

//
// Weapon Upgrade Achievments
//

WeaponUpgradeListConstruct = [
    {"title": "Razor Whit", "description": "Upgrade the ProtoWhirlwind Throwtie to max level, then save the game.", "points": 10, "weapon": TIEARANG},
    {"title": "Mortar-fyring", "description": "Upgrade the ProtoWrist Mortar to max level, then save the game.", "points": 10, "weapon": CUFFLINK},
    {"title": "A Fire upon the Deep", "description": "Upgrade the ProtoHellfire Haversack to max level, then save the game.", "points": 10, "weapon": BLOWTORCH},
    {"title": "It's Deadly Fun", "description": "Upgrade the ProtoKudzu Tangle to max level, then save the game.", "points": 10, "weapon": TANGLEVINE},
    {"title": "Very, Very Frightening", "description": "Upgrade the ProtoLightning Rod to max level, then save the game.", "points": 10, "weapon": UMBRELLA},
    {"title": "Ka-pow!", "description": "Upgrade the ProtoHardlight Fist to max level, then save the game.", "points": 10, "weapon": KNUCKLES},
    {"title": "Broadside", "description": "Upgrade the TitanShard Cannon to max level, then save the game.", "points": 10, "weapon": SHARDGUN},
    {"title": "One Hell of a Punch", "description": "Upgrade the TitanMaruder to max level, then save the game.", "points": 10, "weapon": WALLOPER},
    {"title": "Memories of Dreadzone", "description": "Upgrade the TitanDual Vindicators to max level, then save the game.", "points": 10, "weapon": LANCERATORS},
    {"title": "Mine-d Your Business", "description": "Upgrade the TitanOrdnance Launcher to max level, then save the game.", "points": 10, "weapon": MINELAUNCHER},
    {"title": "Oh Bother", "description": "Upgrade the TitanKiller Bee Mine to max level, then save the game.", "points": 10, "weapon": BEEMINES},
    {"title": "Meat Lovers", "description": "Upgrade the TitanMeat Mortar to max level, then save the game.", "points": 10, "weapon": PORKBOMB},
    {"title": "It's Got a Lot of Kick", "description": "Upgrade the TitanShock Barrage to max level, then save the game.", "points": 10, "weapon": SHOCKROCKET},
    {"title": "Quantam Foam", "description": "Upgrade the TitanPlasma Cord to max level, then save the game.", "points": 10, "weapon": PLASMAWHIP},
    {"title": "Rip. Ya. New. One.", "description": "Upgrade the Ryno to max level, then save the game.", "points": 10, "weapon": RYNO}
    
]

for Upgrade in WeaponUpgradeListConstruct
{
  WeaponLevels = always_true()
  if(Upgrade["weapon"] == RYNO) {
        WeaponLevels = WeaponStats[Upgrade["weapon"]]["level"] == 3 &&
                       prev(WeaponStats[Upgrade["weapon"]]["level"]) <= 2
  } else {
        WeaponLevels = WeaponStats[Upgrade["weapon"]]["level"] == 7 &&
                       prev(WeaponStats[Upgrade["weapon"]]["level"]) <= 6
  }
  AchievementTemplate(
    Upgrade["title"],
    Upgrade["description"],
    Upgrade["points"],
    trigger = 
    InGame() &&
    ChallengeModeActive() &&
    WeaponLevels &&
    prior(GameNotLoading())
  )
}

//
// Weapon Mod Achievements
//
WeaponModListConstruct = [
    {"title": "Inductive!", "description": "Purchase the Molten Bolt mod.", "points": 5, "weapon": BLOWTORCH, "single_mod": 1},
    {"title": "Capacitive!", "description": "Purchase all the Lightning Rod mods.", "points": 5, "weapon": UMBRELLA, "single_mod": 0},
    {"title": "Piece of Mind", "description": "Obtain all the Shard Gun mods.", "points": 5, "weapon": SHARDGUN, "single_mod": 0},
    {"title": "Earthed Strike", "description": "Obtain all the Walloper mods.", "points": 5, "weapon": WALLOPER, "single_mod": 0},
    {"title": "Dualie Noted", "description": "Purchase all the Dual Lancerator mods.", "points": 5, "weapon": LANCERATORS, "single_mod": 0},
    {"title": "Major Seekage", "description": "Purchase all the Mine Launcher mods.", "points": 5, "weapon": MINELAUNCHER, "single_mod": 0},
    {"title": "The Bee Does Not Care What Others Think", "description": "Obtain all the Bee Mine Glove mods.", "points": 5, "weapon": BEEMINES, "single_mod": 0},
    {"title": "Butchers Delight", "description": "Purchase all the Pork Bomb Gun mods.", "points": 5, "weapon": PORKBOMB, "single_mod": 0},
    {"title": "The Fourth State of Kickass", "description": "Purchase all the Plasma Whip mods.", "points": 5, "weapon": PLASMAWHIP, "single_mod": 0},
    {"title": "EMP and Dynamite", "description": "Purchase all the Shock Rocket mods.", "points": 5, "weapon": SHOCKROCKET, "single_mod": 0}
]

for Mod in WeaponModListConstruct
{
  Mods = always_true()
  if(Mod["single_mod"] == 1) {
        Mods = WeaponStats[Mod["weapon"]]["mod1"] == 1 &&
               prev(WeaponStats[Mod["weapon"]]["mod1"]) == 0
  } else {
        Mods = WeaponStats[Mod["weapon"]]["mod1"] == 1 && WeaponStats[Mod["weapon"]]["mod2"] == 1  &&
               __ornext(prev(WeaponStats[Mod["weapon"]]["mod1"]) == 0 || prev(WeaponStats[Mod["weapon"]]["mod2"]) == 0)
  }
  AchievementTemplate(
    Mod["title"],
    Mod["description"],
    Mod["points"],
    trigger = 
    InGame() &&
    ChallengeModeActive() &&
    Mods &&
    prior(GameNotLoading())
  )
}

//
// Wrench Mod Achievements
//
WrenchUnlockListConstruct = [
    //{"title": "Hot Works", "description": "Obtain the Fire-Bomb Wrench Mod.", "points": 1}, // Grouped with the first arena progression
    {"title": "Ride the Wave", "description": "Obtain the Triple Wave Wrench mod.", "points": 5, "wrench": TRIPLE_WAVE},
    {"title": "Shock Horror", "description": "Obtain the Shock Crystal Wrench mod.", "points": 10, "wrench": SHOCK_WRENCH},
    {"title": "Wild Wrench", "description": "Obtian the Wild Burst Wrench mod.", "points": 10, "wrench": WILD_WRENCH}
]

for Wrench in WrenchUnlockListConstruct
{
    AchievementTemplate(
      Wrench["title"],
      Wrench["description"],
      Wrench["points"],
      trigger =
      InGame() &&
      PlayTime() > 0 &&
      CurrentCharacter() == RATCHET &&
      CurrentWrench == Wrench["wrench"] &&
      (prev(CurrentWrench) != Wrench["wrench"]) &&
      prior(GameNotLoading())
    )
}

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
    trigger = 
    InGame() &&
    prior(GameNotLoading()) &&
    StageID() != MAIN_MENU &&
    prev(BoltCount) < 5000000 &&
    BoltCount >= 5000000
)

AchievementTemplate(
    MiscCheevosListConstruct[2]["title"],
    MiscCheevosListConstruct[2]["description"],
    MiscCheevosListConstruct[2]["points"],
    trigger =
    InGame() &&
    StageID() != MAIN_MENU &&
    prev(BoltMultiplier) < 12 &&
    BoltMultiplier == 12
)

AchievementTemplate(
    MiscCheevosListConstruct[3]["title"],
    MiscCheevosListConstruct[3]["description"],
    MiscCheevosListConstruct[3]["points"],
    trigger = 
    InGame() &&
    StageID() == HIG_TREEHOUSE &&
    AllKeyCards() &&
    prev(DallasChalice) == 0 &&
    DallasChalice == 1
)

//
// Skill Point Achievements
//
SkillPointsList = CreateAddrList(0x008edb98, 9)


SkillPointsListConstruct = [
    {"title": "Furious Fists of Fury", "description": "Use only melee attacks to complete Boltair Museum.", "points": 5, "offset": SkillPointsList[0], "bit": 0, "stage": BOLTAIRE_MUSEUM},
    {"title": "Silent Night", "description": "Defeat every possible guard in Boltair Museum using stealth takedowns. ", "points": 10, "offset": SkillPointsList[0], "bit": 1, "stage": BOLTAIRE_MUSEUM},
    {"title": "Pyrrhic Victory", "description": "Get damaged on the very last segment of the Gem Wing rhythm minigame.", "points": 5, "offset": SkillPointsList[0], "bit": 2, "stage": BOLTAIRE_GEM_WING},
    {"title": "Triple Platinum Record", "description": "Get through the whole Gem Wing rhythm minigame without missing any button presses.", "points": 10, "offset": SkillPointsList[0], "bit": 3, "stage": BOLTAIRE_GEM_WING},
    {"title": "Stainless Steel", "description": "Take no damage during the Mega Challenge in the Max-Security Cells.", "points": 5, "offset": SkillPointsList[0], "bit": 4, "stage": MAX_SECURITY_CELLS},
    {"title": "Playing with Fire", "description": "Kill 5 enemies by luring them into Lizard Thug molotov cocktails.", "points": 5, "offset": SkillPointsList[0], "bit": 5, "stage": MAX_SECURITY_CELLS},
    {"title": "Speed Demon", "description": "Complete the \"Rescue Clank\" challenge in under 1 minute and 25 seconds.", "points": 10, "offset": SkillPointsList[0], "bit": 6, "stage": ASYANICA},
    {"title": "Perfect Chrome Finish", "description": "Complete \"Rescue Clank!\" without any Gadgebot taking damage.", "points": 10, "offset": SkillPointsList[0], "bit": 7, "stage": ASYANICA},
    {"title": "Robot Finds Ninja", "description": "Get all possible stealth kills during \"Number Woo works for..?\".", "points": 10, "offset": SkillPointsList[1], "bit": 0, "stage": ASYANICA},
    {"title": "Black Tie Affair", "description": "Complete \"Number Woo works for..?\" while defeating all enemies with only the Tie-A-Rang or its upgrades.", "points": 5, "offset": SkillPointsList[1], "bit": 1, "stage": ASYANICA},
    {"title": "Like the Wind", "description": "Complete \"Number Woo works for..?\" without taking damage.", "points": 5, "offset": SkillPointsList[1], "bit": 2, "stage": ASYANICA},
    {"title": "Inverse Ninja Law", "description": "Defeat 99 Giant Ninjas during \"Larger than Life\".", "points": 5, "offset": SkillPointsList[1], "bit": 3, "stage": LARGER_THAN_LIFE},
    {"title": "Blaster Overload", "description": "Complete \"Larger than Life\" without using the blaster.", "points": 10, "offset": SkillPointsList[1], "bit": 4, "stage": LARGER_THAN_LIFE},
    {"title": "Perfect Tango", "description": "Complete the Tango at the Countesses Villa without missing any button presses.", "points": 10, "offset": SkillPointsList[1], "bit": 5, "stage": COUNTESSES_VILLA},
    {"title": "Black Diamond", "description": "Complete \"Villa Escape\" without hitting any obstacles.", "points": 5, "offset": SkillPointsList[1], "bit": 6, "stage": GLACIARA},
    {"title": "Smooth Moves", "description": "Kill 15 guards on the Glaciara ski slopes with attacks from another guard.", "points": 5, "offset": SkillPointsList[1], "bit": 7, "stage": GLACIARA},
    {"title": "Ringleader", "description": "Collect all the rings in \"Go for Gold\" on the Galciara ski slopes.", "points": 5, "offset": SkillPointsList[2], "bit": 0, "stage": GLACIARA},
    {"title": "Empty the Warrens", "description": "Kill 89 tyhrranoids during \"Tyhrranoid Recycling\".", "points": 5, "offset": SkillPointsList[2], "bit": 1, "stage": MESS_HALL},
    {"title": "Antaeus", "description": "Complete \"Mega Challenge: Cafeteria\" without jumping.", "points": 5, "offset": SkillPointsList[2], "bit": 2, "stage": MESS_HALL},
    {"title": "Master of Disguise", "description": "Use all 8 of the disguises at the tourist carts in the mission \"All the Kingpin's Men\".", "points": 5, "offset": SkillPointsList[2], "bit": 3, "stage": AZCOTAL_ALLEY},
    {"title": "Trash Talk", "description": "Kill all of Kingpin's guards by luring them with a trash can.", "points": 5, "offset": SkillPointsList[2], "bit": 4, "stage": AZCOTAL_ALLEY},
    {"title": "Deadly Hands", "description": "Kill all of Kingpin's guards before reaching the fourth tourist cart.", "points": 10, "offset": SkillPointsList[2], "bit": 5, "stage": AZCOTAL_ALLEY},
    {"title": "Steel Rain", "description": "Smack 10 henchbots off of the gondolas in the mission \"Get a Lift\".", "points": 5, "offset": SkillPointsList[2], "bit": 6, "stage": GONDOLA_AND_JIVE},
    {"title": "52 Card Pickup", "description": "Only use melee attacks or his own cards to defeat Jack of All Trades.", "points": 10, "offset": SkillPointsList[2], "bit": 7, "stage": GONDOLA_AND_JIVE},
    {"title": "Dress for Success", "description": "Hit Jack of All Trades with his own hat three times.", "points": 5, "offset": SkillPointsList[3], "bit": 0, "stage": GONDOLA_AND_JIVE},
    {"title": "Beat the House", "description": "Perform a stealth takedown on all the guards in the Casino during the mission \"Paradise Exploited\".", "points": 10, "offset": SkillPointsList[3], "bit": 1, "stage": CASINO},
    {"title": "Indian Burn", "description": "Kill 10 enemies using the dodgeball cannons in the Prison Planet Exercise Yard.", "points": 5, "offset": SkillPointsList[3], "bit": 2, "stage": EXERCISE_YARD},
    {"title": "The Law Can't Touch Me", "description": "Complete \"Mega Challenge: Exercise Yard\" without being damaged by the giant turrets.", "points": 5, "offset": SkillPointsList[3], "bit": 3, "stage": EXERCISE_YARD},
    {"title": "Lucky Sevens", "description": "Complete \"High Risk vs. High Stakes\" with a score of exactly 77,700 points.", "points": 5, "offset": SkillPointsList[3], "bit": 4, "stage": HIGH_STAKES_ROOM},
    {"title": "A Gadgebot Stands Alone", "description": "Complete the Gadgebot section of \"High Risk vs. High Stakes\" without reviving the other Gadgebots.", "points": 10, "offset": SkillPointsList[3], "bit": 5, "stage": HIGH_STAKES_ROOM},
    {"title": "All Slime Must Burn", "description": "Kill all the Amoeboids during \"Crashing the Party\" using only the Blowtorch Briefcase or Hellfire Haversack.", "points": 5, "offset": SkillPointsList[3], "bit": 6, "stage": VENANTONIO_LABS},
    {"title": "Ramming Speed!", "description": "Kill 10 Amoeboids using a floating platform in \"Crashing the Party\".", "points": 5, "offset": SkillPointsList[3], "bit": 7, "stage": VENANTONIO_LABS},
    {"title": "Evasive Manoeuvres", "description": "Avoid 8 torpedoes using the Hydrofoil move during \"Great Escape\".", "points": 5, "offset": SkillPointsList[4], "bit": 0, "stage": VENANTONIO_CANALS},
    {"title": "Deep Six", "description": "Avoid all the mines during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 1, "stage": VENANTONIO_CANALS},
    {"title": "Wake of Destruction", "description": "Destroy every object during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 2, "stage": VENANTONIO_CANALS},
    {"title": "Ringmaster", "description": "Collect all the rings in \"Threading the Needle\".", "points": 5, "offset": SkillPointsList[4], "bit": 3, "stage": VENANTONIO_CANALS},
    {"title": "Twinkle Toes", "description": "Get 5 butterfly bounces in a row during \"Madame Butterqwark\".", "points": 5, "offset": SkillPointsList[4], "bit": 4, "stage": BUTTERQWARK},
    {"title": "Magnum Opus", "description": "Complete \"Madame Butterqwark\" without taking damage.", "points": 10, "offset": SkillPointsList[4], "bit": 5, "stage": BUTTERQWARK},
    {"title": "Sold Out", "description": "Get a score of 150,000 or higher during \"Madame Butterqwark\".", "points": 10, "offset": SkillPointsList[4], "bit": 6, "stage": BUTTERQWARK},
    {"title": "With Interest", "description": "Kill 5 Static Midges with friendly fire from Bolt Thieves.", "points": 5, "offset": SkillPointsList[4], "bit": 7, "stage": BOLT_RESERVE},
    {"title": "Androids in Disguise", "description": "Stealth kill two disguised Doppelgangers in Fort Sprocket while being disguised as a Doppelganger.", "points": 5, "offset": SkillPointsList[5], "bit": 0, "stage": BOLT_RESERVE},
    {"title": "Vault Vault", "description": "Complete the \"Vaultbreakers\" challenge in under 8 minutes and 25 seconds.", "points": 10, "offset": SkillPointsList[5], "bit": 1, "stage": A_EYE},
    {"title": "El Dia de los Muertos", "description": "Have all three Gadgebots wear Static Midge helmets at the same time during \"Vaultbreakers\".", "points": 5, "offset": SkillPointsList[5], "bit": 2, "stage": A_EYE},
    {"title": "Ruba-Dub Club", "description": "Kill the Amoeboid King using only the OmniWrench.", "points": 10, "offset": SkillPointsList[5], "bit": 3, "stage": THE_SHOWERS},
    {"title": "Modesty", "description": "Complete \"Mega Challenge: Shower\" without taking damage.", "points": 10, "offset": SkillPointsList[5], "bit": 4, "stage": THE_SHOWERS},
    {"title": "It's a Delicacy Somewhere", "description": "Destroy all the Sargasso spores during \"Tracking the Kingpin\".", "points": 5, "offset": SkillPointsList[5], "bit": 5, "stage": SPACESHIP_GRAVEYARD},
    {"title": "Revenant", "description": "Destroy every enemy in the Salvage Yard before the final door opens without being seen.", "points": 10, "offset": SkillPointsList[5], "bit": 6, "stage": SPACESHIP_GRAVEYARD},
    {"title": "Punchy", "description": "Defeat all pirates using only punches.", "points": 10, "offset": SkillPointsList[5], "bit": 7, "stage": SAINT_QWARK},
    {"title": "Sour Victory", "description": "Kill the Kudzu Monster using only lemons.", "points": 10, "offset": SkillPointsList[6], "bit": 0, "stage": SAINT_QWARK},
    {"title": "Min-Maxing", "description": "Score 1,075 points in the Giant Clank level (1,550 in Challenge Mode).", "points": 5, "offset": SkillPointsList[6], "bit": 1, "stage": QUASAR_FIELDS},
    {"title": "I Kill the Rock", "description": "Kill all 3 MegaRock-class dreadnoughts.", "points": 10, "offset": SkillPointsList[6], "bit": 2, "stage": QUASAR_FIELDS},
    {"title": "Whip It Good", "description": "Get 40 kills with the Plasma Whip or Plasma Chord during any Prison Breakout challenge.", "points": 5, "offset": SkillPointsList[6], "bit": 3, "stage": PRISON_BREAKOUT},
    {"title": "Hanging Judge", "description": "Don't let any prisoners escape during \"Mega Challenge: Battle Royale\".", "points": 10, "offset": SkillPointsList[6], "bit": 4, "stage": PRISON_BREAKOUT},
    {"title": "Yeeee Haaaaaw!", "description": "Perform a roll after jumping off a cliff in one of the Hydrano vehicle challenges.", "points": 2, "offset": SkillPointsList[6], "bit": 5, "stage": DAMS_EDGE},
    {"title": "Offensive Driver", "description": "Complete the \"Rush Hour\" challenge with at least 60 seconds remaining.", "points": 5, "offset": SkillPointsList[6], "bit": 6, "stage": DAMS_EDGE},
    {"title": "Slippery Slope", "description": "Hit 5 oil slicks without dying.", "points": 5, "offset": SkillPointsList[6], "bit": 7, "stage": DAMS_EDGE},
    {"title": "Ring around the Rosie", "description": "Collect all the rings in the \"Driving Test\" challenge.", "points": 5, "offset": SkillPointsList[7], "bit": 0, "stage": DAMS_EDGE},
    {"title": "He Cleans Pools, Too!", "description": "Kill 20 enemies with a single lawnmower.", "points": 10, "offset": SkillPointsList[7], "bit": 1, "stage": FICTION_FULL_OF_DOLLARS},
    {"title": "Perfect Mirror", "description": "Complete \"A Fiction Full of Dollars!\" without the dam taking any damage.", "points": 10, "offset": SkillPointsList[7], "bit": 2, "stage": FICTION_FULL_OF_DOLLARS},
    {"title": "Cereal Decoder Ring", "description": "Complete \"Knockin' on Klunk's Door\" in under 4 minutes and 30 seconds.", "points": 10, "offset": SkillPointsList[7], "bit": 3, "stage": BULKHEAD_LOCK},
    {"title": "l33t h4xx0r", "description": "Don't fail any OmniKey puzzles.", "points": 5, "offset": SkillPointsList[7], "bit": 4, "stage": UNDERWATER_BUNKER},
    {"title": "Rust Proof", "description": "Don't fall in the water at any point during \"Clank under Glass\".", "points": 5, "offset": SkillPointsList[7], "bit": 5, "stage": UNDERWATER_BUNKER},
    {"title": "I'm Not There", "description": "Complete \"Clank under Glass\" without being spotted by any enemies, fish, or lasers.", "points": 5, "offset": SkillPointsList[7], "bit": 6, "stage": UNDERWATER_BUNKER},
    {"title": "Turn the Tables", "description": "Perform 4 successful takedowns in a row on Klunk during \"All the Marbles\".", "points": 10, "offset": SkillPointsList[7], "bit": 7, "stage": KLUNK_BOSS_ARENA},
    {"title": "A Pretty Good Likeness", "description": "Complete \"All the Marbles\" without damaging Robo-Ratchet at all.", "points": 5, "offset": SkillPointsList[8], "bit": 0, "stage": KLUNK_BOSS_ARENA}
]

for SkillPoint in SkillPointsListConstruct {
    AchievementTemplate(
        SkillPoint["title"],
        SkillPoint["description"],
        SkillPoint["points"],
        trigger =
        InGame() &&
        CheckUnlock(SkillPoint["offset"], SkillPoint["bit"]) &&
        StageID() == SkillPoint["stage"])
}

achievement(
    title = "Spymaster",
    description = "Obtain every skill point.",
    points = 50,
    trigger = InGame() &&
    sum_of(SkillPointsList, addr => bitcount(addr)) == 65 &&
    prev(sum_of(SkillPointsList, addr => bitcount(addr))) == 64
)

//
// Titanium Bolt Achievements
//
TitaniumBoltList = [
    0x008edba8, 0x008edba9, 0x008edbac, 0x008edbad, 0x008edbae, 0x008edbaf, 0x008edbb1, 0x008edbb2, 0x008edbb4, 0x008edbb6
]

TitaniumBoltListConstruct = [
    {"title": "These Belong in a...Wait a Minute", "description": "Obtain all the Titanium Bolts on Boltair.", "points": 10, "stage": BOLTAIRE_MUSEUM, "multi_stage": 0, "offset": 0, "bits": [0, 1], "total": 2},
    {"title": "Who Leaves Change This High Up?", "description": "Obtain the Titanium Bolt on the Asyanica Rooftops.", "points": 5, "stage": ASYANICA, "multi_stage": 0, "offset": 0, "bits": [4], "total": 1},
    {"title": "Tourists Will Lose Anything", "description": "Obtain all the Titanium Bolts on Rionosis.", "points": 10, "stage": AZCOTAL_ALLEY, "multi_stage": 1, "offset": 1, "bits": [], "total": 4},
    {"title": "Now These Are Real Chips", "description": "Obtain the Titanium Bolt in the High-Rollers Casino.", "points": 5, "stage": CASINO, "multi_stage": 0, "offset": 1, "bits": [0], "total": 1},
    {"title": "Experimental Currency", "description": "Obtain all the Titanium Bolts on Vanantonio.", "points": 10, "stage": VENANTONIO_LABS, "multi_stage": 0, "offset": 1, "bits": [4, 5], "total": 2},
    {"title": "Straight from the Source", "description": "Obtain all the Titanium Bolts in Fort Sprocket.", "points": 10, "stage": BOLT_RESERVE, "multi_stage": 0, "offset": 2, "bits": [0, 1, 2], "total": 3},
    {"title": "Prison Dosh", "description": "Obtain all the Titanium Bolts on the Prison Planet.", "points": 10, "stage": 0, "multi_stage": 2, "offset": 0, "bits": [], "total": 5},
    {"title": "Graverobbing", "description": "Obtain all the Titanium Bolts in the Spaceship Graveyard.", "points": 10, "stage": SPACESHIP_GRAVEYARD, "multi_stage": 0, "offset": 0, "bits": [4, 5, 6, 7], "total": 4},
    {"title": "Stealing from the Villan", "description": "Obtain the Titanium Bolt on Hydrano.", "points": 5, "stage": UNDERWATER_BUNKER, "multi_stage": 0, "offset": 2, "bits": [0], "total": 1},
]



for i in range(0, length(TitaniumBoltListConstruct) -1) {
    TitaniumBolt = TitaniumBoltListConstruct[i]
    if(TitaniumBolt["multi_stage"] == 1) {
        Stage = __ornext(StageID() == AZCOTAL_ALLEY || StageID() == GONDOLA_AND_JIVE)
        Sum = CheckBit(TitaniumBoltList[2], 4) + CheckBit(TitaniumBoltList[2], 5) + CheckBit(TitaniumBoltList[2], 6) + CheckBit(TitaniumBoltList[3], 0) == TitaniumBolt["total"]
        PrevSum = prev(CheckBit(TitaniumBoltList[2], 4) + CheckBit(TitaniumBoltList[2], 5) + CheckBit(TitaniumBoltList[2], 6) + CheckBit(TitaniumBoltList[3], 0) == TitaniumBolt["total"] - 1)
    } else if(TitaniumBolt["multi_stage"] == 2) {
        Stage = __ornext((StageID() == 0x03 || StageID() == 0x09 || StageID() == 0x0e || StageID() == 0x15 || StageID() == 0x19))
        Sum = CheckBit(TitaniumBoltList[1], 0) + CheckBit(TitaniumBoltList[2], 0) + CheckBit(TitaniumBoltList[4], 4) + CheckBit(TitaniumBoltList[7], 0) + CheckBit(TitaniumBoltList[8], 0)== TitaniumBolt["total"]
        PrevSum = prev(CheckBit(TitaniumBoltList[1], 0) + CheckBit(TitaniumBoltList[2], 0) + CheckBit(TitaniumBoltList[4], 4) + CheckBit(TitaniumBoltList[7], 0) + CheckBit(TitaniumBoltList[8], 0) == TitaniumBolt["total"] - 1)
    } else {
        Stage = StageID() == TitaniumBolt["stage"]
        Sum = sum_of(TitaniumBolt["bits"], b => CheckBit(TitaniumBoltList[i] + TitaniumBolt["offset"], b)) == TitaniumBolt["total"]
        PrevSum = prev(sum_of(TitaniumBolt["bits"], b => CheckBit(TitaniumBoltList[i] + TitaniumBolt["offset"], b)) == TitaniumBolt["total"] - 1)
    }
    AchievementTemplate(
        TitaniumBolt["title"],
        TitaniumBolt["description"],
        TitaniumBolt["points"],
        trigger =
        InGame() &&
        Stage &&
        Sum &&
        PrevSum
    )
}

// 
// Alien Code Achievements
//
AlienCodeList = [0x008edbb8, 0x008edbb9, 0x008edbbc, 0x008edbbd, 0x008edbbe, 0x008edbbf, 0x008edbc1, 0x008edbc2, 0x008edbc6]

AlienCodeListConstruct = [
    {"title": "Boltair Alien Codes", "description": "Find all the Alien Codes in Boltair Museum.", "points": 10, "stage": BOLTAIRE_MUSEUM, "bits": [0, 1, 2]},
    {"title": "Asyanica Alien Codes", "description": "Find all the Alien Codes on the Asyanica Rooftops.", "points": 10, "stage": ASYANICA, "bits": [4, 5, 6]},
    {"title": "Azcotal Alien Codes", "description": "Find all the Alien Codes in Azcotal Alley.", "points": 10, "stage": AZCOTAL_ALLEY, "bits": [4, 5 ,6]},
    {"title": "Gondola Alien Codes", "description": "Find all the Alien Codes on the Gondola Ascent.", "points": 10, "stage": GONDOLA_AND_JIVE, "bits": [0, 1, 2]},
    {"title": "Casino Alien Codes", "description": "Find all the Alien Codes in the High-Rollers Casino.", "points": 10, "stage": CASINO, "bits": [0, 1, 2]},
    {"title": "Venantonio Alien Codes", "description": "Find all the Alien Codes in Venantonio Labs.", "points": 10, "stage": VENANTONIO_LABS, "bits": [4, 5, 6]},
    {"title": "Reserve Alien Codes", "description": "Find all the Alien Codes in the Galactic Bolt Reserve.", "points": 10, "stage": BOLT_RESERVE, "bits": [0, 1, 2]},
    {"title": "Graveyard Alien Codes", "description": "Find all the Alien Codes in the Spaceship Graveyard.", "points": 10, "stage": SPACESHIP_GRAVEYARD, "bits": [4, 5, 6]},
    {"title": "Bunker Alien Codes", "description": "Find all the Alien Codes in the Underwater Bunker.", "points": 10, "stage": UNDERWATER_BUNKER, "bits": [0, 1, 2]}
]

for i in range(0, length(AlienCodeList) -1)
{   
    Code = AlienCodeListConstruct[i]
    AchievementTemplate(
        Code["title"],
        Code["description"],
        Code["points"],
        trigger =
        InGame() &&
        StageID() == Code["stage"] &&
        ChallengeModeActive() &&
        ThermOpticShadesObtained() &&
        sum_of(Code["bits"], b => CheckBit(AlienCodeList[i], b)) == 3 &&
        sum_of(Code["bits"], b => prev(CheckBit(AlienCodeList[i], b))) == 2
    )
}


AchievementTemplate(
    "No Gurlz Alowd",
    "Visit the HIG Treehouse after collecting all of the Alien Codes.",
    25,
    trigger =
    InGame() &&
    ChallengeModeActive() &&
    StageID() == 0x1f &&
    sum_of(AlienCodeList, addr => bitcount(addr)) == 27
)

//
// Skin Unlock Achievments
//
SkinList = CreateAddrList(0x00907074, 3)

SkinListConstruct = [
    //{"title": "Prison Scrubs Ratchet", "description": "Unlock the Prison Scrubs Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 0},
    {"title": "Lombaxxx", "description": "Unlock the Towel Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 1},
    {"title": "Hang 6!", "description": "Unlock the Tropical Vacation skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 2},
    {"title": "Ratchetzilla", "description": "Unlock the Ratchetzilla skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 3},
    {"title": "Quest of Booty", "description": "Unlock the Plundering Pirate Captain skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 4},
    {"title": "Intergalactic Lombax of Mystery", "description": "Unlock the Super Incognito Skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 5},
    {"title": "Robo-Hero", "description": "Unlock the Robo-Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 6},
    {"title": "I Know Clank-Fu", "description": "Unlock the Kung Fu Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 7},
    {"title": "Rotten Lombax", "description": "Unlock the Zombie Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 0},
    {"title": "A Friend, Dearly Missed", "description": "Unlock the Dan Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 1},
    //{"title": "Suit Clank", "description": "", "points": 3, "offset": SkinList[1], "bit": 2},
    {"title": "Giddy Up Robo-Bronco", "description": "Unlock the Cowboy Clank skin.", "points": 3, "offset": SkinList[1], "bit": 3},
    {"title": "Clan-Klunk!?", "description": "Unlock the Klunk Clank skin.", "points": 3, "offset": SkinList[1], "bit": 4},
    {"title": "Let's Boogie", "description": "Unlock the 70s Clank skin.", "points": 3, "offset": SkinList[1], "bit": 5},
    {"title": "The Long Metal Arm of the Law", "description": "Unlock the Cop Clank skin.", "points": 3, "offset": SkinList[1], "bit": 6},
    {"title": "Will it Blend?", "description": "Unlock the Blender Clank skin.", "points": 3, "offset": SkinList[1], "bit": 7},
    {"title": "Zoni!", "description": "Unlock the Zoni Clank skin.", "points": 3, "offset": SkinList[2], "bit": 0},
    //{"title": "Regular Qwark", "description": "", "points": 3, "offset": SkinList[2], "bit": 1},
    {"title": "20 Gallon Hat", "description": "Unlock the Cowboy Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 2},
    {"title": "Housekeeping!", "description": "Unlock the Maid Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 3},
    {"title": "EL QWARKO", "description": "Unlock the Lucha Libre Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 4},
]

for SkinUnlocked in SkinListConstruct {
    AchievementTemplate(
        SkinUnlocked["title"],
        SkinUnlocked["description"],
        SkinUnlocked["points"],
        trigger =
        InGame() &&
        StageID() != MAIN_MENU &&
        GameNotLoading() &&
        bit(SkinUnlocked["bit"], SkinUnlocked["offset"]) > prev(bit(SkinUnlocked["bit"], SkinUnlocked["offset"]))
    )
}

//
// Rich Presence
//

CharacterLookup = {
    RATCHET: "Ratchet",
    CLANK: "Clank",
    QWARK: "Qwark",
    GADGEBOTS: "Gadgebots",
}

StageLookup = {
    MAIN_MENU: "the Main Menu",
    BOLTAIRE_MUSEUM: "Boltaire Museum",
    BOLTAIRE_GEM_WING: "Boltaire Gem Wing",
    MAX_SECURITY_CELLS: "Max-Security Cells",
    ASYANICA: "Rooftop Deathtrap / Asyanica Rooftops",
    LARGER_THAN_LIFE: "Larger Than Life",
    COUNTESSES_VILLA: "Countess's Villa",
    GLACIARA: "Glaciara, Ski Slopes",
    MESS_HALL: "The Mess Hall",
    AZCOTAL_ALLEY: "Azcotal Alley",
    GONDOLA_AND_JIVE: "Gondola Ascent / Suck and Jive",
    CASINO: "High-Rollers Casino",
    EXERCISE_YARD: "The Excercise Yard",
    HIGH_STAKES_ROOM: "High Stakes Room",
    VENANTONIO_LABS: "Venantonio Labs",
    VENANTONIO_CANALS: "Venantonio Canals",
    BUTTERQWARK: "Madam Butterqwark",
    BOLT_RESERVE: "Galactic Bolt Reserve",
    A_EYE: "Inside the A-Eye",
    THE_SHOWERS: "The Showers",
    SPACESHIP_GRAVEYARD: "Spaceship Graveyard",
    SAINT_QWARK: "Saint Qwark",
    QUASAR_FIELDS: "The Quasar Fields",
    PRISON_BREAKOUT: "Prison Breakout!",
    DAMS_EDGE: "Dam's Edge, Hydrano",
    FICTION_FULL_OF_DOLLARS: "A Fiction Full Of Dollars!",
    BULKHEAD_LOCK: "Bulkhead Lock",
    UNDERWATER_BUNKER: "Underwater Bunker",
    KLUNK_BOSS_ARENA: "Klunks Lair",
    HIG_TREEHOUSE: "The HIG Treehouse",
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

rp_bolt_count = rich_presence_value("Number", BoltCount)
rp_clank_weapon = rich_presence_lookup("ClankWeapon", ClankCurrentWeapon, ClankWeaponLookup, fallback="Kung Fu")
rp_ratchet_weapon = rich_presence_lookup("RatchetWeapon", RatchetCurrentWeapon, RatchetWeaponLookup)
rp_current_character = rich_presence_lookup("Character", CurrentCharacter, CharacterLookup)
rp_current_stage = rich_presence_lookup("Stage", CurrentStage, StageLookup)

rich_presence_conditional_display(CurrentCharacter == 0 && CurrentStage == 0, "In the main menu")

rich_presence_conditional_display(CurrentCharacter == 8 && CurrentStage == 4, "Gadgebots | Rooftop Deathtrap | Bolts: {0}",
    rp_bolt_count
)

rich_presence_conditional_display(CurrentCharacter == 1 && CurrentStage == 4, "Clank | Asyanica Rooftops | Bolts: {0} | Equipped: {1}",
    rp_bolt_count,
    rp_clank_weapon
)

rich_presence_conditional_display(CurrentCharacter == 1 && CurrentStage == 11, "Clank | Gondola Ascent | Bolts: {0} | Equipped: {1}",
    rp_bolt_count,
    rp_clank_weapon
)

rich_presence_conditional_display(CurrentCharacter == 4 && CurrentStage == 11, "Qwark | Suck and Jive | Bolts: {0}",
    rp_bolt_count
)

rich_presence_conditional_display(CurrentCharacter == 0, "{0} | {1} | Bolts: {2} | Equipped: {3}",
    rp_current_character,
    rp_current_stage,
    rp_bolt_count,
    rp_ratchet_weapon
)

rich_presence_conditional_display(CurrentCharacter == 1, "{0} | {1} | Bolts: {2} | Equipped: {3}",
    rp_current_character,
    rp_current_stage,
    rp_bolt_count,
    rp_clank_weapon
)

rich_presence_display("{0} | {1} | Bolts: {2} | Equipped: {3}",
    rp_current_character,
    rp_current_stage,
    rp_bolt_count,
    rp_clank_weapon
)
