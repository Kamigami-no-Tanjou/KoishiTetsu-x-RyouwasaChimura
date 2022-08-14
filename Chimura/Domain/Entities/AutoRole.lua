---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing an AutoRole object
--- Its attributes are :
--- - ID        : BIGINT NOT NULL UNSIGNED (PRIMARY KEY) (=Discord ID)
--- - GuildID   : BIGINT NOT NULL UNSIGNED (=Discord ID)
---
--- @class AutoRole
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
AutoRole = {
    id = 0,
    guildId = 0
}

---
--- The AutoRole's constructor (will be used to rebuild AutoRoles object instances out of a table retrieved from a json)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of AutoRole it represents.
--- @param guildId number The ID of the Guild it is attached to.
---
--- @return AutoRole the new instance of AutoRole.
---
function AutoRole:new(object, id, guildId)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' AutoRole's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.guildId = tonumber(guildId or object.guildId) or nil

    return object
end