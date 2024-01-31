TRUNCATE TABLE taxa,
genomes,
regions,
mibig_hits,
mibig,
seqfu,
dna_sequences,
cdss,
checkm,
bigfam_hits,
bigfam_network,
bigscape_network,
bigscape_cluster;

\copy taxa FROM './exported_database/taxa.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy genomes FROM './exported_database/genomes.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy regions FROM './exported_database/regions.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy mibig FROM './exported_database/mibig.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy mibig_hits FROM './exported_database/mibig_hits.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy seqfu FROM './exported_database/seqfu.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy dna_sequences FROM './exported_database/dna_sequences.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy cdss FROM './exported_database/cdss.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy checkm FROM './exported_database/checkm.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy bigfam_hits FROM './exported_database/bigfam_hits.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy bigfam_network FROM './exported_database/bigfam_network.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy bigscape_network FROM './exported_database/bigscape_network.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
\copy bigscape_cluster FROM './exported_database/bigscape_cluster.csv' (FORMAT 'csv', quote '"', delimiter ',', header 0);
