require("functions.violence_array_builder")

KP_array_builder("startup")

data:extend({
    {
        type = "bool-setting",
        name = "KP-bonus-damage",
        setting_type = "startup",
        default_value = true,
        order = "a1"
    },{
        type = "bool-setting",
        name = "KP-ammo-prod",
        setting_type = "startup",
        default_value = true,
        order = "a2"
    },{
        type = "bool-setting",
        name = "KP-sci-prod",
        setting_type = "startup",
        default_value = false,
        order = "a3"
    },{
        type = "bool-setting",
        name = "KP-override-Violence-values",
        setting_type = "runtime-global",
        default_value = false,
        order = "a4"
    }
})

local x = 0
for n, i in pairs(final_array) do
    local y = 0
    x = x + 1
    for q, j in pairs(i) do
        y = y + 1
        data.extend({
            {
                type = "double-setting",
                name = "KP-" .. j[1],
                setting_type = "runtime-global",
                default_value = j[2],
                minimum_value = 0.01,
                maximum_value = 1000,
                order = "b" .. x .. y
            }
        })
    end
end