-- Adds a region field and supporting index for order analysis
ALTER TABLE customer_orders ADD COLUMN shipping_region VARCHAR(64) NOT NULL DEFAULT 'unknown';
CREATE INDEX idx_customer_orders_status_created_at ON customer_orders (status, created_at);
