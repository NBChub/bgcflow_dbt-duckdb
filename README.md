## BGCFlow dbt-duckdb implementation
Shamelessly adapted from https://github.com/dbt-labs/jaffle_shop_duckdb

### Install dependencies
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

### Usage
Clone this repository to BGCFlow project result in `bgcflow/data/processed/<my_project>`

Run DBT:
```bash
dbt debug
dbt build
dbt serve
```