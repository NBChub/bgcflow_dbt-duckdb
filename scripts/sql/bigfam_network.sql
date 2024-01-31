CREATE TABLE bigfam_network (
    bigfam_id BIGINT,
    bgc_id VARCHAR,
    membership_value DOUBLE PRECISION,
    rank BIGINT,
    CONSTRAINT bigfam_network_bigfam_id_fkey FOREIGN KEY (bigfam_id)
    REFERENCES bigfam_hits (bigfam_id) MATCH SIMPLE
    ON DELETE CASCADE,
    CONSTRAINT bigfam_network_bgc_id_fkey FOREIGN KEY (bgc_id)
    REFERENCES regions (region_id) MATCH SIMPLE
    ON DELETE CASCADE
);
