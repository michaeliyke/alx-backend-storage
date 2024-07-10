-- Advanced SQL Lesson 0: Unique Users
-- In this lesson, we will learn how to create a table with unique users.
CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
);
