-- Baseline table used by OVERSIGHT demo scoring
CREATE TABLE customer_orders (
  id BIGINT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  status VARCHAR(32) NOT NULL DEFAULT 'open',
  total_cents INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
