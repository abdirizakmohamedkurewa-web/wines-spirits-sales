-- -------------------------------------------------------------
-- Sample Data for 'products' table
-- -------------------------------------------------------------
INSERT INTO products (name, type, volume_ml, price, cost, stock_quantity) VALUES
('Cabernet Sauvignon', 'Red Wine', 750, 25.50, 15.00, 50),
('Chardonnay', 'White Wine', 750, 22.00, 12.50, 60),
('Scotch Whisky', 'Whisky', 700, 45.00, 30.00, 30);

-- -------------------------------------------------------------
-- Sample Data for 'sales' and 'sale_items' tables
-- -------------------------------------------------------------
-- Step 1: Create a new sale and get its ID
WITH new_sale AS (
  INSERT INTO sales (total_amount)
  VALUES (70.50) -- Example total: 1x Cabernet (25.50) + 2x Chardonnay (22.00*2=45.00)
  RETURNING id
)
-- Step 2: Add items to the sale using the ID from the previous step
INSERT INTO sale_items (sale_id, product_id, quantity, price_per_unit) VALUES
((SELECT id FROM new_sale), 1, 1, 25.50),
((SELECT id FROM new_sale), 2, 2, 22.00);

-- -------------------------------------------------------------
-- Note: The total_amount in the 'sales' table is pre-calculated
-- here for simplicity. In a real application, this might be
-- calculated by a trigger or application logic.
-- -------------------------------------------------------------