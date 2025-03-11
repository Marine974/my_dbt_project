select
    oi.order_items_id,
    order_id,
    oi.product_id,
    oi.quantity,
    oi.product_unit_price,
    oi.discount,
    oi.total_order_items_amount,
    o.customer_id,
    o.order_date,
    o.shipped_date,
    o.shipping_status,
    o.store_id,
    o.staff_id
from {{ ref('stg_local_bike__order_items') }} oi
inner join {{ ref('int_local_bike__orders') }} o
    on oi.order_id = o.order_id
