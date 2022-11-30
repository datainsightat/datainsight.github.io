# General

[Official Documentation](https://www.getdbt.com/)

# Setup Project

## Install

    # python --version
    conda create --name dbt python=3.9
    conda activate dbt

    pip install dbt-oracle==1.3.0

## Create Model

    mkdir project
    cd project
    dbt init project
    
    dbt deps # to install package
    dbt clean # to clean

    dbt docs generate
    dbt docs serve
    
## Run Model

    dbt run-operation generate_source --args '{"schema_name": "XXX", "database_name": "XXX", "table_names":["XXX"]}'


