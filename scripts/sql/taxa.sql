CREATE TABLE taxa (
    tax_id VARCHAR,
    "domain" VARCHAR,
    phylum VARCHAR,
    "class" VARCHAR,
    taxonomic_order VARCHAR,
    "family" VARCHAR,
    genus VARCHAR,
    species VARCHAR,
    CONSTRAINT taxa_pkey PRIMARY KEY (tax_id)
);
