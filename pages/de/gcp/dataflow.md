# Dataflow

* Scalable
* Low latency
* Batch and Strem

||Dataflow|Dataproc|
|-|-|-|
|Recommended for|New data processing pipelines, unified batch and streaming|Existing Hadoop/Spak applications, ML, large-batch jobs|
|Fully managed|Yes|No|
|Auto scaling|Yes (adaptive)|Yes (reactive)|
|Expertise|Apache Beam|Hadoop, Hive, Pig, Sprak ...|

![Dataflow vs Dataproc](../../img/gcp_dataflow_10.png)

## Apache Beam

![Apache Beam](../../img/gcp_dataflow_11.png)

### Datagraph

![Datagraph](../../img/gcp_dataflow_12.png)

### PCollection

![PCollection](../../img/gcp_dataflow_13.png)

In a PCollection all data is immutable and stored as bytestring.

## How does Dataflow Work?

* Fully Managed
* Optimizes Datagraph
* Autoscaling
* Rebalancing
* Streaming Semntics

![How Dataflow works](../../img/gcp_dataflow_14.png)

## Dataflow Pipelines

### Simple Pipeline

![Simple Pipeline](../../img/gcp_dataflow_15.png)

### Branching Pipeline

![Branching](../../img/gcp_dataflow_16.png)

### Start End

    import apache_beam as beam
    
    if __name == '__main__':
    
      with beam.Pipeline(argv=sys.argv) as p: # Create pipeline parameterized by command line flags
      
        (p
          | beam.io.ReadFromText('gs://...') # Read Input
          | beam.FlatMap(count_words) # Apply transform
          | beam.io.WriteToText('gs://...') # Write output
        )
    
    options = {'project':<project>,
               'runner':'DataflowRunner'. # Where to run
               'region':<region>.
               'retup_file':<setup.py file>}
    
    pipeline_options = beam.pipeline.PipelineOptions(flags=[],**options)
    
    pipeline = beam.Pipeline(options=pipeline_options) # Creates the pipeline

#### Run local

    $ python ./grep.py

#### Run on cloud

    $ python ./grep.py \
             --project=$PROJECT \
             --job_name=myjob \
             --staging_location=gs://$BUCKET/staging/ \
             --temp_location=gs://$BUCKET/tmp/ \
             --runnner)DataflowRunner
 
 ### Read Data
 
    with beam.Pipeline(options=pipeline_options as p:
    
       # Cloud Storage
      lines = p | beam.ioReadFromText("gs://..../input-*.csv.gz")
      
      # Pub/Sub
      lines = p | beam.io.ReadStringsFromPubSub(topic=known_args.input_topic)
      
      # BigQuery
      query = "select x, y, z from `project.dataset.tablename`"
      BQ_source = beam.io.BigQuerySource(query = <query>, use_standard_sql=True)
      BQ_data = pipeline | beam.io.Read(BG_srouce)
      
 ### Write to Sinks
 
    from apache_beam.io.gcp.internal.clients import bigquery
    
    table_spec = bigquery.TableReference(
      projectId='clouddataflow-readonly',
      datasetId='samples',
      tableId='weather_stations')
      
     p | beam.io.WriteToBigQuery(
      table_spec,
      schema=table_schema,
      write_disposition=beam.io.BigQuerryDisposition.WRITE_TRUNCATE,
      create_disposition=beam.io.BigQueryDisposition.CREATE_IT_NEEDED)

### Transform

    'WordLengths' >> beam.Map(word, len(word))

    def my_grep(line_term):
      if term in line:
        yield line
        
    'Grep' >> beam.FlatMap(my_grep(line, searchTerm))

#### ParDo Parallel Processing

![ParDo](../../img/gcp_dataflow_18.png)

    words = ...
    
    # Do Fn
    class ComputeWordLengthFn(beam.DoFn):
      def process(self,element):
        return [len(element)}
    
    # ParDo
    word_lengths = words | beam.ParDo(ComputeWordLengthFn())

##### Multiple Variables

    results = (words | beam.PrDo(ProcessWords(),
      cutoff_length=2, marker='x')
      .with_putputs('above_cutoff_lengths','marked strings',main='below_cutoff_strings'))
      
    below = results.below_cutoff_strings
    above = results.above_cutoff_strings
    marked = results['marked strings']

