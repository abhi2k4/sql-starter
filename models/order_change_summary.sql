-- Downstream summary model for lineage and impact analysis
select
  customer_id,
  count(*) as order_count,
  sum(total_cents) as gross_cents,
  sum(case when order_status in ('cancelled', 'refunded') then 1 else 0 end) as adverse_order_count,
  max(updated_at) as last_order_update_at
from {{ ref('customer_orders') }}
where deleted_at is null
group by customer_id