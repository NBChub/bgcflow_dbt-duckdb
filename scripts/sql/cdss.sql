CREATE TABLE cdss (
    cds_id VARCHAR,
    region_id VARCHAR,
    locus_tag VARCHAR,
    product VARCHAR,
    gene_function VARCHAR,
    "name" VARCHAR,
    translation VARCHAR,
    "location" VARCHAR,
    gene_kind VARCHAR,
    codon_start VARCHAR,
    ec_number VARCHAR,
    CONSTRAINT cdss_pkey PRIMARY KEY (cds_id),
    CONSTRAINT cdss_region_id_fkey FOREIGN KEY (region_id)
    REFERENCES regions (region_id) MATCH SIMPLE
    ON DELETE CASCADE
);
