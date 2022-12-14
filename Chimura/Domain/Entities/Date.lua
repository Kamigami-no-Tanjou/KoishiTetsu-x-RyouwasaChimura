---
--- Generated by EmmyLua(https://github.com/EmmyLua)
---
--- This class is a bit special, as is actually isn't a table from the database, but more of a utility one, that will
--- help dealing with dates, hence it's always a bit tricky.
---
--- It will contain three attributes which are the following:
--- - year  : The year of the date, a string of length 4.
--- - month : The month of the date, a string of length 2.
--- - day   : the day of the date, a string of length 2.
---
--- They are conserved as strings for integrity with the database reasons. The idea is to ultimately just have to put
--- every attribute together to be able to insert the date in the database.
---
--- @class Date
--- @author RedNeath
--- @since 1.0.0
---
--- @licence MIT (https://github.com/Kamigami-no-Tanjou/KoishiTetsu-x-RyouwasaChimura/blob/main/LICENSE)
---
Date = {
    year = nil, -- : string
    month = nil, -- : string
    day = nil -- : string
}

---
--- The Date's constructor.
---
--- @param fullString string The SQL-like string, that follows the canonical format: 'YYYY-MM-DD'.
--- @param year string The year of the date.
--- @param month string The month of the date.
--- @param day string The day of the date.
---
--- @return Date the new instance of Date.
---
function Date:new(fullString,
                  year,
                  month,
                  day
)
    --We create the new instance
    local object = {}

    --We provide 'object' Date's metamethods & properties
    setmetatable(object, self)
    self.__index = self

    --And we finally give it its values
    --[[
    Important here to affect values to 'object' and not 'self' !! Because editing 'self' would mean modifying the
    prototype, hence modifying all its sub-classes/objects!
    --]]
    if fullString ~= nil and string.len(fullString) == 10 then
        object.year = string.sub(fullString, 1, 4)
        object.month = string.sub(fullString, 6, 7)
        object.day = string.sub(fullString, 9, 10)
    else
        object.year = year
        object.month = month
        object.day = day
    end

    return object
end

---
--- This method returns the SQL-compliant string that will allow the insertion or update in the database.
---
--- @return string The SQL date as 'YYYYMMDD'.
---
function Date:toString()
    return self.year .. self.month .. self.day
end