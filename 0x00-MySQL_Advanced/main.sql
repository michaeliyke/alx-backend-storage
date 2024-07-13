-- Show and compute average weighted score
SELECT "--";
SELECT * FROM users;
SELECT "--";
SELECT * FROM projects;
SELECT "--";
SELECT * FROM corrections;
SELECT "--";

CALL ComputeAverageWeightedScoreForUser((SELECT id FROM users WHERE name = "Jeanne"));

SELECT "--";
SELECT * FROM users;
