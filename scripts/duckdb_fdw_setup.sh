#!/bin/bash
# sudo apt-get install postgresql-server-dev-all
# Step 1: Download source
git clone https://github.com/alitrack/duckdb_fdw


cd duckdb_fdw

# Step 2: Download DuckDB library
wget -c https://github.com/duckdb/duckdb/releases/download/v0.8.1/libduckdb-linux-amd64.zip -nc
unzip -n -d . libduckdb-linux-amd64.zip

export PATH=/usr/lib/postgresql/14/bin:$PATH
echo $(which pg_config)

libdir="/usr/lib/postgresql/14/lib"
sudo cp libduckdb.so $libdir


# Step 3: Build and install duckdb_fdw
# Add a directory of pg_config to PATH and build and install duckdb_fdw.

sudo make NO_PGXS=1
sudo make install NO_PGXS=1



cd ..
export PGPASSWORD=$1

echo "Using ${PSQL_HOST:=localhost}:${PSQL_PORT:=5432} with db ${PSQL_DB:=dbt_bgcflow}, schema ${PSQL_SCHEMA:=public} as ${PSQL_USER:=postgres}"
PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER"
PSQL_AS="$PSQL $PSQL_DB"

$PSQL_AS -c "CREATE EXTENSION duckdb_fdw;"
