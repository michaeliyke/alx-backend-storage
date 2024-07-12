-- Advanced SQL Lesson 7: Average Score
--  creates a stored procedure ComputeAverageScoreForUser that computes and store the average score for a student
-- Note: An average score can be a decimal

DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN  -- Multi-statement block starts here. Not necessary for single-statement blocks.

	-- Declare variables
	DECLARE avg_score FLOAT;
	DECLARE total_score FLOAT;
	DECLARE total_projects INT;

	SELECT SUM(score), COUNT(*) INTO total_score, total_projects FROM corrections WHERE user_id = user_id;

	-- Calculate average score
	IF total_projects = 0 THEN
		SET avg_score = 0;
	ELSE
		SET avg_score = total_score / total_projects;
	END IF;

	-- Update the user's average score in the users table
	UPDATE users SET average_score = avg_score WHERE id = user_id;
END//

DELIMITER ;
