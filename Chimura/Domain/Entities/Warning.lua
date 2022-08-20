---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a Warning object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - MemberID      : INT NOT NULL UNSIGNED
--- - Amount        : INT NOT NULL UNSIGNED
--- - LastUpdate    : DATE NOT NULL
---
--- @class Warning
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Warning = {
    id = nil, -- : int
    memberId = nil, -- : int
    amount = nil, -- : int
    lastUpdate = nil -- : Date
}

---
--- The Warning's constructor (will be used to rebuild Warnings object instances out of a table retrieved from a json
--- string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Warning it represents.
--- @param memberId number The ID of the member it is attached to.
--- @param amount number The amount of time the member has been warned.
--- @param lastUpdate Date The date when the amount of warnings of the user changed for the last time.
---
--- @return Warning the new instance of Warning.
---
function Warning:new(object,
                     id,
                     memberId,
                     amount,
                     lastUpdate
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Warning's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.memberId = tonumber(memberId or object.memberId) or nil
    object.amount = tonumber(amount or object.amount or 0)
    object.lastUpdate = lastUpdate or object.lastUpdate or nil

    return object
end