CREATE TABLE mibig (
    mibig_id VARCHAR,
    biosyn_class VARCHAR,
    compounds VARCHAR,
    chem_acts VARCHAR,
    accession VARCHAR,
    completeness VARCHAR,
    evidence VARCHAR,
    organism_name VARCHAR,
    ncbi_tax_id BIGINT,
    publications VARCHAR,
    CONSTRAINT mibig_pkey PRIMARY KEY (mibig_id)
);
