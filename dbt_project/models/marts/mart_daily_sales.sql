select
    order_date,
    country,
    count(*) as orders,
    sum(amount) as revenue
from {{ ref('stg_orders') }}
group by order_date, country
