---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a StatAlteration object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - GuildRPGID    : INT NOT NULL UNSIGNED
--- - StatID        : INT NOT NULL UNSIGNED
--- - Value         : INT NOT NULL
---
--- @class StatAlteration
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
StatAlteration = {
    id = nil, -- : int
    guildRPGId = nil, -- : int
    statId = nil, -- : int
    value = nil, -- : int
    guildRPG = nil, -- : GuildRPG
    stat = nil -- : Stat
}

---
--- The StatAlteration's constructor (will be used to rebuild StatAlteration object instances out of a table retrieved
--- from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of StatAlteration it represents.
--- @param guildRPGId number The ID of the GuildRPG this StatAlteration belongs to.
--- @param statId number The ID of the Stat it is attached to.
--- @param value number The value of the alteration of the stat.
--- @param guildRPG GuildRPG The GuildRPG object it is attached to.
--- @param stat Stat The Stat object this instance alters.
---
--- @return StatAlteration the new instance of StatAlteration.
---
function StatAlteration:new(object,
                  id,
                  guildRPGId,
                  statId,
                  value,
                  guildRPG,
                  stat
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' StatAlteration's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.guildRPGId = tonumber(guildRPGId or object.guildRPGId) or nil
    object.statId = tonumber(statId or object.statId) or nil
    object.value = tonumber(value or object.value) or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.guildRPG = guildRPG or object.guildRPG or nil
    object.stat = stat or object.stat or nil

    return object
end