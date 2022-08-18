---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A Character representing a Character object
--- Its attributes are :
--- - ID            : INT NOT NULL UNSIGNED (PRIMARY KEY) (DatabaseGenerated)
--- - UserID        : BIGINT NOT NULL UNSIGNED
--- - GuildRPGID    : INT NOT NULL UNSIGNED
--- - GenreID       : INT NOT NULL UNSIGNED
--- - ClassID       : INT NOT NULL UNSIGNED
--- - SpecieID      : INT NOT NULL UNSIGNED
--- - BeliefID      : INT NULLABLE UNSIGNED
--- - FirstName     : VARCHAR NULLABLE
--- - LastName      : VARCHAR NULLABLE
--- - Alignment     : VARCHAR NULLABLE
--- - Image         : VARCHAR NULLABLE
---
--- @class Character
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Character = {
    id = 0,
    userId = 0,
    guildRPGId = 0,
    genreId = 0,
    classId = 0,
    specieId = 0,
    beliefId = 0,
    firstName = "",
    lastName = "",
    alignment = "",
    image = "",
    user = {},
    guildRPG = {},
    genre = {},
    class = {},
    specie = {},
    belief = {},
    characterStats = {}
}

---
--- The Character' constructor (will be used to rebuild Character object instances out of a table retrieved from a
--- json string)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Character it represents.
--- @param userId number The ID of the User to whom this Character belongs.
--- @param guildRPGId number The ID of the GuildRPG this Character belongs to.
--- @param genreId number The ID of the genre of the Character.
--- @param classId number The ID of the class of the Character.
--- @param specieId number The ID of the specie of the Character.
--- @param beliefId number The ID of the belief of the Character.
--- @param firstName string The first name of the character.
--- @param lastName string The last name of the character.
--- @param alignment string The alignment of the character.
--- @param image string The link to an image that represents the character.
--- @param user User The User to whom this Character belongs.
--- @param guildRPG GuildRPG The GuildRPG object it is attached to.
--- @param genre Genre The Genre of the character.
--- @param class Class The Class of the character.
--- @param specie Specie The Specie of the character.
--- @param belief Belief The religion in which the character believes.
--- @param characterStats CharacterStat[] The array of stats of the character.
---
--- @return Character the new instance of Character.
---
function Character:new(object,
                          id,
                          userId,
                          guildRPGId,
                          genreId,
                          classId,
                          specieId,
                          beliefId,
                          firstName,
                          lastName,
                          alignment,
                          image,
                          user,
                          guildRPG,
                          genre,
                          class,
                          specie,
                          belief,
                          characterStats
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Character's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id) or nil
    object.userId = tonumber(userId or object.userId) or nil
    object.guildRPGId = tonumber(guildRPGId or object.guildRPGId) or nil
    object.genreId = tonumber(genreId or object.genreId) or nil
    object.classId = tonumber(classId or object.classId) or nil
    object.specieId = tonumber(specieId or object.specieId) or nil
    object.beliefId = tonumber(beliefId or object.beliefId) or nil
    object.firstName = firstName or object.firstName or nil
    object.lastName = lastName or object.lastName or nil
    object.alignment = alignment or object.alignment or nil
    object.image = image or object.image or nil

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.user = user or object.user or nil
    object.guildRPG = guildRPG or object.guildRPG or nil
    object.genre = genre or object.genre or nil
    object.class = class or object.class or nil
    object.specie = specie or object.specie or nil
    object.belief = belief or object.belief or nil
    object.characterStats = characterStats or object.characterStats or nil

    return object
end