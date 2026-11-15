require("functions.functions")
local sci_types = require("research-builder.Sci-Prod.science_types")
local bonus = settings.startup["KP-sci-prod-boost"].value

if not settings.startup["KP-sci-prod"].value == true then return end

-- adds 5% prod to labs if sci prod is enabled
data.extend({
    {
        type = "technology",
        name = "KP-sci-prod",
        icon = "__base__/graphics/icons/lab.png",
        upgrade = true,
        unit = {
            count_formula = "500*2^L",
            ingredients = {{"KP-Violence", 1}},
            time = 69
        },
        max_level = "infinite",
        effects = {
            {
                type = "laboratory-productivity",
                modifier = bonus
            }
        }
    }
})

-- add sci to resurch
for _, i in pairs(sci_types) do
    table.insert(data.raw.technology["KP-sci-prod"].effects--[[@cast -?]],
        {
            type = "change-recipe-productivity",
            recipe = i,
            change = bonus
        }
    )
end