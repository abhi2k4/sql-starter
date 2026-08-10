-- dbt-style model placeholder
select id, customer_id, status, total_cents, shipping_region
from {{ ref('customer_orders') }}
