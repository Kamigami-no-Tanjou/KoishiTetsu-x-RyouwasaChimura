require 'Chimura.EntitiesGlobalFunctions'

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A class representing a Guild object
--- Its attributes are :
--- - ID                    : BIGINT NOT NULL UNSIGNED (PRIMARY KEY) (=Discord ID)
--- - MaxWarningAmount      : INT UNSIGNED NOT NULL DEFAULT 3
--- - WarningCooldownStatus : BIT NOT NULL DEFAULT 1 (=true)
--- - WarningCooldown       : INT NOT NULL DEFAULT 14(days)
--- - MutedCooldown         : INT NOT NULL DEFAULT 24(hours)
--- - MutedRoleID           : BIGINT
--- - BirthdayAlerts        : BIT NOT NULL (=false)
---
--- @class Guild
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Guild = {
    id = 0,
    maxWarningAmount = 3,
    warningCooldownStatus = true,
    warningCooldown = 14,
    mutedCooldown = 24,
    mutedRoleId = nil, --Thanks to the dynamic types, ints can be nil! :D
    birthdayAlerts = false,
    members = {},
    autoRoles = {},
    reactionRoles = {},
    disabledCommands = {},
    customCommands = {},
    rolePlayingGames = {}
}

---
--- The Guild's constructor (will be used to rebuild Guild object instances out of a table retrieved from a json)
---
--- @param object table The table to create an object from (leave nil if not used).
--- @param id number The ID of the line of Guild it represents.
--- @param maxWarningAmount number The maximum amount of warnings tolerated before to ban users.
--- @param warningCooldownStatus boolean Whether the cooldown of warnings is enabled or not. If it is, then members will
--- lose one warning if they didn't take any other during the *warningCooldown* time.
--- @param warningCooldown number The time (in days) that members need not to get warned for in order to lose one warning.
--- @param mutedCooldown number The default time (in hours) that members need to wait until they get automatically unmuted.
--- @param mutedRoleId number The ID (Discord-like) of the role to give to muted members (when they are muted via the bot).
--- @param birthdayAlerts boolean Whether the bot sends messages to alert all guild members that today's the birthday of
--- one or more members.
--- @param members Member[] The array of Members that belongs to this Guild.
--- @param autoRoles AutoRole[] The array of roles to give automatically to every Member joining the Guild.
--- @param reactionRoles ReactionRole[] The array of reaction roles in this server.
--- @param disabledCommands DefaultCommand[] The array of DefaultCommands disabled by the Guild's moderation team.
--- @param customCommands CustomCommand[] The array of customized commands made by the Guild's moderation team.
--- @param rolePlayingGames GuildRPG[] The array of role playing games the current Guild's been used for.
---
--- @return Guild the new instance of guild.
---
function Guild:new(object,
                   id,
                   maxWarningAmount,
                   warningCooldownStatus,
                   warningCooldown,
                   mutedCooldown,
                   mutedRoleId,
                   birthdayAlerts,
                   members,
                   autoRoles,
                   reactionRoles,
                   disabledCommands,
                   customCommands,
                   rolePlayingGames
)
    --For safety (if the table is nil)
    object = object or {}

    --We provide 'object' Guild's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its default values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    object.id = tonumber(id or object.id or 0)
    object.maxWarningAmount = tonumber(maxWarningAmount or object.maxWarningAmount or 3)
    object.warningCooldownStatus = affectBool(tonumber(warningCooldownStatus or object.warningCooldownStatus or true))
    object.warningCooldown = tonumber(warningCooldown or object.warningCooldown or 14)
    object.mutedCooldown = tonumber(mutedCooldown or object.mutedCooldown or 24)
    object.mutedRoleId = tonumber(mutedRoleId or object.mutedRoleId or nil)
    object.birthdayAlerts = affectBool(tonumber(birthdayAlerts or object.birthdayAlerts or false))

    --These values are not meant to be inserted in the database (or perhaps not the standard way)
    object.members = members or object.members or nil
    object.autoRoles = autoRoles or object.autoRoles or nil
    object.reactionRoles = reactionRoles or object.reactionRoles or nil
    object.disabledCommands = disabledCommands or object.disabledCommands or nil
    object.customCommands = customCommands or object.customCommands or nil
    object.rolePlayingGames = rolePlayingGames or object.rolePlayingGames or nil

    return object
end