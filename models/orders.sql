-- dbt-style model placeholder
select id, customer_id, status, total_cents from {{ ref('customer_orders') }}
