# Engineering Data in Google Cloud

## BigQueryML

### Analyze Data

gcp > BigQuery  

#### Source

    select * from `qwiklabs-gcp-04-797b0d469b84.taxirides.historical_taxi_rides_raw` limit 10;

#### Target

    select * from `qwiklabs-gcp-04-797b0d469b84.taxirides.report_prediction_data` limit 10;

### Filter Table

    create or replace table
        `qwiklabs-gcp-04-797b0d469b84.taxirides.taxi_training_data_231`
    as
        (
        with
          boundaries as (
            select
                #min(pickup_datetime) put_min,
                #max(pickup_datetime) put_max,
                least(min(pickuplon),min(dropofflon)) lon_min,
                greatest(max(pickuplon),max(dropofflon)) lon_max,
                least(min(pickuplat),min(dropofflat)) lat_min,
                greatest(max(pickuplat),max(dropofflat)) lat_max,
                max(passengers) passg_max
            from 
                `qwiklabs-gcp-04-797b0d469b84.taxirides.report_prediction_data`
          )

        select
            CAST(EXTRACT(week FROM pickup_datetime) AS STRING) AS weekofyear,
            CAST(EXTRACT(dayofweek FROM pickup_datetime) AS STRING) AS dayofweek,
            CAST(EXTRACT(hour FROM pickup_datetime) AS STRING) AS hourofday,
            ST_Distance(ST_GeogPoint(pickup_longitude, pickup_latitude), ST_GeogPoint(dropoff_longitude, dropoff_latitude)) AS euclidean,
            passenger_count passengers,
            tolls_amount + fare_amount fare_amount_227
        from
          `qwiklabs-gcp-04-797b0d469b84.taxirides.historical_taxi_rides_raw`
        where
          #a.pickup_datetime >= (select put_min from boundaries) and
          pickup_longitude between (select lon_min from boundaries) and (select lon_max from boundaries) and
          dropoff_longitude between  (select lon_min from boundaries) and (select lon_max from boundaries) and
          pickup_latitude between  (select lat_min from boundaries) and (select lat_max from boundaries) and
          dropoff_latitude between  (select lat_min from boundaries) and (select lat_max from boundaries) and
          trip_distance > 4 and
          fare_amount > 3 and
          passenger_count > 4
        limit 999999
        );

### Create BQML Model

Project > Create Dataset > fare_model_904

    CREATE OR REPLACE MODEL
      taxirides.fare_model_904
    OPTIONS
      (input_label_cols=['fare_amount_227'],
        model_type='linear_reg') AS
    SELECT
      *
    FROM
      taxirides.taxi_training_data_231;

### Evaluate Model

    SELECT
        *
    FROM
        ML.EVALUATE(MODEL `taxirides.fare_model_904`);

### Perform Batch Prediction

    create or replace table
        `qwiklabs-gcp-04-797b0d469b84.taxirides.2015_fare_amount_predictions`
    as
        (
        SELECT
          *
        FROM
          ML.PREDICT(MODEL taxirides.fare_model_904,
            (
            select
                CAST(EXTRACT(week FROM pickup_datetime) AS STRING) AS weekofyear,
                CAST(EXTRACT(dayofweek FROM pickup_datetime) AS STRING) AS dayofweek,
                CAST(EXTRACT(hour FROM pickup_datetime) AS STRING) AS hourofday,
                ST_Distance(ST_GeogPoint(pickuplon, pickuplat), ST_GeogPoint(dropofflon, dropofflat)) AS euclidean,
                passengers#,
                #tolls_amount + fare_amount fare_amount_227
            from
                `qwiklabs-gcp-04-797b0d469b84.taxirides.report_prediction_data`
            ))
        );
