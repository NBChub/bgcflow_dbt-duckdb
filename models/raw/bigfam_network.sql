WITH src_bigfam_network as (
    SELECT * FROM {{ source('bgcflow_bigslice', 'query_network') }}
),

stg_bigfam_network as (
    SELECT
        gcf_id AS bigfam_id,
        bgc_id,
        membership_value,
        rank
    FROM src_bigfam_network
)

SELECT * FROM stg_bigfam_network