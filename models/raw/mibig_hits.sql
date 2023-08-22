WITH src_bigscape_mibig_hits AS (
    SELECT * FROM {{ source('bgcflow_bigscape', 'df_known') }}
),

stg_bigscape_mibig_hits AS (
    SELECT
        bgc_id,
        product,
        bigscape_class,
        biosyn_class,
        compounds,
        chem_acts,
        accession,
        completeness,
        organism_name,
        ncbi_tax_id,
        publications,
        evidence,
    FROM src_bigscape_mibig_hits
)

SELECT * FROM stg_bigscape_mibig_hits
