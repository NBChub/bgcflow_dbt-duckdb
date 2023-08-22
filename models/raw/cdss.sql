WITH src_cdss AS (
    SELECT * FROM {{ source('bgcflow_warehouse', 'cdss') }}
),

stg_cdss AS (
    SELECT
        cds_id,
        region_id,
        locus_tag,
        product,
        gene_function,
        name,
        translation,
        'location',
        gene_kind,
        codon_start,
        EC_number,
    FROM src_cdss
)

SELECT * FROM stg_cdss
