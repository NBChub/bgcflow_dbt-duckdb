WITH src_checkm AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_tables', 'df_checkm_stats') }}, header=True)
),

stg_checkm AS (
    SELECT
        genome_id,
        Completeness AS completeness,
        Contamination AS contamination,
        "# ambiguous bases" AS num_ambiguous_bases,
        "Coding density" AS coding_density,
        "# predicted genes" AS num_predicted_genes
    FROM src_checkm
)

SELECT * FROM stg_checkm
