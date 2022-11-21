SELECT *
FROM {{ source('bgcflow_warehouse', 'cdss') }}
