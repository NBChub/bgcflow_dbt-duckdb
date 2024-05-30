## BGCFlow dbt-duckdb implementation
An ELT framework to build a DuckDB OLAP database from [BGCFlow run](https://github.com/NBChub/bgcflow) using dbt.

## Publication
> Matin Nuhamunada, Omkar S Mohite, Patrick V Phaneuf, Bernhard O Palsson, Tilmann Weber, BGCFlow: systematic pangenome workflow for the analysis of biosynthetic gene clusters across large genomic datasets, Nucleic Acids Research, 2024;, gkae314, [https://doi.org/10.1093/nar/gkae314](https://doi.org/10.1093/nar/gkae314)

### Usage
#### Clone
Clone this repository to BGCFlow project result in `bgcflow/data/processed/<my_project>`:
```bash
(cd bgcflow/data/processed/<my_project> && git clone git@github.com:matinnuhamunada/dbt_bgcflow.git)
```
#### Install dependencies
<details>
<summary>install using python venv</summary>

```bash
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
```

</details>

<details>
<summary>install using mamba</summary>

```bash
mamba env create -f env.yml
```

</details>

#### Configure source location
Activate the virtual environment and configures source location by running this python script:

```python
project_dir="bgcflow/data/processed/<my_project>"
python $project_dir/bgcflow_dbt-duckdb/scripts/source_template.py templates/_sources.yml models/sources.yml "7.1.0" "0.30"
```

#### Run DBT
```bash
dbt debug
dbt build
dbt docs generate
dbt docs serve
```

### Exporting to newer version of DuckDB
Right now newer version of DuckDB is not backward compatible. To migrate the data to newer version, use the script [`export_duckdb.py`](scripts/export_duckdb.py):
```bash
$ python scripts/export_duckdb.py -h
usage: export_duckdb.py [-h] [--database_filename DATABASE_FILENAME] [--export_directory EXPORT_DIRECTORY]

Export a DuckDB database.

options:
  -h, --help            show this help message and exit
  --database_filename DATABASE_FILENAME
                        The filename of the DuckDB database to export.
  --export_directory EXPORT_DIRECTORY
                        The directory to save the exported database.
  --format {parquet,csv}
                        The format to export the database in.
```

### [WIP] Migrating to PostgreSQL
```bash
bash scripts/migrate_postgres_workflow.sh
```

# Credits
This dbt template was inspired adapted from [jaffle_shop_duckdb](https://github.com/dbt-labs/jaffle_shop_duckdb) example.
