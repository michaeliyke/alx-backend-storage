-- Advanced SQL Lesson 11: Need Meeting
-- creates a view need_meeting that lists all students that have a score under 80 (strict)
--  and no last_meeting or more than 1 month

-- A view in SQL is a virtual table based on the result set of a SQL query.
-- A view contains rows and columns, just like a real table.
-- The fields in a view are fields from one or more real tables in the database.
-- It doesn't store the data itself but presents data stored in tables in a specific,
-- often simplified, way.

-- Views can be used to:
--
-- Simplify complex queries.
-- Provide a layer of abstraction.
-- Enhance security by restricting access to specific data.
-- Present data in a specific format or structure.

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH));
