-- Downstream summary model for lineage and impact analysis
select
  customer_id,
  count(*) as order_count,
  sum(total_cents) as gross_cents,
  max(updated_at) as last_order_update_at
from {{ ref('customer_orders') }}
group by customer_id