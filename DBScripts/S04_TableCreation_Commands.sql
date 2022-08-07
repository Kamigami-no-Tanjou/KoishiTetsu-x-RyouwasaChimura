USE ChimuraTest;

CREATE TABLE DefaultCommand( -- There will probably be huge changes to make to this table, but at least it's there
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8 NOT NULL,
    Description VARCHAR(10000) CHARACTER SET utf8 NOT NULL,
    
    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE CustomCommand(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) CHARACTER SET utf8 NOT NULL,
    Description VARCHAR(10000) CHARACTER SET utf8,
    Enabled BIT NOT NULL,
    Slashless BIT NOT NULL,
    TriggeredFromContent BIT NOT NULL,
    Output VARCHAR(10000) CHARACTER SET utf8,
    GuildID BIGINT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ID),
    FOREIGN KEY(GuildID) REFERENCES Guild(ID),
    CONSTRAINT Guild_CustomCommand UNIQUE (Name, GuildID)
) ENGINE=INNODB;

CREATE TABLE CommandArg(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(20) CHARACTER SET utf8 NOT NULL,
    Description VARCHAR(10000) CHARACTER SET utf8 NOT NULL,
    Type CHAR NOT NULL,
    Optional BIT NOT NULL,
    DefaultCommandID INT UNSIGNED,
    CustomCommandID INT UNSIGNED,
    
    PRIMARY KEY(ID),
    FOREIGN KEY(DefaultCommandID) REFERENCES DefaultCommand(ID), -- Trigger : Can't reference a default and a custom command at once
    FOREIGN KEY(CustomCommandID) REFERENCES CustomCommand(ID), -- View : Show lines that has references neither a default nor a custom command
    CONSTRAINT DefaultOrCustomCommand_Name_Type UNIQUE (Name, Type, DefaultCommandID, CustomCommandID)
) ENGINE = INNODB;

CREATE TABLE GuildDefaultCommand(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Enabled BIT NOT NULL,
    GuildID BIGINT UNSIGNED NOT NULL,
    DefaultCommandID INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ID),
    FOREIGN KEY(GuildID) REFERENCES Guild(ID),
    FOREIGN KEY(DefaultCommandID) REFERENCES DefaultCommand(ID)
) ENGINE=INNODB;

CREATE TABLE RoleCustomCommand(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    RoleID INT UNSIGNED NOT NULL,
    CustomCommandID INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ID),
    -- No foreign key for the RoleID as the table doesn't exist and probably won't ever. => Though it will have to be made if I include the table!
    FOREIGN KEY(CustomCommandID) REFERENCES CustomCommand(ID)
) ENGINE=INNODB;

CREATE TABLE MemberCustomCommand(
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    UserID BIGINT UNSIGNED NOT NULL,
    GuildID BIGINT UNSIGNED NOT NULL,
    CustomCommandID INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ID),
    FOREIGN KEY(UserID) REFERENCES User(ID),
    FOREIGN KEY(GuildID) REFERENCES Guild(ID),
    FOREIGN KEY(CustomCommandID) REFERENCES CustomCommand(ID)
) ENGINE=INNODB;