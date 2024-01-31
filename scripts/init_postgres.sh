#!/bin/bash

set -o nounset

echo "Setting up PostgreSQL connection..."
echo "Using ${PSQL_HOST:=localhost}:${PSQL_PORT:=5432} with db ${PSQL_DB:=dbt_bgcflow}, schema ${PSQL_SCHEMA:=public} as ${PSQL_USER:=postgres}"
PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER"
PSQL_AS="$PSQL $PSQL_DB"

echo "Checking if database ${PSQL_DB} exists..."
$PSQL -tc "SELECT 1 FROM pg_database WHERE datname = '${PSQL_DB}';" | grep -q 1 || $PSQL -c "CREATE DATABASE $PSQL_DB;"

echo "Clearing out the whole schema"
$PSQL_AS -c "DROP SCHEMA IF EXISTS ${PSQL_SCHEMA} CASCADE;" > /dev/null 2>&1

echo "Creating schema ${PSQL_SCHEMA} if it does not exist..."
$PSQL_AS -c "CREATE SCHEMA IF NOT EXISTS ${PSQL_SCHEMA};" > /dev/null 2>&1

SQL_FILES="scripts/sql"

# tables not depending on other tables
TABLES="taxa mibig "

# tables depending on other tables. Please keep the order intact
TABLES="$TABLES genomes checkm dna_sequences seqfu regions bigscape_cluster cdss mibig_hits bigfam_hits bigfam_network bigscape_network"

# load tables
TABLES="$TABLES load"

for t in $TABLES; do
    if [ -f "$SQL_FILES/${t}.sql" ]; then
        echo "Processing $t"
    else
        echo "no such file: $SQL_FILES/${t}.sql"
        exit 1
    fi
    echo "Executing SQL script for $t..."
    $PSQL_AS 2>&1 < "$SQL_FILES/${t}.sql" | tee tmp | grep ERROR
    if [ "$?" -eq "0" ]; then
        cat tmp
        rm tmp
        exit 1
    fi
    echo "SQL script for $t executed successfully."
    rm tmp
done

echo "PostgreSQL setup completed."
