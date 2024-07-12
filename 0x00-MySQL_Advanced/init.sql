-- Initial
-- items table
DROP TABLE IF EXISTS items;
CREATE TABLE IF NOT EXISTS items (
	name VARCHAR(255) NOT NULL,
	quantity int NOT NULL DEFAULT 10
);
-- orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	item_name VARCHAR(255) NOT NULL,
	number int NOT NULL
);
INSERT INTO items (name)
VALUES ("apple"),
	("pineapple"),
	("pear");
