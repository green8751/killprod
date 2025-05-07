final_array = {}



function detailed_violence()
    local kills = 0
    local Violence = 0
    local total_kills = 0
    local total_violence = 0
    for _, i in pairs(final_array) do
        for _, surface in pairs(game.surfaces) do
            kills = kills + game.forces["player"].get_kill_count_statistics(surface).get_input_count(i[1])
        end
        Violence = kills * i[2]
        print(i[1] .." are worth ".. i[2] .." Violence per kill, you have killed ".. kills .." for a total score of ".. Violence)
        total_kills = total_kills + kills
        kills = 0
        total_violence = total_violence + Violence
    end
    print("you have a total of ".. total_kills .." for a total Violence score of ".. total_violence)
end