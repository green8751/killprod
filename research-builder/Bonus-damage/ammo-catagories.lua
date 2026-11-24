require("functions.functions")
local ammocats = {}

-- initial load of all damage types
for i, _ in pairs(data.raw["ammo-category"]) do
    dlog(i .. " recorded")
    table.insert(ammocats, i)
end

-- load unwanted entries. if required for multimod compat entries can be restored via setting them to nul or false
local unwanted = {}
unwanted["base"] = {"capsule", "melee", "biological"}
unwanted["Krastorio2"] = {"beam"}
unwanted["space-age"] = {"seismic"}
unwanted["pyalienlife"] = {"caravan-control", "dragon-breath", "ulric-infusion"}
unwanted["angelsaddons-cab"] = {"angels-cab-deploy", "angels-cab-undeploy"}

-- trim unwanted entries
-- listtrim(ammocats, unwanted)

Compatable_List_trim(ammocats, unwanted)

return ammocats