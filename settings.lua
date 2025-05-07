data:extend({
    {
        type = "bool-setting",
        name = "bonus-damage",
        setting_type = "startup",
        default_value = true
    },{
        type = "bool-setting",
        name = "ammo-prod",
        setting_type = "startup",
        default_value = true
    },{
        type = "bool-setting",
        name = "sci-prod",
        setting_type = "startup",
        default_value = true
    },{
        type = "bool-setting",
        name = "override-Violence-values",
        setting_type = "runtime-global",
        default_value = false
    },{
        type = "double-setting",
        name = "small-biters",
        setting_type = "runtime-global",
        default_value = 1,
        minamum_value = 0.01,
        maximum_value = 1000
    }
})