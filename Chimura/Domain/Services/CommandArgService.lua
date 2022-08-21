---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A script that offers a few basic methods to treat CommandArg instances.
---
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
--- @return self
---
local CommandArgService = {}
local env = require 'Chimura.SetEnvironment'
local sUtils = require 'Chimura.ServicesGlobalFunctions'
require 'Chimura.Domain.Entities.CommandArg'

---
--- This function allows us to retrieve a CommandArg from the DB thanks to its ID.
---
--- @param id number The primary key of the CommandArg to retrieve.
---
--- @return CommandArg The row of the DB corresponding to the given ID.
---
function CommandArgService.retrieveFromId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            Name AS name,
            Description AS description,
            Type AS type,
            Optional AS optional,
            DefaultCommandID AS defaultCommandId,
            CustomCommandID AS customCommandId
        FROM CommandArg
        WHERE ID = %s
        LIMIT 1
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    local result = assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = assert(result:fetch({}, "a"), "{ \"err\":\"No lines found!\" }")

    result:close()
    return CommandArg:new(row)
end

---
--- This function allows us to retrieve the list of CommandArgs for the given DefaultCommand
---
--- @param defaultCommandId number The primary key of the DefaultCommand to retrieve CommandArgs from.
---
--- @return CommandArg[] The array of CommandArgs belonging to the given DefaultCommand.
---
function CommandArgService.retrieveFromDefaultCommandId(defaultCommandId)
    local commandArgs = {}

    assert(defaultCommandId ~= nil and defaultCommandId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            Name AS name,
            Description AS description,
            Type AS type,
            Optional AS optional,
            DefaultCommandID AS defaultCommandId,
            CustomCommandID AS customCommandId
        FROM CommandArg
        WHERE DefaultCommandID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, defaultCommandId)

    local result = assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = result:fetch({}, "a")

    local i = 1
    while row do
        commandArgs[i] = CommandArg:new(row)

        row = result:fetch({}, "a")
        i = i + 1
    end

    result:close()
    return commandArgs
end

---
--- This function allows us to retrieve the list of CommandArgs for the given CustomCommand
---
--- @param customCommandId number The primary key of the CustomCommand to retrieve CommandArgs from.
---
--- @return CommandArg[] The array of CommandArgs belonging to the given CustomCommand.
---
function CommandArgService.retrieveFromCustomCommandId(customCommandId)
    local commandArgs = {}

    assert(customCommandId ~= nil and customCommandId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            Name AS name,
            Description AS description,
            Type AS type,
            Optional AS optional,
            DefaultCommandID AS defaultCommandId,
            CustomCommandID AS customCommandId
        FROM CommandArg
        WHERE CustomCommandID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, customCommandId)

    local result = assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = result:fetch({}, "a")

    local i = 1
    while row do
        commandArgs[i] = CommandArg:new(row)

        row = result:fetch({}, "a")
        i = i + 1
    end

    result:close()
    return commandArgs
end

---
--- This function's purpose is to insert or update the given CommandArg object. It will check that whether the object
--- already is in the DB or not, and decide on which to use based on that.
---
--- @param row CommandArg The CommandArg object to insert or update in the database.
---
--- @return void
---
function CommandArgService.insertOrUpdate(row)
    local isNotNew = ((row.id or 0) ~= 0) --If id == nil => 0; if id == 0 => 0; if id > 0 => id;

    if isNotNew then    -- update
        local requestSkeleton = [[
            UPDATE CommandArg
            SET
                Name = %s,
                Description = %s,
                Type = %s,
                Optional = %s
            WHERE ID = %s
            ;
        ]]

        local request = string.format(requestSkeleton,
                sUtils.varchar(row.name) or "NULL",
                sUtils.varchar(row.description) or "NULL",
                sUtils.varchar(row.type) or "NULL",
                row.optional,
                row.id
        )

        assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
        -- No need to fetch anything here

    else                -- insert
        local requestSkeleton = [[
            INSERT INTO CommandArg(
                Name,
                Description,
                Type,
                Optional,
                DefaultCommandID,
                CustomCommandID
            ) VALUES (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s
            )
            ;
        ]]

        local request = string.format(requestSkeleton,
                sUtils.varchar(row.name) or "NULL",
                sUtils.varchar(row.description) or "NULL",
                sUtils.varchar(row.type) or "NULL",
                row.optional,
                row.defaultCommandId or "NULL",
                row.customCommandId or "NULL"
        )

        assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    end

end

---
--- This function's purpose is to delete the row of command argument at the given ID from the database.
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there was no command
--- argument to delete at the given id.
---
--- @param id number The ID of the command arg to remove from the database.
---
--- @return void
---
function CommandArgService.deleteAtId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM CommandArg
        WHERE ID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    -- Aaand... that's it. Nothing more to do here
end

---
--- This function's purpose is to delete all rows of command argument for the given DefaultCommand
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there were no command
--- argument to delete.
---
--- @param defaultCommandId number The ID of the DefaultCommand to remove command args from.
---
--- @return void
---
function CommandArgService.deleteAtDefaultCommandId(defaultCommandId)
    assert(defaultCommandId ~= nil and defaultCommandId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM CommandArg
        WHERE DefaultCommandID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, defaultCommandId)

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    -- Aaand... that's it. Nothing more to do here
end

---
--- This function's purpose is to delete all rows of command argument for the given CustomCommand
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there were no command
--- argument to delete.
---
--- @param customCommandId number The ID of the CustomCommand to remove command args from.
---
--- @return void
---
function CommandArgService.deleteAtCustomCommandId(customCommandId)
    assert(customCommandId ~= nil and customCommandId > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM CommandArg
        WHERE CustomCommandID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, customCommandId)

    assert(env.con:execute(request), "{ \"err\":\"Request failed!\" }")
    -- Aaand... that's it. Nothing more to do here
end

---
--- Calls for the environment set in this service to close. Has to be called at the very end of all treatments!!
---
--- @return void
---
function CommandArgService.closeEnv()
    env.close()
end

return CommandArgService