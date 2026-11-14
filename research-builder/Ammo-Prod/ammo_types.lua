require("functions.functions")
local setting_controlled_ammo = require("research-builder.Ammo-Prod.setting_controlled_ammo")

if settings.startup["KP-ammo-prod"].value == true then

local simple_compat = {}
simple_compat["base"] = {"firearm-magazine", "piercing-rounds-magazine", "uranium-rounds-magazine", "shotgun-shell", "piercing-shotgun-shell",
            "cannon-shell", "explosive-cannon-shell", "uranium-cannon-shell", "explosive-uranium-cannon-shell", "artillery-shell",
            "rocket", "explosive-rocket", "atomic-bomb", "flamethrower-ammo", "land-mine",
            "grenade", "cluster-grenade", "poison-capsule", "slowdown-capsule", "defender-capsule", "distractor-capsule", "destroyer-capsule"}
simple_compat["Krastorio2"] = {"kr-rifle-magazine", "kr-armor-piercing-rifle-magazine", "kr-uranium-rifle-magazine", "kr-imersite-rifle-magazine",
            "kr-anti-materiel-rifle-magazine", "kr-armor-piercing-anti-materiel-rifle-magazine", "kr-uranium-anti-materiel-rifle-magazine",
            "kr-imersite-anti-materiel-rifle-magazine", "kr-impulse-rifle-ammo",
            "kr-nuclear-artillery-shell", "kr-antimatter-artillery-shell", "kr-biter-virus",
            "kr-basic-railgun-shell", "kr-explosive-railgun-shell", "kr-antimatter-railgun-shell",
            "kr-explosive-turret-rocket", "kr-nuclear-turret-rocket", "kr-antimatter-turret-rocket"}
simple_compat["space-age"] = {"capture-robot-rocket","railgun-ammo","tesla-ammo"}
simple_compat["pyalternativeenergy"] = {"nuclear-artillery-shell"}
simple_compat["Voidcraft"] = {"s6x-void-atomic-bomb", "s6x-weaponize-pure-void"}
simple_compat["IridescentIndustry"] = {"s6x-prismite-laser-ammo-r", "s6x-prismite-laser-ammo-g", "s6x-prismite-laser-ammo-b"}

-- pull in setting controlled additions here
Settings_Controled_extender(setting_controlled_ammo, simple_compat)

local ammotypes = Compatable_List(simple_compat)

-- load unwanted entries. if required for multimod compat entries can be restored via setting them to nul or false
local unwanted2={}
if mods["Krastorio2"] then unwanted2["uranium-rounds-magazine"]=true
    -- trim unwanted entries
    listtrim(simple_compat, unwanted2)
end

return ammotypes

end