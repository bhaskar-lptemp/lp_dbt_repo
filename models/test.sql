{{
    config(
        materialized='incremental',
        unique_key='id',
        incremental_strategy='merge'
    )
}}

select id,name,updated_time
from AIRBNB.RAW.CUSTOMER

{% if is_incremental() %}
--Only get new/updated records since last run
where updated_time > (select max(updated_time) from {{this}})

--Or for initial load handeling:
--where order_date >= DATEADD(day, -3, CURRENT_DATE)
{% endif%}
