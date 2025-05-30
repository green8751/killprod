local meld = require('meld')

-- if bonus damage is enabled, add space age wepons
-- if settings.startup["KP-bonus-damage"].value == true then
--     meld(data.raw["technology"]["ammo-damage"], {
--         effects = meld.append({
--             {
--                 type = "ammo-damage",
--                 ammo_category = "tesla",
--                 modifier = 0.1
--             }, {
--                 type = "ammo-damage",
--                 ammo_category = "railgun",
--                 modifier = 0.1
--             }
--         })
--     })
-- end

-- if ammo prod is enabled, add space age ammo
if settings.startup["KP-ammo-prod"].value == true then
    local KPammoprod = {"capture-robot-rocket","railgun-ammo","tesla-ammo"}
    for _, i in pairs(KPammoprod) do
        table.insert(data.raw["technology"]["KP-ammo-prod"].effects,
            {
                type = "change-recipe-productivity",
                recipe = i,
                change = 0.05
            }
        )
    end
end

-- add space sci packs if sci-prod is enabled
if settings.startup["KP-sci-prod"].value then
    local sci_prod = {"space-science-pack","metallurgic-science-pack","agricultural-science-pack","electromagnetic-science-pack","cryogenic-science-pack","promethium-science-pack"}
    for _, i in pairs(sci_prod) do
        table.insert(data.raw.technology["KP-sci-prod"].effects,
            {
                type = "change-recipe-productivity",
                recipe = i,
                change = 0.05
            }
        )
    end
end