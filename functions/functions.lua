require("util")

-- fancy logging control dlog for dev logging, flog for function logging
function dlog(data)
    local dlog = false
    if dlog then log(data) end
end
function flog(data)
    local flog = true
    if flog then log(data) end
end

-- workaround to let you use the same code in any stage of startup. god this is cursed, but it works. set mode to startup to make it use mods[] instead of script.mods[]
function checkmod(modname, mode)
    -- flog(modname)
    if mode == "startup" then
        -- if mods[modname] then a = mods[modname] end
        -- flog(a)
        return mods[modname]
    else
        return script.active_mods[modname]
    end
end

-- removes entries from a list. used for damage type bonus manigement. requires removal list to use the unwanted entry to be in the format of {entry=true}
-- Source - https://stackoverflow.com/a/12397571
-- Posted by Mud, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-08-08, License - CC BY-SA 4.0
-- Modified into a function in this use
function listtrim(input, remove)
    local i=1
    while i <= #input do
        if remove[input[i]] then
            flog(input[i] .. " trimmed")
            table.remove(input, i)
        else
            i = i + 1
        end
    end
end

-- merge 2 lists. preserves duplicates
function merge_lists(main, secondary)
    -- loop over t2 items   
    for _, i in ipairs(secondary) do
        -- append entries to t1   
        table.insert(main, i)
   end
end

-- turn a types array into a list. types array must be indexed by modname.
function Compatable_List(raw_array)
    local viable = {}
    for i, v in pairs(raw_array) do
        if mods[i] then
            for _, j in ipairs(v) do
                if data.raw.recipe[j] or data.raw["ammo-category"][j] then
                    table.insert(viable, j)
                else
                    log("recipe " .. j .. " not found")
                end
            end
        else
            dlog("mod " .. i .. " not found")
        end
    end
    return viable
end

-- extend a science list based on settings. index by modname then setting name
function Settings_Controled_extender(settings_array, raw_array)
    for i, v in pairs(settings_array) do
        if mods[i] then
            for j, _ in pairs(v) do
                if settings.startup[j].value then
                    flog("setting " .. j .. " true")
                    merge_lists(raw_array[i], settings_array[i][j])
                else
                    flog("setting " .. j .. " false")
                end
            end
        end
    end
end

-- use the same format as compatable list for trim
---@generic list_of_strings, mod, t[mod][list_of_strings]
---@param compatable_list list_of_strings output of Compatable_List
---@param trim t[mod][list_of_strings] things to remove
function Compatable_List_trim(compatable_list, trim)
    local raw = Compatable_List(trim)
    local map = {}
    for _, v in pairs(raw) do
        map[v] = true
    end
    listtrim(compatable_list, map)
end