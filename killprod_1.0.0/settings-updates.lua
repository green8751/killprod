require("functions.violence_array_builder")

KP_array_builder("startup")

local x = 0
for n, i in pairs(final_array) do
    local y = 0
    x = x + 1
    for q, j in pairs(i) do
        y = y + 1
        data.raw["double-setting"]["KP-" .. j[1]].default_value = j[2]*10
    end
end