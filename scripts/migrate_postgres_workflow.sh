echo "Starting export from DuckDB..."
python scripts/export_duckdb.py --format csv
echo "Export from DuckDB completed."

echo "Initializing PostgreSQL..."
bash scripts/init_postgres.sh
echo "PostgreSQL initialization completed."
