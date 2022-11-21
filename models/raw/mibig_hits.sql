WITH src_bigscape_mibig_hits AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_bigscape', 'df_known') }}, header=True)
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
        "gcf_0.30" AS gcf,
        "Clan Number" AS clan_number,
        "fam_id_0.30" AS fam_id,
        "fam_type_0.30" AS fam_type,
        "fam_known_compounds_0.30" AS fam_known_compounds
    FROM src_bigscape_mibig_hits
)

SELECT * FROM stg_bigscape_mibig_hits
