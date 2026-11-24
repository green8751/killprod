require("functions.functions")

if settings.startup["KP-bonus-damage"].value == false then return end

local simple_compat = {}
simple_compat["base"] = {"flamethrower-turret", "gun-turret"}
simple_compat["Voidcraft"] = {"s6x-prismite-laser-turret"}
simple_compat["bobwarfare"] = {"bob-gun-turret-2", "bob-gun-turret-3", "bob-gun-turret-4", "bob-gun-turret-5",
            "bob-sniper-turret-1", "bob-sniper-turret-2", "bob-sniper-turret-3"}

local turrets = Compatable_List(simple_compat)

return turrets