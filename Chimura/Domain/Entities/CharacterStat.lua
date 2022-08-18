---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a CharacterStat object
--- Its attributes are :
--- - ID                : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - RPGCharacterID    : INT NOT NULL UNSIGNED
--- - StatID            : INT NOT NULL UNSIGNED
--- - Value             : INT NOT NULL
---
--- @class CharacterStat
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
CharacterStat = {
    id = 0,
    characterId = 0,
    statId = 0,
    value = 0,
    character = {},
    stat = {}
}

---
--- The CharacterStat's constructor (will be used to rebuild CharacterStat object instances out of a table retrieved
--- from a json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of CharacterStat it represents.
--- @param characterId number The ID of the Character this CharacterStat belongs to.
--- @param statId number The ID of the Stat it is attached to.
--- @param value number The value of the stat for the character.
--- @param character Character The Character object it is attached to.
--- @param stat Stat The Stat object this instance concerns.
---
--- @return CharacterStat the new instance of CharacterStat.
---
function CharacterStat:new(object,
                           id,
                           characterId,
                           statId,
                           value,
                           character,
                           stat
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' CharacterStat's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.characterId = tonumber(characterId or object.characterId) or nil
    object.statId = tonumber(statId or object.statId) or nil
    object.value = tonumber(value or object.value) or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.character = character or object.character or nil
    object.stat = stat or object.stat or nil

    return object
end