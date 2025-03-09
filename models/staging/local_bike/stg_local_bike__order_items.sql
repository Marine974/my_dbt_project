select
    CONCAT(order_id, '_', item_id)              as order_items_id,
    order_id,
    item_id,
    product_id,
    quantity,
    list_price                                  as product_unit_price,
    discount,
    (quantity * list_price) * (1 - discount)    as total_order_items_amount
from {{ source('local_bike', 'order_items') }}