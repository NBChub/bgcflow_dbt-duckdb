SELECT *
FROM {{ source('bgcflow_warehouse', 'regions') }}
