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

// GameState | 0x05 is the saving state flag, while the save and load screens look the same the flag is different
//           | 0x04 is the loading state flag
//           | 0x08 is used then the level initially loads and no other load operation occurs such as the open world levels
//           | 0x0b is used when a challenge is loaded from a menu within a level such as Max-Security Cells
function InGame() => __ornext(GameState() == 0x0b || GameState() == 0x08)
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


function AchievementTemplate(title, description, points, cheevoid, trigger) {
    achievement(
        title,
        description,
        points,
        id=cheevoid,
        trigger = trigger
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
function ProgressionTemplate(title, description, points, cheevoid, offset, bit, stage, cheevotype) {
    achievement(
    title,
    description,
    points,
    id=cheevoid,
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
    {"title": "LOST and Found", "description": "Acquire the co-ordinates to Asyanica.", "points": 3, "offset": CinematicsList[0], "bit": 2, "stage": BOLTAIRE_GEM_WING, "cheevotype": "progression", "id": 432482},
    {"title": "The Turkey Is in the Dishwasher", "description": "Rescue Clank from the trap laid by Number Woo.", "points": 3, "offset": CinematicsList[1], "bit": 1, "stage": ASYANICA, "cheevotype": "progression", "id": 432483},
    {"title": "Woo Got Played", "description": "Acquire the co-ordinates to the Countess' Villa.", "points": 3, "offset": CinematicsList[1], "bit": 2, "stage": ASYANICA, "cheevotype": "progression", "id": 432484},
    {"title": "Adjusting a Doo-hicky", "description": "Defeat the 50-feet tall winged menace.", "points": 3, "offset": CinematicsList[1], "bit": 4, "stage": LARGER_THAN_LIFE, "cheevotype": "progression", "id": 432485},
    {"title": "Death Defying Dancing", "description": "Acquire the co-ordinates to Rionosis.", "points": 3, "offset": CinematicsList[2], "bit": 1, "stage": COUNTESSES_VILLA, "cheevotype": "progression", "id": 432486},
    {"title": "Ace up the Sleeve", "description": "Acquire the co-ordinates to the Casino.", "points": 3, "offset": CinematicsList[3], "bit": 2, "stage": GONDOLA_AND_JIVE, "cheevotype": "progression", "id": 432487},
    {"title": "Publisher's Notes?", "description": "Defeat Jack of All Trades.", "points": 3, "offset": CinematicsList[3], "bit": 4, "stage": GONDOLA_AND_JIVE, "cheevotype": "progression", "id": 432488},
    {"title": "An Exchange of Quips", "description": "Acquire the co-ordinates to Venantonio.", "points": 3, "offset": CinematicsList[4], "bit": 3, "stage": HIGH_STAKES_ROOM, "cheevotype": "progression", "id": 432489},
    {"title": "Beam Me Up", "description": "Acquire the co-ordinates to the Bolt Foundry.", "points": 3, "offset": CinematicsList[5], "bit": 3, "stage": VENANTONIO_CANALS, "cheevotype": "progression", "id": 432490},
    {"title": "Good ol' Marv", "description": "Sing your heart out on Venantonio.", "points": 3, "offset": CinematicsList[5], "bit": 5, "stage": BUTTERQWARK, "cheevotype": "progression", "id": 432521},
    {"title": "I Never Learned to Drive Stick", "description": "Catch up to the Kingpin in the Spaceship Graveyard.", "points": 3, "offset": CinematicsList[6], "bit": 1, "stage": SPACESHIP_GRAVEYARD, "cheevotype": "progression", "id": 432522},
    {"title": "Spacenuns and Orphans", "description": "Defeat the All-seeing SpaceEye.", "points": 3, "offset": CinematicsList[6], "bit": 3, "stage": SAINT_QWARK, "cheevotype": "progression", "id": 432523},
    {"title": "The Iron Giant", "description": "Find your ship after flying through the Quasar Fields.", "points": 3, "offset": CinematicsList[7], "bit": 0, "stage": PRISON_BREAKOUT, "cheevotype": "progression", "id": 432524},
    {"title": "Clank's Incredible Car", "description": "Discover the location of Klunk's lair.", "points": 3, "offset": CinematicsList[7], "bit": 2, "stage": DAMS_EDGE, "cheevotype": "progression", "id": 432491},
    {"title": "Down to His Skivvies", "description": "\"Save\" the dam and then take a dip.", "points": 3, "offset": CinematicsList[7], "bit": 4, "stage": FICTION_FULL_OF_DOLLARS, "cheevotype": "progression", "id": 432525},
    {"title": "Evil Suck-Vac 3000", "description": "Witness Klunk's ultimate fate.", "points": 25, "offset": CinematicsList[8], "bit": 3, "stage": KLUNK_BOSS_ARENA, "cheevotype": "win_condition", "id": 432526},
]

for Cinematic in CinematicsListConstruct {
    ProgressionTemplate(
        Cinematic["title"],
        Cinematic["description"],
        Cinematic["points"],
        Cinematic["id"],
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
    {"title": "From Brushing Teeth to Smashing Them", "description": "Survive Ratchet's first day in prison and obtain the Fire Wrench mod, Walloper, and Shard Gun.", "points": 5, "offset": ChallengesList[0], "bit": 0, "stage": MAX_SECURITY_CELLS, "cheevotype": "progression", "id": 432527},
    {"title": "Messy Eaters", "description": "Live through the lunch rush in the Mess Hall.", "points": 3, "offset": ChallengesList[1], "bit": 0, "stage": MESS_HALL, "cheevotype": "progression", "id": 432528},
    {"title": "Playtime!", "description": "Make it through your Prison Yard time.", "points": 3, "offset": ChallengesList[2], "bit": 0, "stage": EXERCISE_YARD, "cheevotype": "progression", "id": 432677},
    {"title": "De-Briefing", "description": "Preserve your modesty in The Showers and obtain the PDA.", "points": 3, "offset": ChallengesList[3], "bit": 0, "stage": THE_SHOWERS, "cheevotype": "progression", "id": 432492},
    {"title": "Catch Me If You Can!", "description": "Prevent the prisoners from escaping!", "points": 3, "offset": ChallengesList[4], "bit": 0, "stage": PRISON_BREAKOUT, "cheevotype": "progression", "id": 432678},
    {"title": "The Porcupine Has Eaten the Snowman", "description": "Free Clank from the vault at the Bolt Foundry.", "points": 5, "offset": ChallengesList[5], "bit": 0, "stage": A_EYE, "cheevotype": "progression", "id": 432555},
    {"title": "Cold Call Bots", "description": "Find a way around the door in Klunk's lair.", "points": 3, "offset": ChallengesList[6], "bit": 0, "stage": BULKHEAD_LOCK, "cheevotype": "progression", "id": 432556},
]

for Challenge in ChallengesCompleteListConstruct {
    ProgressionTemplate(
        Challenge["title"],
        Challenge["description"],
        Challenge["points"],
        Challenge["id"],
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
    {"title": "Maximum OverLombax", "description": "Complete all the arena challenges in the Max-Security Cells.", "points": 5, "stage": MAX_SECURITY_CELLS, "challenge_list": MaxSecurityCellsChallenges, "id": 432557},
    {"title": "Chow Time", "description": "Complete all the arena challenges in the Mess Hall.", "points": 5, "stage": MESS_HALL, "challenge_list": MessHallChallenges, "id": 432558},
    {"title": "Pumping Raritanium", "description": "Complete all the arena challenges in the Exercise Yard.", "points": 5, "stage": EXERCISE_YARD, "challenge_list": ExerciseYardChallenges, "id": 432530},
    {"title": "Don't Drop the Soap", "description": "Complete all the arena challenges in The Showers.", "points": 5, "stage": THE_SHOWERS, "challenge_list": TheShowersChallenges, "id": 432493},
    {"title": "The Great Escape in Spaaaaace!", "description": "Complete all the arena challenges during the Prison Breakout.", "points": 5, "stage": PRISON_BREAKOUT, "challenge_list": PrisonBreakoutChallenges, "id": 432559},
    {"title": "Small Bots, Big City", "description": "Complete all the Gadgebot challenges on Asyanica.", "points": 5, "stage": ASYANICA, "challenge_list": GadgebotAsyanicaChallenges, "id": 432560},
    {"title": "Tiny Heist", "description": "Complete all the Gadgebot challenges at Fort Sprocket.", "points": 5, "stage": A_EYE, "challenge_list": GadgebotBoltReserveChallenges, "id": 432561},
    {"title": "Bots in a Bubble", "description": "Complete all the Gadgebot challenges at the Underwater Bunker.", "points": 5, "stage": BULKHEAD_LOCK, "challenge_list": GadgeBotBunkerChallenges, "id": 432562},
    {"title": "Extreme Sports Mode Activated", "description": "Complete all the snowboard challenges on Glaciara.", "points": 5, "stage": GLACIARA, "challenge_list": SnowboardingChallenges, "id": 432494},
    {"title": "Turning the Tide", "description": "Complete all the boating challenges on Venantonio.", "points": 5, "stage": VENANTONIO_CANALS, "challenge_list": BoatingChallenges, "id": 432571},
    {"title": "Rush Hour Rampage", "description": "Complete all the driving challenges on Hydrano.", "points": 5, "stage": DAMS_EDGE, "challenge_list": DrivingChallenges, "id": 432531},
]

for i in range(0, length(ChallengeListConstruct) - 1)
{
  Challenge = ChallengeListConstruct[i]
  AchievementTemplate(
    Challenge["title"],
    Challenge["description"],
    Challenge["points"],
    Challenge["id"],
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
    {"title": "Sharp Dresser", "description": "Obtain the Tie-A-Rang, then save the game.", "points": 3, "weapon": TIEARANG, "challenge_mode_needed": 0, "id": 432565},
    {"title": "Off the Cuff", "description": "Obtain the Cufflink Bomb, then save the game.", "points": 3, "weapon": CUFFLINK, "challenge_mode_needed": 0, "id": 432566},
    {"title": "Melt the Locks Off", "description": "Obtain the Blowtorch Briefcase, then save the game.", "points": 3, "weapon": BLOWTORCH, "challenge_mode_needed": 0, "id": 432563},
    {"title": "Plants Vs. Robots", "description": "Obtain the Tanglevine Carnation, then save the game.", "points": 3, "weapon": TANGLEVINE, "challenge_mode_needed": 0, "id": 432495},
    {"title": "Loud Stick", "description": "Purchase the ThunderStorm Umbrella.", "points": 3, "weapon": UMBRELLA, "challenge_mode_needed": 0, "id": 432572},
    {"title": "Wham!", "description": "Purchase the Holo-Knuckles.", "points": 3, "weapon": KNUCKLES, "challenge_mode_needed": 0, "id": 432567},
    {"title": "Blotter", "description": "Obtain the Blackout Pen, then save the game.", "points": 3, "weapon": BLACKOUTPEN, "challenge_mode_needed": 0, "id": 432532},
    {"title": "You Are Feeling Very Sleeeepyyyy", "description": "Purchase the Hypno-Watch.", "points": 3, "weapon": HYPNOWATCH, "challenge_mode_needed": 0, "id": 432568},
    {"title": "Spiffing Eyeware Old Chap", "description": "Obtain the Holo-Monocle.", "points": 3, "weapon": MONOCLE, "challenge_mode_needed": 0, "id": 432569},
    {"title": "Pretty Dang Awesome", "description": "Purchase the Agency PDA.", "points": 3, "weapon": CLANKPDA, "challenge_mode_needed": 0, "id": 432496},
    {"title": "Nice Shades Dude!", "description": "Obtain the Therm-Optic Shades, then save the game.", "points": 3, "weapon": THERMOSHADES, "challenge_mode_needed": 1, "id": 432570},
    {"title": "Do a Flip!", "description": "Obtain the Jet Boots, then enter the Gem Wing.", "points": 3, "weapon": JETBOOTS, "challenge_mode_needed": 0, "id": 432564},
    {"title": "Locks? HA!", "description": "Obtain the Omni-Key.", "points": 3, "weapon": OMNIKEY, "challenge_mode_needed": 0, "id": 432573},
    //{"title": "[VOID] What am I Missing?", "description": "Obtain the Map-O-Matic.", "points": 5,  "weapon": WeaponID}, // The Map-O-Matic isn't obtainable in the game and does nothing when cheated in.
    {"title": "Attractive, for a Robot", "description": "Purchase the Bolt Grabber.", "points": 3, "weapon": CLANKBOLTGRABBER, "challenge_mode_needed": 0, "id": 432533},
    {"title": "Fleet Feet", "description": "Purchase the Clank Fu Kick.", "points": 3, "weapon": CLANKFUKICK, "challenge_mode_needed": 0, "id": 432497}, // Actual clank fu kick
    {"title": "A Fire in my Sole", "description": "Purchase the Clank Fu Hot Foot Download.", "points": 4, "weapon": CLANKFUHOTFOOT, "challenge_mode_needed": 0, "id": 432574},
    {"title": "An Inferno Where I Tread", "description": "Purchase the Clank Fu Hot Foot 2.1 Beta Download.", "points": 5, "weapon": CLANKFUHOTFOOTUPDATE, "challenge_mode_needed": 1, "id": 432575},
    //{"title": "[VOID] The Spoils of Victory", "description": "Pick up the Shard Gun and Walloper then complete the first arena battle.", "points": 2, "weapon": WeaponID}, // Grouped with first arena win
    //{"title": "[VOID] Give 'em a Good Whack", "description": "Obtain the Walloper then complete the first arena battle.", "points": 2,  "weapon": WeaponID},
    {"title": "Dual Wieldable", "description": "Obtain the Dual Lancerators, then save the game or go to a checkpoint.", "points": 3, "weapon": LANCERATORS, "challenge_mode_needed": 0, "id": 432576},
    {"title": "Balls that Seek", "description": "Obtain the Mine Launcher, then save the game or go to a checkpoint.", "points": 3, "weapon": MINELAUNCHER, "challenge_mode_needed": 0, "id": 432577},
    {"title": "*Angry Bee Noises*", "description": "Obtain the Bee Mine Launcher Mk. II, then save the game or go to a checkpoint.", "points": 3, "weapon": BEEMINES, "challenge_mode_needed": 0, "id": 432578},
    {"title": "Makin' Bacon", "description": "Purchase the Pork Bomb Gun.", "points": 3, "weapon": PORKBOMB, "challenge_mode_needed": 0, "id": 432498},
    {"title": "No Bottles Here", "description": "Purchase the Shock Rocket.", "points": 3, "weapon": SHOCKROCKET, "challenge_mode_needed": 0, "id": 432534},
    {"title": "Long, Hot and Flexible", "description": "Purchase the Plasma Whip.", "points": 3, "weapon": PLASMAWHIP, "challenge_mode_needed": 0, "id": 432579},
    {"title": "That One Gun", "description": "Purchase the RYNO.", "points": 10, "weapon": RYNO, "challenge_mode_needed": 1, "id": 432580},
    //{"title": "[VOID] Public Display of Affection?", "description": "Obtain the Gadgetron PDA.", "points": 5, "weapon": RATCHETPDA, "challenge_mode_needed": 0, "id": 432581},
    {"title": "Long Distance Change Collector", "description": "Obtain Slim Cognito's Bolt Extractor.", "points": 5, "weapon": RATCHETBOLTGRABBER, "challenge_mode_needed": 0, "id": 432582} 
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
    Weapon["id"],
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
    {"title": "Razor Whit", "description": "Upgrade the ProtoWhirlwind Throwtie to max level, then save the game.", "points": 10, "weapon": TIEARANG, "id": 432499},
    {"title": "Mortar-fyring", "description": "Upgrade the ProtoWrist Mortar to max level, then save the game.", "points": 10, "weapon": CUFFLINK, "id": 432583},
    {"title": "A Fire upon the Deep", "description": "Upgrade the ProtoHellfire Haversack to max level, then save the game.", "points": 10, "weapon": BLOWTORCH, "id": 432584},
    {"title": "It's Deadly Fun", "description": "Upgrade the ProtoKudzu Tangle to max level, then save the game.", "points": 10, "weapon": TANGLEVINE, "id": 432535},
    {"title": "Very, Very Frightening", "description": "Upgrade the ProtoLightning Rod to max level, then save the game.", "points": 10, "weapon": UMBRELLA, "id": 432585},
    {"title": "Ka-pow!", "description": "Upgrade the ProtoHardlight Fist to max level, then save the game.", "points": 10, "weapon": KNUCKLES, "id": 432586},
    {"title": "Broadside", "description": "Upgrade the TitanShard Cannon to max level, then save the game.", "points": 10, "weapon": SHARDGUN, "id": 432500},
    {"title": "One Hell of a Punch", "description": "Upgrade the TitanMaruder to max level, then save the game.", "points": 10, "weapon": WALLOPER, "id": 432587},
    {"title": "Memories of Dreadzone", "description": "Upgrade the TitanDual Vindicators to max level, then save the game.", "points": 10, "weapon": LANCERATORS, "id": 432588},
    {"title": "Mine-d Your Business", "description": "Upgrade the TitanOrdnance Launcher to max level, then save the game.", "points": 10, "weapon": MINELAUNCHER, "id": 432589},
    {"title": "Oh Bother", "description": "Upgrade the TitanKiller Bee Mine to max level, then save the game.", "points": 10, "weapon": BEEMINES, "id": 432536},
    {"title": "Meat Lovers", "description": "Upgrade the TitanMeat Mortar to max level, then save the game.", "points": 10, "weapon": PORKBOMB, "id": 432590},
    {"title": "It's Got a Lot of Kick", "description": "Upgrade the TitanShock Barrage to max level, then save the game.", "points": 10, "weapon": SHOCKROCKET, "id": 432591},
    {"title": "Quantam Foam", "description": "Upgrade the TitanPlasma Cord to max level, then save the game.", "points": 10, "weapon": PLASMAWHIP, "id": 432501},
    {"title": "Rip. Ya. New. One.", "description": "Upgrade the Ryno to max level, then save the game.", "points": 10, "weapon": RYNO, "id": 432592}
    
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
    Upgrade["id"],
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
    {"title": "Inductive!", "description": "Purchase the Molten Bolt mod.", "points": 5, "weapon": BLOWTORCH, "single_mod": 1, "id": 432593},
    {"title": "Capacitive!", "description": "Purchase all the Lightning Rod mods.", "points": 5, "weapon": UMBRELLA, "single_mod": 0, "id": 432537},
    {"title": "Piece of Mind", "description": "Obtain all the Shard Gun mods.", "points": 5, "weapon": SHARDGUN, "single_mod": 0, "id": 432594},
    {"title": "Earthed Strike", "description": "Obtain all the Walloper mods.", "points": 5, "weapon": WALLOPER, "single_mod": 0, "id": 432595},
    {"title": "Dualie Noted", "description": "Purchase all the Dual Lancerator mods.", "points": 5, "weapon": LANCERATORS, "single_mod": 0, "id": 432502},
    {"title": "Major Seekage", "description": "Purchase all the Mine Launcher mods.", "points": 5, "weapon": MINELAUNCHER, "single_mod": 0, "id": 432596},
    {"title": "The Bee Does Not Care What Others Think", "description": "Obtain all the Bee Mine Glove mods.", "points": 5, "weapon": BEEMINES, "single_mod": 0, "id": 432597},
    {"title": "Butchers Delight", "description": "Purchase all the Pork Bomb Gun mods.", "points": 5, "weapon": PORKBOMB, "single_mod": 0, "id": 432538},
    {"title": "The Fourth State of Kickass", "description": "Purchase all the Plasma Whip mods.", "points": 5, "weapon": PLASMAWHIP, "single_mod": 0, "id": 432598},
    {"title": "EMP and Dynamite", "description": "Purchase all the Shock Rocket mods.", "points": 5, "weapon": SHOCKROCKET, "single_mod": 0, "id": 432599}
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
    Mod["id"],
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
    {"title": "Ride the Wave", "description": "Obtain the Triple Wave Wrench mod.", "points": 5, "wrench": TRIPLE_WAVE, "id": 432503},
    {"title": "Shock Horror", "description": "Obtain the Shock Crystal Wrench mod.", "points": 10, "wrench": SHOCK_WRENCH, "id": 432600},
    {"title": "Wild Wrench", "description": "Obtian the Wild Burst Wrench mod.", "points": 10, "wrench": WILD_WRENCH, "id": 432601}
]

for Wrench in WrenchUnlockListConstruct
{
    AchievementTemplate(
      Wrench["title"],
      Wrench["description"],
      Wrench["points"],
      Wrench["id"],
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
    1: {"title": "Jingling Pockets", "description": "Carry 5,000,000 bolts at once.", "points": 25, "id": 432539},
    2: {"title": "Multiplicative Gains", "description": "Reach a bolt multiplier of 12.", "points": 10, "id": 432602},
    3: {"title": "Who Is Dallas?", "description": "Find all three keycards and acquire a very powerful cup.", "points": 10, "id": 432603}
}

AchievementTemplate(
    MiscCheevosListConstruct[1]["title"],
    MiscCheevosListConstruct[1]["description"],
    MiscCheevosListConstruct[1]["points"],
    MiscCheevosListConstruct[1]["id"],
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
    MiscCheevosListConstruct[2]["id"],
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
    MiscCheevosListConstruct[3]["id"],
    trigger = 
    InGame() &&
    StageID() == HIG_TREEHOUSE &&
    AllKeyCards() &&
    DallasChalice > prev(DallasChalice)
)

//
// Skill Point Achievements
//
SkillPointsList = CreateAddrList(0x008edb98, 9)


SkillPointsListConstruct = [
    {"title": "Furious Fists of Fury", "description": "Use only melee attacks to complete Boltair Museum.", "points": 5, "offset": SkillPointsList[0], "bit": 0, "stage": BOLTAIRE_MUSEUM, "id": 432504},
    {"title": "Silent Night", "description": "Defeat every possible guard in Boltaire Museum using stealth takedowns. ", "points": 10, "offset": SkillPointsList[0], "bit": 1, "stage": BOLTAIRE_MUSEUM, "id": 432604},
    {"title": "Pyrrhic Victory", "description": "Get damaged on the very last segment of the Gem Wing rhythm minigame.", "points": 5, "offset": SkillPointsList[0], "bit": 2, "stage": BOLTAIRE_GEM_WING, "id": 432605},
    {"title": "Triple Platinum Record", "description": "Get through the whole Gem Wing rhythm minigame without missing any button presses.", "points": 10, "offset": SkillPointsList[0], "bit": 3, "stage": BOLTAIRE_GEM_WING, "id": 432606},
    {"title": "Stainless Steel", "description": "Take no damage during the Mega Challenge in the Max-Security Cells.", "points": 5, "offset": SkillPointsList[0], "bit": 4, "stage": MAX_SECURITY_CELLS, "id": 432607},
    {"title": "Playing with Fire", "description": "Kill 5 enemies by luring them into Lizard Thug molotov cocktails.", "points": 5, "offset": SkillPointsList[0], "bit": 5, "stage": MAX_SECURITY_CELLS, "id": 432540},
    {"title": "Speed Demon", "description": "Complete the \"Rescue Clank\" challenge in under 1 minute and 25 seconds.", "points": 10, "offset": SkillPointsList[0], "bit": 6, "stage": ASYANICA, "id": 432505},
    {"title": "Perfect Chrome Finish", "description": "Complete \"Rescue Clank!\" without any Gadgebot taking damage.", "points": 10, "offset": SkillPointsList[0], "bit": 7, "stage": ASYANICA, "id": 432608},
    {"title": "Robot Finds Ninja", "description": "Get all possible stealth kills during \"Number Woo works for..?\".", "points": 10, "offset": SkillPointsList[1], "bit": 0, "stage": ASYANICA, "id": 432609},
    {"title": "Black Tie Affair", "description": "Complete \"Number Woo works for..?\" while defeating all enemies with only the Tie-A-Rang or its upgrades.", "points": 5, "offset": SkillPointsList[1], "bit": 1, "stage": ASYANICA, "id": 432610},
    {"title": "Like the Wind", "description": "Complete \"Number Woo works for..?\" without taking damage.", "points": 5, "offset": SkillPointsList[1], "bit": 2, "stage": ASYANICA, "id": 432611},
    {"title": "Inverse Ninja Law", "description": "Defeat 99 Giant Ninjas during \"Larger than Life\".", "points": 5, "offset": SkillPointsList[1], "bit": 3, "stage": LARGER_THAN_LIFE, "id": 432612},
    {"title": "Blaster Overload", "description": "Complete \"Larger than Life\" without using the blaster.", "points": 10, "offset": SkillPointsList[1], "bit": 4, "stage": LARGER_THAN_LIFE, "id": 432541},
    {"title": "Perfect Tango", "description": "Complete the Tango at the Countesses Villa without missing any button presses.", "points": 10, "offset": SkillPointsList[1], "bit": 5, "stage": COUNTESSES_VILLA, "id": 432506},
    {"title": "Black Diamond", "description": "Complete \"Villa Escape\" without hitting any obstacles.", "points": 5, "offset": SkillPointsList[1], "bit": 6, "stage": GLACIARA, "id": 432613},
    {"title": "Smooth Moves", "description": "Kill 15 guards on the Glaciara ski slopes with attacks from another guard.", "points": 5, "offset": SkillPointsList[1], "bit": 7, "stage": GLACIARA, "id": 432614},
    {"title": "Ringleader", "description": "Collect all the rings in \"Go for Gold\" on the Galciara ski slopes.", "points": 5, "offset": SkillPointsList[2], "bit": 0, "stage": GLACIARA, "id": 432615},
    {"title": "Empty the Warrens", "description": "Kill 89 tyhrranoids during \"Tyhrranoid Recycling\".", "points": 5, "offset": SkillPointsList[2], "bit": 1, "stage": MESS_HALL, "id": 432616},
    {"title": "Antaeus", "description": "Complete \"Mega Challenge: Cafeteria\" without jumping.", "points": 5, "offset": SkillPointsList[2], "bit": 2, "stage": MESS_HALL, "id": 432617},
    {"title": "Master of Disguise", "description": "Use all 8 of the disguises at the tourist carts in the mission \"All the Kingpin's Men\".", "points": 5, "offset": SkillPointsList[2], "bit": 3, "stage": AZCOTAL_ALLEY, "id": 432507},
    {"title": "Trash Talk", "description": "Kill all of Kingpin's guards by luring them with a trash can in the mission \"All the Kingpin's Men\".", "points": 5, "offset": SkillPointsList[2], "bit": 4, "stage": AZCOTAL_ALLEY, "id": 432618},
    {"title": "Deadly Hands", "description": "Kill all of Kingpin's guards before reaching the fourth tourist cart in \"All the Kingpins's Men\".", "points": 10, "offset": SkillPointsList[2], "bit": 5, "stage": AZCOTAL_ALLEY, "id": 432542},
    {"title": "Steel Rain", "description": "Smack 10 henchbots off of the gondolas in the mission \"Get a Lift\".", "points": 5, "offset": SkillPointsList[2], "bit": 6, "stage": GONDOLA_AND_JIVE, "id": 432619},
    {"title": "52 Card Pickup", "description": "Only use melee attacks or his own cards to defeat Jack of All Trades.", "points": 10, "offset": SkillPointsList[2], "bit": 7, "stage": GONDOLA_AND_JIVE, "id": 432620},
    {"title": "Dress for Success", "description": "Hit Jack of All Trades with his own hat three times.", "points": 5, "offset": SkillPointsList[3], "bit": 0, "stage": GONDOLA_AND_JIVE, "id": 432621},
    {"title": "Beat the House", "description": "Perform a stealth takedown on all the guards in the Casino during the mission \"Paradise Exploited\".", "points": 10, "offset": SkillPointsList[3], "bit": 1, "stage": CASINO, "id": 432508},
    {"title": "Indian Burn", "description": "Kill 10 enemies using the dodgeball cannons in the Prison Planet Exercise Yard.", "points": 5, "offset": SkillPointsList[3], "bit": 2, "stage": EXERCISE_YARD, "id": 432622},
    {"title": "The Law Can't Touch Me", "description": "Complete \"Mega Challenge: Exercise Yard\" without being damaged by the giant turrets.", "points": 5, "offset": SkillPointsList[3], "bit": 3, "stage": EXERCISE_YARD, "id": 432623},
    {"title": "Lucky Sevens", "description": "Complete \"High Risk vs. High Stakes\" with a score of exactly 77,700 points.", "points": 5, "offset": SkillPointsList[3], "bit": 4, "stage": HIGH_STAKES_ROOM, "id": 432543},
    {"title": "A Gadgebot Stands Alone", "description": "Complete the Gadgebot section of \"High Risk vs. High Stakes\" without reviving the other Gadgebots.", "points": 10, "offset": SkillPointsList[3], "bit": 5, "stage": HIGH_STAKES_ROOM, "id": 432624},
    {"title": "All Slime Must Burn", "description": "Kill all the Amoeboids during \"Crashing the Party\" using only the Blowtorch Briefcase or Hellfire Haversack.", "points": 5, "offset": SkillPointsList[3], "bit": 6, "stage": VENANTONIO_LABS, "id": 432625},
    {"title": "Ramming Speed!", "description": "Kill 10 Amoeboids using a floating platform in \"Crashing the Party\".", "points": 5, "offset": SkillPointsList[3], "bit": 7, "stage": VENANTONIO_LABS, "id": 432509},
    {"title": "Evasive Manoeuvres", "description": "Avoid 8 torpedoes using the Hydrofoil move during \"Great Escape\".", "points": 5, "offset": SkillPointsList[4], "bit": 0, "stage": VENANTONIO_CANALS, "id": 432626},
    {"title": "Deep Six", "description": "Avoid all the mines during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 1, "stage": VENANTONIO_CANALS, "id": 432627},
    {"title": "Wake of Destruction", "description": "Destroy every object during \"Great Escape\".", "points": 10, "offset": SkillPointsList[4], "bit": 2, "stage": VENANTONIO_CANALS, "id": 432628},
    {"title": "Ringmaster", "description": "Collect all the rings in \"Threading the Needle\".", "points": 5, "offset": SkillPointsList[4], "bit": 3, "stage": VENANTONIO_CANALS, "id": 432544},
    {"title": "Twinkle Toes", "description": "Get 5 butterfly bounces in a row during \"Madame Butterqwark\".", "points": 5, "offset": SkillPointsList[4], "bit": 4, "stage": BUTTERQWARK, "id": 432629},
    {"title": "Magnum Opus", "description": "Complete \"Madame Butterqwark\" without taking damage.", "points": 10, "offset": SkillPointsList[4], "bit": 5, "stage": BUTTERQWARK, "id": 432510},
    {"title": "Sold Out", "description": "Get a score of 150,000 or higher during \"Madame Butterqwark\".", "points": 10, "offset": SkillPointsList[4], "bit": 6, "stage": BUTTERQWARK, "id": 432630},
    {"title": "With Interest", "description": "Kill 5 Static Midges with friendly fire from Bolt Thieves at Fort Sprocket.", "points": 5, "offset": SkillPointsList[4], "bit": 7, "stage": BOLT_RESERVE, "id": 432631},
    {"title": "Androids in Disguise", "description": "Stealth kill two disguised Doppelgangers in Fort Sprocket while being disguised as a Doppelganger.", "points": 5, "offset": SkillPointsList[5], "bit": 0, "stage": BOLT_RESERVE, "id": 432632},
    {"title": "Vault Vault", "description": "Complete the \"Vaultbreakers\" challenge in under 8 minutes and 25 seconds.", "points": 10, "offset": SkillPointsList[5], "bit": 1, "stage": A_EYE, "id": 432633},
    {"title": "El Dia de los Muertos", "description": "Have all three Gadgebots wear Static Midge helmets at the same time during \"Vaultbreakers\".", "points": 5, "offset": SkillPointsList[5], "bit": 2, "stage": A_EYE, "id": 432545},
    {"title": "Ruba-Dub Club", "description": "Kill the Amoeboid King using only the OmniWrench during \"No good deed goes unpunished\".", "points": 10, "offset": SkillPointsList[5], "bit": 3, "stage": THE_SHOWERS, "id": 432511},
    {"title": "Modesty", "description": "Complete \"Mega Challenge: Shower\" without taking damage.", "points": 10, "offset": SkillPointsList[5], "bit": 4, "stage": THE_SHOWERS, "id": 432634},
    {"title": "It's a Delicacy Somewhere", "description": "Destroy all the Sargasso spores during \"Tracking the Kingpin\".", "points": 5, "offset": SkillPointsList[5], "bit": 5, "stage": SPACESHIP_GRAVEYARD, "id": 432635},
    {"title": "Revenant", "description": "Destroy every enemy in the Salvage Yard before the final door opens without being seen in the Spaceship Graveyard.", "points": 10, "offset": SkillPointsList[5], "bit": 6, "stage": SPACESHIP_GRAVEYARD, "id": 432636},
    {"title": "Punchy", "description": "Defeat all pirates using only punches in \"Saint Qwark\".", "points": 10, "offset": SkillPointsList[5], "bit": 7, "stage": SAINT_QWARK, "id": 432637},
    {"title": "Sour Victory", "description": "Kill the Kudzu Monster using only lemons in \"Saint Qwark\".", "points": 10, "offset": SkillPointsList[6], "bit": 0, "stage": SAINT_QWARK, "id": 432638},
    {"title": "Min-Maxing", "description": "Score 1,075 points in \"Escape the Kudzu\" (1,550 in Challenge Mode).", "points": 5, "offset": SkillPointsList[6], "bit": 1, "stage": QUASAR_FIELDS, "id": 432512},
    {"title": "I Kill the Rock", "description": "Kill all 3 MegaRock-class dreadnoughts.", "points": 10, "offset": SkillPointsList[6], "bit": 2, "stage": QUASAR_FIELDS, "id": 432546},
    {"title": "Whip It Good", "description": "Get 40 kills with the Plasma Whip or Plasma Chord during any Prison Breakout challenge.", "points": 5, "offset": SkillPointsList[6], "bit": 3, "stage": PRISON_BREAKOUT, "id": 432639},
    {"title": "Hanging Judge", "description": "Don't let any prisoners escape during \"Mega Challenge: Battle Royale\".", "points": 10, "offset": SkillPointsList[6], "bit": 4, "stage": PRISON_BREAKOUT, "id": 432640},
    {"title": "Yeeee Haaaaaw!", "description": "Perform a roll after jumping off a cliff in one of the Hydrano vehicle challenges.", "points": 2, "offset": SkillPointsList[6], "bit": 5, "stage": DAMS_EDGE, "id": 432641},
    {"title": "Offensive Driver", "description": "Complete the \"Rush Hour\" challenge with at least 60 seconds remaining.", "points": 5, "offset": SkillPointsList[6], "bit": 6, "stage": DAMS_EDGE, "id": 432642},
    {"title": "Slippery Slope", "description": "Hit 5 oil slicks without dying in the one of the Hydrano vehicle challenges.", "points": 5, "offset": SkillPointsList[6], "bit": 7, "stage": DAMS_EDGE, "id": 432513},
    {"title": "Ring around the Rosie", "description": "Collect all the rings in the \"Driving Test\" challenge.", "points": 5, "offset": SkillPointsList[7], "bit": 0, "stage": DAMS_EDGE, "id": 432643},
    {"title": "He Cleans Pools, Too!", "description": "Kill 20 enemies with a single lawnmower in \"A Fiction Full of Dollars!\".", "points": 10, "offset": SkillPointsList[7], "bit": 1, "stage": FICTION_FULL_OF_DOLLARS, "id": 432547},
    {"title": "Perfect Mirror", "description": "Complete \"A Fiction Full of Dollars!\" without the dam taking any damage.", "points": 10, "offset": SkillPointsList[7], "bit": 2, "stage": FICTION_FULL_OF_DOLLARS, "id": 432644},
    {"title": "Cereal Decoder Ring", "description": "Complete \"Knockin' on Klunk's Door\" in under 4 minutes and 30 seconds.", "points": 10, "offset": SkillPointsList[7], "bit": 3, "stage": BULKHEAD_LOCK, "id": 432645},
    {"title": "l33t h4xx0r", "description": "Don't fail any OmniKey puzzles during \"Clank under Glass\".", "points": 5, "offset": SkillPointsList[7], "bit": 4, "stage": UNDERWATER_BUNKER, "id": 432646},
    {"title": "Rust Proof", "description": "Don't fall in the water at any point during \"Clank under Glass\".", "points": 5, "offset": SkillPointsList[7], "bit": 5, "stage": UNDERWATER_BUNKER, "id": 432514},
    {"title": "I'm Not There", "description": "Complete \"Clank under Glass\" without being spotted by any enemies, fish, or lasers.", "points": 5, "offset": SkillPointsList[7], "bit": 6, "stage": UNDERWATER_BUNKER, "id": 432647},
    {"title": "Turn the Tables", "description": "Perform 4 successful takedowns in a row on Klunk during \"All the Marbles\".", "points": 10, "offset": SkillPointsList[7], "bit": 7, "stage": KLUNK_BOSS_ARENA, "id": 432648},
    {"title": "A Pretty Good Likeness", "description": "Complete \"All the Marbles\" without damaging Robo-Ratchet at all.", "points": 5, "offset": SkillPointsList[8], "bit": 0, "stage": KLUNK_BOSS_ARENA, "id": 432548}
]

for SkillPoint in SkillPointsListConstruct {
    AchievementTemplate(
        SkillPoint["title"],
        SkillPoint["description"],
        SkillPoint["points"],
        SkillPoint["id"],
        trigger =
        InGame() &&
        CheckUnlock(SkillPoint["offset"], SkillPoint["bit"]) &&
        StageID() == SkillPoint["stage"])
}

achievement(
    title = "Spymaster",
    description = "Obtain every skill point.",
    points = 50,
    id = 432649,
    trigger = InGame() &&
    measured(sum_of(SkillPointsList, addr => bitcount(addr)) == 65) &&
    prev(sum_of(SkillPointsList, addr => bitcount(addr))) == 64
)

//
// Titanium Bolt Achievements
//
TitaniumBolts = 0x008edba8

TitaniumBoltListConstruct = [
    {"title": "These Belong in a...Wait a Minute", "description": "Obtain all the Titanium Bolts on Boltair.", "points": 10, "stages": [BOLTAIRE_MUSEUM], "bits": [0, 1], "id": 432650},
    {"title": "Who Leaves Change This High Up?", "description": "Obtain the Titanium Bolt on the Asyanica Rooftops.", "points": 5, "stages": [ASYANICA], "bits": [12], "id": 432515},
    {"title": "Tourists Will Lose Anything", "description": "Obtain all the Titanium Bolts on Rionosis.", "points": 10, "stages": [AZCOTAL_ALLEY, GONDOLA_AND_JIVE], "bits": [36, 37, 38, 40], "id": 432655},
    {"title": "Now These Are Real Chips", "description": "Obtain the Titanium Bolt in the High-Rollers Casino.", "points": 5, "stages": [CASINO], "bits": [48], "id": 432656},
    {"title": "Experimental Currency", "description": "Obtain all the Titanium Bolts on Vanantonio.", "points": 10, "stages": [VENANTONIO_LABS], "bits": [60, 61], "id": 432657},
    {"title": "Straight from the Source", "description": "Obtain all the Titanium Bolts in Fort Sprocket.", "points": 10, "stages": [BOLT_RESERVE], "bits": [72, 73, 74], "id": 432549},
    {"title": "Prison Dosh", "description": "Obtain all the Titanium Bolts on the Prison Planet.", "points": 10, "stages": [MAX_SECURITY_CELLS, MESS_HALL, EXERCISE_YARD, THE_SHOWERS, PRISON_BREAKOUT], "bits": [8, 32, 52, 80, 96], "id": 432658},
    {"title": "Graverobbing", "description": "Obtain all the Titanium Bolts in the Spaceship Graveyard.", "points": 10, "stages": [SPACESHIP_GRAVEYARD], "bits": [84, 85, 86, 87], "id": 432659},
    {"title": "Stealing from the Villain", "description": "Obtain the Titanium Bolt on Hydrano.", "points": 5, "stages": [UNDERWATER_BUNKER], "bits": [112], "id": 432516}
]

for TitaniumBolt in TitaniumBoltListConstruct
{
  numBolts = length(TitaniumBolt["bits"])
  AchievementTemplate(
    TitaniumBolt["title"],
    TitaniumBolt["description"],
    TitaniumBolt["points"],
    TitaniumBolt["id"],
    trigger=
        InGame() &&
        __ornext(any_of(TitaniumBolt["stages"], s => s == StageID())) &&
        measured(sum_of(TitaniumBolt["bits"], b => CheckBit(TitaniumBolts, b)) == numBolts) &&
        sum_of(TitaniumBolt["bits"], b => prev(CheckBit(TitaniumBolts, b))) == numBolts - 1
  )
}

// 
// Alien Code Achievements
//
AlienCodeList = [0x008edbb8, 0x008edbb9, 0x008edbbc, 0x008edbbd, 0x008edbbe, 0x008edbbf, 0x008edbc1, 0x008edbc2, 0x008edbc6]

AlienCodeListConstruct = [
    {"title": "Messages from the Past", "description": "Find all the Alien Codes in Boltair Museum.", "points": 10, "stage": BOLTAIRE_MUSEUM, "bits": [0, 1, 2], "id": 432651},
    {"title": "Rooftop Graffiti", "description": "Find all the Alien Codes on the Asyanica Rooftops.", "points": 10, "stage": ASYANICA, "bits": [4, 5, 6], "id": 432660},
    {"title": "Wall Scrawl", "description": "Find all the Alien Codes in Azcotal Alley.", "points": 10, "stage": AZCOTAL_ALLEY, "bits": [4, 5 ,6], "id": 432661},
    {"title": "Sky Writing", "description": "Find all the Alien Codes on the Gondola Ascent.", "points": 10, "stage": GONDOLA_AND_JIVE, "bits": [0, 1, 2], "id": 432550},
    {"title": "The House Always Writes", "description": "Find all the Alien Codes in the High-Rollers Casino.", "points": 10, "stage": CASINO, "bits": [0, 1, 2], "id": 432662},
    {"title": "Solana Science Journal", "description": "Find all the Alien Codes in Venantonio Labs.", "points": 10, "stage": VENANTONIO_LABS, "bits": [4, 5, 6], "id": 432517},
    {"title": "Blank Cheque", "description": "Find all the Alien Codes in the Galactic Bolt Reserve.", "points": 10, "stage": BOLT_RESERVE, "bits": [0, 1, 2], "id": 432663},
    {"title": "Encoded Epitaphs", "description": "Find all the Alien Codes in the Spaceship Graveyard.", "points": 10, "stage": SPACESHIP_GRAVEYARD, "bits": [4, 5, 6], "id": 432666},
    {"title": "Klunky Codes", "description": "Find all the Alien Codes in the Underwater Bunker.", "points": 10, "stage": UNDERWATER_BUNKER, "bits": [0, 1, 2], "id": 432652}
]

for i in range(0, length(AlienCodeList) -1)
{   
    Code = AlienCodeListConstruct[i]
    AchievementTemplate(
        Code["title"],
        Code["description"],
        Code["points"],
        Code["id"],
        trigger =
        InGame() &&
        StageID() == Code["stage"] &&
        ChallengeModeActive() &&
        ThermOpticShadesObtained() &&
        measured(sum_of(Code["bits"], b => CheckBit(AlienCodeList[i], b)) == 3) &&
        sum_of(Code["bits"], b => prev(CheckBit(AlienCodeList[i], b))) == 2
    )
}


AchievementTemplate(
    "No Gurlz Alowd",
    "Visit the HIG Treehouse after collecting all of the Alien Codes.",
    25,
    cheevoid = 432667,
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
    //{"title": "Prison Scrubs Ratchet", "description": "Unlock the Prison Scrubs Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 0, "id": },
    {"title": "Lombaxxx", "description": "Unlock the Towel Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 1, "id": 432551},
    {"title": "Prior Heroics", "description": "Unlock several skins by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 2, "id": 460813},
    //{"title": "[VOID] Hang 6!", "description": "Unlock the Tropical Vacation skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 2, "id": 432518},
    //{"title": "[VOID] Ratchetzilla", "description": "Unlock the Ratchetzilla skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 3, "id": 432664},
    //{"title": "[VOID] Quest of Booty", "description": "Unlock the Plundering Pirate Captain skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 4, "id": 432668},
    //{"title": "[VOID] Intergalactic Lombax of Mystery", "description": "Unlock the Super Incognito Skin by importing a Ratchet & Clank: Size Matters save file.", "points": 1, "offset": SkinList[0], "bit": 5, "id": 432669},
    {"title": "Robo-Hero", "description": "Unlock the Robo-Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 6, "id": 432670},
    {"title": "I Know Clank-Fu", "description": "Unlock the Kung Fu Ratchet skin.", "points": 3, "offset": SkinList[0], "bit": 7, "id": 432519},
    {"title": "Rotten Lombax", "description": "Unlock the Zombie Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 0, "id": 432653},
    {"title": "A Friend, Dearly Missed", "description": "Unlock the Dan Ratchet skin.", "points": 3, "offset": SkinList[1], "bit": 1, "id": 432552},
    //{"title": "Suit Clank", "description": "", "points": 3, "offset": SkinList[1], "bit": 2, "id": },
    {"title": "Giddy Up Robo-Bronco", "description": "Unlock the Cowboy Clank skin.", "points": 3, "offset": SkinList[1], "bit": 3, "id": 432671},
    {"title": "Clan-Klunk!?", "description": "Unlock the Klunk Clank skin.", "points": 3, "offset": SkinList[1], "bit": 4, "id": 432672},
    {"title": "Let's Boogie", "description": "Unlock the 70s Clank skin.", "points": 3, "offset": SkinList[1], "bit": 5, "id": 432673},
    {"title": "The Long Metal Arm of the Law", "description": "Unlock the Cop Clank skin.", "points": 3, "offset": SkinList[1], "bit": 6, "id": 432520},
    {"title": "Will it Blend?", "description": "Unlock the Blender Clank skin.", "points": 3, "offset": SkinList[1], "bit": 7, "id": 432665},
    {"title": "Zoni!", "description": "Unlock the Zoni Clank skin.", "points": 3, "offset": SkinList[2], "bit": 0, "id": 432674},
    //{"title": "Regular Qwark", "description": "", "points": 3, "offset": SkinList[2], "bit": 1, "id": },
    {"title": "20 Gallon Hat", "description": "Unlock the Cowboy Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 2, "id": 432553},
    {"title": "Housekeeping!", "description": "Unlock the Maid Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 3, "id": 432654},
    {"title": "EL QWARKO", "description": "Unlock the Lucha Libre Qwark skin.", "points": 3, "offset": SkinList[2], "bit": 4, "id": 432675}
]

for SkinUnlocked in SkinListConstruct {
    AchievementTemplate(
        SkinUnlocked["title"],
        SkinUnlocked["description"],
        SkinUnlocked["points"],
        SkinUnlocked["id"],
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

rich_presence_conditional_display(CurrentCharacter == RATCHET && CurrentStage == MAIN_MENU, "In the main menu")

rich_presence_conditional_display(CurrentCharacter == GADGEBOTS && CurrentStage == ASYANICA, "Gadgebots | Rooftop Deathtrap | Bolts: {0}",
    rp_bolt_count
)

rich_presence_conditional_display(CurrentCharacter == CLANK && CurrentStage == ASYANICA, "Clank | Asyanica Rooftops | Bolts: {0} | Equipped: {1}",
    rp_bolt_count,
    rp_clank_weapon
)

rich_presence_conditional_display(CurrentCharacter == CLANK && CurrentStage == GONDOLA_AND_JIVE, "Clank | Gondola Ascent | Bolts: {0} | Equipped: {1}",
    rp_bolt_count,
    rp_clank_weapon
)

rich_presence_conditional_display(CurrentCharacter == QWARK && CurrentStage == GONDOLA_AND_JIVE, "Qwark | Suck and Jive | Bolts: {0}",
    rp_bolt_count
)

rich_presence_conditional_display(CurrentCharacter == RATCHET, "{0} | {1} | Bolts: {2} | Equipped: {3}",
    rp_current_character,
    rp_current_stage,
    rp_bolt_count,
    rp_ratchet_weapon
)

rich_presence_conditional_display(CurrentCharacter == CLANK, "{0} | {1} | Bolts: {2} | Equipped: {3}",
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
