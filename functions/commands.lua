function print_violence()
    --basegame values
    game.print("small violence = " .. storage.small_score)
    game.print("medium violence = " .. storage.medium_score)
    game.print("big violence = " .. storage.big_score)
    game.print("behemoth violence = " .. storage.behemoth_score)
    game.print("spawner violence = " .. storage.nest_score)

    --space age values
    if script.active_mods["space-age"] then
        game.print("demolisher violence = " .. storage.demolisher_score)
        game.print("stomper violence = " .. storage.stomper_score)
        game.print("strider violence = " .. storage.strafer_score)
        game.print("wriggler violence = " .. storage.wriggler_score + storage.premature_score)
        game.print("egg raft violence = " .. storage.raft_score)
    end
    --total, must be last
    game.print("total Violence = " .. storage.total_score)
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