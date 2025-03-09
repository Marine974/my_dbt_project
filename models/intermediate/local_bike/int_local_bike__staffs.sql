select
    staff.staff_id,
    staff.staff_first_name,
    staff.staff_last_name,
    staff.staff_email,
    staff.staff_phone,
    staff.staff_status,
    staff.store_id,
    staff.manager_id,
    manager.staff_first_name    as manager_first_name,
    manager.staff_last_name     as manager_last_name
from {{ ref("stg_local_bike__staffs") }} staff
left join {{ ref("stg_local_bike__staffs") }} manager
    on staff.manager_id = manager.staff_id