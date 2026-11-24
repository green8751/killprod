---@diagnostic disable: need-check-nil
-- dedicated sub sections of the mod
require("research-builder.Sci-Prod.technology")
require("research-builder.Bonus-damage.technology")
require("research-builder.Ammo-Prod.technology")

-- local check = false
-- local modcheck = {"pyalienlife"}

-- for i, v in pairs(modcheck) do
--     if mods[v] then check = true break end
-- end

if mods["pypostprocessing"] then
    if settings.startup["KP-ammo-prod"].value then
        data.raw.technology["KP-ammo-prod"].unit.ingredients = {{"KP-Violence", 1}}
    end
    if settings.startup["KP-bonus-damage"].value then
        data.raw.technology["KP-bonus-damage"].unit.ingredients = {{"KP-Violence", 1}}
    end
    if data.raw.technology["KP-sci-prod"] then
        data.raw.technology["KP-sci-prod"].unit.ingredients = {{"KP-Violence", 1}}
    end
end

