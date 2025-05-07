require("util")

-- removes an array of effects from a resurch. full description required
function Remove_value(array, to_be_removed)
    for _, i in pairs(to_be_removed) do
        for index, value in pairs(array) do
            if util.table.compare(value, i) then
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
    if teck == "ammo-damage" then
        array = data.raw["technology"]["ammo-damage"].effects

    elseif teck == "ammo-prod" then
        array = data.raw["technology"]["ammo-prod"].effects

    elseif teck == "sci-prod" then
        array = data.raw["technology"]["sci-prod"].effects
        
    else
        log("unknown teck name, name passed:".. teck)
    end

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