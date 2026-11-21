require("entity-catagories")
-- assign what types impact an entity
-- open side by side with entity catigories while extending

-- types are multiplied togeather.
-- fist type is its "primary" type, which is used to place it in a catagory
local entities = {}
entities["base"] = {
    ["small-biter"] = {"small", "biter"},
    ["small-spitter"] = {"small", "spitter"},
    ["small-worm-turret"] = {"small", "worm"},

    ["medium-biter"] = {"medium", "biter"},
    ["medium-spitter"] = {"medium", "spitter"},
    ["medium-worm-turret"] = {"medium", "worm"},

    ["big-biter"] = {"big", "biter"},
    ["big-spitter"] = {"big", "spitter"},
    ["big-worm-turret"] = {"big", "worm"},

    ["behemoth-biter"] = {"behemoth", "biter"},
    ["behemoth-spitter"] = {"behemoth", "spitter"},
    ["behemoth-worm-turret"] = {"behemoth", "worm"},

    ["biter-spawner"] = {"nest"},
    ["spitter-spawner"] = {"nest"}
}
entities["space-age"] = {
    ["small-demolisher"] = {"demolisher", "small"},
    ["medium-demolisher"] = {"demolisher", "medium"},
    ["big-demolisher"] = {"demolisher", "big"},
    
    ["small-strafer-pentapod"] = {"strafer", "pentapod-s"},
    ["medium-strafer-pentapod"] = {"strafer", "pentapod-m"},
    ["big-strafer-pentapod"] = {"strafer", "pentapod-l"},

    ["small-stomper-pentapod"] = {"stomper", "pentapod-s"},
    ["medium-stomper-pentapod"] = {"stomper", "pentapod-m"},
    ["big-stomper-pentapod"] = {"stomper", "pentapod-l"},

    ["small-wriggler-pentapod"] = {"wriggler", "pentapod-s"},
    ["medium-wriggler-pentapod"] = {"wriggler", "pentapod-m"},
    ["big-wriggler-pentapod"] = {"wriggler", "pentapod-l"},

    ["small-wriggler-pentapod-premature"] = {"premature", "pentapod-s"},
    ["medium-wriggler-pentapod-premature"] = {"premature", "pentapod-m"},
    ["big-wriggler-pentapod-premature"] = {"premature", "pentapod-l"},

    ["gleba-spawner"] = {"raft", "pentapod-s"},
    ["gleba-spawner-small"] = {"raft", "pentapod-t"}
}

return entities