# Google Cloud SQL

## Setup

    $ gcloud auth list
    $ gcloud config list project

## Prepare Environment

    $ export PROJECT_ID=$(gcloud info --format='value(config.project)')
    $ export BUCKET=${PROJECT_ID}-ml
    
## Create SQL Instance

    $ gcloud sql instances create taxi \
    --tier=db-n1-standard-1 --activation-policy=ALWAYS

Set password

    $ gcloud sql users set-password root --host % --instance taxi --password Passw0rd

IP Address cloud shell

    $ export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32
    
Whitelist Cloud shell instance

    $ gcloud sql instances patch taxi --authorized-networks $ADDRESS

Get IP address Cloud SQL instance

    $ MYSQLIP=$(gcloud sql instances describe taxi --format="value(ipAddresses.ipAddress)")
    $ echo $MYSQLIP
    
## Create Table

    $ mysql --host=$MYSQLIP --user=root --password --verbose
    mysql> create database if not exists bts;
    mysql> use bts;
    mysql> drop table if exists trips;
    mysql> create table trips (
              vendor_id VARCHAR(16),		
              pickup_datetime DATETIME,
              dropoff_datetime DATETIME,
              passenger_count INT,
              trip_distance FLOAT,
              rate_code VARCHAR(16),
              store_and_fwd_flag VARCHAR(16),
              payment_type VARCHAR(16),
              fare_amount FLOAT,
              extra FLOAT,
              mta_tax FLOAT,
              tip_amount FLOAT,
              tolls_amount FLOAT,
              imp_surcharge FLOAT,
              total_amount FLOAT,
              pickup_location_id VARCHAR(16),
              dropoff_location_id VARCHAR(16)
           );
    mysql> describe trips;
    mysql> select distinct(pickup_location_id) from trips;
    mysql> exit;
    
## Add Data
 
    $ gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_1.csv trips.csv-1
    $ gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_2.csv trips.csv-2
    
## Import Data to Cloud SQL

    $ mysqlimport --local --host=$MYSQLIP --user=root --password --ignore-lines=1 --fields-terminated-by=',' bts trips.csv-*
 
## Check Data

    $ mysql --host=$MYSQLIP --user=root  --password
    
    mysql> use bts;
    mysql> select distinct(pickup_location_id) from trips;
    mysql> select
              max(trip_distance),
              min(trip_distance)
            from
              trips;
    mysql> select count(*) from trips where trip_distance = 0;
    mysql> select count(*) from trips where fare_amount < 0;
    mysql> select
              payment_type,
              count(*)
            from
              trips
            group by
              payment_type;
      
    
    
    
    
 
