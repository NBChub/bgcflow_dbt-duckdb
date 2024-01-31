CREATE TABLE bigscape_network (
    bigscape_edge_id BIGINT,
    clustername_1 VARCHAR,
    clustername_2 VARCHAR,
    raw_distance DOUBLE PRECISION,
    squared_similarity DOUBLE PRECISION,
    jaccard_index DOUBLE PRECISION,
    dss_index DOUBLE PRECISION,
    adjacency_index DOUBLE PRECISION,
    raw_dss_non_anchor DOUBLE PRECISION,
    raw_dss_anchor DOUBLE PRECISION,
    non_anchor_domains BIGINT,
    anchor_domains BIGINT,
    combined_group VARCHAR,
    shared_group VARCHAR,
    CONSTRAINT bigscape_network_pkey PRIMARY KEY (bigscape_edge_id)
);
