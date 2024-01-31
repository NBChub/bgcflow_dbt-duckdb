CREATE TABLE checkm (
    genome_id VARCHAR,
    completeness DOUBLE PRECISION,
    contamination DOUBLE PRECISION,
    num_ambiguous_bases BIGINT,
    coding_density DOUBLE PRECISION,
    num_predicted_genes BIGINT,
    CONSTRAINT checkm_genome_id_fkey FOREIGN KEY (genome_id)
    REFERENCES genomes (genome_id) MATCH SIMPLE
    ON DELETE CASCADE
);
