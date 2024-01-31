CREATE TABLE bigfam_hits (
    bigfam_id BIGINT,
    core_member BIGINT,
    putative_member BIGINT,
    core_member_mibig VARCHAR,
    putative_member_mibig VARCHAR,
    core_member_mibig_count BIGINT,
    core_member_mibig_bool BOOLEAN,
    putative_member_mibig_count BIGINT,
    putative_member_mibig_bool BOOLEAN,
    bigfam_link VARCHAR,
    CONSTRAINT bigfam_hits_pkey PRIMARY KEY (bigfam_id)
);
