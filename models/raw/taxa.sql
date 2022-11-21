WITH src_taxa AS (
    SELECT * FROM read_csv_auto({{ source('bgcflow_tables', 'df_gtdb_meta') }}, header=True)
),

stg_taxa AS (
    SELECT
        md5(Domain || Phylum || Class || src_taxa.Order || Family || Genus || Organism) AS tax_id,
        genome_id,
        Domain AS domain,
        Phylum AS phylum,
        Class AS class,
        src_taxa.Order AS taxonomic_order,
        Family AS family,
        Genus AS genus,
        Organism AS species,
    FROM src_taxa
)

SELECT DISTINCT tax_id, domain, phylum, class, taxonomic_order, family, genus, species
    FROM stg_taxa
