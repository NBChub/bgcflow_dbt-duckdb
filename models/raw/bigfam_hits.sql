WITH src_bigfam_hits AS (
    SELECT * FROM {{ source('bgcflow_bigslice', 'gcf_summary') }}
),

stg_bigfam_gcf_hits AS (
    SELECT 
        gcf_id AS bigfam_id,
        core_member,
        putative_member,
        core_member_mibig,
        putative_member_mibig,
        core_member_mibig_count,
        core_member_mibig_bool,
        putative_member_mibig_count,
        putative_member_mibig_bool,
        "link to BiG-FAM" AS bigfam_link
    FROM src_bigfam_hits
)

SELECT * FROM stg_bigfam_gcf_hits