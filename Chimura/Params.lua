---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A script used to tell whether the app is in test or production mode.
---
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
--- @return self
---
local Params = {}

-- We load the config file in the config variable
Params.config = assert(io.open("../config.conf", "r"))

-- First parameter (one parameter per line) : whether the current instance is in test or production environment
Params.isTest = Params.config:read("*line") == "TEST"

return Params