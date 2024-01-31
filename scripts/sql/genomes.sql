CREATE TABLE genomes (
    genome_id VARCHAR, tax_id VARCHAR, source VARCHAR, strain DOUBLE PRECISION,
    CONSTRAINT genomes_pkey PRIMARY KEY (genome_id),
    CONSTRAINT genomes_tax_id_fkey FOREIGN KEY (tax_id)
    REFERENCES taxa (tax_id) MATCH SIMPLE
    ON DELETE CASCADE
);
