## BGCFlow dbt-duckdb implementation
Clone this repository to the BGCFlow project result to build a DuckDB database.

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
python $project_dir/dbt_bgcflow/scripts/source_template.py templates/_sources.yml models/sources.yml "6.1.1" "0.30"
```

#### Run DBT
```bash
dbt debug
dbt build
dbt docs generate
dbt docs serve
```

# Credits
This dbt template was inspired adapted from [jaffle_shop_duckdb](https://github.com/dbt-labs/jaffle_shop_duckdb) example.
