CREATE TABLE mibig_hits (
    bgc_id VARCHAR,
    product VARCHAR,
    bigscape_class VARCHAR,
    biosyn_class VARCHAR,
    compounds VARCHAR,
    chem_acts VARCHAR,
    accession VARCHAR,
    completeness VARCHAR,
    organism_name VARCHAR,
    ncbi_tax_id BIGINT,
    publications VARCHAR,
    evidence VARCHAR,
    CONSTRAINT mibig_hits_bgc_id_fkey FOREIGN KEY (bgc_id)
    REFERENCES mibig (mibig_id) MATCH SIMPLE
    ON DELETE CASCADE
);
