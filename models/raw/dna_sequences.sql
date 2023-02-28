WITH src_dna_sequences AS (
    SELECT * FROM {{ source('bgcflow_warehouse', 'dna_sequences') }}
),

stg_dna_sequences AS (
    SELECT
        sequence_id,
        accessions,
        genome_id,
        description,
        molecule_type,
        topology,
        seq,
    FROM src_dna_sequences
)

SELECT * FROM stg_dna_sequences
