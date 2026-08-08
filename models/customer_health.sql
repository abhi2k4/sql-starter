-- Second-hop downstream model to deepen lineage impact paths
select
  customer_id,
  order_count,
  gross_cents,
  adverse_order_count,
  case
    when adverse_order_count >= 3 then 'review_now'
    when gross_cents >= 100000 then 'strategic'
    else 'normal'
  end as attention_level
from {{ ref('order_change_summary') }}