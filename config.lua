Config = {}

--You can not add or remove any tables if you do it will break the script. You can however change the locations just because the location says for example valentine you can change the coords to be somewhere else.
Config.Webhookling = ''

Config.BookieBlip = true --false if you do not want blips to appear on the bookie

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
    TL = {
        location = 'tl', -- Do not touch
        Bookielocation = {x = -1414.28, y = -2212.16, z = 43.24},
        Bookieheading = 177.25,
        Fightersspawn = {
            FighterA = {x = -1410.31, y = -2204.65, z = 43.31},
            FighterB = {x = -1411.31, y = -2207.65, z = 43.31},
        },
        cooldown = 60000,
    },
    VH = {
        location = 'vh', -- Do not touch
        Bookielocation = {x = 2953.09, y = 595.26, z = 44.37},
        Bookieheading = 157.78,
        Fightersspawn = {
            FighterA = {x = 2958.66, y = 597.03, z = 44.37},
            FighterB = {x = 2957.66, y = 600.03, z = 44.37},
        },
        cooldown = 60000,
    },
    TW = {
        location = 'tw', -- Do not touch
        Bookielocation = {x = -5487.71, y = -2985.51, z = -1.54},
        Bookieheading = 150.24,
        Fightersspawn = {
            FighterA = {x = -5479.93, y = -2991.62, z = -5.14},
            FighterB = {x = -5481.93, y = -2989.62, z = -5.14},
        },
        cooldown = 60000,
    },
}
