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

// Check Player is in game
function PlayerInGame() => InGameCheck() != 0
function PlayerNotInGame() => InGameCheck() == 0

// Check Main Pointer is not null
function PointerNotNull() => Pointer() != 0

// Catchable Pokemon List

StarterList = 
{
    1: {"title": "Treecko", "description": "Obtain a Poochyena", "points": 1, "id": 252, "badges": 0},
    2: {"title": "Grovyle", "description": "Obtain a Poochyena", "points": 2, "id": 253, "badges": 0},
    3: {"title": "Sceptile", "description": "Obtain a Poochyena", "points": 3, "id": 254, "badges": 0},
    4: {"title": "Torchic", "description": "Obtain a Poochyena", "points": 1, "id": 255, "badges": 0},
    5: {"title": "Combusken", "description": "Obtain a Poochyena", "points": 2, "id": 256, "badges": 0},
    6: {"title": "Blaziken", "description": "Obtain a Poochyena", "points": 3, "id": 257, "badges": 0},
    7: {"title": "Mudkip", "description": "Obtain a Poochyena", "points": 1, "id": 258, "badges": 0},
    8: {"title": "Marshtomp", "description": "Obtain a Marshtomp", "points": 2, "id": 259, "badges": 0},
    9: {"title": "Swampert", "description": "Obtain a Swampert", "points": 3, "id": 260, "badges": 0}
}

