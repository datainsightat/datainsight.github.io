# Dataflow SQL Batch - Java

[Github Source](https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/quests/dataflow/4_SQL_Batch_Analytics/solution/src/main/java/com/mypackage/pipeline/BatchUserTrafficSQLPipeline.java)

## Initialize

    $ gcloud auth list
    $ gcloud config list project

### IDE

http://34.135.142.254:3000/#/home/project/training-data-analyst/quests/dataflow/

    ide $ cd 4_SQL_Batch_Analytics/labs
    ide $ mvn clean dependency:resolve
    ide $ export BASE_DIR=$(pwd)

### Create GCS buckets and BQ dataset

    ide $ cd $BASE_DIR/../..
    ide $ source create_batch_sinks.sh
    ide $ source generate_batch_events.sh
    ide $ cd $BASE_DIR
    
### Enable Datacatalog API

    ide $ gcloud services enable datacatalog.googleapis.com
    
## Add SQL Dependencies

pom.xml

    <dependency>
      <groupId>org.apache.beam</groupId>
      <artifactId>beam-sdks-java-extensions-sql</artifactId>
      <version>${beam.version}</version>
    </dependency>
    <dependency>
      <groupId>org.apache.beam</groupId>
      <artifactId>beam-sdks-java-extensions-sql-zetasql</artifactId>
      <version>${beam.version}</version>
    </dependency>
    
    ide $ mvn clean dependency:resolve

## Aggregate Traffic by User

BatchUserTrafficSQLPipeline.java

    import org.apache.beam.sdk.extensions.sql.impl.BeamSqlPipelineOptions;
    import org.apache.beam.sdk.extensions.sql.SqlTransform;    
    
    public interface Options extends PipelineOptions, BeamSqlPipelineOptions {
        // All existing options here
    }
    
    Options options = PipelineOptionsFactory.fromArgs(args)
                .withValidation()
                .as(Options.class);
        options.setPlannerName("org.apache.beam.sdk.extensions.sql.zetasql.ZetaSQLQueryPlanner");

### Implement SQL Transform aggregations

    PCollection<Row> filteredNames = testApps.apply(
    SqlTransform.query(
        "SELECT appId, description, rowtime "
        + "FROM PCOLLECTION "
        + "WHERE id=1"));
        
    aggregateField("user_id", Count.combineFn(), "pageviews")
                        .aggregateField("num_bytes", Sum.ofIntegers(), "total_bytes")
                        .aggregateField("num_bytes", Max.ofIntegers(), "max_num_bytes")
                        .aggregateField("num_bytes", Min.ofIntegers(), "min_num_bytes"))
                        
## Run Pipeline

    ide $ export PROJECT_ID=$(gcloud config get-value project)
    ide $ export REGION='us-central1'
    ide $ export BUCKET=gs://${PROJECT_ID}
    ide $ export PIPELINE_FOLDER=${BUCKET}
    ide $ export MAIN_CLASS_NAME=com.mypackage.pipeline.BatchUserTrafficSQLPipeline
    ide $ export RUNNER=DataflowRunner
    ide $ export INPUT_PATH=${PIPELINE_FOLDER}/events.json
    ide $ export AGGREGATE_TABLE_NAME=${PROJECT_ID}:logs.user_traffic
    ide $ export RAW_TABLE_NAME=${PROJECT_ID}:logs.raw
    ide $ cd $BASE_DIR
    ide $ mvn compile exec:java \
    -Dexec.mainClass=${MAIN_CLASS_NAME} \
    -Dexec.cleanupDaemonThreads=false \
    -Dexec.args=" \
    --project=${PROJECT_ID} \
    --region=${REGION} \
    --stagingLocation=${PIPELINE_FOLDER}/staging \
    --tempLocation=${PIPELINE_FOLDER}/temp \
    --runner=${RUNNER} \
    --inputPath=${INPUT_PATH} \
    --aggregateTableName=${AGGREGATE_TABLE_NAME} \
    --rawTableName=${RAW_TABLE_NAME}"

![Dataflow](../../../img/gcp_dataflow_137.jpg)

## Aggregate Traffic by Minute

### Add Timestamp

BatchMinuteTrafficSQLPipeline.java

    purchases.apply(AddFields.<PurchasePojo>create()
    .field("timeOfDaySeconds", FieldType.INT32)
    .field("shippingAddress.deliveryNotes", FieldType.STRING)
    .field("transactions.isFlagged", FieldType.BOOLEAN, false));
    
    // The input PCollection.
    PCollection<String> words = ...;
    // Apply a MapElements with an anonymous lambda function to the PCollection words.
    // Save the result as the PCollection wordLengths.
    PCollection<Integer> wordLengths = words.apply(
      MapElements.into(TypeDescriptors.integers())
                 .via((String word) -> word.length()));
  
    // The input PCollection.
    PCollection<String> words = ...;
    // Apply a MapElements with an anonymous lambda function to the PCollection words.
    // Save the result as the PCollection wordLengths.
    PCollection<Integer> wordLengths = words.apply(
      MapElements.via(new SimpleFunction<String, Integer> () {
          @Override
          public Row apply(String word) {
              return word.length();
          }
      }));
      
### Implement SQL Transformations

    SELECT COUNT(*) AS order_count, MAX(num_items) as max_items, tr.window_end AS hour
    FROM
        TUMBLE ( ( SELECT * FROM PCOLLECTION ),
        DESCRIPTOR(timestamp_joda), "INTERVAL 60 MINUTES" ) as tr
    GROUP BY tr.window_end

## Run Pipeline

    ide $ export PROJECT_ID=$(gcloud config get-value project)
    ide $ export REGION='us-central1'
    ide $ export BUCKET=gs://${PROJECT_ID}
    ide $ export PIPELINE_FOLDER=${BUCKET}
    ide $ export MAIN_CLASS_NAME=com.mypackage.pipeline.BatchMinuteTrafficSQLPipeline
    ide $ export RUNNER=DataflowRunner
    ide $ export INPUT_PATH=${PIPELINE_FOLDER}/events.json
    ide $ export TABLE_NAME=${PROJECT_ID}:logs.minute_traffic
    ide $ cd $BASE_DIR
    ide $ mvn compile exec:java \
    -Dexec.mainClass=${MAIN_CLASS_NAME} \
    -Dexec.cleanupDaemonThreads=false \
    -Dexec.args=" \
    --project=${PROJECT_ID} \
    --region=${REGION} \
    --stagingLocation=${PIPELINE_FOLDER}/staging \
    --tempLocation=${PIPELINE_FOLDER}/temp \
    --runner=${RUNNER} \
    --inputPath=${INPUT_PATH} \
    --tableName=${TABLE_NAME}"

![Dataflow](../../../img/gcp_dataflow_138.jpg)

## Check Results

    $ bq head -n 10 $PROJECT_ID:logs.minute_traffic
    
## Dataflow SQL UI

gcp > Dataflow > SQL Workspace

    SELECT
      user_id,
      COUNT(*) AS pageviews,
      SUM(num_bytes) AS total_bytes,
      MAX(num_bytes) AS max_num_bytes,
      MIN(num_bytes) AS min_num_bytes
    FROM
      `qwiklabs-gcp-00-563426a68528`.logs.raw
    GROUP BY
      user_id
      
Create Job

|Option|Value|
|-|-|
|Output|BigQuery|
|Dataset|logs|
|Table|user_traffic_ui|

![Dataflow](../../../img/gcp_dataflow_139.jpg)


