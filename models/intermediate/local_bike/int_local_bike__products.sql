select
    p.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    p.model_year,
    p.unit_price
from {{ ref('stg_local_bike__products') }} p
inner join {{ ref('stg_local_bike__brands') }} b 
    on p.brand_id = b.brand_id 
inner join {{ ref('stg_local_bike__categories') }} c 
    on p.category_id = c.category_id