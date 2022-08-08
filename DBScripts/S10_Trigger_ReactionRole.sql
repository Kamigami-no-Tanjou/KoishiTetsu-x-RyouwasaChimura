USE ChimuraTest;

CREATE PROCEDURE CheckEmoteAndEmoji(
    IN emote VARCHAR(20),
    IN emoji VARCHAR(20)
)
BEGIN
    IF NOT ISNULL(emote) AND NOT ISNULL(emoji) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A reaction role cannot be linked with an emote and an emoji at the same time.';
    END IF;
END
;
/

CREATE TRIGGER EmoteAndEmojiInsert
BEFORE INSERT
ON ReactionRole
FOR EACH ROW
BEGIN
    CALL CheckEmoteAndEmoji(NEW.Emote, NEW.Emoji);
END
;
/

CREATE TRIGGER EmoteAndEmojiUpdate
BEFORE UPDATE
ON ReactionRole
FOR EACH ROW
BEGIN
    CALL CheckEmoteAndEmoji(NEW.Emote, NEW.Emoji);
END
;
/