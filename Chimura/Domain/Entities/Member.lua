require 'Chimura.EntitiesGlobalFunctions'

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a Warning object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - UserID        : BIGINT NOT NULL UNSIGNED (=Discord ID)
--- - GuildID       : BIGINT NOT NULL UNSIGNED (=Discord ID)
--- - Muted         : BOOL NOT NULL
---
--- @class Member
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Member = {
    id = 0,
    userId = 0,
    guildId = 0,
    muted = false,
    user = {},
    warning = {},
    customCommands = {}, --Relevant?
}

---
--- The Member's constructor (will be used to rebuild Member object instances out of a table retrieved from a json
--- string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Member it represents.
--- @param userId number The ID of the User it is attached to.
--- @param guildId number The ID of the Guild it is attached to.
--- @param muted boolean Whether the user is currently muted or not.
--- @param user User The User attached to this Member.
--- @param warning Warning The Warning attached to this Member.
--- @param customCommands CustomCommand[] The array of custom commands linked to this instance of Member.
---
--- @return Member the new instance of Member.
---
function Member:new(object,
                    id,
                    userId,
                    guildId,
                    muted,
                    user,
                    warning,
                    customCommands
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Member's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.userId = tonumber(userId or object.userId) or nil
    object.guildId = tonumber(guildId or object.guildId) or nil
    object.muted = affectBool(tonumber(muted or object.muted)) or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.user = user or object.user or nil
    object.warning = warning or object.warning or nil
    object.customCommands = customCommands or object.customCommands or nil

    return object
end