// Pokemon Emerald Version [Subset - Professor Oak Challenge]
// #ID = 24186

// $000E08: In-Game Check [8-Bit]
//          0x01 = In Game
function InGameCheck() => byte(0x000E08)

// $005D8C: [24-Bit] Pointer
//          
//          +0x937C=
//          bit7=Stone Badge
//          +0x937D=
//          bit0=Knuckle Badge
//          bit1=Dynamo Badge
//          bit2=Heat Badge
//          bit3=Balance Badge
//          bit4=Feather Badge
//          bit5=Mind Badge
//          bit6=Rain Badge
//          
//          +0x707C=Pokedex Caught Start
//          +0x709C=
//          bit1=Mudkip
//          +0x70A7=
//          bit6=Castform
function Pointer() => tbyte(0x005D8C)

// $00707C: [Pokedex Offesets Start]
//          
//          Bit 0 - Bulbasaur
//          Bit 1 - Ivysaur
//          Bit 2 - Venusaur
//          Bit 3 - Charmander
//          Bit 4 - Charmeleon
//          Bit 5 - Charizard
//          Bit 6 - Squirtle
//          Bit 7 - Wartortle
function PokedexOffesetsStart() => byte(0x00707C)

// $00707D: [Pokedex Offesets Start]
//          
//          Bit 0 - Blastoise
//          Bit 1 - Caterpie
//          Bit 2 - Metapod
//          Bit 3 - Butterfree
//          Bit 4 - Weedle
//          Bit 5 - Kakuna
//          Bit 6 - Beedrill
//          Bit 7 - Pidgey
function PokedexOffesetsStart() => byte(0x00707D)

// $00707E: [Pokedex Offesets Start]
//          
//          Bit 0 - Pidgeotto
//          Bit 1 - Pidgeot
//          Bit 2 - Rattata
//          Bit 3 - Raticate
//          Bit 4 - Spearow
//          Bit 5 - Fearow
//          Bit 6 - Ekans
//          Bit 7 - Arbok
function PokedexOffesetsStart() => byte(0x00707E)

// $00707F: [Pokedex Offesets Start]
//          
//          Bit 0 - Pikachu
//          Bit 1 - Raichu
//          Bit 2 - Sandshrew
//          Bit 3 - Sandslash
//          Bit 4 - NidoranF
//          Bit 5 - Nidorina
//          Bit 6 - Nidoqueen
//          Bit 7 - NidoranM
function PokedexOffesetsStart() => byte(0x00707F)

// $007080: [Pokedex Offesets Start]
//          
//          Bit 0 - Nidorino
//          Bit 1 - Nidoking
//          Bit 2 - Clefairy
//          Bit 3 - Clefable
//          Bit 4 - Vulpix
//          Bit 5 - Ninetales
//          Bit 6 - Jigglypuff
//          Bit 7 - Wigglytuff
function PokedexOffesetsStart() => byte(0x007080)

// $007081: [Pokedex Offesets Start]
//          
//          Bit 0 - Zubat
//          Bit 1 - Golbat
//          Bit 2 - Oddish
//          Bit 3 - Gloom
//          Bit 4 - Vileplume
//          Bit 5 - Paras
//          Bit 6 - Parasect
//          Bit 7 - Venonat
function PokedexOffesetsStart() => byte(0x007081)

// $007082: [Pokedex Offesets Start]
//          
//          Bit 0 - Venomoth
//          Bit 1 - Diglett
//          Bit 2 - Dugtrio
//          Bit 3 - Meowth
//          Bit 4 - Persian
//          Bit 5 - Psyduck
//          Bit 6 - Golduck
//          Bit 7 - Mankey
function PokedexOffesetsStart() => byte(0x007082)

// $007083: [Pokedex Offesets Start]
//          
//          Bit 0 - Primeape
//          Bit 1 - Growlithe
//          Bit 2 - Arcanine
//          Bit 3 - Poliwag
//          Bit 4 - Poliwhirl
//          Bit 5 - Poliwrath
//          Bit 6 - Abra
//          Bit 7 - Kadabra
function PokedexOffesetsStart() => byte(0x007083)

// $007084: [Pokedex Offesets Start]
//          
//          Bit 0 - Alakazam
//          Bit 1 - Machop
//          Bit 2 - Machoke
//          Bit 3 - Machamp
//          Bit 4 - Bellsprout
//          Bit 5 - Weepinbell
//          Bit 6 - Victreebel
//          Bit 7 - Tentacool
function PokedexOffesetsStart() => byte(0x007084)

// $007085: [Pokedex Offesets Start]
//          
//          Bit 0 - Tentacruel
//          Bit 1 - Geodude
//          Bit 2 - Graveler
//          Bit 3 - Golem
//          Bit 4 - Ponyta
//          Bit 5 - Rapidash
//          Bit 6 - Slowpoke
//          Bit 7 - Slowbro
function PokedexOffesetsStart() => byte(0x007085)

// $007086: [Pokedex Offesets Start]
//          
//          Bit 0 - Magnemite
//          Bit 1 - Magneton
//          Bit 2 - Farfetch'd
//          Bit 3 - Doduo
//          Bit 4 - Dodrio
//          Bit 5 - Seel
//          Bit 6 - Dewgong
//          Bit 7 - Grimer
function PokedexOffesetsStart() => byte(0x007086)

// $007087: [Pokedex Offesets Start]
//          
//          Bit 0 - Muk
//          Bit 1 - Shellder
//          Bit 2 - Cloyster
//          Bit 3 - Gastly
//          Bit 4 - Haunter
//          Bit 5 - Gengar
//          Bit 6 - Onix
//          Bit 7 - Drowzee
function PokedexOffesetsStart() => byte(0x007087)

// $007088: [Pokedex Offesets Start]
//          
//          Bit 0 - Hypno
//          Bit 1 - Krabby
//          Bit 2 - Kingler
//          Bit 3 - Voltorb
//          Bit 4 - Electrode
//          Bit 5 - Exeggcute
//          Bit 6 - Exeggutor
//          Bit 7 - Cubone
function PokedexOffesetsStart() => byte(0x007088)

// $007089: [Pokedex Offesets Start]
//          
//          Bit 0 - Marowak
//          Bit 1 - Hitmonlee
//          Bit 2 - Hitmonchan
//          Bit 3 - Lickitung
//          Bit 4 - Koffing
//          Bit 5 - Weezing
//          Bit 6 - Rhyhorn
//          Bit 7 - Rhydon
function PokedexOffesetsStart() => byte(0x007089)

// $00708A: [Pokedex Offesets Start]
//          
//          Bit 0 - Chansey
//          Bit 1 - Tangela
//          Bit 2 - Kangaskhan
//          Bit 3 - Horsea
//          Bit 4 - Seadra
//          Bit 5 - Goldeen
//          Bit 6 - Seaking
//          Bit 7 - Staryu
function PokedexOffesetsStart() => byte(0x00708A)

// $00708B: [Pokedex Offesets Start]
//          
//          Bit 0 - Starmie
//          Bit 1 - Mr. Mime
//          Bit 2 - Scyther
//          Bit 3 - Jynx
//          Bit 4 - Electabuzz
//          Bit 5 - Magmar
//          Bit 6 - Pinsir
//          Bit 7 - Tauros
function PokedexOffesetsStart() => byte(0x00708B)

// $00708C: [Pokedex Offesets Start]
//          
//          Bit 0 - Magikarp
//          Bit 1 - Gyarados
//          Bit 2 - Lapras
//          Bit 3 - Ditto
//          Bit 4 - Eevee
//          Bit 5 - Vaporeon
//          Bit 6 - Jolteon
//          Bit 7 - Flareon
function PokedexOffesetsStart() => byte(0x00708C)

// $00708D: [Pokedex Offesets Start]
//          
//          Bit 0 - Porygon
//          Bit 1 - Omanyte
//          Bit 2 - Omastar
//          Bit 3 - Kabuto
//          Bit 4 - Kabutops
//          Bit 5 - Aerodactyl
//          Bit 6 - Snorlax
//          Bit 7 - Articuno
function PokedexOffesetsStart() => byte(0x00708D)

// $00708E: [Pokedex Offesets Start]
//          
//          Bit 0 - Zapdos
//          Bit 1 - Moltres
//          Bit 2 - Dratini
//          Bit 3 - Dragonair
//          Bit 4 - Dragonite
//          Bit 5 - Mewtwo
//          Bit 6 - Mew
//          Bit 7 - Chikorita
function PokedexOffesetsStart() => byte(0x00708E)

// $00708F: [Pokedex Offesets Start]
//          
//          Bit 0 - Bayleef
//          Bit 1 - Meganium
//          Bit 2 - Cyndaquil
//          Bit 3 - Quilava
//          Bit 4 - Typhlosion
//          Bit 5 - Totodile
//          Bit 6 - Croconaw
//          Bit 7 - Feraligatr
function PokedexOffesetsStart() => byte(0x00708F)

// $007090: [Pokedex Offesets Start]
//          
//          Bit 0 - Sentret
//          Bit 1 - Furret
//          Bit 2 - Hoothoot
//          Bit 3 - Noctowl
//          Bit 4 - Ledyba
//          Bit 5 - Ledian
//          Bit 6 - Spinarak
//          Bit 7 - Ariados
function PokedexOffesetsStart() => byte(0x007090)

