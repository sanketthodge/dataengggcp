select
    order_id,
    customer_id,
    order_date,
    country,
    cast(amount as numeric) as amount
from {{ source('m9_raw', 'orders_raw') }}
where amount > 0
