USE ChimuraTest;

CREATE TRIGGER DefaultCommandCreation
AFTER INSERT
ON DefaultCommand
FOR EACH ROW
BEGIN
    DECLARE finished BIT DEFAULT false;
    DECLARE guildID BIGINT UNSIGNED;
    DECLARE curGuild CURSOR FOR SELECT ID FROM Guild;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = true;

    OPEN curGuild;
    
    guild_loop: LOOP
        FETCH curGuild INTO guildID;
        IF finished THEN
            LEAVE guild_loop;
        END IF;
        
        INSERT INTO GuildDefaultCommand (
            Enabled, GuildID, DefaultCommandID
        ) VALUES (
            true, guildID, NEW.ID
        );
    END LOOP;
    
    CLOSE curGuild;
END
;
/