import argparse
import logging

import duckdb

# Set up logging
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)


def export_database(database_filename, export_directory, format):
    """
    Export a DuckDB database to a specified directory.

    Args:
    database_filename (str): The filename of the DuckDB database to export.
    export_directory (str): The directory to save the exported database.
    format (str): The format to export the database in.
    """
    logging.info(f"Connecting to database: {database_filename}")
    conn = duckdb.connect(database_filename)

    logging.info(f"Exporting database to directory: {export_directory}")
    conn.execute(f"EXPORT DATABASE '{export_directory}' (FORMAT {format.upper()})")

    logging.info("Database export completed successfully")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export a DuckDB database.")
    parser.add_argument(
        "--database_filename",
        help="The filename of the DuckDB database to export.",
        default="dbt_bgcflow.duckdb",
    )
    parser.add_argument(
        "--export_directory",
        help="The directory to save the exported database.",
        default="./exported_database",
    )
    parser.add_argument(
        "--format",
        help="The format to export the database in.",
        choices=["parquet", "csv"],
        default="parquet",
    )
    args = parser.parse_args()

    export_database(args.database_filename, args.export_directory, args.format)
