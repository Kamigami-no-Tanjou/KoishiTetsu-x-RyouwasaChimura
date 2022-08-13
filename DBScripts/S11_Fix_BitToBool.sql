USE ChimuraTest;

ALTER TABLE CommandArg
    MODIFY Optional BOOL NOT NULL
;

ALTER TABLE CustomCommand
    MODIFY Enabled BOOL NOT NULL,
    MODIFY Slashless BOOL NOT NULL,
    MODIFY TriggeredFromContent BOOL NOT NULL
;

ALTER TABLE Guild
    MODIFY BirthdayAlerts BOOL NOT NULL,
    MODIFY WarningCooldownStatus BOOL NOT NULL
;

ALTER TABLE GuildDefaultCommand
    MODIFY Enabled BOOL NOT NULL
;

ALTER TABLE Language
    MODIFY Supported BOOL NOT NULL
;

ALTER TABLE Member
    MODIFY Muted BOOL NOT NULL
;