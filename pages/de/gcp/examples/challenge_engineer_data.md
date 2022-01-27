# Engineering Data in Google Cloud

## BigQueryML

### Analyze Data

gcp > BigQuery  

#### Source

    select * from `qwiklabs-gcp-03-68ce65a17fdf.taxirides.historical_taxi_rides_raw` limit 10;

#### Target

    select * from `qwiklabs-gcp-03-68ce65a17fdf.taxirides.report_prediction_data` limit 10;
    
##### Get Boundaries

    select
        min(pickup_datetime) put_min,
        max(pickup_datetime) put_max,
        least(min(pickuplon),min(dropofflon)) lon_min,
        greatest(max(pickuplon),max(dropofflon)) lon_max,
        least(min(pickuplat),min(dropofflat)) lat_min,
        greatest(max(pickuplat),max(dropofflat)) lat_max,
        max(passengers) passg_max
    from 
        `qwiklabs-gcp-03-68ce65a17fdf.taxirides.report_prediction_data`;

### Filter Table

    with
      boundaries as (
        select
            min(pickup_datetime) put_min,
            max(pickup_datetime) put_max,
            least(min(pickuplon),min(dropofflon)) lon_min,
            greatest(max(pickuplon),max(dropofflon)) lon_max,
            least(min(pickuplat),min(dropofflat)) lat_min,
            greatest(max(pickuplat),max(dropofflat)) lat_max,
            max(passengers) passg_max
        from 
            `qwiklabs-gcp-03-68ce65a17fdf.taxirides.report_prediction_data`
      )

    select
      *
    from
      `qwiklabs-gcp-03-68ce65a17fdf.taxirides.historical_taxi_rides_raw` a
    where
      a.pickup_datetime >= boundaries.put_min and
      a.pickup_longitude between lon_min and lon_max and
      a.dropoff_longitude between lon_min and lon_max and
      a.pickup_latitude between lon_min and lon_max and
      a.dropoff_latitude between lon_min and lon_max and
      a.trip_distance > 4 and
      a.fare_amount > 2 and
      a.passenger_count > 4 and
    limit 999999;

### Duplicate Table

    create or replace table
      `qwiklabs-gcp-03-68ce65a17fdf.taxirides.taxi_training_data_209` as
    select
      *
    from `qwiklabs-gcp-03-68ce65a17fdf.taxirides.historical_taxi_rides_raw`;

### Clean Training Data

### Create BQML Model

### Perform Prediction

