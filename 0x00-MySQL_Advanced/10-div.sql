-- Advanced SQL Lesson 10: Div
-- function SafeDiv that divides & returns the 1st by the 2nd number.
-- Returns 0 if the second number is equal to 0

DROP FUNCTION IF EXISTS SafeDiv;

DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS INT
BEGIN
	IF b = 0 THEN
		RETURN 0;
	ELSE
		RETURN a / b;
	END IF;
END//

DELIMITER ;

