{{
    config(
        materialized='view'
    )
}}

WITH raw_hosts AS (
    SELECT
        *
    FROM
       {{ ref('src_hosts') }}
)
SELECT
     host_id,
 NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
  nvl(is_superhost,'Anonymous') AS is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts

    