-- base must come first, then order by count. multi mod is only required if they interact with the same things, or modify eachother in a way that matters for my mod
require("compat.base")

-- one mod
if mods["space-age"] then require("compat.space-age") end
if mods["Krastorio2"] then require("compat.krastorio") end

--2 mod compat

-- add placeholders
data.extend({
    {--adds the violence placeholder
        type = "tool",
        name = "Violence",
        stack_size = 50,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        durability = 1
    },{--adds the vake lab for teh placeholder
        type = "lab",
        name = "Violence-lab",
        hidden = true,
        icon = "__base__/graphics/icons/small-biter-corpse.png",
        energy_usage = "1W",
        energy_source = {type = "void"},
        inputs = {"Violence"}
    }
})