---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a User object
--- Its attributes are :
--- - ID            : BIGINT NOT NULL UNSIGNED (PRIMARY KEY) (=Discord ID)
--- - LanguageID    : INT NOT NULL UNSIGNED DEFAULT 42
--- - Experience    : INT NOT NULL UNSIGNED
--- - Birthdate     : DATE NULLABLE
--- - TimeZone      : INT NULLABLE
---
--- @class User
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
User = {
    id = nil, -- : int
    languageId = nil, -- : int
    experience = nil, -- : int
    timeZone = nil, -- : int
    birthdate = nil, -- : Date
    language = nil, -- : Language
    members = nil, -- : Member[]
    characters = nil -- : Character[]
}

---
--- The User's constructor (will be used to rebuild User object instances out of a table retrieved from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of User it represents.
--- @param languageId number The ID of the Language that is attached to it.
--- @param experience number The amount of experience this User accumulated with the bot.
--- @param timeZone number The time zone to which the User belongs. A number between -12 & +12
--- @param birthdate Date The date when the User was born.
--- @param language Language The language spoken by the User.
--- @param members Member[] The array of members this User is linked with.
--- @param characters RPGCharacter[] The array of characters this User is linked with.
---
--- @return User the new instance of User.
---
function User:new(object,
                  id,
                  languageId,
                  experience,
                  timeZone,
                  birthdate,
                  language,
                  members,
                  characters
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' User's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.languageId = tonumber(languageId or object.languageId or 42)
    object.experience = tonumber(experience or object.experience) or nil
    object.timeZone = tonumber(timeZone or object.timeZone or 0)
    object.birthdate = tonumber(birthdate or object.birthdate) or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.language = language or object.language or nil
    object.members = members or object.members or nil
    object.characters = characters or object.characters or nil

    return object
end