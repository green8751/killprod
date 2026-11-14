require("functions.functions")

Final_Array = {}

-- builds Final_Array, if passed the condition true it builds the default array, if not passed a value it builds the array based on the current global settings.
-- can be passed true, false, and "startup", true and false force an operation mode, while "startup" forces a true override and passes it as a mode value.
function KP_array_builder(override)
    local default
    local mode
    if override == nil then
        default = not settings.global["KP-override-Violence-values"].value
    elseif override == "startup" then
        mode = "startup"
        default = true
--[[     elseif override == true or override == false then
        default = override ]]
    else
        log("bad value passed to KP_array_builder, value passed: " .. override .. "\n expected bulian or a string of startup")
    end
    if default then
        Final_Array["small"] = {{"small-biter", 1},{"small-spitter", 1},{"small-worm-turret", 3}}
        Final_Array["medium"] = {{"medium-biter", 3},{"medium-spitter", 3},{"medium-worm-turret", 9}}
        Final_Array["big"] = {{"big-biter", 10},{"big-spitter", 10},{"big-worm-turret", 30}}
        Final_Array["behemoth"] = {{"behemoth-biter", 15},{"behemoth-spitter", 15},{"behemoth-worm-turret", 45}}
        Final_Array["nest"] = {{"biter-spawner", 15},{"spitter-spawner", 15}}
        if checkmod("space-age", mode) then
            Final_Array["demolisher"] = {{"small-demolisher", 100},{"medium-demolisher", 300},{"big-demolisher", 500}}
            Final_Array["strafer"] = {{"small-strafer-pentapod", 13},{"medium-strafer-pentapod", 16},{"big-strafer-pentapod", 20}}
            Final_Array["stomper"] = {{"small-stomper-pentapod", 25},{"medium-stomper-pentapod", 40},{"big-stomper-pentapod", 50}}
            Final_Array["wriggler"] = {{"small-wriggler-pentapod", 2},{"medium-wriggler-pentapod", 6.5}, {"big-wriggler-pentapod", 12.5}}
            Final_Array["premature"] = {{"small-wriggler-pentapod-premature", 0.2},{"medium-wriggler-pentapod-premature", 0.65}, {"big-wriggler-pentapod-premature", 1.25}}
            Final_Array["raft"] = {{"gleba-spawner", 20},{"gleba-spawner-small", 7}}
        end
    else
        for i, v in pairs(Final_Array) do
            for j, k in pairs(v) do
                ---@diagnostic disable-next-line: undefined-field
                Final_Array[i][j][2] = settings.global["KP-" .. Final_Array[i][j][1]].value
            end
        end
    end
end