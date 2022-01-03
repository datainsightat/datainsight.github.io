# Create Pub/Sub Topic

Create dataset and table

    $ bq mk taxirides
    $ bq mk \
    --time_partitioning_field timestamp \
    --schema ride_id:string,point_idx:integer,latitude:float,longitude:float,\
    timestamp:timestamp,meter_reading:float,meter_increment:float,ride_status:string,\
    passenger_count:integer -t taxirides.realtime
    
 Alternatively: gcp > BigQuery > Create dataset  
 Dataset > View actions > create table  
 Dataset > Partition Cluster > timestamp
 
 # Crate Cloud Storage Bucket
 
 gcp > Cloud Storage > Create Bucket
 Bucket > create Folder 'tmp'
 
 # Setup Dataflow Pipeline
 
 gcp > Dataflow > Create from Template
 
 ![Pipeline](../../.,/img/gcp_rt_dashboard_1.png)
 
 # Analyze
 
 gcp > BigQuery
 
    SELECT * FROM taxirides.realtime LIMIT 10
    
 Aggregations
 
    WITH streaming_data AS (
    SELECT
      timestamp,
      TIMESTAMP_TRUNC(timestamp, HOUR, 'UTC') AS hour,
      TIMESTAMP_TRUNC(timestamp, MINUTE, 'UTC') AS minute,
      TIMESTAMP_TRUNC(timestamp, SECOND, 'UTC') AS second,
      ride_id,
      latitude,
      longitude,
      meter_reading,
      ride_status,
      passenger_count
    FROM
      taxirides.realtime
    WHERE ride_status = 'dropoff'
    ORDER BY timestamp DESC
    LIMIT 100000
    )
    # calculate aggregations on stream for reporting:
    SELECT
     ROW_NUMBER() OVER() AS dashboard_sort,
     minute,
     COUNT(DISTINCT ride_id) AS total_rides,
     SUM(meter_reading) AS total_revenue,
     SUM(passenger_count) AS total_passengers
    FROM streaming_data
    GROUP BY minute, timestamp
    
# Create Dashboard

Open [Google Data Studio](https://datastudio.google.com/)

![Dashboard](../../.,/img/gcp_rt_dashboard_2.png)

# Stop Dataflow Job

