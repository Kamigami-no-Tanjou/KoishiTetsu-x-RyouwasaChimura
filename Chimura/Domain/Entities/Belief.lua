---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a Belief object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - GuildRPGID    : INT NOT NULL UNSIGNED
--- - Name          : VARCHAR NULLABLE
--- - Description   : VARCHAR NULLABLE
---
--- @class Belief
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Belief = {
    id = nil, -- : int
    guildRPGId = nil, -- : int
    name = nil, -- : string
    description = nil, -- : string
    guildRPG = nil, -- : GuildRPG
    divinities = nil -- : Divinity[]
}

---
--- The Belief's constructor (will be used to rebuild Belief object instances out of a table retrieved from a json
--- string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Belief it represents.
--- @param guildRPGId number The ID of the GuildRPG this Belief belongs to.
--- @param name string The name of the belief.
--- @param description string The description of the belief.
--- @param guildRPG GuildRPG The GuildRPG object it is attached to.
--- @param divinities Divinity[] The array of Divinities that appears in the belief.
---
--- @return Belief the new instance of Belief.
---
function Belief:new(object,
                    id,
                    guildRPGId,
                    name,
                    description,
                    guildRPG,
                    divinities
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Belief's metamethods & properties
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
    object.description = description or object.description or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.guildRPG = guildRPG or object.guildRPG or nil
    object.divinities = divinities or object.divinities or nil

    return object
end