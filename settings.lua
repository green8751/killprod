-- require("Violence-Array.violence_array_builder")
require("Violence-Array.entity-catagories")

local types = types("startup")

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
        type = "string-setting",
        name = "KP-sci-prod",
        setting_type = "startup",
        default_value = "off",
        allowed_values = {"off", "science only", "lab boost only", "both"},
        order = "a3"
    },{
        type = "bool-setting",
        name = "KP-override-Violence-values",
        setting_type = "runtime-global",
        default_value = false,
        order = "a4"
    },{
        type = "double-setting",
        name = "KP-ammo-prod-boost",
        setting_type = "startup",
        default_value = 0.05,
        minimum_value = 0.01,
        maximum_value = 1,
        hidden = true,
        order = "a5"
    },{
        type = "double-setting",
        name = "KP-bonus-damage-boost",
        setting_type = "startup",
        default_value = 0.1,
        minimum_value = 0.01,
        maximum_value = 1,
        hidden = true,
        order = "a6"
    },{
        type = "double-setting",
        name = "KP-sci-prod-boost",
        setting_type = "startup",
        default_value = 0.05,
        minimum_value = 0.01,
        maximum_value = 1,
        hidden = true,
        order = "a7"
    }
})

local total = 0
local z = 0
for i, v in pairs(types) do
    total = total + 1
    z = z + 1
    data.extend({
        {
            type = "double-setting",
            name = "KP-" .. i,
            setting_type = "runtime-global",
            default_value = v,
            order = "b" .. string.format("%03d", z)
        }
    })
end

if total < 100 then
    log(total .. " settings generated")
else
    log("WARNING: TOO MANY SETTINGS ARE GENERATING, CHECK CAUSE. " .. total .. " SETTINGS GENERATED")
end

if mods["Voidcraft"] then
    data:extend({
        {
            type = "bool-setting",
            name = "KP-raw-void",
            setting_type = "startup",
            default_value = false,
            order = "b1"
        },{
            type = "bool-setting",
            name = "KP-flux-void",
            setting_type = "startup",
            default_value = false,
            order = "b2"
        },{
            type = "bool-setting",
            name = "KP-coherence-void",
            setting_type = "startup",
            default_value = true,
            order = "b3"
        },{
            type = "bool-setting",
            name = "KP-quality-void",
            setting_type = "startup",
            default_value = false,
            order = "b4"
        }
    })
end