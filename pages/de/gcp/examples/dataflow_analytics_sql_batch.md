# Dataflow Analytics Using SQL for Batch Processing - Java

## Initialize

    $ gcloud auth list
    $ gcloud config list project
    
## IDE

http://35.192.71.50:3000/#/home/project/training-data-analyst/quests/dataflow/

## Write ETL Pipeline

### Aggregate Site Traffic

#### Generate Synthetic Data

    $ cd 4_SQL_Batch_Analytics/labs
    $ mvn clean dependency:resolve
    $ export BASE_DIR=$(pwd)

#### Setup Data Environment
  
    $ cd $BASE_DIR/../..
    $ source create_batch_sinks.sh
    $ source generate_batch_events.sh
    $ cd $BASE_DIR

#### Enable Dataflow API

    $ gcloud services enable datacatalog.googleapis.com

### Add SQL Dependencies

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
    
    $ mvn clean dependency:resolve
    
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
    
### Implement SQLTransform aggregations

    PCollection<Row> filteredNames = testApps.apply(
    SqlTransform.query(
        "SELECT appId, description, rowtime "
        + "FROM PCOLLECTION "
        + "WHERE id=1"));
    
    aggregateField("user_id", Count.combineFn(), "pageviews")
                        .aggregateField("num_bytes", Sum.ofIntegers(), "total_bytes")
                        .aggregateField("num_bytes", Max.ofIntegers(), "max_num_bytes")
                        .aggregateField("num_bytes", Min.ofIntegers(), "min_num_bytes"))
                        
    COUNT(*)
    MAX(field_to_find_max_of)
    SUM(field_to_sum)
    MIN(field_to_find_min_of)
    
    .apply("AggregateSQLQuery", SqlTransform.query("SELECT user_id," +
      "COUNT(*) AS pageviews, SUM(num_bytes) as total_bytes, MAX(num_bytes) AS max_num_bytes, MIN" +
      "(num_bytes) as min_num_bytes FROM PCOLLECTION GROUP BY user_id"))   

### Implement Branch to Store Data

    .apply("WriteAggregateToBQ",
        BigQueryIO.<Row>write().to(options.getAggregateTableName()).useBeamSchema()
                .withWriteDisposition(BigQueryIO.Write.WriteDisposition.WRITE_TRUNCATE)
                .withCreateDisposition(BigQueryIO.Write.CreateDisposition.CREATE_IF_NEEDED));
                
[Github Source File}(https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/quests/dataflow/4_SQL_Batch_Analytics/solution/src/main/java/com/mypackage/pipeline/BatchUserTrafficSQLPipeline.java)
                
## Run Pipeline

    $ export PROJECT_ID=$(gcloud config get-value project)
    $ export REGION='us-central1'
    $ export BUCKET=gs://${PROJECT_ID}
    $ export PIPELINE_FOLDER=${BUCKET}
    $ export MAIN_CLASS_NAME=com.mypackage.pipeline.BatchUserTrafficSQLPipeline
    $ export RUNNER=DataflowRunner
    $ export INPUT_PATH=${PIPELINE_FOLDER}/events.json
    $ export AGGREGATE_TABLE_NAME=${PROJECT_ID}:logs.user_traffic
    $ export RAW_TABLE_NAME=${PROJECT_ID}:logs.raw
    $ cd $BASE_DIR
    $ mvn compile exec:java \
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
