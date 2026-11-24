require("functions.functions")
local ammorecipe = require("research-builder.Ammo-Prod.ammo_types")
local bonus = settings.startup["KP-ammo-prod-boost"].value

if settings.startup["KP-ammo-prod"].value then
    -- actualy make the resurch effects
    for _, i in pairs(ammorecipe) do
        table.insert(data.raw["technology"]["KP-ammo-prod"].effects--[[@cast -?]],
            {
                type = "change-recipe-productivity",
                recipe = i,
                change = bonus
            })
    end
end