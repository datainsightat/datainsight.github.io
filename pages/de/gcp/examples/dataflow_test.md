# Dataflow Testing - Java

IDE: http://34.121.192.45:3000/#/home/project/training-data-analyst/quests/dataflow/

## Unit Testing

    TestPipeline p = TestPipeline.create();
    
    List<String> input = Arrays.asList(testInput);
    // Some code to create a TestPipeline p
    outputPColl = p.apply(Create.of(input).apply(...);
    
    PAssert.that(outputPColl).containsInAnyOrder(expectedOutput);

## Test Batch Pipeline

WeatherStatisticsPipelineTest.java

### DoFn

    @RunWith(JUnit4.class)
    public class WeatherStatisticsPipelineTest {
      @Rule 
      public final transient TestPipeline p = TestPipeline.create();
      
[Gitlab Source Code](https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/quests/dataflow/8a_Batch_Testing_Pipeline/solution/src/test/java/com/mypackage/pipeline/WeatherStatisticsPipelineTest.java)
      
### Run Test

    $ cd 8a_Batch_Testing_Pipeline/lab
    $ mvn clean dependency:resolve
    $ export BASE_DIR=$(pwd)
    $ mvn test

## Test Stream Pipeline

TaxiStreamingPipelineTest.java

### Run Test

    $ cd $BASE_DIR/../../8b_Stream_Testing_Pipeline/lab
    $ mvn clean dependency:resolve
    $ export BASE_DIR=$(pwd)
    $ mvn test
    
# Dataflow Testing - Python

## Initlialize

    $ gcloud auth list
    $ gcloud config list project
    
## Testpipeline

    with TestPipeline() as p:
      INPUTS = [fake_input_1, fake_input_2]
      test_output = p | beam.Create(INPUTS) | # Transforms to be tested
      
## Prepare Environment

    $ git clone https://github.com/GoogleCloudPlatform/training-data-analyst/
    $ cd ~/training-data-analyst/quests/dataflow_python/
    
    $ cd 8a_Batch_Testing_Pipeline/lab
    $ export BASE_DIR=$(pwd)
    
### Setup Virtual Environment

    $ sudo apt-get install -y python3-venv
    $ python3 -m venv df-env
    $ source df-env/bin/activate

### Install Packages

    $ python3 -m pip install -q --upgrade pip setuptools wheel
    $ python3 -m pip install apache-beam[gcp]

### Enable Dataflow API

    $ gcloud services enable dataflow.googleapis.com

### Grant dataflow.worker role

    $ PROJECT_ID=$(gcloud config get-value project)
    $ export PROJECT_NUMBER=$(gcloud projects list --filter="$PROJECT_ID" --format="value(PROJECT_NUMBER)")
    $ export serviceAccount=""$PROJECT_NUMBER"-compute@developer.gserviceaccount.com"
    $ gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:${serviceAccount}" --role="roles/dataflow.worker"

### Create Cloudstorage Bucket

    $ export PROJECT_ID=$(gcloud config get-value project)
    $ gsutil mb -l US gs://$PROJECT_ID

## Explore Code

weather_statistics_pipeline.py 
weather_statistics_pipeline_test.py

[Gitlab Source Code}(https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/quests/dataflow_python/8a_Batch_Testing_Pipeline/solution/weather_statistics_pipeline_test.py)

## Write Batch Test Function

### Main Function

    def main(out = sys.stderr, verbosity = 2):
        loader = unittest.TestLoader()

        suite = loader.loadTestsFromModule(sys.modules[__name__])
        unittest.TextTestRunner(out, verbosity = verbosity).run(suite)
        # Testing code omitted
        
    if __name__ == '__main__':
        with open('testing.out', 'w') as f:
            main(f)

### Test Function

    class ConvertToWeatherRecordTest(unittest.TestCase):
      def test_convert_to_csv(self):
          with TestPipeline() as p:
          ...
          
### Run Test

    $ python3 weather_statistics_pipeline_test.py
    

### Copy test result to Storage Bucket

    $ gsutil cp testing.out gs://$PROJECT_ID/8b_Stream_Testing_Pipeline/
    
## Write Streaming Data Test Function

8b_Stream_Testing_Pipeline/lab/taxi_streaming_pipeline_test.py

[Gitlab Source Code](https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/quests/dataflow_python/8b_Stream_Testing_Pipeline/solution/taxi_streaming_pipeline_test.py)

### Run Test

    $ rm testing.out
    $ python3 taxi_streaming_pipeline_test.py
    $ cat testing.out

### Copy test result to Storage Bucket

    $ gsutil cp testing.out gs://$PROJECT_ID/8b_Stream_Testing_Pipeline/
