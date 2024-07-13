-- Advanced SQL Lesson 7: Average Score
--  creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student
-- Note: An average score can be a decimal

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN userid INT)
BEGIN  -- Multi-statement block starts here. Not necessary for single-statement blocks.
	-- Declare a variable to store the average score
	DECLARE avg_score FLOAT;

	-- Compute the average score for the user
	SELECT AVG(score) INTO avg_score FROM corrections WHERE user_id = userid;

	-- Update the user's average score in the users table
	UPDATE users SET average_score = avg_score WHERE id = userid;
END//

DELIMITER ;
