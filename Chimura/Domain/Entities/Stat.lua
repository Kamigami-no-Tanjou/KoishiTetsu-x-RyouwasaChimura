---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a Stat object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - GuildRPGID    : INT NOT NULL UNSIGNED
--- - Name          : VARCHAR NULLABLE
--- - Abbreviation  : VARCHAR(4) NULLABLE
---
--- @class Stat
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Stat = {
    id = nil, -- : int
    guildRPGId = nil, -- : int
    name = nil, -- : string
    abbreviation = nil, -- : string
    guildRPG = nil -- : GuildRPG
}

---
--- The Stat's constructor (will be used to rebuild Stat object instances out of a table retrieved from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Stat it represents.
--- @param guildRPGId number The ID of the GuildRPG it is attached to.
--- @param name string The name of the Stat ; basically, how we should refer to it.
--- @param abbreviation string The short for the stat's name. Usually its 3-4 first digits.
--- @param guildRPG GuildRPG The GuildRPG object to which it belongs.
---
--- @return Stat the new instance of Stat.
---
function Stat:new(object,
                  id,
                  guildRPGId,
                  name,
                  abbreviation,
                  guildRPG
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Stat's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.guildRPGId = tonumber(guildRPGId or object.guildRPGId) or nil
    object.name = name or object.name or nil
    object.abbreviation = abbreviation or object.abbreviation or nil

    --This value is not meant to be inserted in the database (or perhaps not the standard way)
    object.guildRPG = guildRPG or object.guildRPG or nil

    return object
end