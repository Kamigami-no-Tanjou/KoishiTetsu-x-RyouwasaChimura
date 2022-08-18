USE ChimuraTest;

-- Tables without foreign keys :
CREATE TABLE Genre ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(1000) CHARACTER SET utf8,

    PRIMARY KEY(ID),
    UNIQUE(Name) -- We do not want the user to be able to create the same gender twice.
) ENGINE=INNODB;

CREATE TABLE Divinity ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,

    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE Belief ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,

    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE Stat ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(1000) CHARACTER SET utf8,
    Abreviation VARCHAR(4) CHARACTER SET utf8,

    PRIMARY KEY(ID),
    UNIQUE(Name), -- Same here, as this is pretty much a 'text container', we don't want duplicates.
    UNIQUE(Abreviation)
) ENGINE=INNODB;

CREATE TABLE Equipment ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,
    LoadTime INT,

    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE Spell ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,
    DailyQuota INT,

    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE Class ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,

    PRIMARY KEY(ID)
) ENGINE=INNODB;

CREATE TABLE Specie ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(10000) CHARACTER SET utf8,
    Description VARCHAR(10000) CHARACTER SET utf8,

    PRIMARY KEY(ID)
) ENGINE=INNODB;


-- Tables with foreign keys :
CREATE TABLE RPGCharacter ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(5000) CHARACTER SET utf8,
    LastName VARCHAR(5000) CHARACTER SET utf8,
    Alignment VARCHAR(5000) CHARACTER SET utf8,
    Image VARCHAR(5000) CHARACTER SET utf8,
    GenreID INT UNSIGNED NOT NULL,
    SpecieID INT UNSIGNED NOT NULL,
    ClassID INT UNSIGNED NOT NULL,
    BeliefID INT UNSIGNED,

    PRIMARY KEY(ID),
    FOREIGN KEY(GenreID) REFERENCES Genre(ID),
    FOREIGN KEY(SpecieID) REFERENCES Specie(ID),
    FOREIGN KEY(ClassID) REFERENCES Class(ID),
    FOREIGN KEY(BeliefID) REFERENCES Belief(ID)
) ENGINE=INNODB;

CREATE TABLE StatAlteration ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Value INT NOT NULL,
    StatID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(StatID) REFERENCES Stat(ID)
) ENGINE=INNODB;


-- Association tables :
CREATE TABLE BeliefDivinity ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    BeliefID INT UNSIGNED NOT NULL,
    DivinityID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(BeliefID) REFERENCES Belief(ID),
    FOREIGN KEY(DivinityID) REFERENCES Divinity(ID)
) ENGINE=INNODB;

CREATE TABLE RPGCharacterStat ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Value INT NOT NULL,
    RPGCharacterID INT UNSIGNED NOT NULL,
    StatID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(RPGCharacterID) REFERENCES RPGCharacter(ID),
    FOREIGN KEY(StatID) REFERENCES Stat(ID)
) ENGINE=INNODB;

CREATE TABLE ClassEquipment ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ClassID INT UNSIGNED NOT NULL,
    EquipmentID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(ClassID) REFERENCES Class(ID),
    FOREIGN KEY(EquipmentID) REFERENCES Equipment(ID)
) ENGINE=INNODB;

CREATE TABLE SpecieEquipment ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    SpecieID INT UNSIGNED NOT NULL,
    EquipmentID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(SpecieID) REFERENCES Specie(ID),
    FOREIGN KEY(EquipmentID) REFERENCES Equipment(ID)
) ENGINE=INNODB;

CREATE TABLE RPGCharacterEquipment ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    RPGCharacterID INT UNSIGNED NOT NULL,
    EquipmentID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(RPGCharacterID) REFERENCES RPGCharacter(ID),
    FOREIGN KEY(EquipmentID) REFERENCES Equipment(ID)
) ENGINE=INNODB;

CREATE TABLE ClassSpell ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ClassID INT UNSIGNED NOT NULL,
    SpellID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(ClassID) REFERENCES Class(ID),
    FOREIGN KEY(SpellID) REFERENCES Spell(ID)
) ENGINE=INNODB;

CREATE TABLE SpecieSpell ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    SpecieID INT UNSIGNED NOT NULL,
    SpellID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(SpecieID) REFERENCES Specie(ID),
    FOREIGN KEY(SpellID) REFERENCES Spell(ID)
) ENGINE=INNODB;

CREATE TABLE RPGCharacterSpell ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    RPGCharacterID INT UNSIGNED NOT NULL,
    SpellID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(RPGCharacterID) REFERENCES RPGCharacter(ID),
    FOREIGN KEY(SpellID) REFERENCES Spell(ID)
) ENGINE=INNODB;

CREATE TABLE SpecieStatAlteration ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    SpecieID INT UNSIGNED NOT NULL,
    StatAlterationID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(SpecieID) REFERENCES Specie(ID),
    FOREIGN KEY(StatAlterationID) REFERENCES StatAlteration(ID)
) ENGINE=INNODB;

CREATE TABLE ClassStatAlteration ( -- OK
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ClassID INT UNSIGNED NOT NULL,
    StatAlterationID INT UNSIGNED NOT NULL,

    PRIMARY KEY(ID),
    FOREIGN KEY(ClassID) REFERENCES Class(ID),
    FOREIGN KEY(StatAlterationID) REFERENCES StatAlteration(ID)
) ENGINE=INNODB;