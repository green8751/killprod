require("functions.violence_array_builder")
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

script.on_configuration_changed(function(event)
    Initialize_Storage()
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting_type == "runtime-global" and event.tick > storage.last_tick then
        KP_array_builder()
        -- why am i adding 1 to event.tick? was this paranoia or a glitch? did i run into a floating point error?
        storage.last_tick = event.tick + 1
    end
end)

-- function for initilizing storage when needed
function Initialize_Storage()
    storage.last_tick = storage.last_tick or 0

    --score variables
    storage.small_score = storage.small_score or 0
    storage.medium_score = storage.medium_score or 0
    storage.big_score = storage.big_score or 0
    storage.behemoth_score = storage.behemoth_score or 0
    storage.nest_score = storage.nest_score or 0
    storage.base_score = storage.base_score or 0
    storage.total_score = storage.total_score or 0
    if script.active_mods["space-age"] then
        storage.demolisher_score = storage.demolisher_score or 0
        storage.stomper_score = storage.stomper_score or 0
        storage.strafer_score = storage.strafer_score or 0
        storage.wriggler_score = storage.wriggler_score or 0
        storage.premature_score = storage.premature_score or 0
        storage.raft_score = storage.raft_score or 0
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



-- every 10 seconds get the violence score, and use it to set resurch level
script.on_nth_tick(600, function(event)
    -- if Final_Array["small"] == nil then KP_array_builder() end
    storage.small_score = get_kill_count(Final_Array["small"])
    storage.medium_score = get_kill_count(Final_Array["medium"])
    storage.big_score = get_kill_count(Final_Array["big"])
    storage.behemoth_score = get_kill_count(Final_Array["behemoth"])
    storage.nest_score = get_kill_count(Final_Array["nest"])
    storage.total_score = storage.small_score + storage.medium_score + storage.big_score + storage.behemoth_score + storage.nest_score
    -- if space age is active, add the space age values
    if script.active_mods["space-age"] then
        storage.demolisher_score = get_kill_count(Final_Array["demolisher"])
        storage.strafer_score = get_kill_count(Final_Array["strafer"])
        storage.stomper_score = get_kill_count(Final_Array["stomper"])
        storage.wriggler_score = get_kill_count(Final_Array["wriggler"])
        storage.premature_score = get_kill_count(Final_Array["premature"])
        storage.raft_score = get_kill_count(Final_Array["raft"])
        storage.total_score = storage.total_score + storage.demolisher_score + storage.stomper_score + storage.strafer_score + storage.wriggler_score + storage.premature_score + storage.raft_score
    end
    -- game.print("updated")
    
    if storage.total_score > 25 and settings.startup["KP-ammo-prod"].value then
        game.forces.player.technologies["KP-ammo-prod"].level = math.floor(math.log(storage.total_score/25)/math.log(2)+1)
    end
    if storage.total_score > 20 and settings.startup["KP-bonus-damage"].value then
        game.forces.player.technologies["KP-bonus-damage"].level = math.floor(math.log(storage.total_score/20)/math.log(2)+1)
    end
    if storage.total_score > 500 and settings.startup["KP-sci-prod"].value then
        game.forces.player.technologies["KP-sci-prod"].level = math.floor(math.log(storage.total_score/500)/math.log(2)+1)
    end
end)