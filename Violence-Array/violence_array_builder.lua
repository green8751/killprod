require("functions.functions")
require("entity-catagories")

local entities = require("raw-entities")

Final_Array = {}

-- builds Final_Array,
-- can be passed the same settings as types(), settings are directly passed through
function KP_array_builder(override)
    local types = types(override)
    -- grab all enemy prototypes
    local prototype = prototypes.get_entity_filtered{{
        filter = "type",
        type = "unit"
    },{
        filter = "type",
        type = "unit-spawner"
    },{
        filter = "type",
        type = "turret"
    },{
        filter = "type",
        type = "segmented-unit"
    },{
        filter = "type",
        type = "spider-unit"
    }}

    -- generate final array from entities and types
    for i, v in pairs(entities) do
        -- make sure the mod they are from is installed
        if script.active_mods[i] then
            for j, k in pairs(v) do
                -- make sure nobody removed the prototype
                if prototype[j] then
                    local score = 1.0
                    -- generate the score from the entities types
                    for _, r in pairs(k) do
                        if types[r] then score = score * types[r] end
                    end
                    -- make sure the primary type is indexed in final array, then assign the entity its score
                    if not Final_Array[k[1]] then Final_Array[k[1]] = {} end
                    table.insert(Final_Array[k[1]], {j, score})
                end
            end
        end
    end
end