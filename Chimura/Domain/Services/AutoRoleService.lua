---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A script that offers a few basic methods to treat AutoRole instances.
---
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
--- @return self
---
local AutoRoleService = {}
local env = require 'Chimura.SetEnvironment'
require 'Chimura.Domain.Entities.AutoRole'

---
--- This function allows us to retrieve an AutoRole from the DB thanks to its ID.
---
--- @param id number The primary key of the AutoRole to retrieve.
---
--- @return AutoRole The row of the DB corresponding to the given ID.
---
function AutoRoleService.retrieveFromId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            GuildID AS guildId
        FROM AutoRole
        WHERE ID = %s
        LIMIT 1
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    local result = assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = assert(result:fetch({}, "a"), "{ \"err\":\"No lines found!\" }")

    result:close()
    return AutoRole:new(row)
end

---
--- This function allows us to retrieve an AutoRole from the DB thanks to the ID of the Guild it belongs to.
---
--- @param guildId number The primary key of the Guild to retrieve the AutoRole from.
---
--- @return AutoRole[] The list of AutoRoles corresponding to the given Guild.
---
function AutoRoleService.retrieveFromGuildId(guildId)
    local autoRoles = {}

    assert(guildId ~= nil and guildId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            GuildID AS guildId
        FROM AutoRole
        WHERE GuildID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, guildId)

    local result = assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = result:fetch({}, "a")

    local i = 1
    while row do
        autoRoles[i] = AutoRole:new(row)

        row = result:fetch({}, "a")
        i = i + 1
    end

    result:close()
    return autoRoles
end


---
--- This function's purpose is to insert the given AutoRole object. It's not gonna update it, since an AutoRole can't
--- change its Role or Guild.
---
--- @param row AutoRole The AutoRole object to insert in the database.
---
--- @return void
---
function AutoRoleService.insert(row)
    local requestSkeleton = [[
        INSERT INTO AutoRole(
            ID,
            GuildID
        ) VALUES (
            %s,
            %s
        )
        ;
    ]]

    local request = string.format(requestSkeleton,
            row.id or "NULL",
            row.guildId or "NULL"
    )

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")

    --result:close() /!\ Here result is not a cursor!
end

---
--- This function's purpose is to delete the row of auto role at the given ID from the database.
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there was no auto role
--- to delete at the given id.
---
--- @param id number The Discord-like ID of the auto role to remove from the database.
---
--- @return void
---
function AutoRoleService.deleteAtId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM AutoRole
        WHERE ID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    -- Aaand... that's it. Nothing more to do here
end

---
--- This function's purpose is to delete all auto roles from the given guild. It is only meant to be called when
--- deleting a row of Guild, or when the Guild moderators asked for removing all auto roles.
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there were no auto
--- roles at the given guild.
---
--- @param guildId number The Discord-like ID of the Guild to remove all reaction roles from.
---
--- @return void
---
function AutoRoleService.deleteAtGuildId(guildId)
    assert(guildId ~= nil and guildId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM AutoRole
        WHERE GuildID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, guildId)

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
end

---
--- Calls for the environment set in this service to close. Has to be called at the very end of all treatments!!
---
--- @return void
---
function AutoRoleService.closeEnv()
    env.close()
end

return AutoRoleService