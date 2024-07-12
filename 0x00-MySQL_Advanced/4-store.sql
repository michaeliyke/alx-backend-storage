-- Advanced SQL Lesson 4: Store
-- creates a trigger that decreases the quantity of an item after adding a new order.
CREATE TRIGGER decrease_item_quantity
AFTER
INSERT ON orders FOR EACH ROW BEGIN
UPDATE store
SET quantity = quantity - NEW.quantity
WHERE item = NEW.item;
END;
