-- add placeholders
data:extend({
    {--adds the violence placeholder
        type = "tool",
        name = "KP-Violence",
        stack_size = 50,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        durability = 1,
        order = "zzz"
    },{--adds the fake lab for the placeholder
        type = "lab",
        name = "KP-Violence-lab",
        hidden = true,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        energy_usage = "1W",
        energy_source = {type = "void"},
        inputs = {"KP-Violence"}
    }
})

-- prep raw resurch
-- formulas are for ingame visuals only, actualy controlled by a script
-- preps sci prod if enabled
if not settings.startup["KP-sci-prod"].value == "off" then
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
            effects = {}
        }
    })
end

-- preps ammo prod if enabled
if settings.startup["KP-ammo-prod"].value then
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
end

-- preps bonus damage if enabled
if settings.startup["KP-bonus-damage"].value then
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
            effects = {}
        }
    })
end