CatchableList =
{  
    1: {"title": "Poochyena", "description": "Obtain a Poochyena", "points": 1, "id": 261, "badges": 0},
    2: {"title": "Mightyena", "description": "Obtain a Mightyena", "points": 2, "id": 262, "badges": 0},
    3: {"title": "Zigzagoon", "description": "Obtain a Zigzagoon", "points": 1, "id": 263, "badges": 0},
    4: {"title": "Linoone", "description": "Obtain a Linoone", "points": 2, "id": 264, "badges": 0},
    5: {"title": "Wurmple", "description": "Obtain a Wurmple", "points": 1, "id": 265, "badges": 0},
    6: {"title": "Silcoon", "description": "Obtain a Silcoon", "points": 2, "id": 266, "badges": 0},
    7: {"title": "Beautifly", "description": "Obtain a Beautifly", "points": 3, "id": 267, "badges": 0},
    8: {"title": "Cascoon", "description": "Obtain a Cascoon", "points": 2, "id": 268, "badges": 0},
    9: {"title": "Dustox", "description": "Obtain a Dustox", "points": 3, "id": 269, "badges": 0},
    10: {"title": "Lotad", "description": "Obtain a Lotad", "points": 1, "id": 270, "badges": 0},
    11: {"title": "Lombre", "description": "Obtain a Lombre", "points": 2, "id": 271, "badges": 0},
    12: {"title": "Ludicolo", "description": "Obtain a Ludicolo", "points": 3, "id": 272, "badges": 6},
    13: {"title": "Seedot", "description": "Obtain a Seedot", "points": 1, "id": 273, "badges": 0},
    14: {"title": "Nuzleaf", "description": "Obtain a Nuzleaf", "points": 2, "id": 274, "badges": 0},
    15: {"title": "Shiftry", "description": "Obtain a Shiftry", "points": 3, "id": 275, "badges": 6},
    16: {"title": "Tailow", "description": "Obtain a Tailow", "points": 1, "id": 276, "badges": 0},
    17: {"title": "Swellow", "description": "Obtain a Swellow", "points": 2, "id": 277, "badges": 0},
    18: {"title": "Wingull", "description": "Obtain a Wingull", "points": 1, "id": 278, "badges": 0},
    19: {"title": "Pelipper", "description": "Obtain a Pelipper", "points": 2, "id": 279, "badges": 0},
    20: {"title": "Ralts", "description": "Obtain a Ralts", "points": 1, "id": 280, "badges": 0},
    21: {"title": "Kirlia", "description": "Obtain a Kirlia", "points": 2, "id": 281, "badges": 0},
    22: {"title": "Gardevoir", "description": "Obtain a Gardevoir", "points": 3, "id": 282, "badges": 0},
    23: {"title": "Shroomish", "description": "Obtain a Shroomish", "points": 1, "id": 285, "badges": 0},
    24: {"title": "Breloom", "description": "Obtain a Breloom", "points": 2, "id": 286, "badges": 0},
    25: {"title": "Slakoth", "description": "Obtain a Slakoth", "points": 1, "id": 287, "badges": 0},
    26: {"title": "Vigoroth", "description": "Obtain a Vigoroth", "points": 2, "id": 288, "badges": 0},
    27: {"title": "Slaking", "description": "Obtain a Slaking", "points": 3, "id": 289, "badges": 0},
    28: {"title": "Abra", "description": "Obtain an Abra", "points": 1, "id": 63, "badges": 0},
    29: {"title": "Kadabra", "description": "Obtain a Kadabra", "points": 2, "id": 64, "badges": 0},
    30: {"title": "Nincada", "description": "Obtain a Nincada", "points": 1, "id": 290, "badges": 0},
    31: {"title": "Ninjask", "description": "Obtain a Ninjask", "points": 2, "id": 291, "badges": 0},
    32: {"title": "Shedinja", "description": "Obtain a Shedinja", "points": 2, "id": 292, "badges": 0},
    33: {"title": "Whismur", "description": "Obtain a Whismur", "points": 1, "id": 293, "badges": 0},
    34: {"title": "Loudred", "description": "Obtain a Loudred", "points": 2, "id": 294, "badges": 0},
    35: {"title": "Exploud", "description": "Obtain an Exploud", "points": 3, "id": 295, "badges": 0},
    36: {"title": "Makuhita", "description": "Obtain a Makuhita", "points": 1, "id": 296, "badges": 1},
    37: {"title": "Hariyama", "description": "Obtain a Hariyama", "points": 2, "id": 297, "badges": 1},
    38: {"title": "Goldeen", "description": "Obtain a Goldeen", "points": 1, "id": 118, "badges": 1},
    39: {"title": "Seaking", "description": "Obtain a Seaking", "points": 2, "id": 119, "badges": 1},
    40: {"title": "Magikarp", "description": "Obtain a Magikarp", "points": 1, "id": 129, "badges": 1},
    41: {"title": "Gyarados", "description": "Obtain a Gyarados", "points": 2, "id": 130, "badges": 1},
    42: {"title": "Azurill", "description": "Obtain an Azurill", "points": 1, "id": 298, "badges": 5},
    43: {"title": "Marill", "description": "Obtain a Marill", "points": 2, "id": 183, "badges": 0},
    44: {"title": "Azumarill", "description": "Obtain an Azumarill", "points": 3, "id": 184, "badges": 0},
    45: {"title": "Geodude", "description": "Obtain a Geodude", "points": 1, "id": 74, "badges": 1},
    46: {"title": "Graveler", "description": "Obtain a Graveler", "points": 2, "id": 75, "badges": 1},
    47: {"title": "Nosepass", "description": "Obtain a Nosepass", "points": 1, "id": 299, "badges": 2},
    48: {"title": "Skitty", "description": "Obtain a Skitty", "points": 1, "id": 300, "badges": 0},
    49: {"title": "Delcatty", "description": "Obtain a Delcatty", "points": 2, "id": 301, "badges": 2},
    50: {"title": "Zubat", "description": "Obtain a Zubat", "points": 1, "id": 41, "badges": 1},
    51: {"title": "Golbat", "description": "Obtain a Golbat", "points": 2, "id": 42, "badges": 1},
    52: {"title": "Crobat", "description": "Obtain a Crobat", "points": 3, "id": 169, "badges": 1},
    53: {"title": "Tentacool", "description": "Obtain a Tentacool", "points": 1, "id": 72, "badges": 1},
    54: {"title": "Tentacruel", "description": "Obtain a Tentacruel", "points": 2, "id": 73, "badges": 1},
    55: {"title": "Sableye", "description": "Obtain a Sableye", "points": 1, "id": 302, "badges": 1},
    56: {"title": "Mawile", "description": "Obtain a Mawile", "points": 1, "id": 303, "badges": 7},
    57: {"title": "Aron", "description": "Obtain an Aron", "points": 1, "id": 304, "badges": 1},
    58: {"title": "Lairon", "description": "Obtain a Lairon", "points": 2, "id": 305, "badges": 1},
    59: {"title": "Aggron", "description": "Obtain an Aggron", "points": 3, "id": 306, "badges": 1},
    60: {"title": "Machop", "description": "Obtain a Machop", "points": 1, "id": 66, "badges": 2},
    61: {"title": "Machoke", "description": "Obtain a Machoke", "points": 2, "id": 67, "badges": 2},
    62: {"title": "Electrike", "description": "Obtain an Electrike", "points": 1, "id": 309, "badges": 1},
    63: {"title": "Manectric", "description": "Obtain a Manectric", "points": 2, "id": 310, "badges": 1},
    64: {"title": "Plusle", "description": "Obtain a Plusle", "points": 1, "id": 311, "badges": 1},
    65: {"title": "Minun", "description": "Obtain a Minun", "points": 1, "id": 312, "badges": 1},
    66: {"title": "Magnemite", "description": "Obtain a Magnemite", "points": 1, "id": 81, "badges": 5},
    67: {"title": "Magneton", "description": "Obtain a Magneton", "points": 2, "id": 82, "badges": 5},
    68: {"title": "Voltorb", "description": "Obtain a Voltorb", "points": 1, "id": 100, "badges": 5},
    69: {"title": "Electrode", "description": "Obtain an Electrode", "points": 2, "id": 101, "badges": 5},
    70: {"title": "Volbeat", "description": "Obtain a Volbeat", "points": 1, "id": 313, "badges": 1},
    71: {"title": "Illumise", "description": "Obtain an Illumise", "points": 1, "id": 314, "badges": 1},
    72: {"title": "Oddish", "description": "Obtain an Oddish", "points": 1, "id": 43, "badges": 1},
    73: {"title": "Gloom", "description": "Obtain a Gloom", "points": 2, "id": 44, "badges": 1},
    74: {"title": "Vileplume", "description": "Obtain a Vileplume", "points": 3, "id": 45, "badges": 6},
    75: {"title": "Bellossom", "description": "Obtain a Bellossom", "points": 3, "id": 182, "badges": 2},
    76: {"title": "Doduo", "description": "Obtain a Doduo", "points": 1, "id": 84, "badges": 5},
    77: {"title": "Dodrio", "description": "Obtain a Dodrio", "points": 2, "id":85, "badges": 5},
    78: {"title": "Gulpin", "description": "Obtain a Gulpin", "points": 1, "id": 316, "badges": 1},
    79: {"title": "Swalot", "description": "Obtain a Swalot", "points": 2, "id": 317, "badges": 1},
    80: {"title": "Carvanha", "description": "Obtain a Carvanha", "points": 1, "id": 318, "badges": 5},
    81: {"title": "Sharpedo", "description": "Obtain a Sharpedo", "points": 2, "id": 319, "badges": 5},
    82: {"title": "Wailmer", "description": "Obtain a Wailmer", "points": 1, "id": 320, "badges": 5},
    83: {"title": "Wailord", "description": "Obtain a Wailord", "points": 2, "id": 321, "badges": 5},
    84: {"title": "Numel", "description": "Obtain a Numel", "points": 1, "id": 322, "badges": 2},
    85: {"title": "Camerupt", "description": "Obtain a Camerupt", "points": 2, "id": 323, "badges": 2},
    86: {"title": "Slugma", "description": "Obtain a Slugma", "points": 1, "id": 218, "badges": 2},
    87: {"title": "Magcargo", "description": "Obtain a Magcargo", "points": 2, "id": 219, "badges": 2},
    88: {"title": "Torkoal", "description": "Obtain a Torkoal", "points": 1, "id": 324, "badges": 2},
    89: {"title": "Grimer", "description": "Obtain a Grimer", "points": 1, "id": 88, "badges": 2},
    90: {"title": "Muk", "description": "Obtain a Muk", "points": 2, "id": 89, "badges": 2},
    91: {"title": "Koffing", "description": "Obtain a Koffing", "points": 1, "id": 109, "badges": 2},
    92: {"title": "Weezing", "description": "Obtain a Weezing", "points": 2, "id": 110, "badges": 2},
    93: {"title": "Spoink", "description": "Obtain a Spoink", "points": 1, "id": 325, "badges": 2},
    94: {"title": "Grumpig", "description": "Obtain a Grumpig", "points": 2, "id": 326, "badges": 2},
    95: {"title": "Sandshrew", "description": "Obtain a Sandshrew", "points": 1, "id": 27, "badges": 3},
    96: {"title": "Sandslash", "description": "Obtain a Sandslash", "points": 2, "id": 28, "badges": 3},
    97: {"title": "Spinda", "description": "Obtain a Spinda", "points": 1, "id": 327, "badges": 2},
    98: {"title": "Skarmory", "description": "Obtain a Skarmory", "points": 1, "id": 227, "badges": 2},
    99: {"title": "Trapinch", "description": "Obtain a Trapinch", "points": 1, "id": 328, "badges": 3},
    100: {"title": "Vibrava", "description": "Obtain a Vibrava", "points": 2, "id": 329, "badges": 3},
    101: {"title": "Flygon", "description": "Obtain a Flygon", "points": 3, "id": 330, "badges": 3},
    102: {"title": "Cacnea", "description": "Obtain a Cacnea", "points": 1, "id": 331, "badges": 3},
    103: {"title": "Cacturne", "description": "Obtain a Cacturne", "points": 2, "id": 332, "badges": 3},
    104: {"title": "Swablu", "description": "Obtain a Swablu", "points": 1, "id": 333, "badges": 2},
    105: {"title": "Altaria", "description": "Obtain an Altaria", "points": 2, "id": 334, "badges": 2},
    106: {"title": "Seviper", "description": "Obtain a Seviper", "points": 1, "id": 336, "badges": 2},
    107: {"title": "Solrock", "description": "Obtain a Solrock", "points": 1, "id": 338, "badges": 2},
    108: {"title": "Barboach", "description": "Obtain a Barboach", "points": 1, "id": 339, "badges": 5},
    109: {"title": "Whiscash", "description": "Obtain a Whiscash", "points": 2, "id": 340, "badges": 5},
    110: {"title": "Corphish", "description": "Obtain a Corphish", "points": 1, "id": 341, "badges": 5},
    111: {"title": "Crawdaunt", "description": "Obtain a Crawdaunt", "points": 2, "id": 342, "badges": 5},
    112: {"title": "Baltoy", "description": "Obtain a Baltoy", "points": 1, "id": 343, "badges": 3},
    113: {"title": "Claydol", "description": "Obtain a Claydol", "points": 2, "id": 344, "badges": 3},
    114: {"title": "Lileep", "description": "Obtain a Lileep", "points": 1, "id": 345, "badges": 9},
    115: {"title": "Cradily", "description": "Obtain a Cradily", "points": 2, "id": 346, "badges": 9},
    116: {"title": "Anorith", "description": "Obtain an Anorith", "points": 1, "id": 347, "badges": 9},
    117: {"title": "Armaldo", "description": "Obtain an Armaldo", "points": 2, "id": 348, "badges": 9},
    118: {"title": "Igglybuff", "description": "Obtain an Igglybuff", "points": 1, "id": 174, "badges": 5},
    119: {"title": "Jigglypuff", "description": "Obtain a Jigglypuff", "points": 2, "id": 39, "badges": 5},
    120: {"title": "Feebas", "description": "Obtain a Feebas", "points": 5, "id": 349, "badges": 5},
    121: {"title": "Milotic", "description": "Obtain a Milotic", "points": 5, "id": 350, "badges": 5},
    122: {"title": "Castform", "description": "Obtain a Castform", "points": 1, "id": 351, "badges": 5},
    123: {"title": "Staryu", "description": "Obtain a Staryu", "points": 1, "id": 120, "badges": 5},
    124: {"title": "Starmie", "description": "Obtain a Starmie", "points": 2, "id": 121, "badges": 6},
    125: {"title": "Kecleon", "description": "Obtain a Kecleon", "points": 1, "id": 352, "badges": 5},
    126: {"title": "Shuppet", "description": "Obtain a Shuppet", "points": 1, "id": 353, "badges": 5},
    127: {"title": "Banette", "description": "Obtain a Banette", "points": 2, "id": 354, "badges": 5},
    128: {"title": "Duskull", "description": "Obtain a Duskull", "points": 1, "id": 355, "badges": 5},
    129: {"title": "Dusclops", "description": "Obtain a Dusclops", "points": 2, "id": 356, "badges": 5},
    130: {"title": "Tropius", "description": "Obtain a Tropius", "points": 1, "id": 357, "badges": 5},
    131: {"title": "Chimecho", "description": "Obtain a Chimecho", "points": 1, "id": 358, "badges": 5},
    132: {"title": "Absol", "description": "Obtain an Absol", "points": 1, "id": 359, "badges": 5},
    133: {"title": "Vulpix", "description": "Obtain a Vulpix", "points": 1, "id": 37, "badges": 5},
    134: {"title": "Ninetales", "description": "Obtain a Ninetales", "points": 2, "id": 38, "badges": 5},
    135: {"title": "Pichu", "description": "Obtain a Pichu", "points": 1, "id": 172, "badges": 5},
    136: {"title": "Pikachu", "description": "Obtain a Pikachu", "points": 2, "id": 25, "badges": 5},
    137: {"title": "Raichu", "description": "Obtain a Raichu", "points": 3, "id": 26, "badges": 5},
    138: {"title": "Psyduck", "description": "Obtain a Psyduck", "points": 1, "id": 54, "badges": 5},
    139: {"title": "Golduck", "description": "Obtain a Golduck", "points": 2, "id": 55, "badges": 5},
    140: {"title": "Wynaut", "description": "Obtain a Wynaut", "points": 1, "id": 360, "badges": 2},
    141: {"title": "Wobbuffet", "description": "Obtain a Wobbuffet", "points": 2, "id": 202, "badges": 2},
    142: {"title": "Natu", "description": "Obtain a Natu", "points": 1, "id": 177, "badges": 5},
    143: {"title": "Xatu", "description": "Obtain a Xatu", "points": 2, "id": 178, "badges": 5},
    144: {"title": "Girafarig", "description": "Obtain a Girafarig", "points": 1, "id": 203, "badges": 5},
    145: {"title": "Phanpy", "description": "Obtain a Phanpy", "points": 1, "id": 231, "badges": 5},
    146: {"title": "Donphan", "description": "Obtain a Donphan", "points": 2, "id": 232, "badges": 5},
    147: {"title": "Pinsir", "description": "Obtain a Pinsir", "points": 1, "id": 127, "badges": 5},
    148: {"title": "Heracross", "description": "Obtain a Heracross", "points": 1, "id": 214, "badges": 5},
    149: {"title": "Rhyhorn", "description": "Obtain a Rhyhorn", "points": 1, "id": 111, "badges": 5},
    150: {"title": "Rhydon", "description": "Obtain a Rhydon", "points": 2, "id": 112, "badges": 5},
    151: {"title": "Snorunt", "description": "Obtain a Snorunt", "points": 1, "id": 361, "badges": 5},
    152: {"title": "Glalie", "description": "Obtain a Glalie", "points": 2, "id": 362, "badges": 5},
    153: {"title": "Spheal", "description": "Obtain a Spheal", "points": 1, "id": 363, "badges": 5},
    154: {"title": "Sealeo", "description": "Obtain a Sealeo", "points": 2, "id": 364, "badges": 5},
    155: {"title": "Walrein", "description": "Obtain a Walrein", "points": 3, "id": 365, "badges": 5},
    156: {"title": "Clamperl", "description": "Obtain a Clamperl", "points": 1, "id": 366, "badges": 6},
    157: {"title": "Relicanth", "description": "Obtain a Relicanth", "points": 1, "id": 369, "badges": 6},
    158: {"title": "Corsola", "description": "Obtain a Corsola", "points": 1, "id": 222, "badges": 5},
    159: {"title": "Chinchou", "description": "Obtain a Chinchou", "points": 1, "id": 170, "badges": 6},
    160: {"title": "Lanturn", "description": "Obtain a Lanturn", "points": 2, "id": 171, "badges": 6},
    161: {"title": "Luvdisc", "description": "Obtain a Luvdisc", "points": 1, "id": 370, "badges": 5},
    162: {"title": "Horsea", "description": "Obtain a Horsea", "points": 1, "id": 116, "badges": 5},
    163: {"title": "Seadra", "description": "Obtain a Seadra", "points": 2, "id": 117, "badges": 5},
    164: {"title": "Bagon", "description": "Obtain a Bagon", "points": 1, "id": 371, "badges": 7},
    165: {"title": "Shelgon", "description": "Obtain a Shelgon", "points": 2, "id": 372, "badges": 7},
    166: {"title": "Salamence", "description": "Obtain a Salamence", "points": 3, "id": 373, "badges": 7},
    167: {"title": "Beldum", "description": "Obtain a Beldum", "points": 1, "id": 374, "badges": 9},
    168: {"title": "Metang", "description": "Obtain a Metang", "points": 2, "id": 375, "badges": 9},
    169: {"title": "Metagross", "description": "Obtain a Metagross", "points": 3, "id": 376, "badges": 9},
    170: {"title": "Regirock", "description": "Obtain a Regirock", "points": 1, "id": 377, "badges": 6},
    171: {"title": "Regice", "description": "Obtain a Regice", "points": 1, "id": 378, "badges": 6},
    172: {"title": "Registeel", "description": "Obtain a Registeel", "points": 1, "id": 379, "badges": 6},
    173: {"title": "Kyogre", "description": "Obtain a Kyogre", "points": 1, "id": 382, "badges": 9},
    174: {"title": "Groudon", "description": "Obtain a Groudon", "points": 1, "id": 383, "badges": 9},
    175: {"title": "Rayquaza", "description": "Obtain a Rayquaza", "points": 1, "id": 384, "badges": 9},
    176: {"title": "Meowth", "description": "Obtain a Meowth", "points": 1, "id": 52, "badges": 9},
    177: {"title": "Persian", "description": "Obtain a Persian", "points": 2, "id": 53, "badges": 9},
    178: {"title": "Ditto", "description": "Obtain a Ditto", "points": 1, "id": 132, "badges": 9},
    179: {"title": "Hoothoot", "description": "Obtain a Hoothoot", "points": 1, "id": 163, "badges": 9},
    180: {"title": "Noctowl", "description": "Obtain a Noctowl", "points": 2, "id": 164, "badges": 9},
    181: {"title": "Ledyba", "description": "Obtain a Ledyba", "points": 1, "id": 165, "badges": 9},
    182: {"title": "Ledian", "description": "Obtain a Ledian", "points": 2, "id": 166, "badges": 9},
    183: {"title": "Spinarak", "description": "Obtain a Spinarak", "points": 1, "id": 167, "badges": 9},
    184: {"title": "Ariados", "description": "Obtain an Ariados", "points": 2, "id": 168, "badges": 9},
    185: {"title": "Mareep", "description": "Obtain a Mareep", "points": 1, "id": 179, "badges": 9},
    186: {"title": "Flaaffy", "description": "Obtain a Flaaffy", "points": 2, "id": 180, "badges": 9},
    187: {"title": "Ampharos", "description": "Obtain an Ampharos", "points": 3, "id": 181, "badges": 9},
    188: {"title": "Sudowoodo", "description": "Obtain a Sudowoodo", "points": 1, "id": 185, "badges": 9},
    189: {"title": "Aipom", "description": "Obtain an Aipom", "points": 1, "id": 190, "badges": 9},
    190: {"title": "Sunkern", "description": "Obtain a Sunkern", "points": 1, "id": 191, "badges": 9},
    191: {"title": "Sunflora", "description": "Obtain a Sunflora", "points": 2, "id": 192, "badges": 9},
    192: {"title": "Wooper", "description": "Obtain a Wooper", "points": 1, "id": 194, "badges": 9},
    193: {"title": "Quagsire", "description": "Obtain a Quagsire", "points": 2, "id": 195, "badges": 9},
    194: {"title": "Pineco", "description": "Obtain a Pineco", "points": 1, "id": 204, "badges": 9},
    195: {"title": "Forretress", "description": "Obtain a Forretress", "points": 2, "id": 205, "badges": 9},
    196: {"title": "Gligar", "description": "Obtain a Gligar", "points": 1, "id": 207, "badges": 9},
    197: {"title": "Snubbull", "description": "Obtain a Snubbull", "points": 1, "id": 209, "badges": 9},
    198: {"title": "Granbull", "description": "Obtain a Granbull", "points": 2, "id": 210, "badges": 9},
    199: {"title": "Shuckle", "description": "Obtain a Shuckle", "points": 1, "id": 213, "badges": 9},
    200: {"title": "Teddiursa", "description": "Obtain a Teddiursa", "points": 1, "id": 216, "badges": 9},
    201: {"title": "Ursaring", "description": "Obtain an Ursaring", "points": 2, "id": 217, "badges": 9},  
    202: {"title": "Remoraid", "description": "Obtain a Remoraid", "points": 1, "id": 223, "badges": 9},
    203: {"title": "Octillery", "description": "Obtain an Octillery", "points": 2, "id": 224, "badges": 9},
    204: {"title": "Houndour", "description": "Obtain a Houndour", "points": 1, "id": 228, "badges": 9},
    205: {"title": "Houndoom", "description": "Obtain a Houndoom", "points": 2, "id": 229, "badges": 9},
    206: {"title": "Stantler", "description": "Obtain a Stantler", "points": 1, "id": 234, "badges": 9},
    207: {"title": "Smeargle", "description": "Obtain a Smeargle", "points": 1, "id": 235, "badges": 9},
    208: {"title": "Miltank", "description": "Obtain a Miltank", "points": 1, "id": 241, "badges": 9},
}

