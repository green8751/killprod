require("functions.functions")
-- if ammo prod is enabled, remove unused ammo and consumables, then add in krastorio ammo and consumables
if settings.startup["ammo-prod"].value then
    Remove_effects("ammo-prod", "prod", {"uranium-rounds-magazine"})

    local SPammoprod = {"kr-rifle-magazine","kr-armor-piercing-rifle-magazine","kr-uranium-rifle-magazine","kr-imersite-rifle-magazine",
        "kr-anti-materiel-rifle-magazine","kr-armor-piercing-anti-materiel-rifle-magazine","kr-uranium-anti-materiel-rifle-magazine","kr-imersite-anti-materiel-rifle-magazine",
        "kr-impulse-rifle-ammo",
        "kr-nuclear-artillery-shell","kr-antimatter-artillery-shell",
        "kr-biter-virus",
        "kr-basic-railgun-shell","kr-explosive-railgun-shell","kr-antimatter-railgun-shell",
        "kr-explosive-turret-rocket","kr-nuclear-turret-rocket","kr-antimatter-turret-rocket"}
    for _, i in pairs(SPammoprod) do
        table.insert(data.raw["technology"]["ammo-prod"].effects,
            {
                type = "change-recipe-productivity",
                recipe = i,
                change = 0.05
            }
        )
    end
end

-- if bonus damage is enabled, add space age wepons
if settings.startup["bonus-damage"].value then
    --table.remove(data.raw["technology"]["ammo-damage"].effects, 12)
    Remove_effects("ammo-damage", "damage", {"beam"})
    local bonus_damage = {"kr-impulse-rifle","kr-heavy-rocket","kr-railgun-shell","kr-turret-missile","kr-pistol","kr-anti-materiel-rifle-ammo"}
    for _, i in pairs(bonus_damage) do
        table.insert(data.raw["technology"]["ammo-damage"].effects,
            {
                type = "ammo-damage",
                ammo_category = i,
                modifier = 0.1
            }
        )
    end
end

-- add folowing cards to sci prod: matter, basic, advanced, singularity, space
-- add space sci packs if sci-prod is enabled
if settings.startup["sci-prod"].value then
    local sci_prod = {"space-science-pack","kr-basic-tech-card","kr-matter-tech-card","kr-advanced-tech-card","kr-singularity-tech-card"}
    for _, i in pairs(sci_prod) do
        table.insert(data.raw["technology"]["sci-prod"].effects,
            {
                type = "change-recipe-productivity",
                recipe = i,
                change = 0.05
            }
        )
    end
end