require("functions.functions")
local sci_types = require("research-builder.Sci-Prod.science_types")
local bonus = settings.startup["KP-sci-prod-boost"].value

if settings.startup["KP-sci-prod"].value == "off" then return end

-- adds 5% prod to labs if sci prod is enabled
data.extend({
    {
        type = "technology",
        name = "KP-sci-prod",
        icon = "__base__/graphics/icons/lab.png",
        upgrade = true,
        unit = {
            count_formula = "500*2^L", -- consider changing to 1.3, and adding a seprate multiplier
            ingredients = {{"KP-Violence", 1}},
            time = 69
        },
        max_level = "infinite",
        effects = {
        }
    }
})

if settings.startup["KP-sci-prod"].value == "both" or settings.startup["KP-sci-prod"].value == "lab boost only" then
    table.insert(data.raw.technology["KP-sci-prod"].effects--[[@cast -?]],
        {
            type = "laboratory-productivity",
            modifier = bonus
        }
    )
end

if settings.startup["KP-sci-prod"].value == "both" or settings.startup["KP-sci-prod"].value == "science only" then
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
end