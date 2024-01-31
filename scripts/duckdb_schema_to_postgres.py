import argparse


def convert_sql_script(duckdb_script_path, postgres_script_path):
    """
    Convert a DuckDB SQL script to a PostgreSQL SQL script.

    Args:
    duckdb_script_path (str): The path to the DuckDB SQL script.
    postgres_script_path (str): The path to save the PostgreSQL SQL script.
    """
    # Mapping of DuckDB data types to PostgreSQL data types
    data_type_mapping = {
        "BIGINT": "BIGINT",
        "BOOLEAN": "BOOLEAN",
        "DATE": "DATE",
        "DOUBLE": "DOUBLE PRECISION",
        "INTEGER": "INTEGER",
        "TEXT": "TEXT",
        "TIMESTAMP": "TIMESTAMP",
    }

    # Read the DuckDB SQL script
    with open(duckdb_script_path, "r") as file:
        duckdb_script = file.read()

    # Replace the data types with their PostgreSQL equivalents
    for duckdb_type, postgres_type in data_type_mapping.items():
        duckdb_script = duckdb_script.replace(duckdb_type, postgres_type)

    # Write the new script to a PostgreSQL SQL script
    with open(postgres_script_path, "w") as file:
        file.write(duckdb_script)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert a DuckDB SQL script to a PostgreSQL SQL script."
    )
    parser.add_argument("duckdb_script_path", help="The path to the DuckDB SQL script.")
    parser.add_argument(
        "postgres_script_path", help="The path to save the PostgreSQL SQL script."
    )
    args = parser.parse_args()

    convert_sql_script(args.duckdb_script_path, args.postgres_script_path)
