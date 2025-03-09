select
    order_id,
    customer_id,
    order_status,
    SAFE_CAST(order_date as DATE)       as order_date,
    SAFE_CAST(required_date as DATE)    as required_date,
    SAFE_CAST(shipped_date as DATE)     as shipped_date,
    store_id,
    staff_id
from {{ source('local_bike', 'orders') }}