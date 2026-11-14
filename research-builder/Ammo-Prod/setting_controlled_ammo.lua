require("functions.functions")

if settings.startup["KP-ammo-prod"].value == true then

local settings_comtrolled = {}
settings_comtrolled["Voidcraft"] = {}
settings_comtrolled["Voidcraft"]["KP-raw-void"] = {"s6xvc-firearm-magazine", "s6xvc-piercing-rounds-magazine", "s6xvc-uranium-rounds-magazine",
        "s6xvc-shotgun-shell", "s6xvc-piercing-shotgun-shell",
        "s6xvc-cannon-shell", "s6xvc-explosive-cannon-shell", "s6xvc-uranium-cannon-shell", "s6xvc-explosive-uranium-cannon-shell", "s6xvc-artillery-shell",
        "s6xvc-rocket", "s6xvc-explosive-rocket", "s6xvc-flamethrower-ammo", "s6xvc-land-mine",
        "s6xvc-grenade", "s6xvc-cluster-grenade", "s6xvc-railgun-ammo"}
settings_comtrolled["Voidcraft"]["KP-flux-void"] = {"s6xvc-firearm-magazine-flx", "s6xvc-piercing-rounds-magazine-flx", "s6xvc-uranium-rounds-magazine-flx",
        "s6xvc-shotgun-shell-flx", "s6xvc-piercing-shotgun-shell-flx",
        "s6xvc-cannon-shell-flx", "s6xvc-explosive-cannon-shell-flx", "s6xvc-uranium-cannon-shell-flx", "s6xvc-explosive-uranium-cannon-shell-flx", "s6xvc-artillery-shell-flx",
        "s6xvc-rocket-flx", "s6xvc-explosive-rocket-flx", "s6xvc-flamethrower-ammo-flx", "s6xvc-land-mine-flx",
        "s6xvc-grenade-flx", "s6xvc-cluster-grenade-flx", "s6xvc-railgun-ammo-flx"}
settings_comtrolled["Voidcraft"]["coherence-void"] = {"s6xvc-firearm-magazine-coh", "s6xvc-piercing-rounds-magazine-coh", "s6xvc-uranium-rounds-magazine-coh",
        "s6xvc-shotgun-shell-coh", "s6xvc-piercing-shotgun-shell-coh",
        "s6xvc-cannon-shell-coh", "s6xvc-explosive-cannon-shell-coh", "s6xvc-uranium-cannon-shell-coh", "s6xvc-explosive-uranium-cannon-shell-coh", "s6xvc-artillery-shell-coh",
        "s6xvc-rocket-coh", "s6xvc-explosive-rocket-coh", "s6xvc-flamethrower-ammo-coh", "s6xvc-land-mine-coh",
        "s6xvc-grenade-coh", "s6xvc-cluster-grenade-coh", "s6xvc-railgun-ammo-coh"}
settings_comtrolled["Voidcraft"]["quality-void"] = {"s6xvc-firearm-magazine-qual", "s6xvc-piercing-rounds-magazine-qual", "s6xvc-uranium-rounds-magazine-qual",
        "s6xvc-shotgun-shell-qual", "s6xvc-piercing-shotgun-shell-qual",
        "s6xvc-cannon-shell-qual", "s6xvc-explosive-cannon-shell-qual", "s6xvc-uranium-cannon-shell-qual", "s6xvc-explosive-uranium-cannon-shell-qual", "s6xvc-artillery-shell-qual",
        "s6xvc-rocket-qual", "s6xvc-explosive-rocket-qual", "s6xvc-flamethrower-ammo-qual", "s6xvc-land-mine-qual",
        "s6xvc-grenade-qual", "s6xvc-cluster-grenade-qual", "s6xvc-railgun-ammo-qual"}

return settings_comtrolled

end