CREATE TABLE dna_sequences (
    sequence_id VARCHAR,
    accessions VARCHAR,
    genome_id VARCHAR,
    description VARCHAR,
    molecule_type VARCHAR,
    topology VARCHAR,
    seq VARCHAR,
    CONSTRAINT dna_sequences_pkey PRIMARY KEY (sequence_id),
    CONSTRAINT dna_sequences_genome_id_fkey FOREIGN KEY (genome_id)
    REFERENCES genomes (genome_id) MATCH SIMPLE
    ON DELETE CASCADE
);
