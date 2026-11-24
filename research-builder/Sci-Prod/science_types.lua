require("functions.functions")

if settings.startup["KP-sci-prod"].value == "off" or settings.startup["KP-sci-prod"].value == "lab boost only" then return end

-- simple science array. format is: modname = {recipy names}. use the name of the mod that adds the pack
local simple_compat = {}
simple_compat["base"] = {"automation-science-pack", "logistic-science-pack", "military-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack", "space-science-pack"}
simple_compat["space-age"] = {"metallurgic-science-pack","agricultural-science-pack","electromagnetic-science-pack","cryogenic-science-pack","promethium-science-pack"}
simple_compat["Krastorio2"] = {"kr-basic-tech-card","kr-matter-tech-card","kr-advanced-tech-card","kr-singularity-tech-card"}
simple_compat["pyalienlife"] = {"py-science-pack-1", "py-science-pack-2", "py-science-pack-3", "py-science-pack-4"}
simple_compat["Voidcraft"] = {"void-science-pack", "esoteric-science-pack", "celestial-science-pack"}
simple_compat["IridescentIndustry"] = {"iridescent-science-pack", "polychromatic-science-pack"}
simple_compat["bobtech"] = {"bob-advanced-logistic-science-pack", "bob-science-pack-gold", "bob-alien-science-pack", "bob-alien-science-pack-blue", "bob-alien-science-pack-orange",
            "bob-alien-science-pack-purple", "bob-alien-science-pack-yellow", "bob-alien-science-pack-green", "bob-alien-science-pack-red"}

local sci_types = Compatable_List(simple_compat)

-- remove unused sci packs
local unwanted = {}
unwanted["Krastorio2-spaced-out"] = {"kr-basic-tech-card"}

Compatable_List_trim(sci_types, unwanted)

return sci_types