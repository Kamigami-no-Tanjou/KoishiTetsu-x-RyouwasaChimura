require 'Chimura.EntitiesGlobalFunction'

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a CustomCommand object
--- Its attributes are :
--- - ID                    : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - Name                  : VARCHAR NOT NULL
--- - Description           : VARCHAR NULLABLE
--- - Enabled               : BOOL NOT NULL
--- - Slashless             : BOOL NOT NULL
--- - TriggeredFromContent  : BOOL NOT NULL
--- - Output                : VARCHAR NULLABLE
--- - GuildID               : BIGINT NOT NULL UNSIGNED (=Discord ID)
---
--- @class CustomCommand
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
CustomCommand = {
    id = 0,
    name = "",
    description = "",
    enabled = false,
    slashless = false,
    triggeredFromContent = false,
    output = "",
    guildId = 0,
    commandArgs = {},
    roles = {},
    members = {}
}

---
--- The CustomCommand's constructor (will be used to rebuild CustomCommand object instances out of a table retrieved
--- from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of CustomCommand it represents.
--- @param name string The name of the command. This will be used for calling it.
--- @param description string The command's description. Will help members getting to know how to use it.
--- @param enabled boolean Whether the command should be triggered when members try to call it.
--- @param slashless boolean Whether the command should be triggered with a slash before or not.
--- @param triggeredFromContent boolean Whether the command can be triggered simply by finding its name within a message
--- or not.
--- @param output string The output of the command. May contain values to substitute with others.
--- @param guildId number The ID of the Guild this CustomCommand belongs to.
--- @param commandArgs CommandArg[] The array of arguments available for this command. Length may be up to five.
--- @param roles number[] The array of roles to apply this command to.
--- @param members Member[] The array of members to apply this command to.
---
--- @return CustomCommand the new instance of CustomCommand.
---
function CustomCommand:new(object,
                           id,
                           name,
                           description,
                           enabled,
                           slashless,
                           triggeredFromContent,
                           output,
                           guildId,
                           commandArgs,
                           roles,
                           members
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' CustomCommand's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.name = name or object.name or nil
    object.description = description or object.description or nil
    object.enabled = affectBool(tonumber(enabled or object.enabled)) or nil
    object.slashless = affectBool(tonumber(slashless or object.slashless)) or nil
    object.triggeredFromContent = affectBool(tonumber(triggeredFromContent or object.triggeredFromContent)) or nil
    object.output = output or object.output or nil
    object.guildId = tonumber(guildId or object.guildId) or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.commandArgs = commandArgs or object.commandArgs or nil
    object.roles = roles or object.roles or nil
    object.members = members or object.members or nil

    return object
end