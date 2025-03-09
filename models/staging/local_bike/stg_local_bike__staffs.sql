select
    staff_id,
    first_name  as staff_first_name,
    last_name   as staff_last_name,
    email       as staff_email,
    phone       as staff_phone,
    active      as staff_status,
    store_id,
    CAST(REPLACE(manager_id, 'NULL', '-1') as INT64) as manager_id
from {{ source('local_bike', 'staffs') }}
