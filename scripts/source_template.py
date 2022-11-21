import logging
import sys
from pathlib import Path

import yaml
from jinja2 import Template

log_format = "%(levelname)-8s %(asctime)s   %(message)s"
date_format = "%d/%m %H:%M:%S"
logging.basicConfig(format=log_format, datefmt=date_format, level=logging.DEBUG)


def create_dbt_source_config(
    template_file, outfile, as_version="6.1.1", bigscape_cutoff="0.30"
):
    """
    Handle missing rules output from BGCFlow as table sources for DBT
    """
    source_yml = Path(template_file)
    dbt_dir = source_yml.parents[1]

    with open(source_yml, "r") as f:
        raw_source_template = f.read()
        raw_template = Template(raw_source_template)
        source_template = yaml.safe_load(
            raw_template.render(as_version=as_version, bigscape_cutoff=bigscape_cutoff)
        )

    sources = source_template["sources"]
    for num_s, s in enumerate(sources):
        logging.info(f"Finding tables from source: {s['name']}")
        logging.debug(f"Schema is: {s['schema']}")
        template_location = s["meta"]["external_location"]
        for num_t, t in enumerate(s["tables"]):
            name = t["name"]
            location = t["meta"]["external_location"]
            table_extension = Path(location).name.split(".")[-1]
            table = [
                i
                for i in (dbt_dir / location).parent.glob(f"*{name}*.{table_extension}")
            ]
            if len(table) == 1:
                logging.debug(f"Found table {s['name']}.{name}: {table[0]}")
            elif len(table) == 0:
                logging.warning(f"Cannot find table {s['name']}.{name}")
                logging.debug(f"Using blank table from template: {template_location}")
                template_resolved = dbt_dir / template_location.replace("{name}", name)
                template_parent = template_resolved.parent
                template = [i for i in template_parent.glob(f"*{name}*")]
                assert (
                    len(template) == 1
                ), f"Error finding template for {s['name']}.{name}: {template}"
                table = template
                logging.debug(f"Found table {s['name']}.{name}: {table[0]}")
                logging.debug(
                    f"Replacing source value: {location} --> {template_location}"
                )
                source_template["sources"][num_s]["tables"][num_t]["meta"][
                    "external_location"
                ] = template_location
            else:
                logging.warning(f"More than 1 table is found! {table}")
                raise
            logging.debug("Moving on...")

    logging.info(f"Writing to output: {outfile}")

    with open(outfile, "w") as f:
        yaml.dump(source_template, f, sort_keys=False)

    logging.info("Job Done!")
    return


if __name__ == "__main__":
    create_dbt_source_config(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
