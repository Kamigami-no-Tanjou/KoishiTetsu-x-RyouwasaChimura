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
    MODIFY BirthdayAlerts BOOL NOT NULL DEFAULT 0,
    MODIFY WarningCooldownStatus BOOL NOT NULL DEFAULT 1
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