-- Higher-risk schema change to exercise impact detection
ALTER TABLE customer_orders RENAME COLUMN status TO order_status;

ALTER TABLE customer_orders ADD COLUMN status_reason VARCHAR(128);

ALTER TABLE customer_orders ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

CREATE INDEX idx_customer_orders_order_status ON customer_orders(order_status);