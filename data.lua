-- add placeholders
data:extend({
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