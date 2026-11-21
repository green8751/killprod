require("Violence-Array.violence_array_builder")
require("functions.commands")

-- KP-Violence requires the the violence score to have been run at least once to work, after the save is made or loaded.
script.on_init(function()
    commands.add_command("KP-Violence", "prints out violence data", function()
        print_violence()
    end)
    commands.add_command("KP-Detailed-Violence", "prints out all violence data", function()
        detailed_violence()
    end)
    KP_array_builder()
    Initialize_Storage()
    storage.version_checker = script.active_mods["killprod"]
end)

script.on_load(function()
    commands.add_command("KP-Violence", "prints out violence data", function()
        print_violence()
    end)
    commands.add_command("KP-Detailed-Violence", "prints out all violence data", function()
        detailed_violence()
    end)
    KP_array_builder()
    -- log(Final_Array[small][1][1])
end)

-- script.on_event(defines.events.on_player_created, function(event)
-- end)

script.on_configuration_changed(function(event)
    game.print("Modlist change detected, recalculating Violence score.")
    Initialize_Storage()
    Violence_Calculation()
    game.print("Recalculation complete.")

    -- check if modlist change was becasue killprod updated, if so, display any update related messages and update stored version
    if helpers.compare_versions(script.active_mods["killprod"], storage.version_checker) > 0 then
        game.print("WARNING: The settings system has been mearly entirely redone, if you were using Violence Override values your settings your changes have been lost")
        if script.active_mods["space-age"] then
            game.print("There has been a major default ballence changes for Space Age, your bonuses are likely different.")
        else
            game.print("There has been a minor default ballence change, your bonuses may be different.")
        end
        storage.version_checker = script.active_mods["killprod"]
    end
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting_type == "runtime-global" and event.tick > storage.last_tick then
        KP_array_builder()
        Violence_Calculation()
        -- why am i adding 1 to event.tick? was this paranoia or a glitch? did i run into a floating point error?
        storage.last_tick = event.tick --[[ + 1 ]]
    end
end)

-- function for initilizing storage when needed
function Initialize_Storage()
    storage.last_tick = storage.last_tick or 0
    storage.version_checker = storage.version_checker or "1.1.1"
    storage.total_score = storage.total_score or 0.0

    --score variables
    for i, v in pairs(Final_Array) do
        storage[i .. "_score"] = storage[i .. "_score"] or 0
    end
end

local function get_kill_count(array)
    local force = game.forces["player"]
    local kills = 0.0
    for z, i in pairs(array) do
        for _, surface in pairs(game.surfaces) do
            kills = kills + (force.get_kill_count_statistics(surface).get_input_count(i[1]) * i[2])
        end
    end
    --game.print(foe .. " " .. kills .. " worth " .. kills * multi .. " violence")
    return kills
end

-- generate Violence Score, then set resurch levels
function Violence_Calculation()
    storage.total_score = 0.0
    for i, v in pairs(Final_Array) do
        storage[i .. "_score"] = get_kill_count(v)
        storage.total_score = storage.total_score + storage[i .. "_score"]
    end
    
    -- ensure ammo prod bonuses are correct
    if settings.startup["KP-ammo-prod"].value then
        if storage.total_score > 25 then
            game.forces.player.technologies["KP-ammo-prod"].level = math.floor(math.log(storage.total_score/25)/math.log(2)+1)
        else
            game.forces.player.technologies["KP-ammo-prod"].researched = false
        end
    end

    -- ensure damage bonuses are correct
    if settings.startup["KP-bonus-damage"].value then
        if storage.total_score > 20 and settings.startup["KP-bonus-damage"].value then
            game.forces.player.technologies["KP-bonus-damage"].level = math.floor(math.log(storage.total_score/20)/math.log(2)+1)
        else
            game.forces.player.technologies["KP-bonus-damage"].researched = false
        end
    end

    -- ensure science prod bonuses are correct
    if not settings.startup["KP-sci-prod"].value == "off" then
        if storage.total_score > 500 then
            game.forces.player.technologies["KP-sci-prod"].level = math.floor(math.log(storage.total_score/500)/math.log(2)+1)
        else
            game.forces.player.technologies["KP-sci-prod"].researched = false
        end
    end
end

-- every 10 seconds get the violence score, and use it to set resurch level
script.on_nth_tick(600, function(event)
    -- if Final_Array["small"] == nil then KP_array_builder() end
    Violence_Calculation()
end)