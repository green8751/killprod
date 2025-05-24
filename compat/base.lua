-- adds 5% prod to amunition if ammo prod is enabled
if settings.startup["ammo-prod"].value == true then
    data.extend({
        {
            type = "technology",
            name = "ammo-prod",
            icon = "__base__/graphics/icons/firearm-magazine.png",
            upgrade = true,
            unit = {
                count_formula = "25*2^L",
                ingredients = {{"Violence", 1}},
                time = 69
            },
            max_level = "infinite",
            effects = {
                {
                    type = "change-recipe-productivity",
                    recipe = "firearm-magazine",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "piercing-rounds-magazine",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "uranium-rounds-magazine",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "artillery-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "shotgun-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "piercing-shotgun-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "cannon-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "explosive-cannon-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "uranium-cannon-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "explosive-uranium-cannon-shell",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "rocket",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "explosive-rocket",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "atomic-bomb",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "flamethrower-ammo",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "grenade",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "cluster-grenade",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "poison-capsule",
                    change = 0.1
                },{
                    type = "change-recipe-productivity",
                    recipe = "slowdown-capsule",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "defender-capsule",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "distractor-capsule",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "destroyer-capsule",
                    change = 0.05
                },{
                    type = "change-recipe-productivity",
                    recipe = "land-mine",
                    change = 0.05
                }
            }
        }
    })
end

-- adds 10% damage to all weapons if bonus damage is enabled
if settings.startup["bonus-damage"].value == true then
    for _, i in pairs(data.raw["ammo-category"]) do
        local n = data.raw["ammo-category"].name
        log(n)
    end
end

if settings.startup["bonus-damage"].value == true then
    data.extend({
        {
            type = "technology",
            name = "ammo-damage",
            icon = "__base__/graphics/icons/firearm-magazine.png",
            upgrade = true,
            unit = {
                count_formula = "20*2^L",
                ingredients = {{"Violence", 1}},
                time = 69
            },
            max_level = "infinite",
            effects = {
                {
                    type = "ammo-damage",
                    ammo_category = "bullet",
                    modifier = 0.1
                },{
                    type = "turret-attack",
                    turret_id = "gun-turret",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "shotgun-shell",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "cannon-shell",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "flamethrower",
                    modifier = 0.1
                },{
                    type = "turret-attack",
                    turret_id = "flamethrower-turret",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "laser",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "rocket",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "grenade",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "landmine",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "artillery-shell",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "beam",
                    modifier = 0.1
                },{
                    type = "ammo-damage",
                    ammo_category = "electric",
                    modifier = 0.1
                }
            }
        }
    })
end

-- adds 1% prod to sci production and labs if sci prod is enabled
if settings.startup["sci-prod"].value == true then
    data.extend({
        {
            type = "technology",
            name = "sci-prod",
            icon = "__base__/graphics/icons/lab.png",
            upgrade = true,
            unit = {
                count_formula = "1000*L",
                ingredients = {{"Violence", 1}},
                time = 69
            },
            max_level = "infinite",
            effects = {
                {
                    type = "change-recipe-productivity",
                    recipe = "automation-science-pack",
                    change = 0.01
                },{
                    type = "change-recipe-productivity",
                    recipe = "logistic-science-pack",
                    change = 0.01
                },{
                    type = "change-recipe-productivity",
                    recipe = "military-science-pack",
                    change = 0.01
                },{
                    type = "change-recipe-productivity",
                    recipe = "chemical-science-pack",
                    change = 0.01
                },{
                    type = "change-recipe-productivity",
                    recipe = "production-science-pack",
                    change = 0.01
                },{
                    type = "change-recipe-productivity",
                    recipe = "utility-science-pack",
                    change = 0.01
                },{
                    type = "laboratory-productivity",
                    modifier = 0.01
                }
            }
        }
})
end