CREATE TABLE regions (
    region_id VARCHAR,
    genome_id VARCHAR,
    region DOUBLE PRECISION,
    accession VARCHAR,
    start_pos BIGINT,
    end_pos BIGINT,
    contig_edge BOOLEAN,
    product VARCHAR,
    region_length BIGINT,
    CONSTRAINT regions_pkey PRIMARY KEY (region_id),
    CONSTRAINT regions_genome_id_fkey FOREIGN KEY (genome_id)
    REFERENCES genomes (genome_id) MATCH SIMPLE
    ON DELETE CASCADE
);
