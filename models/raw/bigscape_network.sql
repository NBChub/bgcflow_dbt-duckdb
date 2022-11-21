WITH src_bigscape_network AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_bigscape', 'df_network') }}, header=True)
),

stg_bigscape_network AS (
    SELECT
        bigscape_edge_id,
        "Clustername 1" AS clustername_1,
        "Clustername 2" AS clustername_2,
        "Raw distance" AS raw_distance,
        "Squared similarity" AS squared_similarity,
        "Jaccard index" AS jaccard_index,
        "DSS index" AS dss_index,
        "Adjacency index" AS adjacency_index,
        "raw DSS non-anchor" AS raw_DSS_non_anchor,
        "raw DSS anchor" AS raw_DSS_anchor,
        "Non-anchor domains" AS non_anchor_domains,
        "Anchor domains" AS anchor_domains,
        "Combined group" AS combined_group,
        "Shared group" AS shared_group
    FROM src_bigscape_network
)

SELECT * FROM stg_bigscape_network
