WITH src_regions AS (
    SELECT * FROM {{ source('bgcflow_warehouse', 'regions') }}
),

stg_regions AS (
    SELECT
        region_id,
        accession,
        region_number,
        location,
        start_pos,
        end_pos,
        contig_edge,
        product,
        rules,
    FROM src_regions
)

SELECT * FROM stg_regions
