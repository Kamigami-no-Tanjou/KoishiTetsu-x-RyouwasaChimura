---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a ReactionRole object
--- Its attributes are :
--- - ID        : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - MessageID : BIGINT NOT NULL (=Discord ID)
--- - GuildID   : BIGINT NOT NULL (=Discord ID)
--- - RoleID    : BIGINT NOT NULL (=Discord ID)
--- - Emote     : VARCHAR(20) NULLABLE
--- - Emoji     : VARCHAR(20) NULLABLE
---
--- @class ReactionRole
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
ReactionRole = {
    id = nil, -- : int
    messageId = nil, -- : int
    guildId = nil, -- : int
    roleId = nil, -- : int
    emote = nil, -- : string
    emoji = nil -- : string
}

---
--- The ReactionRole's constructor (will be used to rebuild ReactionRoles object instances out of a table retrieved from
--- a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of ReactionRole it represents.
--- @param messageId number The Discord ID of the message it is attached to.
--- @param guildId number The Discord ID of the Guild it is attached to.
--- @param roleId number The Discord ID of the role it is attached to.
--- @param emote string The emote of the reaction.
--- @param emoji string The emoji of the reaction.
---
--- There can't be an emoji and an emote at the same time on a ReactionRole.
---
--- @return ReactionRole the new instance of ReactionRole.
---
function ReactionRole:new(object,
                          id,
                          messageId,
                          guildId,
                          roleId,
                          emote,
                          emoji
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' ReactionRole's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --We verify values are correct: It's okay if there is none, as it could be added later.
    if emote ~= nil then
        assert(emoji == nil, "{ \"err\":\"There can't be an emote and an emoji at the same time!\" }")
    end

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.messageId = tonumber(messageId or object.messageId) or nil
    object.guildId = tonumber(guildId or object.guildId) or nil
    object.roleId = tonumber(roleId or object.roleId) or nil
    object.emote = emote or object.emote or nil
    object.emoji = emoji or object.emoji or nil

    return object
end