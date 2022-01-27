# Engineering Data in Google Cloud

## BigQueryML

### Analyze Data

gcp > BigQuery  

#### Source

    select * from `qwiklabs-gcp-03-68ce65a17fdf.taxirides.historical_taxi_rides_raw` limit 10;

#### Target

    select * from `qwiklabs-gcp-03-68ce65a17fdf.taxirides.report_prediction_data` limit 10;

### Filter Table

    create or replace table
        `qwiklabs-gcp-04-0e71a1f42a26.taxirides.taxi_training_data_225`
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
                `qwiklabs-gcp-04-0e71a1f42a26.taxirides.report_prediction_data`
          )

        select
            CAST(EXTRACT(week FROM pickup_datetime) AS STRING) AS weekofyear,
            CAST(EXTRACT(dayofweek FROM pickup_datetime) AS STRING) AS dayofweek,
            CAST(EXTRACT(hour FROM pickup_datetime) AS STRING) AS hourofday,
            ST_Distance(ST_GeogPoint(pickup_longitude, pickup_latitude), ST_GeogPoint(dropoff_longitude, dropoff_latitude)) AS euclidean,
            passenger_count passengers,
            tolls_amount + fare_amount fare_amount_580
        from
          `qwiklabs-gcp-04-0e71a1f42a26.taxirides.historical_taxi_rides_raw`
        where
          #a.pickup_datetime >= (select put_min from boundaries) and
          pickup_longitude between (select lon_min from boundaries) and (select lon_max from boundaries) and
          dropoff_longitude between  (select lon_min from boundaries) and (select lon_max from boundaries) and
          pickup_latitude between  (select lat_min from boundaries) and (select lat_max from boundaries) and
          dropoff_latitude between  (select lat_min from boundaries) and (select lat_max from boundaries) and
          trip_distance > 4 and
          fare_amount > 2 and
          passenger_count > 4
        limit 999999
        );

### Create BQML Model

Project > Create Dataset > fare_model_594

    CREATE OR REPLACE MODEL
      fare_model_594.model
    OPTIONS
      (input_label_cols=['fare_amount_580'],
        model_type='linear_reg') AS
    SELECT
      *
    FROM
      taxirides.taxi_training_data_225;

### Evaluate Model

    SELECT
        *
    FROM
        ML.EVALUATE(MODEL `fare_model_594.model`);

### Perform Prediction

