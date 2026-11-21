function print_violence()
    --score variables
    for i, v in pairs(Final_Array) do
        game.print(i .. " Violence = " .. storage[i .. "_score"])
    end
    game.print("total Violence = " .. storage.total_score)
end

function detailed_violence()
    -- KP_array_builder()
    local kills = 0.0
    local Violence = 0.0
    local total_kills = 0.0
    local total_violence = 0.0
    for n, i in pairs(Final_Array) do
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