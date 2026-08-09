# Agent notes

## Deprecation timing

- Do **not** drop `legacy_payment_method` (or cold DROP COLUMN on `customer_orders`) until Q3.
- Wait for `fct_orders` consumers; prefer dual-read, then a follow-up drop PR.
- Breaking DDL on this SQL demo warehouse is merge-blocking without an approved window.