// $007091: [Pokedex Offesets Start]
//          
//          Bit 0 - Crobat
//          Bit 1 - Chinchou
//          Bit 2 - Lanturn
//          Bit 3 - Pichu
//          Bit 4 - Cleffa
//          Bit 5 - Igglybuff
//          Bit 6 - Togepi
//          Bit 7 - Togetic
function PokedexOffesetsStart() => byte(0x007091)

// $007092: [Pokedex Offesets Start]
//          
//          Bit 0 - Natu
//          Bit 1 - Xatu
//          Bit 2 - Mareep
//          Bit 3 - Flaaffy
//          Bit 4 - Ampharos
//          Bit 5 - Bellossom
//          Bit 6 - Marill
//          Bit 7 - Azumarill
function PokedexOffesetsStart() => byte(0x007092)

// $007093: [Pokedex Offesets Start]
//          
//          Bit 0 - Sudowoodo
//          Bit 1 - Politoed
//          Bit 2 - Hoppip
//          Bit 3 - Skiploom
//          Bit 4 - Jumpluff
//          Bit 5 - Aipom
//          Bit 6 - Sunkern
//          Bit 7 - Sunflora
function PokedexOffesetsStart() => byte(0x007093)

// $007094: [Pokedex Offesets Start]
//          
//          Bit 0 - Yanma
//          Bit 1 - Wooper
//          Bit 2 - Quagsire
//          Bit 3 - Espeon
//          Bit 4 - Umbreon
//          Bit 5 - Murkrow
//          Bit 6 - Slowking
//          Bit 7 - Misdreavus
function PokedexOffesetsStart() => byte(0x007094)

// $007095: [Pokedex Offesets Start]
//          
//          Bit 0 - Unown
//          Bit 1 - Wobbuffet
//          Bit 2 - Girafarig
//          Bit 3 - Pineco
//          Bit 4 - Forretress
//          Bit 5 - Dunsparce
//          Bit 6 - Gligar
//          Bit 7 - Steelix
function PokedexOffesetsStart() => byte(0x007095)

// $007096: [Pokedex Offesets Start]
//          
//          Bit 0 - Snubbull
//          Bit 1 - Granbull
//          Bit 2 - Qwilfish
//          Bit 3 - Scizor
//          Bit 4 - Shuckle
//          Bit 5 - Heracross
//          Bit 6 - Sneasel
//          Bit 7 - Teddiursa
function PokedexOffesetsStart() => byte(0x007096)

// $007097: [Pokedex Offesets Start]
//          
//          Bit 0 - Ursaring
//          Bit 1 - Slugma
//          Bit 2 - Magcargo
//          Bit 3 - Swinub
//          Bit 4 - Piloswine
//          Bit 5 - Corsola
//          Bit 6 - Remoraid
//          Bit 7 - Octillery
function PokedexOffesetsStart() => byte(0x007097)

// $007098: [Pokedex Offesets Start]
//          
//          Bit 0 - Delibird
//          Bit 1 - Mantine
//          Bit 2 - Skarmory
//          Bit 3 - Houndour
//          Bit 4 - Houndoom
//          Bit 5 - Kingdra
//          Bit 6 - Phanpy
//          Bit 7 - Donphan
function PokedexOffesetsStart() => byte(0x007098)

// $007099: [Pokedex Offesets Start]
//          
//          Bit 0 - Porygon2
//          Bit 1 - Stantler
//          Bit 2 - Smeargle
//          Bit 3 - Tyrogue
//          Bit 4 - Hitmontop
//          Bit 5 - Smoochum
//          Bit 6 - Elekid
//          Bit 7 - Magby
function PokedexOffesetsStart() => byte(0x007099)

// $00709A: [Pokedex Offesets Start]
//          
//          Bit 0 - Miltank
//          Bit 1 - Blissey
//          Bit 2 - Raikou
//          Bit 3 - Entei
//          Bit 4 - Suicune
//          Bit 5 - Larvitar
//          Bit 6 - Pupitar
//          Bit 7 - Tyranitar
function PokedexOffesetsStart() => byte(0x00709A)

// $00709B: [Pokedex Offesets Start]
//          
//          Bit 0 - Lugia
//          Bit 1 - Ho-oh
//          Bit 2 - Celebi
//          Bit 3 - Treecko
//          Bit 4 - Grovyle
//          Bit 5 - Sceptile
//          Bit 6 - Torchic
//          Bit 7 - Combusken
function PokedexOffesetsStart() => byte(0x00709B)

// $00709C: [Pokedex Offesets Start]
//          
//          Bit 0 - Blaziken
//          Bit 1 - Mudkip
//          Bit 2 - Marshtomp
//          Bit 3 - Swampert
//          Bit 4 - Poochyena
//          Bit 5 - Mightyena
//          Bit 6 - Zigzagoon
//          Bit 7 - Linoone
function PokedexOffesetsStart() => byte(0x00709C)

// $00709D: [Pokedex Offesets Start]
//          
//          Bit 0 - Wurmple
//          Bit 1 - Silcoon
//          Bit 2 - Beautifly
//          Bit 3 - Cascoon
//          Bit 4 - Dustox
//          Bit 5 - Lotad
//          Bit 6 - Lombre
//          Bit 7 - Ludicolo
function PokedexOffesetsStart() => byte(0x00709D)

// $00709E: [Pokedex Offesets Start]
//          
//          Bit 0 - Seedot
//          Bit 1 - Nuzleaf
//          Bit 2 - Shiftry
//          Bit 3 - Tailow
//          Bit 4 - Swellow
//          Bit 5 - Wingull
//          Bit 6 - Pelipper
//          Bit 7 - Ralts
function PokedexOffesetsStart() => byte(0x00709E)

// $00709F: [Pokedex Offesets Start]
//          
//          Bit 0 - Kirlia
//          Bit 1 - Gardevoir
//          Bit 2 - Surskit
//          Bit 3 - Masquerain
//          Bit 4 - Shroomish
//          Bit 5 - Breloom
//          Bit 6 - Slakoth
//          Bit 7 - Vigoroth
function PokedexOffesetsStart() => byte(0x00709F)

// $0070A0: [Pokedex Offesets Start]
//          
//          Bit 0 - Slaking
//          Bit 1 - Nincada
//          Bit 2 - Ninjask
//          Bit 3 - Shedinja
//          Bit 4 - Whismur
//          Bit 5 - Loudred
//          Bit 6 - Exploud
//          Bit 7 - Makuhita
function PokedexOffesetsStart() => byte(0x0070A0)

// $0070A1: [Pokedex Offesets Start]
//          
//          Bit 0 - Hariyama
//          Bit 1 - Azurill
//          Bit 2 - Nosepass
//          Bit 3 - Skitty
//          Bit 4 - Delcatty
//          Bit 5 - Sableye
//          Bit 6 - Mawile
//          Bit 7 - Aron
function PokedexOffesetsStart() => byte(0x0070A1)

// $0070A2: [Pokedex Offesets Start]
//          
//          Bit 0 - Lairon
//          Bit 1 - Aggron
//          Bit 2 - Meditite
//          Bit 3 - Medicham
//          Bit 4 - Electrike
//          Bit 5 - Manectric
//          Bit 6 - Plusle
//          Bit 7 - Minun
function PokedexOffesetsStart() => byte(0x0070A2)

// $0070A3: [Pokedex Offesets Start]
//          
//          Bit 0 - Volbeat
//          Bit 1 - Illumise
//          Bit 2 - Roselia
//          Bit 3 - Gulpin
//          Bit 4 - Swalot
//          Bit 5 - Carvanha
//          Bit 6 - Sharpedo
//          Bit 7 - Wailmer
function PokedexOffesetsStart() => byte(0x0070A3)

// $0070A4: [Pokedex Offesets Start]
//          
//          Bit 0 - Wailord
//          Bit 1 - Numel
//          Bit 2 - Camerupt
//          Bit 3 - Torkoal
//          Bit 4 - Spoink
//          Bit 5 - Grumpig
//          Bit 6 - Spinda
//          Bit 7 - Trapinch
function PokedexOffesetsStart() => byte(0x0070A4)

// $0070A5: [Pokedex Offesets Start]
//          
//          Bit 0 - Vibrava
//          Bit 1 - Flygon
//          Bit 2 - Cacnea
//          Bit 3 - Cacturne
//          Bit 4 - Swablu
//          Bit 5 - Altaria
//          Bit 6 - Zangoose
//          Bit 7 - Seviper
function PokedexOffesetsStart() => byte(0x0070A5)

// $0070A6: [Pokedex Offesets Start]
//          
//          Bit 0 - Lunatone
//          Bit 1 - Solrock
//          Bit 2 - Barboach
//          Bit 3 - Whiscash
//          Bit 4 - Corphish
//          Bit 5 - Crawdaunt
//          Bit 6 - Baltoy
//          Bit 7 - Claydol
function PokedexOffesetsStart() => byte(0x0070A6)

// $0070A7: [Pokedex Offesets Start]
//          
//          Bit 0 - Lileep
//          Bit 1 - Cradily
//          Bit 2 - Anorith
//          Bit 3 - Armaldo
//          Bit 4 - Feebas
//          Bit 5 - Milotic
//          Bit 6 - Castform
//          Bit 7 - Kecleon
function PokedexOffesetsStart() => byte(0x0070A7)

