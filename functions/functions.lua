require("util")

-- fancy logging control dlog for dev logging, flog for function logging
function dlog(data)
    local dlog = true
    if dlog then log(data) end
end
function flog(data)
    local flog = false
    if flog then log(data) end
end

-- workaround to let you use the same code in any stage of startup. god this is cursed, but it works. set mode to startup to make it use mods[] instead of script.mods[]
function checkmod(modname, mode)
    flog(modname)
    if mode == "startup" then
        if mods[modname] then a = mods[modname] end
        flog(a)
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

-- merge 2 lists
function merge_lists(main, secondary)
    -- loop over t2 items   
    for _, i in ipairs(secondary) do
        -- append entries to t1   
        table.insert(main, i)
   end
   -- return merged table
   return main
end
