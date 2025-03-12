select
    oi.product_id,
    p.product_name,
    p.category_name,
    p.brand_name,
    oi.store_id,
    s.store_name,
    s.store_city,
    s.store_state,
    EXTRACT(YEAR from oi.order_date) as order_year,
    count(distinct order_id) as total_nb_of_orders,
    sum(oi.quantity) as total_quantity,
    sum(oi.total_order_items_amount) as total_amount,
    avg(oi.product_unit_price) as product_unit_price
from {{ ref('int_local_bike__order_items') }} oi
inner join {{ ref('int_local_bike__products') }} p
    on oi.product_id = p.product_id
inner join {{ ref('stg_local_bike__stores') }} s
    on oi.store_id = s.store_id
group by product_id, product_name, category_name, brand_name, 
         store_id, store_name, store_city, store_state, 
         order_year