require("functions.functions")

-- adds 5% prod to amunition if ammo prod is enabled
data.extend({
    {
        type = "technology",
        name = "KP-ammo-prod",
        icon = "__base__/graphics/icons/firearm-magazine.png",
        upgrade = true,
        unit = {
            count_formula = "25*2^L",
            ingredients = {{"KP-Violence", 1}},
            time = 69
        },
        max_level = "infinite",
        effects = {}
    }
})

-- load basegame ammo types
local ammorecipe = {"firearm-magazine", "piercing-rounds-magazine", "uranium-rounds-magazine", "shotgun-shell", "piercing-shotgun-shell",
    "cannon-shell", "explosive-cannon-shell", "uranium-cannon-shell", "explosive-uranium-cannon-shell", "artillery-shell",
    "rocket", "explosive-rocket", "atomic-bomb", "flamethrower-ammo", "land-mine",
    "grenade", "cluster-grenade", "poison-capsule", "slowdown-capsule", "defender-capsule", "distractor-capsule", "destroyer-capsule",}

-- add in mod specific ammo types
if mods["Krastorio2"] then -- add in krastorio ammo and consumables
    local krastorio_ammoprod = {"kr-rifle-magazine","kr-armor-piercing-rifle-magazine","kr-uranium-rifle-magazine","kr-imersite-rifle-magazine",
        "kr-anti-materiel-rifle-magazine","kr-armor-piercing-anti-materiel-rifle-magazine","kr-uranium-anti-materiel-rifle-magazine","kr-imersite-anti-materiel-rifle-magazine",
        "kr-impulse-rifle-ammo",
        "kr-nuclear-artillery-shell","kr-antimatter-artillery-shell",
        "kr-biter-virus",
        "kr-basic-railgun-shell","kr-explosive-railgun-shell","kr-antimatter-railgun-shell",
        "kr-explosive-turret-rocket","kr-nuclear-turret-rocket","kr-antimatter-turret-rocket"}
    merge_lists(ammorecipe, krastorio_ammoprod)
end

if mods["space-age"] then -- add in space age ammo and consumables
    local spaceage_ammoprod = {"capture-robot-rocket","railgun-ammo","tesla-ammo"}
    merge_lists(ammorecipe, spaceage_ammoprod)
end

if mods["pyalternativeenergy"] then table.insert(ammorecipe, "nuclear-artillery-shell") end

-- load unwanted entries. if required for multimod compat entries can be restored via setting them to nul or false
local unwanted2={}
if mods["Krastorio2"] then unwanted2["uranium-rounds-magazine"]=true
    -- trim unwanted entries
    listtrim(ammorecipe, unwanted2)
end

-- actualy make the resurch effects
for _, i in pairs(ammorecipe) do
    table.insert(data.raw["technology"]["KP-ammo-prod"].effects,
        {
            type = "change-recipe-productivity",
            recipe = i,
            change = 0.05
        })
end