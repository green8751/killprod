require("util")

-- removes an effect from a resurch. full effect array required. may be broken. possibly unused
function Remove_value(array, to_be_removed)
    for _, i in pairs(to_be_removed) do
        for index, value in pairs(array) do
            if util.table.compare(value, i) then
                log("removed " .. i)
                table.remove(array, index)
                break
            end
        end
    end
end

--[[removes an array of effects based on the science, type, and an array of recipies or ammo catigories.
 Valid types are "prod" and "damage", teck is the name of the teck]]
function Remove_effects(teck, type, effects)
    local array
    local remove = {}
    array = data.raw["technology"]["KP-" .. teck].effects
    if type == "prod" then
        for _, i in pairs(effects) do
            table.insert(remove,
                {
                    type = "change-recipe-productivity",
                    recipe = i,
                    change = 0.05
                }
            )
        end
    elseif type == "damage" then
        for _, i in pairs(effects) do
            log(i)
            table.insert(remove,
                {
                    type = "ammo-damage",
                    ammo_category = i,
                    modifier = 0.1
                }
            )
        end
    else
        log("type error, type read ".. type .."\n effects passed through:\n".. effects)
    end
    Remove_value(array, remove)
end

-- workaround to let you use the same code in any stage of startup. god this is cursed, but it works. set mode to startup to make it use mods[] instead of script.mods[]
function checkmod(modname, mode)
    -- log(modname)
    if mode == "startup" then
        if mods[modname] then a = mods[modname] end
        -- log(a)
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
            log(input[i] .. " trimmed")
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
