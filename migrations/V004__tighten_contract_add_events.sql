-- Additional high-signal migration for change-intelligence dogfooding
ALTER TABLE customer_orders ADD COLUMN deleted_at TIMESTAMP;

ALTER TABLE customer_orders ALTER COLUMN total_cents TYPE BIGINT;

ALTER TABLE customer_orders ALTER COLUMN status_reason SET NOT NULL;

CREATE TABLE customer_order_events (
  event_id BIGINT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  event_type VARCHAR(64) NOT NULL,
  event_at TIMESTAMP NOT NULL DEFAULT NOW(),
  actor VARCHAR(128),
  payload JSONB,
  CONSTRAINT fk_customer_order_events_order
    FOREIGN KEY (order_id) REFERENCES customer_orders(id)
);

CREATE INDEX idx_customer_order_events_order_id ON customer_order_events(order_id);
CREATE INDEX idx_customer_order_events_event_type ON customer_order_events(event_type);
