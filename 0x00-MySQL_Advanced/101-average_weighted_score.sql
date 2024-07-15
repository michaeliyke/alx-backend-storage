-- Advanced SQL Lesson 101: Average Weighted Score
-- creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()

BEGIN
	-- Declare variables
	DECLARE weighted_total_score FLOAT;
	DECLARE total_weight FLOAT;
	DECLARE average_score FLOAT;
	DECLARE user_id INT;
	-- Flag var to control loop termination.
	-- TRUE indicates no more users to process. (INT initialized to FALSE)
	DECLARE done INT DEFAULT FALSE;
	-- Define a cursor to fetch user IDs one by one from the users table
	DECLARE cur CURSOR FOR SELECT id FROM users;
	-- Define a special handler for the cursor above
	-- Defines what action to take when the cursor reaches the end of the data
	-- Here sets the done variable to TRUE when the NOT FOUND condition occurs.
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	-- Open the cursor ready to retrieve data
	OPEN cur;

	-- Loop continues iterating as long as the done flag is FALSE
	repeat
		-- Retrieve next user ID from the cursor, store in user_id
		FETCH cur INTO user_id;
		-- Check if the done flag is still FALSE
		IF NOT done THEN
			-- Calculate the sum of weighted scores for the user
			SELECT SUM(corrections.score * projects.weight) INTO weighted_total_score
			FROM corrections
			INNER JOIN projects
			ON corrections.project_id = projects.id
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
		END IF;
	until done END REPEAT;

	-- Close the cursor
	CLOSE cur;

END//

DELIMITER ;

-- DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
