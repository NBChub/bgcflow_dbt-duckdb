WITH src_taxa AS (
    SELECT * FROM {{ source('bgcflow_tables', 'df_gtdb_meta') }}
),

src_genomes AS (
    SELECT * FROM {{ source('bgcflow_tables', 'df_antismash') }}
),

stg_taxa AS (
    SELECT
        md5(Domain || Phylum || Class || src_taxa.Order || Family || Genus || Organism) AS tax_id,
        genome_id,
    FROM src_taxa
),

stg_genomes AS(
    SELECT
        src_genomes.genome_id as genome_id,
        stg_taxa.tax_id as tax_id,
        src_genomes.source as source,
        src_genomes.strain as strain,
        --src_genomes.bgcs_count,
        --src_genomes.bgcs_on_contig_edge,
    FROM src_genomes, stg_taxa
    WHERE
        src_genomes.genome_id = stg_taxa.genome_id
)

SELECT genome_id, tax_id, source, strain FROM stg_genomes
