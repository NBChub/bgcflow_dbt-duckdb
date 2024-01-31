WITH src_mibig_bgcs AS (
    SELECT * FROM {{ source('bgcflow_tables', 'df_mibig_bgcs') }}
),

stg_mibig_bgcs AS (
    SELECT
        mibig_id,
        biosyn_class,
        compounds,
        chem_acts,
        accession,
        completeness,
        evidence,
        organism_name,
        ncbi_tax_id,
        publications
    FROM src_mibig_bgcs
)

SELECT * FROM stg_mibig_bgcs
