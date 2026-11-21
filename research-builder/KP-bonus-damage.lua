require("functions.functions")
local bonus = settings.startup["KP-bonus-damage-boost"].value

if not settings.startup["KP-bonus-damage"].value == true then return end

-- adds 10% damage to all weapons if bonus damage is enabled
data.extend({
    {
        type = "technology",
        name = "KP-bonus-damage",
        icon = "__base__/graphics/icons/firearm-magazine.png",
        upgrade = true,
        unit = {
            count_formula = "20*2^L",
            ingredients = {{"KP-Violence", 1}},
            time = 69
        },
        max_level = "infinite",
        effects = {
            {
                type = "turret-attack",
                turret_id = "flamethrower-turret",
                modifier = bonus
            },{
                type = "turret-attack",
                turret_id = "gun-turret",
                modifier = bonus
            }
        }
    }
})

local ammocats = {}

-- initial load of all damage types
for i, _ in pairs(data.raw["ammo-category"]) do
    dlog(i .. " recorded")
    table.insert(ammocats, i)
end

-- load unwanted entries. if required for multimod compat entries can be restored via setting them to nul or false
local unwanted = {capsule=true, melee=true, biological=true}
if mods["Krastorio2"] then unwanted["beam"]=true end
if mods["space-age"] then unwanted["seismic"]=true end
if mods["pyalienlife"] then
    unwanted["caravan-control"]=true
    unwanted["dragon-breath"]=true
    unwanted["ulric-infusion"]=true
end
if mods["angelsaddons-cab"] then
    unwanted["angels-cab-deploy"] = true
    unwanted["angels-cab-undeploy"] = true
end

-- trim unwanted entries
listtrim(ammocats, unwanted)

-- actualy make the resurch effects
for _, i in pairs(ammocats) do
    table.insert(data.raw.technology["KP-bonus-damage"].effects--[[@cast -?]],
        {
            type = "ammo-damage",
            ammo_category = i,
            modifier = bonus
        })
end