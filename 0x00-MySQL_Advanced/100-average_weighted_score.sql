-- Advanced SQL Lesson 100: Average Weighted Score
-- creates a stored procedure ComputeAverageWeightedScoreForUser that  computes and store the average weighted score for a student.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	-- Declare variables
	DECLARE weighted_total_score FLOAT;
	DECLARE total_weight FLOAT;
	DECLARE average_score FLOAT;

	 -- Calculate the sum of weighted scores for the user
	SELECT SUM(corrections.score * projects.weight) INTO weighted_total_score
	FROM corrections
	INNER JOIN projects
	ON project_id = id
	WHERE corrections.user_id = user_id;

	 -- Calculate the total weight of projects for the user
	SELECT SUM(projects.weight) INTO total_weight
	FROM corrections
	INNER JOIN projects
	ON corrections.project_id = projects.id
	WHERE corrections.user_id = user_id;

	-- Compute the average weighted score finally, handle division by zero
	IF total_weight > 0 THEN
		SET average_score = ABS(weighted_total_score / total_weight);
	ELSE
		SET average_score = 0;
	END IF;

	-- Update the user's average score in the users table
	UPDATE users
	SET average_score = average_score
	WHERE id = user_id;

END//

DELIMITER ;

-- DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
