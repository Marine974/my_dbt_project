WITH orders AS (
    select
        order_id,
        customer_id,
        order_status,
        order_date,
        required_date,
        shipped_date,
        DATE_DIFF(shipped_date, required_date, DAY) as shipping_delay,
        store_id,
        staff_id
    from {{ ref('stg_local_bike__orders') }}
)

select 
    *,
    CASE WHEN shipping_delay is null THEN 'Not shipped yet'
        ELSE WHEN shipping_delay < 0 THEN 'Delayed'
        ELSE 'On time' END as shipping_status
from orders