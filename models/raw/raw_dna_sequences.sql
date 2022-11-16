SELECT *
FROM {{ source('bgcflow_warehouse', 'dna_sequences') }}