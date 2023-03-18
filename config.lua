Config = {}

--You can not add or remove any tables if you do it will break the script. You can however change the locations just because the location says for example valentine you can change the coords to be somewhere else.
Config.Webhookling = ''

Config.Setup = {
    Val = { --do not remove val
        location = 'val', -- Do not touch
        Bookielocation = {x = -237.49, y = 655.37, z = 113.32}, -- this is where the bookie will be
        Bookieheading = 175.87, --this is the bookies heading(direction he is facing)
        Fightersspawn = { --this is where the fighters will spawn do not add or remove any fighters only edit coords
            FighterA = {x = -232.46, y = 666.19, z = 113.31},
            FighterB = {x = -234.67, y = 667.46, z = 113.31},
        },
        cooldown = 60000, --this is the cooldown between fights in ms
    },
    BW = {
        location = 'bw', -- Do not touch
        Bookielocation = {x = -968.53, y = -1199.67, z = 58.03},
        Bookieheading = 175.87,
        Fightersspawn = {
            FighterA = {x = -957.91, y = -1193.95, z = 56.54},
            FighterB = {x = -954.75, y = -1193.45, z = 56.0},
        },
        cooldown = 60000,
    },
    SD = {
        location = 'sd', -- Do not touch
        Bookielocation = {x = 2145.85, y = -1279.18, z = 43.46},
        Bookieheading = 2.21,
        Fightersspawn = {
            FighterA = {x = 2142.77, y = -1271.88, z = 41.66},
            FighterB = {x = 2141.84, y = -1275.4, z = 41.64},
        },
        cooldown = 60000,
    },
    Armadillo = {
        location = 'armadillo', -- Do not touch
        Bookielocation = {x = -3675.6, y = -2550.36, z = -13.66},
        Bookieheading = 165.06,
        Fightersspawn = {
            FighterA = {x = -3676.17, y = -2547.32, z = -13.75},
            FighterB = {x = -3680.27, y = -2547.12, z = -13.77},
        },
        cooldown = 60000,
    },
    Annesburg = {
        location = 'annesburg', -- Do not touch
        Bookielocation = {x = 2947.84, y = 1425.5, z = 45.47},
        Bookieheading = 216.66,
        Fightersspawn = {
            FighterA = {x = 2945.85, y = 1419.21, z = 44.66},
            FighterB = {x = 2943.34, y = 1415.08, z = 44.76},
        },
        cooldown = 60000,
    },
}