USE ChimuraTest;

ALTER TABLE RoleCustomCommand
    MODIFY RoleID BIGINT UNSIGNED NOT NULL
;

ALTER TABLE User
    ADD Experience INT UNSIGNED NOT NULL DEFAULT 0,
    ADD BirthDate DATE,
    ADD TimeZone TINYINT DEFAULT 0,
    ADD CHECK (TimeZone <= 12 AND TimeZone >= -12)
;

ALTER TABLE Warning
    DROP CONSTRAINT Warning_ibfk_1,
    DROP CONSTRAINT Warning_ibfk_2,
    DROP COLUMN GuildID,
    DROP COLUMN UserID,
    ADD MemberID INT UNSIGNED NOT NULL,
    ADD FOREIGN KEY(MemberID) REFERENCES Member(ID)
;

ALTER TABLE Guild
    ADD MutedCooldown INT NOT NULL DEFAULT 24,
    ADD MutedRoleID BIGINT,
    ADD BirthdayAlerts BIT NOT NULL
;

ALTER TABLE MemberCustomCommand
    DROP CONSTRAINT MemberCustomCommand_ibfk_1,
    DROP CONSTRAINT MemberCustomCommand_ibfk_2,
    DROP COLUMN GuildID,
    DROP COLUMN UserID,
    ADD MemberID INT UNSIGNED NOT NULL,
    ADD FOREIGN KEY(MemberID) REFERENCES Member(ID)
;