-- Advanced SQL Lesson 4: Store
-- creates a trigger that decreases the quantity of an items table after adding a new order.
-- The amount of quiantity to decrease is the number of items in the new order.

DROP TRIGGER IF EXISTS reduce_item_quantity;

DELIMITER //
CREATE TRIGGER reduce_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	UPDATE items
	SET quantity = quantity - NEW.number
	WHERE name = NEW.item_name;
END;
//

DELIMITER ;
