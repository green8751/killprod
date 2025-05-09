require("functions.violence_array_builder")

-- SB-Violence requires the the violence score to have been run at least once to work, after the save is made or loaded.
script.on_init(function()
    commands.add_command("KP-Violence", "prints out violence data", function()
        print_violence()
    end)
    commands.add_command("KP-Detailed-Violence", "prints out all violence data", function()
        detailed_violence()
    end)
end)

script.on_load(function()
    commands.add_command("KP-Violence", "prints out violence data", function()
        print_violence()
    end)
    commands.add_command("KP-Detailed-Violence", "prints out all violence data", function()
        detailed_violence()
    end)
end)

--initialize variables to prevent crashes
small = 0
medium = 0
big = 0
massive = 0
nest = 0
base = 0
total = 0
if script.active_mods["space-age"] then
    demo = 0
    stomp = 0
    stride = 0
    wriggle = 0
    pre = 0
    raft = 0
end

function print_violence()
    --basegame values
    game.print("small violence = " .. small)
    game.print("medium violence = " .. medium)
    game.print("big violence = " .. big)
    game.print("behemoth violence = " .. massive)
    game.print("spawner violence = " .. nest)

    --space age values
    if script.active_mods["space-age"] then
        game.print("demolisher violence = " .. demo)
        game.print("stomper violence = " .. stomp)
        game.print("strider violence = " .. stride)
        game.print("wriggler violence = " .. wriggle + pre)
        game.print("egg raft violence = " .. raft)
    end
    --total, must be last
    game.print("total Violence = " .. total)
end


function get_kill_count(foe, multi)
    local force = game.forces["player"]
    local kills = 0

    for _, surface in pairs(game.surfaces) do
        kills = kills + force.get_kill_count_statistics(surface).get_input_count(foe)
    end
    --game.print(foe .. " " .. kills .. " worth " .. kills * multi .. " violence")
    return kills * multi
end



-- every 10 seconds get the violence score, and use it to set resurch level
script.on_nth_tick(600, function(event)
    small = get_kill_count("small-biter", 1) + get_kill_count("small-spitter", 1) + get_kill_count("small-worm-turret", 3)
    medium = get_kill_count("medium-biter", 3) + get_kill_count("medium-spitter", 3) + get_kill_count("medium-worm-turret", 9)
    big = get_kill_count("big-biter", 10) + get_kill_count("big-spitter", 10) + get_kill_count("big-worm-turret", 30)
    massive = get_kill_count("behemoth-biter", 15) + get_kill_count("behemoth-spitter", 15) + get_kill_count("behemoth-worm-turret", 45)
    nest = get_kill_count("biter-spawner", 15) + get_kill_count("spitter-spawner", 15)
    total = small + medium + big + massive + nest
    -- if space age is active, add the space age values
    if script.active_mods["space-age"] then
        demo = get_kill_count("small-demolisher", 100) + get_kill_count("medium-demolisher", 300) + get_kill_count("big-demolisher", 500)
        stride = get_kill_count("small-strafer-pentapod", 13) + get_kill_count("medium-strafer-pentapod", 16) + get_kill_count("big-strafer-pentapod", 20)
        stomp = get_kill_count("small-stomper-pentapod", 25) + get_kill_count("medium-stomper-pentapod", 40) + get_kill_count("big-stomper-pentapod", 50)
        wriggle = get_kill_count("small-wriggler-pentapod", 2) + get_kill_count("medium-wriggler-pentapod", 6.5) + get_kill_count("big-wriggler-pentapod", 12.5)
        wriggle = get_kill_count("small-wriggler-pentapod-premature", 0.2) + get_kill_count("medium-wriggler-pentapod-premature", 0.65) + get_kill_count("big-wriggler-pentapod-premature", 1.25)
        raft = get_kill_count("gleba-spawner", 20) + get_kill_count("gleba-spawner-small", 7)
        total = total + demo + stomp + stride + wriggle + pre + raft
    end
    game.print("updated")
    
    if total > 25 and settings.startup["ammo-prod"].value then
            game.forces.player.technologies["ammo-prod"].level = math.floor(math.log(total/25)/math.log(2)+1)
    end
    if total > 20 then
        if settings.startup["bonus-damage"].value then
            game.forces.player.technologies["ammo-damage"].level = math.floor(math.log(total/20)/math.log(2)+1)
        end
        if settings.startup["sci-prod"].value then
            game.forces.player.technologies["sci-prod"].level = math.floor(total/1000 +1)
        end
    end
end)