require("functions.functions")

-- adds 5% prod to labs if sci prod is enabled
data.extend({
    {
        type = "technology",
        name = "KP-sci-prod",
        icon = "__base__/graphics/icons/lab.png",
        upgrade = true,
        unit = {
            count_formula = "1000*L",
            ingredients = {{"KP-Violence", 1}},
            time = 69
        },
        max_level = "infinite",
        effects = {
            {
                type = "laboratory-productivity",
                modifier = 0.05
            }
        }
    }
})

-- prep sci types
local sci_types = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack"}

if mods["Krastorio2"] then -- add krastorio science
    local sci_prod = {"kr-basic-tech-card","kr-matter-tech-card","kr-advanced-tech-card","kr-singularity-tech-card"}
    merge_lists(sci_types, sci_prod)
end

if mods["space-age"] then -- add space age science packs
    local sci_prod = {"metallurgic-science-pack","agricultural-science-pack","electromagnetic-science-pack","cryogenic-science-pack","promethium-science-pack"}
    merge_lists(sci_types, sci_prod)
end

if mods["pyalienlife"] then -- add py life science
    local sci_prod = {"py-science-pack-1", "py-science-pack-2", "py-science-pack-3", "py-science-pack-4"}
    merge_lists(sci_types, sci_prod)
end

-- add space science if a supported mod is loaded
if mods["Krastorio2"] or mods["space-age"] or mods["pyhightech"] then table.insert(sci_types, "space-science-pack") end

-- remove unused sci packs
local unwanted = {}
if mods["Krastorio2-spaced-out"] then unwanted["kr-basic-tech-card"]=true end
listtrim(sci_types, unwanted)

-- add sci to resurch
for _, i in pairs(sci_types) do
    table.insert(data.raw.technology["KP-sci-prod"].effects,
        {
            type = "change-recipe-productivity",
            recipe = i,
            change = 0.05
        }
    )
end