// Starters and Latias/Latios List
SpecialCaseList = 
{ 
    1: {"title": "Starter I", "description": "Obtain a Treecko, Torchic or Mudkip", "points": 1},
    2: {"title": "Starter II", "description": "Obtain a Grovyle, Combusken or Marshtomp", "points": 2},
    3: {"title": "Starter III", "description": "Obtain a Sceptile, Blaziken or Swampert", "points": 3},
    4: {"title": "Red or Blue?", "description": "Obtain a Latias or Latios", "points": 5},
}

// Gym Badge List
BadgeChallengeList =
{
    1: {"title": "Rustboro Rumble - Badge 1", "description": "Beat Roxanne with 39 Pokemon in the Pokedex", "points": 10, "offset": 0, "bit": bit7, "map": 0x0b, "submap": 0x03, "submapTwo": 0x03, "caughtAmount": 39},
    2: {"title": "Mauville Marvel - Badge 2", "description": "Beat Winston with 66 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit1, "map": 0x0a, "submap": 0x00, "submapTwo": 0x00, "caughtAmount": 66},
    3: {"title": "Lavaridge Lover - Badge 3", "description": "Beat Flannary with 90 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit2, "map": 0x04, "submap": 0x01, "submapTwo": 0x02, "caughtAmount": 90},
    4: {"title": "Dewford Dominator - Badge 4", "description": "Beat Brawly with 101 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit3, "map": 0x03, "submap": 0x03, "submapTwo": 0x03, "caughtAmount": 101},
    5: {"title": "Petalburg Powerhouse - Badge 5", "description": "Beat Norman with 101 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit4, "map": 0x08, "submap": 0x01, "submapTwo": 0x01, "caughtAmount": 101},
    6: {"title": "Mossdeep Master - Badge 6", "description": "Beat Tate and Liza with 156 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit5, "map": 0x0e, "submap": 0x00, "submapTwo": 0x00, "caughtAmount": 156},
    7: {"title": "Sootopolis Saviour - Badge 7", "description": "Beat Jaun with 167 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit6, "map": 0x0f, "submap": 0x00, "submapTwo": 0x01, "caughtAmount": 167},
    8: {"title": "Fortree Flyer - Badge 8", "description": "Beat Winona with 171 Pokemon in the Pokedex", "points": 10, "offset": 1, "bit": bit7, "map": 0x0c, "submap": 0x01, "submapTwo": 0x01, "caughtAmount": 171},
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

function CaughtPokemon(id, badge)
{
    return 
    PointerNotNull() && 
    PlayerInGame() &&
    MapBank() == prev(MapBank()) && 
    PokedexFlag(id) > prev(PokedexFlag(id))
}

function PrevLevelMusic() {
    MusicID() == LevelUpMusic &&
    prev(MusicID()) == LevelUpMusic
}

// Starter Achievments
achievement(
    SpecialCaseList[1]["title"],
    SpecialCaseList[1]["description"],
    SpecialCaseList[1]["points"],
    PlayerInGame() && PointerNotNull() && (CaughtPokemon(252, 0) || CaughtPokemon(255, 0) || CaughtPokemon(258, 0))
    )

achievement(
    SpecialCaseList[2]["title"],
    SpecialCaseList[2]["description"],
    SpecialCaseList[2]["points"],
    PlayerInGame() && PointerNotNull() && (CaughtPokemon(253, 0) || CaughtPokemon(256, 0) || CaughtPokemon(259, 0))
    )

achievement(
    SpecialCaseList[3]["title"],
    SpecialCaseList[3]["description"],
    SpecialCaseList[3]["points"],
    PlayerInGame() && PointerNotNull() && (CaughtPokemon(254, 0) || CaughtPokemon(257, 0) || CaughtPokemon(260, 0))
    )

// Main Achievements

// New template that uses the pokemons national dex id number and uses a function to calculate the offset from there
function AchievementTemplate(title, description, points, id, badge)
{
    achievement(title, description, points, CaughtPokemon(id, badge))
}

for Pokemon in CatchableList
{        
    AchievementTemplate(
        CatchableList[Pokemon]["title"],
        CatchableList[Pokemon]["description"],
        CatchableList[Pokemon]["points"],
        CatchableList[Pokemon]["id"],
        CatchableList[Pokemon]["badges"])
}

// Latias/Latios Achievement
achievement(
    SpecialCaseList[4]["title"],
    SpecialCaseList[4]["description"],
    SpecialCaseList[4]["points"],
    CaughtPokemon(380, 9) || CaughtPokemon(381, 9)
    )




function CheckPrevBadge(badge)
{
    Sum = always_true()
    Count = 0
    for Pokemon in CatchableList
    {
        if(CatchableList[Pokemon]["badges"] < badge)
        {
            Sum = Sum && PokedexFlag(CatchableList[Pokemon]["id"]) == 1
            
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
    
    if(badge == 4 || badge == 5)
    {
        Sum = Sum && ((PokedexFlag(345) == 1 && PokedexFlag(346) == 1 ) || (PokedexFlag(347) == 1 && PokedexFlag(348) == 1))
    }
    
    if(badge == 6)
    {
        Sum = Sum && ((PokedexFlag(345) == 1 && PokedexFlag(346) == 1 ) || (PokedexFlag(347) == 1 && PokedexFlag(348) == 1) || (PokedexFlag(45) == 1 || PokedexFlag(275) == 1))
    }
    
    if(badge == 9)
    {
        Sum = Sum && ((PokedexFlag(380) == 1 || PokedexFlag(381) == 1))
    }
    
    return Sum
}

ActualBadgeCount = 0
// Gym Challenge Checkpoints
function GymBadgeTemplate(title, description, points, offset, bit, map, submap, submapTwo, caughtAmount)
{
    obtainedBadge = bit(Pointer() + BadgeOffsetArray[offset]) > prev(bit(Pointer() + BadgeOffsetArray[offset]))
    achievement(    
        title,
        description,
        points,
        trigger_when(once(MusicID() == GymLeaderBattleMusic) && obtainedBadge) &&
        CheckPrevBadge(ActualBadgeCount + 1) &&
        disable_when(MapBank() != map, until=MapBank() == map) &&
        PlayerInGame() &&
        PointerNotNull() &&
        (SubMap() == submap || (SubMap() == submapTwo)))
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
        BadgeChallengeList[Badge]["caughtAmount"])
}


// Final achievement
achievement(
    "Stevens' Superior - Final Battle",
    "Beat Steven Stone at Meteor Falls with 212 Pokemon in the Pokedex",
    10,
    PointerNotNull() &&
    PlayerInGame() &&
    trigger_when(repeated(750, MusicID() == StevenStoneBattleMusic)) &&
    trigger_when(
        (Opp1Health() == 0 &&
        Opp2Health() == 0 &&
        Opp3Health() == 0 &&
        Opp4Health() == 0 &&
        Opp5Health() == 0 &&
        Opp6Health() == 0)
    ) &&
    CheckPrevBadge(9) &&
    disable_when(MapBank() != 0x18, until=MapBank() == 0x18) &&
    disable_when(SubMap() != 0x6b, until=SubMap() == 0x6b)
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

function SumOfBadges()
{
    BadgeSum = bitcount(Pointer() + 0x937D) - bit7(Pointer() + 0x937D) + bit7(Pointer() + 0x937C)
    return BadgeSum
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







