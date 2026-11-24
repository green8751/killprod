local turrets = require("turret-types")
local ammocats = require("ammo-catagories")
local bonus = settings.startup["KP-bonus-damage-boost"].value

-- add turrets to the resurch
for _, i in pairs(turrets) do
    table.insert(data.raw.technology["KP-bonus-damage"].effects--[[@cast -?]],
        {
            type = "turret-attack",
            turret_id = i,
            modifier = bonus
        })
end

-- add damage catagories resurch
for _, i in pairs(ammocats) do
    table.insert(data.raw.technology["KP-bonus-damage"].effects--[[@cast -?]],
        {
            type = "ammo-damage",
            ammo_category = i,
            modifier = bonus
        })
end