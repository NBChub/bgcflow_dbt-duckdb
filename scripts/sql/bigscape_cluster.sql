CREATE TABLE bigscape_cluster (
    bgc_id VARCHAR,
    genome_id VARCHAR,
    product VARCHAR,
    bigscape_class VARCHAR,
    accn_id VARCHAR,
    gcf BIGINT,
    fam_id BIGINT,
    fam_type VARCHAR,
    fam_known_compounds VARCHAR,
    CONSTRAINT bigscape_cluster_pkey PRIMARY KEY (bgc_id),
    CONSTRAINT bigscape_cluster_genome_id_fkey FOREIGN KEY (genome_id)
    REFERENCES genomes (genome_id) MATCH SIMPLE
    ON DELETE CASCADE
);
