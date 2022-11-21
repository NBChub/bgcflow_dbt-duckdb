WITH src_seqfu AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_tables', 'df_seqfu_stats') }}, header=True)
),

stg_seqfu AS(
    SELECT
        genome_id,
        src_seqfu.Min AS s_min,
        src_seqfu.N25 AS s_n25,
        src_seqfu.N50 AS s_n50,
        src_seqfu.AuN AS s_aun,
        src_seqfu.gc AS s_gc,
        src_seqfu.Max AS s_max,
        src_seqfu.N75 AS s_n75,
        src_seqfu.Count as s_count,
        src_seqfu.Total as s_total,
        src_seqfu.N90 AS s_n90,
        src_seqfu.Avg AS s_avg
    FROM src_seqfu
)

SELECT * FROM stg_seqfu
