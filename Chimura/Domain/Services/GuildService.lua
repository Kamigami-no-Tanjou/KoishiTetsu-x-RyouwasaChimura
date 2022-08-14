---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- A script that offers a few basic methods to treat Guild instances.
---
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
require 'Chimura.SetEnvironment'
require 'Chimura.Domain.Entities.Guild'

---
--- This function allows us to retrieve a Guild from the DB thanks to its ID.
---
--- @param id number The primary key of the Guild to retrieve.
---
--- @return Guild The row of the DB corresponding to the given ID.
---
function retrieveGuildFromId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        SELECT
            ID AS id,
            MaxWarningAmount AS maxWarningAmount,
            WarningCooldownStatus AS warningCooldownStatus,
            WarningCooldown AS warningCooldown,
            MutedCooldown AS mutedCooldown,
            MutedRoleID AS mutedRoleId,
            BirthdayAlerts AS birthdayAlerts
        FROM Guild
        WHERE ID = %s
        LIMIT 1
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    local result = assert(con:execute(request), "{ \"err\":\"Request failed!\" }")
    local row = assert(result:fetch({}, "a"), "{ \"err\":\"No lines found!\" }")

    result:close()
    return Guild:new(row)
end


---
--- This function's purpose is to insert or update the given Guild object. It will check that whether the object already
--- is in the DB or not, and decide on which to use based on that.
---
--- @param row Guild The Guild object to insert or update in the database.
---
function insertOrUpdateGuild(row)
    --To do that, we're simply going to make a SELECT COUNT on the ID attribute of the guild object.
    local isNotNew

    local request = string.format("SELECT COUNT(ID) FROM Guild WHERE ID = %s", row.id)
    local result = assert(con:execute(request), "{ \"err\":\"Request failed!\" }")
    local count = assert(result:fetch({}), "{ \"err\":\"No lines found!\" }")

    isNotNew = (tonumber(count[1]) > 0)
    result:close() -- We don't need it anymore

    if isNotNew then    -- update
        local requestSkeleton = [[
            UPDATE Guild
            SET
                MaxWarningAmount = %s,
                WarningCooldownStatus = %s,
                WarningCooldown = %s,
                MutedCooldown = %s,
                MutedRoleID = %s,
                BirthdayAlerts = %s
            WHERE ID = %s
            ;
        ]]

        request = string.format(requestSkeleton,
                row.maxWarningAmount or "NULL",
                row.warningCooldownStatus,
                row.warningCooldown or "NULL",
                row.mutedCooldown or "NULL",
                row.mutedRoleId or "NULL",
                row.birthdayAlerts,
                row.id
        )

        result = assert(con:execute(request), "{ \"err\":\"Request failed!\" }")
        -- No need to fetch anything here
    else                -- insert
        local requestSkeleton = [[
            INSERT INTO Guild(
                ID,
                MaxWarningAmount,
                WarningCooldownStatus,
                WarningCooldown,
                MutedCooldown,
                MutedRoleID,
                BirthdayAlerts
            ) VALUES (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s
            )
            ;
        ]]

        request = string.format(requestSkeleton,
                row.id or "NULL",
                row.maxWarningAmount or "NULL",
                row.warningCooldownStatus,
                row.warningCooldown or "NULL",
                row.mutedCooldown or "NULL",
                row.mutedRoleId or "NULL",
                row.birthdayAlerts
        )

        result = assert(con:execute(request), "{ \"err\":\"Request failed!\" }")
    end

    --result:close() /!\ Here result is not a cursor!
end

---
--- This function's purpose is to delete the row of server at the given ID from the database.
--- Be aware that, just like the MySQL DELETE statement, this method will NOT throw any error if there was no server to
--- delete at the given id.
---
--- @param id number The Discord-like ID of the server to remove from the database.
---
function deleteGuildAtId(id)
    assert(id ~= nil and id > 0, "{ \"err\":\"Bad ID!\" }")
    local requestSkeleton = [[
        DELETE FROM Guild
        WHERE ID = %s
        ;
    ]]

    local request = string.format(requestSkeleton, id)

    assert(con:execute(request), "{ \"err\":\"Request failed!\" }")
    -- Aaand... that's it. Nothing more to do here (actually, there's a lot more to do, but that'll be for another time)
end