// $0070A8: [Pokedex Offesets Start]
//          
//          Bit 0 - Shuppet
//          Bit 1 - Banette
//          Bit 2 - Duskull
//          Bit 3 - Dusclops
//          Bit 4 - Tropius
//          Bit 5 - Chimecho
//          Bit 6 - Absol
//          Bit 7 - Wynaut
function PokedexOffesetsStart() => byte(0x0070A8)

// $0070A9: [Pokedex Offesets Start]
//          
//          Bit 0 - Snorunt
//          Bit 1 - Glalie
//          Bit 2 - Spheal
//          Bit 3 - Sealeo
//          Bit 4 - Walrein
//          Bit 5 - Clamperl
//          Bit 6 - Huntail
//          Bit 7 - Gorebyss
function PokedexOffesetsStart() => byte(0x0070A9)

// $0070AA: [Pokedex Offesets Start]
//          
//          Bit 0 - Relicanth
//          Bit 1 - Luvdisc
//          Bit 2 - Bagon
//          Bit 3 - Shelgon
//          Bit 4 - Salamence
//          Bit 5 - Beldum
//          Bit 6 - Metang
//          Bit 7 - Metagross
function PokedexOffesetsStart() => byte(0x0070AA)

// $0070AB: [Pokedex Offesets Start]
//          
//          Bit 0 - Regirock
//          Bit 1 - Regice
//          Bit 2 - Registeel
//          Bit 3 - Latias
//          Bit 4 - Latios
//          Bit 5 - Kyogre
//          Bit 6 - Groudon
//          Bit 7 - Rayquaza
function PokedexOffesetsStart() => byte(0x0070AB)

// $0070AC: [Pokedex Offesets Start]
//          
//          Bit 0 - Jirachi
//          Bit 1 - Deoxys
function PokedexOffesetsStart() => byte(0x0070AC)

// $043C80: Map Bank
function MapBank() => byte(0x043C80)

// $043C81: Sub Map
function SubMap() => byte(0x043C81)

function PrevSubMap() => byte(0x043C83)

// Opponent Pokemon Health Mapping
function Opp1Health() => byte(0x02c79a)
function Opp2Health() => byte(0x02c7fe)
function Opp3Health() => byte(0x02c862)
function Opp4Health() => byte(0x02c8c6)
function Opp5Health() => byte(0x02c92a)
function Opp6Health() => byte(0x02c98e)

//Array of offsets
BadgeOffsetArray = [ 0x937C, 0x937D ]

function SumOfBadges()
{
    BadgeSum = bitcount(Pointer() + 0x937D) - bit7(Pointer() + 0x937D) + bit7(Pointer() + 0x937C)
    return BadgeSum
}

// Check Player is in game
function PlayerInGame() => InGameCheck() != 0
function PlayerNotInGame() => InGameCheck() == 0

// Check Main Pointer is not null
function PointerNotNull() => Pointer() != 0

