-- Advanced SQL Lesson 9: Index Name Score
-- creates an index idx_name_first_score on the table names and the
-- first letter of name and the score

-- DROP INDEX IF EXISTS idx_name_first_score;

-- CREATE INDEX idx_name_first_score ON names (user_id, LEFT((SELECT name FROM users WHERE id = user_id), 1), score);

CREATE INDEX idx_name_first_score ON names (name(1), score);
