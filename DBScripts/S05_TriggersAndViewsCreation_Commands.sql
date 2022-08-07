USE ChimuraTest;

CREATE PROCEDURE CheckDefaultAndCustom(
    IN defaultCommandID INT UNSIGNED,
    IN customCommandID INT UNSIGNED
)
BEGIN
    IF NOT ISNULL(defaultCommandID) AND NOT ISNULL(customCommandID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A command arg cannot refer to two different commands at the same time.';
    END IF;
END
;
/

CREATE TRIGGER DefaultAndCustomInsert
BEFORE INSERT
ON CommandArg
FOR EACH ROW
BEGIN
    CALL CheckDefaultAndCustom(NEW.DefaultCommandID, NEW.CustomCommandID);
END
;
/

CREATE TRIGGER DefaultAndCustomUpdate
BEFORE UPDATE
ON CommandArg
FOR EACH ROW
BEGIN
    CALL CheckDefaultAndCustom(NEW.DefaultCommandID, NEW.CustomCommandID);
END
;
/

CREATE VIEW ArgumentAlone AS
    SELECT CAR.ID, CAR.Name, CAR.Description, CAR.Type, CAR.Optional
    FROM CommandArg CAR
    WHERE ISNULL(CAR.DefaultCommandID) AND ISNULL(CAR.CustomCommandID)
;