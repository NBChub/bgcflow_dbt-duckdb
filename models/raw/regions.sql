WITH src_regions AS (
    SELECT * FROM {{ source('bgcflow_tables', 'df_regions_antismash') }}
),

stg_regions AS (
    SELECT
        bgc_id as region_id,
        genome_id,
        region,
        accession,
        start_pos,
        end_pos,
        contig_edge,
        product,
        region_length,
    FROM src_regions
)

SELECT * FROM stg_regions
