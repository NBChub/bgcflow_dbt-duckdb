WITH src_bigscape_cluster AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_bigscape', 'df_clusters') }}, header=True)
),

stg_bigscape_cluster AS (
    SELECT
        bgc_id,
        genome_id,
        product,
        bigscape_class,
        accn_id,
        "gcf_0.30" AS gcf,
        "Clan Number" AS clan_number,
        "fam_id_0.30" AS fam_id,
        "fam_type_0.30" AS fam_type,
        "fam_known_compounds_0.30" AS fam_known_compounds
    FROM src_bigscape_cluster
)

SELECT * FROM stg_bigscape_cluster
