-- dbt-style model placeholder
select
	id,
	customer_id,
	order_status,
	total_cents,
	status_reason,
	updated_at,
	case
		when order_status in ('cancelled', 'refunded') then 'at_risk'
		when total_cents >= 50000 then 'vip'
		else 'standard'
	end as order_tier
from {{ ref('customer_orders') }}
