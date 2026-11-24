require("functions.functions")
local sci_types = require("research-builder.Sci-Prod.science_types")
local bonus = settings.startup["KP-sci-prod-boost"].value

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