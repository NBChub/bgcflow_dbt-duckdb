CREATE TABLE seqfu (
    genome_id VARCHAR,
    s_min BIGINT,
    s_n25 BIGINT,
    s_n50 BIGINT,
    s_aun DOUBLE PRECISION,
    s_gc DOUBLE PRECISION,
    s_max BIGINT,
    s_n75 BIGINT,
    s_count BIGINT,
    s_total BIGINT,
    s_n90 BIGINT,
    s_avg DOUBLE PRECISION,
    CONSTRAINT seqfu_genome_id_fkey FOREIGN KEY (genome_id)
    REFERENCES genomes (genome_id) MATCH SIMPLE
    ON DELETE CASCADE
);
