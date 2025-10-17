-- -------------------------------------------------------------
-- Table: products
-- Description: Stores information about each wine and spirit.
-- -------------------------------------------------------------
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50),
    volume_ml INTEGER,
    price NUMERIC(10, 2) NOT NULL,
    cost NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------------------------------------
-- Table: sales
-- Description: Stores information about each sale transaction.
-- -------------------------------------------------------------
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- -------------------------------------------------------------
-- Table: sale_items
-- Description: A junction table to link products to sales.
-- -------------------------------------------------------------
CREATE TABLE sale_items (
    id SERIAL PRIMARY KEY,
    sale_id INTEGER NOT NULL REFERENCES sales(id) ON DELETE CASCADE,
    product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL,
    price_per_unit NUMERIC(10, 2) NOT NULL
);

-- -------------------------------------------------------------
-- Indexes for performance
-- -------------------------------------------------------------
CREATE INDEX idx_product_name ON products(name);
CREATE INDEX idx_sale_date ON sales(sale_date);
CREATE INDEX idx_sale_items_sale_id ON sale_items(sale_id);
CREATE INDEX idx_sale_items_product_id ON sale_items(product_id);

-- -------------------------------------------------------------
-- Trigger to update the 'updated_at' timestamp on products
-- -------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_products_updated_at
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();