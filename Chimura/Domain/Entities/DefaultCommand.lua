---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a DefaultCommand object
--- Its attributes are :
--- - ID                    : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - Name                  : VARCHAR NOT NULL
--- - Description           : VARCHAR NULLABLE
---
--- @class DefaultCommand
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
DefaultCommand = {
    id = nil, -- : int
    name = nil, -- : string
    description = nil, -- : string
    commandArgs = nil -- : CommandArg[]
}

---
--- The DefaultCommand's constructor (will be used to rebuild DefaultCommand object instances out of a table retrieved
--- from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of CustomCommand it represents.
--- @param name string The name of the command. This will be used for calling it.
--- @param description string The command's description. Will help members getting to know how to use it.
--- @param commandArgs CommandArg[] The array of arguments available for this command.
---
--- @return DefaultCommand the new instance of DefaultCommand.
---
function DefaultCommand:new(object,
                           id,
                           name,
                           description,
                           commandArgs
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' DefaultCommand's metamethods & properties
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

    --This value is not meant to be inserted in the database (or perhaps not the standard way)
    object.commandArgs = commandArgs or object.commandArgs or nil

    return object
end