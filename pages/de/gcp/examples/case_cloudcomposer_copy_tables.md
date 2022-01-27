# Cloud Composer: Copying BigQuery Tables Across Different Locations

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## Create Cloud Composer Environment

gcp > Composer > Create Environment > Composer 1
      
|Key|Value|
|-|-|
|Name|composer-advanced-lab|
|Location|us-central1|
|Zone|us-central1-a|

## Create Cloud Storage Buckets

gcp > Cloud Storage > Create Bucket > qwiklabs-gcp-04-fa74c2822fdb-us  
gcp > Cloud Storage > Create Bucket > qwiklabs-gcp-04-fa74c2822fdb-eu

## BigQuery Destination Dataset

gcp > BigQuery > Project > Create Dataset > nyc_tlc_EU


## Cloud Composer

### Create Virtual Environment

    $ sudo apt-get update
    $ sudo apt-get install -y virtualenv
    $ virtualenv -p python3 venv
    $ source venv/bin/activate
    
### Setting DAGs Cloud Storage bucket

    $ DAGS_BUCKET=us-central1-composer-advanc-ce5258fd-bucket

### Set Airflow Variables

gcp > Composer > composer-advanced-lab > Environment Variables

|KEY|VALUE|Details|
|-|-|-|
|table_list_file_path|/home/airflow/gcs/dags/bq_copy_eu_to_us_sample.csv|CSV file listing source and target tables, including dataset|
|gcs_source_bucket|{UNIQUE ID}-us|Cloud Storage bucket to use for exporting BigQuery tabledest_bbucks from source|
|gcs_dest_bucket|{UNIQUE ID}-eu|Cloud Storage bucket to use for importing BigQuery tables at destination|

    $ gcloud composer environments run composer-advanced-lab \
    --location us-central1 variables -- \
    --set table_list_file_path /home/airflow/gcs/dags/bq_copy_eu_to_us_sample.cs
    
    $ gcloud composer environments run composer-advanced-lab \
    --location us-central1 variables -- \
    --set gcs_source_bucket qwiklabs-gcp-04-fa74c2822fdb-us
    
    $ gcloud composer environments run composer-advanced-lab \
    --location us-central1 variables -- \
    --set gcs_dest_bucket qwiklabs-gcp-04-fa74c2822fdb-eu
    
### Uploading DAG and dependencies to Cloud Storage

    $ cd ~
    $ gsutil -m cp -r gs://spls/gsp283/python-docs-samples .
    $ gsutil cp -r python-docs-samples/third_party/apache-airflow/plugins/* gs://$DAGS_BUCKET/plugins
    $ gsutil cp python-docs-samples/composer/workflows/bq_copy_across_locations.py gs://$DAGS_BUCKET/dags
    $ gsutil cp python-docs-samples/composer/workflows/bq_copy_eu_to_us_sample.csv gs://$DAGS_BUCKET/dags

### Use Airflow UI

gcp > Composer > composer-advanced-lab > Airflow-Link  

Admin > Variables  

![Variables](../../../gcp_composer_10.jpg)  

DAGs > Trigger DAG

### Explore DAG runs

## Delete Cloud Composer Environment
