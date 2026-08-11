-- dedicated sub sections of the mod
if settings.startup["KP-ammo-prod"].value == true then require("research-builder.KP-ammo-prod") end
if settings.startup["KP-bonus-damage"].value == true then require("research-builder.KP-bonus-damage") end
if settings.startup["KP-sci-prod"].value == true then require("research-builder.KP-sci-prod") end

-- one mod compat list
--[[
"space-age"
"Krastorio2"
]]

-- 2 mod compat list
--[[
"Krastorio2-spaced-out"
]]

-- py pack compat list. for people who hate themselves, but not THAT much.
--[[
"pyalienlife"
"pyhightech"
"pyalternativeenergy" -- implicit. same with the rest of py
]]

-- add placeholders
data.extend({
    {--adds the violence placeholder
        type = "tool",
        name = "KP-Violence",
        stack_size = 50,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        durability = 1,
        order = "zzz"
    },{--adds the vake lab for teh placeholder
        type = "lab",
        name = "KP-Violence-lab",
        hidden = true,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        energy_usage = "1W",
        energy_source = {type = "void"},
        inputs = {"KP-Violence"}
    }
})