require("functions.functions")

-- catagories of entities
function types(mode)
    -- local mode
    -- if stage == "startup" then
    --     mode = stage
    -- else
    --     mode = true
    -- end
    local types = {}
    
    types["small"] = 1
    types["medium"] = 3
    types["big"] = 9
    types["behemoth"] = 18
    types["biter"] = 1
    types["spitter"] = 1
    types["nest"] = 15
    types["worm"] = 3

    if checkmod("space-age", mode) then
        types["demolisher"] = 100
        types["pentapod-s"] = 2
        types["pentapod-m"] = 3
        types["pentapod-l"] = 6
        types["strafer"] = 8
        types["stomper"] = 10
        types["wriggler"] = 2
        types["premature"] = 0.2
        types["raft"] = 10
        types["pentapod-t"] = 0.5
    end

    if not mode and settings.global["KP-override-Violence-values"].value then
        for i, v in pairs(types) do
            ---@diagnostic disable-next-line: assign-type-mismatch
            types[i] = settings.global["KP-" .. i].value
        end
    end

    return types
end