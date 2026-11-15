require("functions.functions")
local ammorecipe = require("research-builder.Ammo-Prod.ammo_types")
local bonus = settings.startup["KP-ammo-prod-boost"].value

if not settings.startup["KP-ammo-prod"].value == true then return end

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

-- actualy make the resurch effects
for _, i in pairs(ammorecipe) do
    table.insert(data.raw["technology"]["KP-ammo-prod"].effects--[[@cast -?]],
        {
            type = "change-recipe-productivity",
            recipe = i,
            change = bonus
        })
end