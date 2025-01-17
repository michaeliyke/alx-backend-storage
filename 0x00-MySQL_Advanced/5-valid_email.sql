-- Advanced SQL Lesson 5: Valid Email
--  creates a trigger that resets valid_email attribute only when the email changes.
DROP      TRIGGER IF EXISTS valid_email_reset;

-- change delimiter to // instead of ;
DELIMITER //

-- start of trigger
CREATE TRIGGER valid_email_reset
BEFORE UPDATE ON users
FOR EACH ROW -- for each row being updated
BEGIN
	-- If email its email has changed,
	-- set its valid_email to 0 and continue the update with this new change.
	IF NEW.email != OLD.email THEN
		SET NEW.valid_email = 0;
	END IF;
END;
-- end of trigger
//

-- change delimiter back to ;
DELIMITER ;
