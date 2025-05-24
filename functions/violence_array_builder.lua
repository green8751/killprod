require("functions.functions")

final_array = {}

-- builds final_array, if passed the condition true it builds the default array, if not passed a value it builds the array based on the current global settings.
-- can be passed true, false, and "startup", true and false force an operation mode, while "startup" forces a true override and passes it as a mode value.
function KP_array_builder(override)
    if override == nil then
        default = not settings.global["override-Violence-values"].value
    elseif override == "startup" then
        mode = "startup"
        default = true
    elseif override == true or override == false then
        default = override
    else
        log("bad value passed to KP_array_builder, value passed: " .. override .. "\n expected bulian or a string of startup")
    end
    for k, i in pairs(final_array) do
        table.remove(final_array, i)
    end
    if default == true then
        small = {{"small-biter", 1},{"small-spitter", 1},{"small-worm-turret", 3}}
        medium = {{"medium-biter", 3},{"medium-spitter", 3},{"medium-worm-turret", 9}}
        big = {{"big-biter", 10},{"big-spitter", 10},{"big-worm-turret", 30}}
        behemoth = {{"behemoth-biter", 15},{"behemoth-spitter", 15},{"behemoth-worm-turret", 45}}
        nest = {{"biter-spawner", 15},{"spitter-spawner", 15}}
        if checkmod("space-age", mode) then
            demolisher = {{"small-demolisher", 100},{"medium-demolisher", 300},{"big-demolisher", 500}}
            strafer = {{"small-strafer-pentapod", 13},{"medium-strafer-pentapod", 16},{"big-strafer-pentapod", 20}}
            stomper = {{"small-stomper-pentapod", 25},{"medium-stomper-pentapod", 40},{"big-stomper-pentapod", 50}}
        end
    else
        small = {{"small-biter", settings.global["KP-small-biter"].value},{"small-spitter", settings.global["KP-small-spitter"].value},{"small-worm-turret", settings.global["KP-small-worm-turret"].value}}
        medium = {{"medium-biter", settings.global["KP-medium-biter"].value},{"medium-spitter", settings.global["KP-medium-spitter"].value},{"medium-worm-turret", settings.global["KP-medium-worm-turret"].value}}
        big = {{"big-biter", settings.global["KP-big-biter"].value},{"big-spitter", settings.global["KP-big-spitter"].value},{"big-worm-turret", settings.global["KP-big-worm-turret"].value}}
        behemoth = {{"behemoth-biter", settings.global["KP-behemoth-biter"].value},{"behemoth-spitter", settings.global["KP-behemoth-spitter"].value},{"behemoth-worm-turret", settings.global["KP-behemoth-worm-turret"].value}}
        nest = {{"biter-spawner", settings.global["KP-biter-spawner"].value},{"spitter-spawner", settings.global["KP-spitter-spawner"].value}}
        if script.active_mods["space-age"] then
            demolisher = {{"small-demolisher", settings.global["KP-small-demolisher"].value},{"medium-demolisher", settings.global["KP-medium-demolisher"].value},{"big-demolisher", settings.global["KP-big-demolisher"].value}}
            strafer = {{"small-strafer-pentapod", settings.global["KP-small-strafer-pentapod"].value},{"medium-strafer-pentapod", settings.global["KP-medium-strafer-pentapod"].value},{"big-strafer-pentapod", settings.global["KP-big-strafer-pentapod"].value}}
            stomper = {{"small-stomper-pentapod", settings.global["KP-small-stomper-pentapod"].value},{"medium-stomper-pentapod", settings.global["KP-medium-stomper-pentapod"].value},{"big-stomper-pentapod", settings.global["KP-big-stomper-pentapod"].value}}
        end
    end
    final_array[small] = small
    final_array[medium] = medium
    final_array[big] = big
    final_array[behemoth] = behemoth
    final_array[nest] = nest
    if checkmod("space-age", mode) then
        final_array[demolisher] = demolisher
        final_array[strafer] = strafer
        final_array[stomper] = stomper
    end
    return final_array
end


function detailed_violence()
    -- KP_array_builder()
    local kills = 0
    local Violence = 0
    local total_kills = 0
    local total_violence = 0
    for n, i in pairs(final_array) do
        for q, j in pairs(i) do
            for _, surface in pairs(game.surfaces) do
                kills = kills + game.forces["player"].get_kill_count_statistics(surface).get_input_count(j[1])
            end
            Violence = kills * j[2]
            game.print(j[1] .." are worth ".. j[2] .." Violence per kill, you have killed ".. kills .." for a total score of ".. Violence)
            total_kills = total_kills + kills
            total_violence = total_violence + Violence
            kills = 0
        end
    end
    game.print("you have a total of ".. total_kills .." kills for a total Violence score of ".. total_violence)
end