// Catchable Pokemon List
// "badges" = exact badge count the Pokemon must be obtained with (8 = after Winona / post-game)
CatchableList =
{  
    1: {"title": "Poochyena", "description": "Register a Poochyena before obtaining the Stone Badge.", "points": 1, "num": 261, "badges": 0, "id": 339795, "badge": "383470"},
    2: {"title": "Mightyena", "description": "Register a Mightyena before obtaining the Stone Badge.", "points": 2, "num": 262, "badges": 0, "id": 339797, "badge": "383481"},
    3: {"title": "Zigzagoon", "description": "Register a Zigzagoon before obtaining the Stone Badge.", "points": 1, "num": 263, "badges": 0, "id": 339798, "badge": "383482"},
    4: {"title": "Linoone", "description": "Register a Linoone before obtaining the Stone Badge.", "points": 2, "num": 264, "badges": 0, "id": 339799, "badge": "383483"},
    5: {"title": "Wurmple", "description": "Register a Wurmple before obtaining the Stone Badge.", "points": 1, "num": 265, "badges": 0, "id": 339800, "badge": "383484"},
    6: {"title": "Silcoon", "description": "Register a Silcoon before obtaining the Stone Badge.", "points": 2, "num": 266, "badges": 0, "id": 339801, "badge": "383485"},
    7: {"title": "Beautifly", "description": "Register a Beautifly before obtaining the Stone Badge.", "points": 3, "num": 267, "badges": 0, "id": 339802, "badge": "383486"},
    8: {"title": "Cascoon", "description": "Register a Cascoon before obtaining the Stone Badge.", "points": 2, "num": 268, "badges": 0, "id": 339803, "badge": "383487"},
    9: {"title": "Dustox", "description": "Register a Dustox before obtaining the Stone Badge.", "points": 3, "num": 269, "badges": 0, "id": 339804, "badge": "383488"},
    10: {"title": "Lotad", "description": "Register a Lotad before obtaining the Stone Badge.", "points": 1, "num": 270, "badges": 0, "id": 339805, "badge": "383489"},
    11: {"title": "Lombre", "description": "Register a Lombre before obtaining the Stone Badge.", "points": 2, "num": 271, "badges": 0, "id": 339806, "badge": "383490"},
    12: {"title": "Ludicolo", "description": "Register a Ludicolo while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 3, "num": 272, "badges": 6, "id": 339807, "badge": "383491"},
    13: {"title": "Seedot", "description": "Register a Seedot before obtaining the Stone Badge.", "points": 1, "num": 273, "badges": 0, "id": 339808, "badge": "383492"},
    14: {"title": "Nuzleaf", "description": "Register a Nuzleaf before obtaining the Stone Badge.", "points": 2, "num": 274, "badges": 0, "id": 339809, "badge": "383493"},
    15: {"title": "Shiftry", "description": "Register a Shiftry while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges or after also obtaining the Mind Badge.", "points": 3, "num": 275, "badges": 6, "id": 339810, "badge": "383494"},
    16: {"title": "Taillow", "description": "Register a Taillow before obtaining the Stone Badge.", "points": 1, "num": 276, "badges": 0, "id": 339811, "badge": "383495"},
    17: {"title": "Swellow", "description": "Register a Swellow before obtaining the Stone Badge.", "points": 2, "num": 277, "badges": 0, "id": 339812, "badge": "383496"},
    18: {"title": "Wingull", "description": "Register a Wingull before obtaining the Stone Badge.", "points": 1, "num": 278, "badges": 0, "id": 339813, "badge": "383497"},
    19: {"title": "Pelipper", "description": "Register a Pelipper before obtaining the Stone Badge.", "points": 2, "num": 279, "badges": 0, "id": 339814, "badge": "383498"},
    20: {"title": "Ralts", "description": "Register a Ralts before obtaining the Stone Badge.", "points": 1, "num": 280, "badges": 0, "id": 339815, "badge": "383499"},
    21: {"title": "Kirlia", "description": "Register a Kirlia before obtaining the Stone Badge.", "points": 2, "num": 281, "badges": 0, "id": 339816, "badge": "383500"},
    22: {"title": "Gardevoir", "description": "Register a Gardevoir before obtaining the Stone Badge.", "points": 3, "num": 282, "badges": 0, "id": 339817, "badge": "383501"},
    23: {"title": "Shroomish", "description": "Register a Shroomish before obtaining the Stone Badge.", "points": 1, "num": 285, "badges": 0, "id": 339818, "badge": "383502"},
    24: {"title": "Breloom", "description": "Register a Breloom before obtaining the Stone Badge.", "points": 2, "num": 286, "badges": 0, "id": 339819, "badge": "383503"},
    25: {"title": "Slakoth", "description": "Register a Slakoth before obtaining the Stone Badge.", "points": 1, "num": 287, "badges": 0, "id": 339820, "badge": "383504"},
    26: {"title": "Vigoroth", "description": "Register a Vigoroth before obtaining the Stone Badge.", "points": 2, "num": 288, "badges": 0, "id": 339821, "badge": "383505"},
    27: {"title": "Slaking", "description": "Register a Slaking before obtaining the Stone Badge.", "points": 3, "num": 289, "badges": 0, "id": 339822, "badge": "383506"},
    28: {"title": "Abra", "description": "Register an Abra before obtaining the Stone Badge.", "points": 1, "num": 63, "badges": 0, "id": 339823, "badge": "383507"},
    29: {"title": "Kadabra", "description": "Register a Kadabra before obtaining the Stone Badge.", "points": 2, "num": 64, "badges": 0, "id": 339824, "badge": "383508"},
    30: {"title": "Nincada", "description": "Register a Nincada before obtaining the Stone Badge.", "points": 1, "num": 290, "badges": 0, "id": 339825, "badge": "383509"},
    31: {"title": "Ninjask", "description": "Register a Ninjask before obtaining the Stone Badge.", "points": 2, "num": 291, "badges": 0, "id": 339826, "badge": "383510"},
    32: {"title": "Shedinja", "description": "Register a Shedinja before obtaining the Stone Badge.", "points": 2, "num": 292, "badges": 0, "id": 339827, "badge": "383511"},
    33: {"title": "Whismur", "description": "Register a Whismur before obtaining the Stone Badge.", "points": 1, "num": 293, "badges": 0, "id": 339828, "badge": "383512"},
    34: {"title": "Loudred", "description": "Register a Loudred before obtaining the Stone Badge.", "points": 2, "num": 294, "badges": 0, "id": 339829, "badge": "383513"},
    35: {"title": "Exploud", "description": "Register an Exploud before obtaining the Stone Badge.", "points": 3, "num": 295, "badges": 0, "id": 339830, "badge": "383514"},
    36: {"title": "Makuhita", "description": "Register a Makuhita while holding only the Stone Badge.", "points": 1, "num": 296, "badges": 1, "id": 339831, "badge": "383515"},
    37: {"title": "Hariyama", "description": "Register a Hariyama while holding only the Stone Badge.", "points": 2, "num": 297, "badges": 1, "id": 339832, "badge": "383516"},
    38: {"title": "Goldeen", "description": "Register a Goldeen while holding only the Stone Badge.", "points": 1, "num": 118, "badges": 1, "id": 339833, "badge": "383517"},
    39: {"title": "Seaking", "description": "Register a Seaking while holding only the Stone Badge.", "points": 2, "num": 119, "badges": 1, "id": 339834, "badge": "383518"},
    40: {"title": "Magikarp", "description": "Register a Magikarp while holding only the Stone Badge.", "points": 1, "num": 129, "badges": 1, "id": 339835, "badge": "383519"},
    41: {"title": "Gyarados", "description": "Register a Gyarados while holding only the Stone Badge.", "points": 2, "num": 130, "badges": 1, "id": 339836, "badge": "383520"},
    42: {"title": "Azurill", "description": "Register an Azurill while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 298, "badges": 5, "id": 339837, "badge": "383521"},
    43: {"title": "Marill", "description": "Register a Marill before obtaining the Stone Badge.", "points": 2, "num": 183, "badges": 0, "id": 339838, "badge": "383522"},
    44: {"title": "Azumarill", "description": "Register an Azumarill before obtaining the Stone Badge.", "points": 3, "num": 184, "badges": 0, "id": 339839, "badge": "383523"},
    45: {"title": "Geodude", "description": "Register a Geodude while holding only the Stone Badge.", "points": 1, "num": 74, "badges": 1, "id": 339840, "badge": "383524"},
    46: {"title": "Graveler", "description": "Register a Graveler while holding only the Stone Badge.", "points": 2, "num": 75, "badges": 1, "id": 339841, "badge": "383525"},
    47: {"title": "Nosepass", "description": "Register a Nosepass while holding only the Stone and Dynamo Badges.", "points": 1, "num": 299, "badges": 2, "id": 339842, "badge": "383526"},
    48: {"title": "Skitty", "description": "Register a Skitty before obtaining the Stone Badge.", "points": 1, "num": 300, "badges": 0, "id": 339843, "badge": "383527"},
    49: {"title": "Delcatty", "description": "Register a Delcatty while holding only the Stone and Dynamo Badges.", "points": 2, "num": 301, "badges": 2, "id": 339844, "badge": "383528"},
    50: {"title": "Zubat", "description": "Register a Zubat while holding only the Stone Badge.", "points": 1, "num": 41, "badges": 1, "id": 339845, "badge": "383529"},
    51: {"title": "Golbat", "description": "Register a Golbat while holding only the Stone Badge.", "points": 2, "num": 42, "badges": 1, "id": 339846, "badge": "383530"},
    52: {"title": "Crobat", "description": "Register a Crobat while holding only the Stone Badge.", "points": 3, "num": 169, "badges": 1, "id": 339847, "badge": "383531"},
    53: {"title": "Tentacool", "description": "Register a Tentacool while holding only the Stone Badge.", "points": 1, "num": 72, "badges": 1, "id": 339848, "badge": "383532"},
    54: {"title": "Tentacruel", "description": "Register a Tentacruel while holding only the Stone Badge.", "points": 2, "num": 73, "badges": 1, "id": 339849, "badge": "383533"},
    55: {"title": "Sableye", "description": "Register a Sableye while holding only the Stone Badge.", "points": 1, "num": 302, "badges": 1, "id": 339850, "badge": "383534"},
    56: {"title": "Mawile", "description": "Register a Mawile while holding only the Stone, Dynamo, Heat, Knuckle, Balance, Mind and Rain Badges.", "points": 1, "num": 303, "badges": 7, "id": 339851, "badge": "383535"},
    57: {"title": "Aron", "description": "Register an Aron while holding only the Stone Badge.", "points": 1, "num": 304, "badges": 1, "id": 339852, "badge": "383536"},
    58: {"title": "Lairon", "description": "Register a Lairon while holding only the Stone Badge.", "points": 2, "num": 305, "badges": 1, "id": 339853, "badge": "383537"},
    59: {"title": "Aggron", "description": "Register an Aggron while holding only the Stone Badge.", "points": 3, "num": 306, "badges": 1, "id": 339854, "badge": "383538"},
    60: {"title": "Machop", "description": "Register a Machop while holding only the Stone and Dynamo Badges.", "points": 1, "num": 66, "badges": 2, "id": 339855, "badge": "383539"},
    61: {"title": "Machoke", "description": "Register a Machoke while holding only the Stone and Dynamo Badges.", "points": 2, "num": 67, "badges": 2, "id": 339856, "badge": "383540"},
    62: {"title": "Electrike", "description": "Register an Electrike while holding only the Stone Badge.", "points": 1, "num": 309, "badges": 1, "id": 339857, "badge": "383542"},
    63: {"title": "Manectric", "description": "Register a Manectric while holding only the Stone Badge.", "points": 2, "num": 310, "badges": 1, "id": 339858, "badge": "383543"},
    64: {"title": "Plusle", "description": "Register a Plusle while holding only the Stone Badge.", "points": 1, "num": 311, "badges": 1, "id": 339859, "badge": "383544"},
    65: {"title": "Minun", "description": "Register a Minun while holding only the Stone Badge.", "points": 1, "num": 312, "badges": 1, "id": 339860, "badge": "383545"},
    66: {"title": "Magnemite", "description": "Register a Magnemite while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 81, "badges": 5, "id": 339861, "badge": "383546"},
    67: {"title": "Magneton", "description": "Register a Magneton while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 82, "badges": 5, "id": 339862, "badge": "383547"},
    68: {"title": "Voltorb", "description": "Register a Voltorb while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 100, "badges": 5, "id": 339863, "badge": "383548"},
    69: {"title": "Electrode", "description": "Register an Electrode while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 101, "badges": 5, "id": 339864, "badge": "383549"},
    70: {"title": "Volbeat", "description": "Register a Volbeat while holding only the Stone Badge.", "points": 1, "num": 313, "badges": 1, "id": 339865, "badge": "383550"},
    71: {"title": "Illumise", "description": "Register an Illumise while holding only the Stone Badge.", "points": 1, "num": 314, "badges": 1, "id": 339866, "badge": "383551"},
    72: {"title": "Oddish", "description": "Register an Oddish while holding only the Stone Badge.", "points": 1, "num": 43, "badges": 1, "id": 339867, "badge": "383552"},
    73: {"title": "Gloom", "description": "Register a Gloom while holding only the Stone Badge.", "points": 2, "num": 44, "badges": 1, "id": 339868, "badge": "383553"},
    74: {"title": "Vileplume", "description": "Register a Vileplume while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges or after also obtaining the Mind Badge.", "points": 3, "num": 45, "badges": 6, "id": 339869, "badge": "383554"},
    75: {"title": "Bellossom", "description": "Register a Bellossom while holding only the Stone and Dynamo Badges.", "points": 3, "num": 182, "badges": 2, "id": 339870, "badge": "383556"},
    76: {"title": "Doduo", "description": "Register a Doduo while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 84, "badges": 5, "id": 339871, "badge": "383557"},
    77: {"title": "Dodrio", "description": "Register a Dodrio while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 85, "badges": 5, "id": 339872, "badge": "383558"},
    78: {"title": "Gulpin", "description": "Register a Gulpin while holding only the Stone Badge.", "points": 1, "num": 316, "badges": 1, "id": 339873, "badge": "383559"},
    79: {"title": "Swalot", "description": "Register a Swalot while holding only the Stone Badge.", "points": 2, "num": 317, "badges": 1, "id": 339874, "badge": "383560"},
    80: {"title": "Carvanha", "description": "Register a Carvanha while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 318, "badges": 5, "id": 339875, "badge": "383561"},
    81: {"title": "Sharpedo", "description": "Register a Sharpedo while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 319, "badges": 5, "id": 339876, "badge": "383562"},
    82: {"title": "Wailmer", "description": "Register a Wailmer while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 320, "badges": 5, "id": 339877, "badge": "383563"},
    83: {"title": "Wailord", "description": "Register a Wailord while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 321, "badges": 5, "id": 339878, "badge": "383564"},
    84: {"title": "Numel", "description": "Register a Numel while holding only the Stone and Dynamo Badges.", "points": 1, "num": 322, "badges": 2, "id": 339879, "badge": "383565"},
    85: {"title": "Camerupt", "description": "Register a Camerupt while holding only the Stone and Dynamo Badges.", "points": 2, "num": 323, "badges": 2, "id": 339880, "badge": "383566"},
    86: {"title": "Slugma", "description": "Register a Slugma while holding only the Stone and Dynamo Badges.", "points": 1, "num": 218, "badges": 2, "id": 339881, "badge": "383567"},
    87: {"title": "Magcargo", "description": "Register a Magcargo while holding only the Stone and Dynamo Badges.", "points": 2, "num": 219, "badges": 2, "id": 339882, "badge": "383568"},
    88: {"title": "Torkoal", "description": "Register a Torkoal while holding only the Stone and Dynamo Badges.", "points": 1, "num": 324, "badges": 2, "id": 339883, "badge": "383569"},
    89: {"title": "Grimer", "description": "Register a Grimer while holding only the Stone and Dynamo Badges.", "points": 1, "num": 88, "badges": 2, "id": 339884, "badge": "383570"},
    90: {"title": "Muk", "description": "Register a Muk while holding only the Stone and Dynamo Badges.", "points": 2, "num": 89, "badges": 2, "id": 339885, "badge": "383571"},
    91: {"title": "Koffing", "description": "Register a Koffing while holding only the Stone and Dynamo Badges.", "points": 1, "num": 109, "badges": 2, "id": 339886, "badge": "383572"},
    92: {"title": "Weezing", "description": "Register a Weezing while holding only the Stone and Dynamo Badges.", "points": 2, "num": 110, "badges": 2, "id": 339887, "badge": "383573"},
    93: {"title": "Spoink", "description": "Register a Spoink while holding only the Stone and Dynamo Badges.", "points": 1, "num": 325, "badges": 2, "id": 339888, "badge": "383574"},
    94: {"title": "Grumpig", "description": "Register a Grumpig while holding only the Stone and Dynamo Badges.", "points": 2, "num": 326, "badges": 2, "id": 339889, "badge": "383575"},
    95: {"title": "Sandshrew", "description": "Register a Sandshrew while holding only the Stone, Dynamo and Heat Badges.", "points": 1, "num": 27, "badges": 3, "id": 339890, "badge": "383576"},
    96: {"title": "Sandslash", "description": "Register a Sandslash while holding only the Stone, Dynamo and Heat Badges.", "points": 2, "num": 28, "badges": 3, "id": 339891, "badge": "383577"},
    97: {"title": "Spinda", "description": "Register a Spinda while holding only the Stone and Dynamo Badges.", "points": 1, "num": 327, "badges": 2, "id": 339892, "badge": "383578"},
    98: {"title": "Skarmory", "description": "Register a Skarmory while holding only the Stone and Dynamo Badges.", "points": 1, "num": 227, "badges": 2, "id": 339893, "badge": "383579"},
    99: {"title": "Trapinch", "description": "Register a Trapinch while holding only the Stone, Dynamo and Heat Badges.", "points": 1, "num": 328, "badges": 3, "id": 339894, "badge": "383580"},
    100: {"title": "Vibrava", "description": "Register a Vibrava while holding only the Stone, Dynamo and Heat Badges.", "points": 2, "num": 329, "badges": 3, "id": 339895, "badge": "383581"},
    101: {"title": "Flygon", "description": "Register a Flygon while holding only the Stone, Dynamo and Heat Badges.", "points": 3, "num": 330, "badges": 3, "id": 339896, "badge": "383582"},
    102: {"title": "Cacnea", "description": "Register a Cacnea while holding only the Stone, Dynamo and Heat Badges.", "points": 1, "num": 331, "badges": 3, "id": 339897, "badge": "383583"},
    103: {"title": "Cacturne", "description": "Register a Cacturne while holding only the Stone, Dynamo and Heat Badges.", "points": 2, "num": 332, "badges": 3, "id": 339898, "badge": "383584"},
    104: {"title": "Swablu", "description": "Register a Swablu while holding only the Stone and Dynamo Badges.", "points": 1, "num": 333, "badges": 2, "id": 339899, "badge": "383585"},
    105: {"title": "Altaria", "description": "Register an Altaria while holding only the Stone and Dynamo Badges.", "points": 2, "num": 334, "badges": 2, "id": 339900, "badge": "383586"},
    106: {"title": "Seviper", "description": "Register a Seviper while holding only the Stone and Dynamo Badges.", "points": 1, "num": 336, "badges": 2, "id": 339901, "badge": "383587"},
    107: {"title": "Solrock", "description": "Register a Solrock while holding only the Stone and Dynamo Badges.", "points": 1, "num": 338, "badges": 2, "id": 339902, "badge": "383588"},
    108: {"title": "Barboach", "description": "Register a Barboach while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 339, "badges": 5, "id": 339903, "badge": "383589"},
    109: {"title": "Whiscash", "description": "Register a Whiscash while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 340, "badges": 5, "id": 339904, "badge": "383590"},
    110: {"title": "Corphish", "description": "Register a Corphish while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 341, "badges": 5, "id": 339905, "badge": "383591"},
    111: {"title": "Crawdaunt", "description": "Register a Crawdaunt while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 342, "badges": 5, "id": 339906, "badge": "383592"},
    112: {"title": "Baltoy", "description": "Register a Baltoy while holding only the Stone, Dynamo and Heat Badges.", "points": 1, "num": 343, "badges": 3, "id": 339907, "badge": "383593"},
    113: {"title": "Claydol", "description": "Register a Claydol while holding only the Stone, Dynamo and Heat Badges.", "points": 2, "num": 344, "badges": 3, "id": 339908, "badge": "383594"},
    114: {"title": "Lileep", "description": "Register a Lileep while holding only the Stone, Dynamo and Heat Badges or after becoming Champion.", "points": 1, "num": 345, "badges": 8, "id": 339909, "badge": "383595"},
    115: {"title": "Cradily", "description": "Register a Cradily while holding only the Stone, Dynamo and Heat Badges or after becoming Champion.", "points": 2, "num": 346, "badges": 8, "id": 339910, "badge": "383596"},
    116: {"title": "Anorith", "description": "Register an Anorith while holding only the Stone, Dynamo and Heat Badges or after becoming Champion.", "points": 1, "num": 347, "badges": 8, "id": 339911, "badge": "383597"},
    117: {"title": "Armaldo", "description": "Register an Armaldo while holding only the Stone, Dynamo and Heat Badges or after becoming Champion.", "points": 2, "num": 348, "badges": 8, "id": 339912, "badge": "383598"},
    118: {"title": "Igglybuff", "description": "Register an Igglybuff while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 174, "badges": 5, "id": 339913, "badge": "383599"},
    119: {"title": "Jigglypuff", "description": "Register a Jigglypuff while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 39, "badges": 5, "id": 339914, "badge": "383600"},
    120: {"title": "Feebas", "description": "Register a Feebas while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 5, "num": 349, "badges": 5, "id": 339915, "badge": "383601"},
    121: {"title": "Milotic", "description": "Register a Milotic while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 5, "num": 350, "badges": 5, "id": 339916, "badge": "383602"},
    122: {"title": "Castform", "description": "Register a Castform while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 351, "badges": 5, "id": 339917, "badge": "383603"},
    123: {"title": "Staryu", "description": "Register a Staryu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 120, "badges": 5, "id": 339918, "badge": "383604"},
    124: {"title": "Starmie", "description": "Register a Starmie while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges", "points": 2, "num": 121, "badges": 6, "id": 339919, "badge": "383605"},
    125: {"title": "Kecleon", "description": "Register a Kecleon while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 352, "badges": 5, "id": 339920, "badge": "383606"},
    126: {"title": "Shuppet", "description": "Register a Shuppet while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 353, "badges": 5, "id": 339921, "badge": "383607"},
    127: {"title": "Banette", "description": "Register a Banette while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 354, "badges": 5, "id": 339922, "badge": "383608"},
    128: {"title": "Duskull", "description": "Register a Duskull while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 355, "badges": 5, "id": 339923, "badge": "383609"},
    129: {"title": "Dusclops", "description": "Register a Dusclops while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 356, "badges": 5, "id": 339924, "badge": "383610"},
    130: {"title": "Tropius", "description": "Register a Tropius while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 357, "badges": 5, "id": 339925, "badge": "383611"},
    131: {"title": "Chimecho", "description": "Register a Chimecho while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 358, "badges": 5, "id": 339926, "badge": "383612"},
    132: {"title": "Absol", "description": "Register an Absol while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 359, "badges": 5, "id": 339927, "badge": "383613"},
    133: {"title": "Vulpix", "description": "Register a Vulpix while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 37, "badges": 5, "id": 339928, "badge": "383614"},
    134: {"title": "Ninetales", "description": "Register a Ninetales while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 38, "badges": 5, "id": 339929, "badge": "383615"},
    135: {"title": "Pichu", "description": "Register a Pichu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 172, "badges": 5, "id": 339930, "badge": "383616"},
    136: {"title": "Pikachu", "description": "Register a Pikachu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 25, "badges": 5, "id": 339931, "badge": "383617"},
    137: {"title": "Raichu", "description": "Register a Raichu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 3, "num": 26, "badges": 5, "id": 339932, "badge": "383618"},
    138: {"title": "Psyduck", "description": "Register a Psyduck while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 54, "badges": 5, "id": 339933, "badge": "383619"},
    139: {"title": "Golduck", "description": "Register a Golduck while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 55, "badges": 5, "id": 339934, "badge": "383620"},
    140: {"title": "Wynaut", "description": "Register a Wynaut while holding only the Stone and Dynamo Badges.", "points": 1, "num": 360, "badges": 2, "id": 339935, "badge": "383621"},
    141: {"title": "Wobbuffet", "description": "Register a Wobbuffet while holding only the Stone and Dynamo Badges.", "points": 2, "num": 202, "badges": 2, "id": 339936, "badge": "383622"},
    142: {"title": "Natu", "description": "Register a Natu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 177, "badges": 5, "id": 339937, "badge": "383623"},
    143: {"title": "Xatu", "description": "Register a Xatu while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 178, "badges": 5, "id": 339938, "badge": "383624"},
    144: {"title": "Girafarig", "description": "Register a Girafarig while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 203, "badges": 5, "id": 339939, "badge": "383625"},
    145: {"title": "Phanpy", "description": "Register a Phanpy while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 231, "badges": 5, "id": 339940, "badge": "383626"},
    146: {"title": "Donphan", "description": "Register a Donphan while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 232, "badges": 5, "id": 339941, "badge": "383628"},
    147: {"title": "Pinsir", "description": "Register a Pinsir while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 127, "badges": 5, "id": 339942, "badge": "383629"},
    148: {"title": "Heracross", "description": "Register a Heracross while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 214, "badges": 5, "id": 339943, "badge": "383630"},
    149: {"title": "Rhyhorn", "description": "Register a Rhyhorn while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 111, "badges": 5, "id": 339944, "badge": "383631"},
    150: {"title": "Rhydon", "description": "Register a Rhydon while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 112, "badges": 5, "id": 339945, "badge": "383632"},
    151: {"title": "Snorunt", "description": "Register a Snorunt while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 361, "badges": 5, "id": 339946, "badge": "383633"},
    152: {"title": "Glalie", "description": "Register a Glalie while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 362, "badges": 5, "id": 339947, "badge": "383634"},
    153: {"title": "Spheal", "description": "Register a Spheal while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 363, "badges": 5, "id": 339948, "badge": "383635"},
    154: {"title": "Sealeo", "description": "Register a Sealeo while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 364, "badges": 5, "id": 339949, "badge": "383636"},
    155: {"title": "Walrein", "description": "Register a Walrein while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 3, "num": 365, "badges": 5, "id": 339950, "badge": "383637"},
    156: {"title": "Clamperl", "description": "Register a Clamperl while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 1, "num": 366, "badges": 6, "id": 339951, "badge": "383638"},
    157: {"title": "Relicanth", "description": "Register a Relicanth while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 1, "num": 369, "badges": 6, "id": 339952, "badge": "383639"},
    158: {"title": "Corsola", "description": "Register a Corsola while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 222, "badges": 5, "id": 339953, "badge": "383640"},
    159: {"title": "Chinchou", "description": "Register a Chinchou while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 1, "num": 170, "badges": 6, "id": 339954, "badge": "383641"},
    160: {"title": "Lanturn", "description": "Register a Lanturn while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 2, "num": 171, "badges": 6, "id": 339955, "badge": "383642"},
    161: {"title": "Luvdisc", "description": "Register a Luvdisc while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 370, "badges": 5, "id": 339956, "badge": "383643"},
    162: {"title": "Horsea", "description": "Register a Horsea while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 1, "num": 116, "badges": 5, "id": 339957, "badge": "383644"},
    163: {"title": "Seadra", "description": "Register a Seadra while holding only the Stone, Dynamo, Heat, Knuckle and Balance Badges.", "points": 2, "num": 117, "badges": 5, "id": 339958, "badge": "383645"},
    164: {"title": "Bagon", "description": "Register a Bagon while holding only the Stone, Dynamo, Heat, Knuckle, Balance, Mind and Rain Badges.", "points": 1, "num": 371, "badges": 7, "id": 339959, "badge": "383646"},
    165: {"title": "Shelgon", "description": "Register a Shelgon while holding only the Stone, Dynamo, Heat, Knuckle, Balance, Mind and Rain Badges.", "points": 2, "num": 372, "badges": 7, "id": 339960, "badge": "383647"},
    166: {"title": "Salamence", "description": "Register a Salamence while holding only the Stone, Dynamo, Heat, Knuckle, Balance, Mind and Rain Badges.", "points": 3, "num": 373, "badges": 7, "id": 339961, "badge": "383648"},
    167: {"title": "Beldum", "description": "Register a Beldum after becoming Champion.", "points": 1, "num": 374, "badges": 8, "id": 339962, "badge": "383649"},
    168: {"title": "Metang", "description": "Register a Metang after becoming Champion.", "points": 2, "num": 375, "badges": 8, "id": 339963, "badge": "383650"},
    169: {"title": "Metagross", "description": "Register a Metagross after becoming Champion.", "points": 3, "num": 376, "badges": 8, "id": 339964, "badge": "383651"},
    170: {"title": "Regirock", "description": "Register a Regirock while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 5, "num": 377, "badges": 6, "id": 339965, "badge": "383653"},
    171: {"title": "Regice", "description": "Register a Regice while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 5, "num": 378, "badges": 6, "id": 339966, "badge": "383654"},
    172: {"title": "Registeel", "description": "Register a Registeel while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 5, "num": 379, "badges": 6, "id": 339967, "badge": "383655"},
    173: {"title": "Kyogre", "description": "Register a Kyogre after becoming Champion.", "points": 5, "num": 382, "badges": 8, "id": 339968, "badge": "383656"},
    174: {"title": "Groudon", "description": "Register a Groudon after becoming Champion.", "points": 5, "num": 383, "badges": 8, "id": 339969, "badge": "383657"},
    175: {"title": "Rayquaza", "description": "Register a Rayquaza while holding only the Stone, Dynamo, Heat, Knuckle, Balance and Mind Badges.", "points": 5, "num": 384, "badges": 6, "id": 339970, "badge": "383658"},
    176: {"title": "Meowth", "description": "Register a Meowth after becoming Champion.", "points": 1, "num": 52, "badges": 8, "id": 339971, "badge": "383659"},
    177: {"title": "Persian", "description": "Register a Persian after becoming Champion.", "points": 2, "num": 53, "badges": 8, "id": 339972, "badge": "383660"},
    178: {"title": "Ditto", "description": "Register a Ditto after becoming Champion.", "points": 1, "num": 132, "badges": 8, "id": 339973, "badge": "383661"},
    179: {"title": "Hoothoot", "description": "Register a Hoothoot after becoming Champion.", "points": 1, "num": 163, "badges": 8, "id": 339974, "badge": "383662"},
    180: {"title": "Noctowl", "description": "Register a Noctowl after becoming Champion.", "points": 2, "num": 164, "badges": 8, "id": 339975, "badge": "383663"},
    181: {"title": "Ledyba", "description": "Register a Ledyba after becoming Champion.", "points": 1, "num": 165, "badges": 8, "id": 339976, "badge": "383664"},
    182: {"title": "Ledian", "description": "Register a Ledian after becoming Champion.", "points": 2, "num": 166, "badges": 8, "id": 339977, "badge": "383665"},
    183: {"title": "Spinarak", "description": "Register a Spinarak after becoming Champion.", "points": 1, "num": 167, "badges": 8, "id": 339978, "badge": "383666"},
    184: {"title": "Ariados", "description": "Register an Ariados after becoming Champion.", "points": 2, "num": 168, "badges": 8, "id": 339979, "badge": "383667"},
    185: {"title": "Mareep", "description": "Register a Mareep after becoming Champion.", "points": 1, "num": 179, "badges": 8, "id": 339980, "badge": "383668"},
    186: {"title": "Flaaffy", "description": "Register a Flaaffy after becoming Champion.", "points": 2, "num": 180, "badges": 8, "id": 339981, "badge": "383669"},
    187: {"title": "Ampharos", "description": "Register an Ampharos after becoming Champion.", "points": 3, "num": 181, "badges": 8, "id": 339982, "badge": "383670"},
    188: {"title": "Sudowoodo", "description": "Register a Sudowoodo after becoming Champion.", "points": 1, "num": 185, "badges": 8, "id": 339983, "badge": "383671"},
    189: {"title": "Aipom", "description": "Register an Aipom after becoming Champion.", "points": 1, "num": 190, "badges": 8, "id": 339984, "badge": "383672"},
    190: {"title": "Sunkern", "description": "Register a Sunkern after becoming Champion.", "points": 1, "num": 191, "badges": 8, "id": 339985, "badge": "383673"},
    191: {"title": "Sunflora", "description": "Register a Sunflora after becoming Champion.", "points": 2, "num": 192, "badges": 8, "id": 339986, "badge": "383674"},
    192: {"title": "Wooper", "description": "Register a Wooper after becoming Champion.", "points": 1, "num": 194, "badges": 8, "id": 339987, "badge": "383675"},
    193: {"title": "Quagsire", "description": "Register a Quagsire after becoming Champion.", "points": 2, "num": 195, "badges": 8, "id": 339988, "badge": "383676"},
    194: {"title": "Pineco", "description": "Register a Pineco after becoming Champion.", "points": 1, "num": 204, "badges": 8, "id": 339989, "badge": "383677"},
    195: {"title": "Forretress", "description": "Register a Forretress after becoming Champion.", "points": 2, "num": 205, "badges": 8, "id": 339990, "badge": "383678"},
    196: {"title": "Gligar", "description": "Register a Gligar after becoming Champion.", "points": 1, "num": 207, "badges": 8, "id": 339991, "badge": "383679"},
    197: {"title": "Snubbull", "description": "Register a Snubbull after becoming Champion.", "points": 1, "num": 209, "badges": 8, "id": 339992, "badge": "383680"},
    198: {"title": "Granbull", "description": "Register a Granbull after becoming Champion.", "points": 2, "num": 210, "badges": 8, "id": 339993, "badge": "383681"},
    199: {"title": "Shuckle", "description": "Register a Shuckle after becoming Champion.", "points": 1, "num": 213, "badges": 8, "id": 339994, "badge": "383682"},
    200: {"title": "Teddiursa", "description": "Register a Teddiursa after becoming Champion.", "points": 1, "num": 216, "badges": 8, "id": 339995, "badge": "383683"},
    201: {"title": "Ursaring", "description": "Register an Ursaring after becoming Champion.", "points": 2, "num": 217, "badges": 8, "id": 339996, "badge": "383684"},  
    202: {"title": "Remoraid", "description": "Register a Remoraid after becoming Champion.", "points": 1, "num": 223, "badges": 8, "id": 339997, "badge": "383685"},
    203: {"title": "Octillery", "description": "Register an Octillery after becoming Champion.", "points": 2, "num": 224, "badges": 8, "id": 339998, "badge": "383686"},
    204: {"title": "Houndour", "description": "Register a Houndour after becoming Champion.", "points": 1, "num": 228, "badges": 8, "id": 339999, "badge": "383687"},
    205: {"title": "Houndoom", "description": "Register a Houndoom after becoming Champion.", "points": 2, "num": 229, "badges": 8, "id": 340000, "badge": "383688"},
    206: {"title": "Stantler", "description": "Register a Stantler after becoming Champion.", "points": 1, "num": 234, "badges": 8, "id": 340001, "badge": "383689"},
    207: {"title": "Smeargle", "description": "Register a Smeargle after becoming Champion.", "points": 1, "num": 235, "badges": 8, "id": 340002, "badge": "383690"},
    208: {"title": "Miltank", "description": "Register a Miltank after becoming Champion.", "points": 1, "num": 241, "badges": 8, "id": 340003, "badge": "383691"},
}


// Starters and Latias/Latios List
SpecialCaseList = 
{ 
    1: {"title": "Starter I", "description": "Register a Treecko, Torchic or Mudkip before obtaining the Stone Badge.", "points": 1, "id": 339792, "badge": "383467"},
    2: {"title": "Starter II", "description": "Register a Grovyle, Combusken or Marshtomp before obtaining the Stone Badge.", "points": 2, "id": 339793, "badge": "383468"},
    3: {"title": "Starter III", "description": "Register a Sceptile, Blaziken or Swampert before obtaining the Stone Badge.", "points": 3, "id": 339794, "badge": "383469"},
    4: {"title": "Red or Blue?", "description": "Register a Latias or Latios after becoming Champion.", "points": 5, "id": 340004, "badge": "383692"},
}

// Gym Badge List
BadgeChallengeList =
{
    1: {"title": "Rustboro Rumble - Badge 1", "description": "Beat Roxanne with 39 Pokemon registered in the Pokedex.", "points": 10, "offset": 0, "bit": bit7, "map": 0x0b, "submap": 0x03, "submapTwo": 0x03, "caughtAmount": 39, "id": 340007, "badge": "383694"},
    2: {"title": "Mauville Marvel - Badge 2", "description": "Beat Wattson with 66 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit1, "map": 0x0a, "submap": 0x00, "submapTwo": 0x00, "caughtAmount": 66, "id": 340008, "badge": "383695"},
    3: {"title": "Lavaridge Lover - Badge 3", "description": "Beat Flannery with 90 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit2, "map": 0x04, "submap": 0x01, "submapTwo": 0x02, "caughtAmount": 90, "id": 340009, "badge": "383696"},
    4: {"title": "Dewford Dominator - Badge 4", "description": "Beat Brawly with 101 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit0, "map": 0x03, "submap": 0x03, "submapTwo": 0x03, "caughtAmount": 101, "id": 340010, "badge": "383697"},
    5: {"title": "Petalburg Powerhouse - Badge 5", "description": "Beat Norman with 101 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit3, "map": 0x08, "submap": 0x01, "submapTwo": 0x01, "caughtAmount": 101, "id": 340011, "badge": "383698"},
    6: {"title": "Mossdeep Master - Badge 6", "description": "Beat Tate and Liza with 156 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit5, "map": 0x0e, "submap": 0x00, "submapTwo": 0x00, "caughtAmount": 156, "id": 340012, "badge": "383699"},
    7: {"title": "Sootopolis Saviour - Badge 7", "description": "Beat Juan with 167 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit6, "map": 0x0f, "submap": 0x00, "submapTwo": 0x01, "caughtAmount": 167, "id": 340013, "badge": "383700"},
    8: {"title": "Fortree Flyer - Badge 8", "description": "Beat Winona with 171 Pokemon registered in the Pokedex.", "points": 10, "offset": 1, "bit": bit4, "map": 0x0c, "submap": 0x01, "submapTwo": 0x01, "caughtAmount": 171, "id": 340014, "badge": "383703"},
}

function MusicID() => byte(0x0f48)
// Various Music IDs
LevelUpMusic = 0x79
BirchVsZigzagoonMusic = 0x9a
WildBattleMusic = 0xda
TrainerBattleMusic = 0xdc
GymLeaderBattleMusic = 0xdd
EggHatchMusic = 0xff
StevenStoneBattleMusic = 0xe1

function PokedexFlag(id)
{
    logic = always_true()
    StartingOffset = 0x707C
    IDAddress = 0
    Count = 0
    for number in range(0, id - 1)
    {
        if(number == id - 1)
        {
            if((Count) == 0)
            {
                IDAddress = bit0(Pointer() + StartingOffset)
            }
            if((Count) == 1)
            {
                IDAddress = bit1(Pointer() + StartingOffset)
            }
            if((Count) == 2)
            {
                IDAddress = bit2(Pointer() + StartingOffset)
            }
            if((Count) == 3)
            {
                IDAddress = bit3(Pointer() + StartingOffset)
            }
            if((Count) == 4)
            {
                IDAddress = bit4(Pointer() + StartingOffset)
            }
            if((Count) == 5)
            {
                IDAddress = bit5(Pointer() + StartingOffset)
            }
            if((Count) == 6)
            {
                IDAddress = bit6(Pointer() + StartingOffset)
            }
            if((Count) == 7)
            {
                IDAddress = bit7(Pointer() + StartingOffset)
            }
        }
        Count = Count + 1
        if(Count == 8)
        {
            Count = 0
            StartingOffset = StartingOffset + 0x01
        }
    }
    return
    IDAddress
}

function FlickerProtection()
{
    return
    MapBank() == prev(MapBank()) &&
    Pointer() == prev(Pointer()) &&
    repeated(5, Pointer() == prev(Pointer()) && never(Pointer() != prev(Pointer())))
}

// Pokemon whose catch window doesn't match their "badges" group.
// Values are every badge group the Pokemon may be obtained in.
BadgeExceptions =
{
    345: [3, 8],   // Lileep
    346: [3, 8],   // Cradily
    347: [3, 8],   // Anorith
    348: [3, 8],   // Armaldo
    45:  [5, 6],   // Vileplume - one Leaf Stone evo is required before Tate and Liza
    275: [5, 6],   // Shiftry
}

// Exact badge count for a group
function BadgeCountIs(group) => SumOfBadges() == group

// One complete fossil line (only one is obtainable before the post-game)
function FossilLineComplete() =>
    (PokedexFlag(345) == 1 && PokedexFlag(346) == 1) ||
    (PokedexFlag(347) == 1 && PokedexFlag(348) == 1)

function CheckPrevBadge(badge)
{
    Sum = always_true()
    Count = 0
    for Pokemon in CatchableList
    {
        if(CatchableList[Pokemon]["badges"] < badge)
        {
            Sum = Sum && PokedexFlag(CatchableList[Pokemon]["num"]) == 1
            
            Count = Count + 1
        }
    }
    
    if(badge >= 0)
    {
        Sum = Sum &&
        (
            (PokedexFlag(252) == 1 && PokedexFlag(253) == 1 && PokedexFlag(254) == 1) ||
            (PokedexFlag(255) == 1 && PokedexFlag(256) == 1 && PokedexFlag(257) == 1) ||
            (PokedexFlag(258) == 1 && PokedexFlag(259) == 1 && PokedexFlag(260) == 1)
        )
    }
    
    // One fossil line from Brawly onwards (both lines are in the list for Steven)
    if(badge >= 4 && badge <= 8)
    {
        Sum = Sum && FossilLineComplete()
    }
    
    // One Leaf Stone evolution before Tate and Liza
    if(badge == 6)
    {
        Sum = Sum && (PokedexFlag(45) == 1 || PokedexFlag(275) == 1)
    }
    
    if(badge == 9)
    {
        Sum = Sum && ((PokedexFlag(380) == 1 || PokedexFlag(381) == 1))
    }
    
    return Sum
}

// Every Pokemon from the sections before this group must already be in the dex
function PrevSectionsComplete(group)
{
    if (group <= 0)
    {
        return always_true()
    }

    return CheckPrevBadge(group)
}

// Exact badge count AND all earlier sections complete
function BadgeWindow(group) => BadgeCountIs(group) && PrevSectionsComplete(group)

function HasRequiredBadges(num, badges)
{
    if (dictionary_contains_key(BadgeExceptions, num))
    {
        logic = always_false()
        for group in BadgeExceptions[num]
        {
            logic = logic || BadgeWindow(group)
        }
        return logic
    }

    return BadgeWindow(badges)
}

function CaughtPokemon(num, badges)
{
    return
    PointerNotNull() &&
    PlayerInGame() &&
    HasRequiredBadges(num, badges) &&
    PokedexFlag(num) > prev(PokedexFlag(num))
}

function PrevLevelMusic() {
    MusicID() == LevelUpMusic &&
    prev(MusicID()) == LevelUpMusic
}

// Starter Achievments
// Starter Achievements - badge check shared in core, only the catch is in the alts
function StarterAchievement(index, first, second, third)
{
    achievement(
        SpecialCaseList[index]["title"],
        SpecialCaseList[index]["description"],
        SpecialCaseList[index]["points"],
        PlayerInGame() &&
        PointerNotNull() &&
        FlickerProtection() &&
        BadgeCountIs(0) &&
        (
            PokedexFlag(first) > prev(PokedexFlag(first)) ||
            PokedexFlag(second) > prev(PokedexFlag(second)) ||
            PokedexFlag(third) > prev(PokedexFlag(third))
        ),
        id = SpecialCaseList[index]["id"],
        badge = SpecialCaseList[index]["badge"]
        )
}

StarterAchievement(1, 252, 255, 258)   // Treecko/Torchic/Mudkip
StarterAchievement(2, 253, 256, 259)   // Grovyle/Combusken/Marshtomp
StarterAchievement(3, 254, 257, 260)   // Sceptile/Blaziken/Swampert

// Main Achievements

// New template that uses the pokemons national dex id number and uses a function to calculate the offset from there
function AchievementTemplate(title, description, points, num, badges, id, badge)
{
    achievement(
    	title,
    	description,
    	points,
    	FlickerProtection() &&
    	CaughtPokemon(num, badges),
    	id = id,
    	badge = badge)
}

for Pokemon in CatchableList
{
    AchievementTemplate(
        CatchableList[Pokemon]["title"],
        CatchableList[Pokemon]["description"],
        CatchableList[Pokemon]["points"],
        CatchableList[Pokemon]["num"],
        CatchableList[Pokemon]["badges"],
        CatchableList[Pokemon]["id"],
        CatchableList[Pokemon]["badge"])
}

// Latias/Latios Achievement
// Badge and dex requirements are shared, so only the catch check is inside the OR
achievement(
    SpecialCaseList[4]["title"],
    SpecialCaseList[4]["description"],
    SpecialCaseList[4]["points"],
    PlayerInGame() &&
    PointerNotNull() &&
    FlickerProtection() &&
    BadgeWindow(8) &&
    (PokedexFlag(380) > prev(PokedexFlag(380)) || PokedexFlag(381) > prev(PokedexFlag(381))),
    id = SpecialCaseList[4]["id"],
    badge = SpecialCaseList[4]["badge"]
    )

ActualBadgeCount = 0
// Gym Challenge Checkpoints
// This is slightly broken as I don't know how to make it generate a ResetNextIf with one of the conditions requiring hits but not using disable_when because I don't want a PauseIf.
// To fix the generated code change the generated ResetIf to a ResetNextIf, add a trigger to the MusicID check and add an additonal MapBank == map check to the bottom of the definition in RALib
// that should fix the icon appearing for the trigger on the correct map.
function GymBadgeTemplate(title, description, points, offset, bit, map, submap, submapTwo, caughtAmount, id, badge)
{
    obtainedBadge = bit(Pointer() + BadgeOffsetArray[offset]) > prev(bit(Pointer() + BadgeOffsetArray[offset]))
    achievement(    
        title,
        description,
        points,
        trigger_when(once(MusicID() == GymLeaderBattleMusic && never(MapBank() != map))) &&
        trigger_when(obtainedBadge) &&
        CheckPrevBadge(ActualBadgeCount + 1) &&
        PlayerInGame() &&
        PointerNotNull() &&
        FlickerProtection() &&
        (SubMap() == submap || (SubMap() == submapTwo)) &&
        MapBank() == map,
        id = id,
        badge = badge)
    ActualBadgeCount = ActualBadgeCount + 1
}

for Badge in BadgeChallengeList
{
    GymBadgeTemplate(
        BadgeChallengeList[Badge]["title"],
        BadgeChallengeList[Badge]["description"],
        BadgeChallengeList[Badge]["points"],
        BadgeChallengeList[Badge]["offset"],
        BadgeChallengeList[Badge]["bit"],
        BadgeChallengeList[Badge]["map"],
        BadgeChallengeList[Badge]["submap"],
        BadgeChallengeList[Badge]["submapTwo"],
        BadgeChallengeList[Badge]["caughtAmount"],
        BadgeChallengeList[Badge]["id"],
        BadgeChallengeList[Badge]["badge"])
}

// Final achievement
// CheckPrevBadge(9) = every CatchableList entry (both fossil lines included) + a starter line + Latias/Latios = 212
achievement(
    "Stevens' Superior - Final Battle",
    "Beat Steven Stone at Meteor Falls with 212 Pokemon registered in the Pokedex.",
    25,
    PointerNotNull() &&
    PlayerInGame() &&
    FlickerProtection() &&
    MapBank() == 0x18 &&
    SubMap() == 0x6b &&
    trigger_when(once(MusicID() == StevenStoneBattleMusic && never(SubMap() != 0x6b))) &&
    //disable_when(SubMap() != 0x6b, until=SubMap() == 0x6b) &&
    trigger_when(prev(byte(0x02c33a)) != 0x01 && never(MusicID() != StevenStoneBattleMusic)) &&
    trigger_when(once(never(prior(byte(0x02c33a)) == 0x01) && byte(0x02c33a) == 0x01)) &&
    CheckPrevBadge(9),
    id = 340015,
    badge = "383704"
)


PokemonOffsetArray =
    [ 0x707C, 0x707D, 0x707E, 0x707F, 0x7080,
      0x7081, 0x7082, 0x7083, 0x7084, 0x7085,
      0x7086, 0x7087, 0x7088, 0x7089, 0x708A,
      0x708B, 0x708C, 0x708D, 0x708E, 0x708F,
      0x7090, 0x7091, 0x7092, 0x7093, 0x7094,
      0x7095, 0x7096, 0x7097, 0x7098, 0x7099, 
      0x709A, 0x709B, 0x709C, 0x709D, 0x709E,
      0x709F, 0x70A0, 0x70A1, 0x70A2, 0x70A3, 
      0x70A4, 0x70A5, 0x70A6, 0x70A7, 0x70A8,
      0x70A9, 0x70AA, 0x70AB, 0x70AC ]

function SumOfCaught()
{
    Sum = 0
    Count = 0
    Address = 0
    for offset in PokemonOffsetArray
    {
        if(Count <= 48)
        {
            Address = Pointer() + PokemonOffsetArray[Count]
            Count = Count + 1
        }
        
        Sum = Sum + bitcount(Address)
    }
    return Sum
}

function LastUsedPokeball() => byte(0x2c208)

// Rich Presence
letters =
{0x01: "", 0xA1: "0", 0xA2: "1", 0xA3: "2", 0xA4: "3", 0xA5: "4", 0xA6: "5", 0xA7: "6", 0xA8: "7",
 0xA9: "8", 0xAA: "9", 0xAB: "!", 0xAC: "?", 0xAD: ".", 0xAE: "-", 0xB0: "…", 0xB1: "“", 0xB2: "”",
 0xB3: "‘", 0xB4: "’", 0xB5: "♂", 0xB6: "♀", 0xB8: ",", 0xBA: "/", 0xBB: "A", 0xBC: "B", 0xBD: "C",
 0xBE: "D", 0xBF: "E", 0xC0: "F", 0xC1: "G", 0xC2: "H", 0xC3: "I", 0xC4: "J", 0xC5: "K", 0xC6: "L",
 0xC7: "M", 0xC8: "N", 0xC9: "O", 0xCA: "P", 0xCB: "Q", 0xCC: "R", 0xCD: "S", 0xCE: "T", 0xCF: "U",
 0xD0: "V", 0xD1: "W", 0xD2: "X", 0xD3: "Y", 0xD4: "Z", 0xD5: "a", 0xD6: "b", 0xD7: "c", 0xD8: "d",
 0xD9: "e", 0xDA: "f", 0xDB: "g", 0xDC: "h", 0xDD: "i", 0xDE: "j", 0xDF: "k", 0xE0: "l", 0xE1: "m",
 0xE2: "n", 0xE3: "o", 0xE4: "p", 0xE5: "q", 0xE6: "r", 0xE7: "s", 0xE8: "t", 0xE9: "u", 0xEA: "v",
 0xEB: "w", 0xEC: "x", 0xED: "y", 0xEE: "z"}


rich_presence_conditional_display(PlayerNotInGame(), "On menu screen")
rich_presence_display("{0}{1}{2}{3}{4}{5}{6} | Caught: {7}/212 | Badges: {8}/8",
    rich_presence_lookup("name", byte(Pointer() + 0x7054), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x7055), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x7056), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x7057), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x7058), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x7059), letters),
    rich_presence_lookup("name", byte(Pointer() + 0x705a), letters),
    rich_presence_macro("Number", measured(SumOfCaught())),
    rich_presence_macro("Number", measured(SumOfBadges())))