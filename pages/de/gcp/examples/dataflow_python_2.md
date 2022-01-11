# Dataflow

## Initialize

    $ gcloud auth list
    $ gcloud config list project

### Check, if Dataflow API is enabled

gcp > Dataflow API > Manage > Disable API  
Enable

### Get Repository Files

    $ git clone https://github.com/GoogleCloudPlatform/training-data-analyst

### Create Cloud Storage Bucket

gcp > Cloud Storage > Create Bucket > qwiklabs-gcp-01-9a5bf01c7342

    $ BUCKET="qwiklabs-gcp-01-9a5bf01c7342"
    $ echo $BUCKET

## DataflowProject

### Setup

    $ cd ~/training-data-analyst/courses/data_analysis/lab2/python
    $ sudo ./install_packages.sh
    $ pip3 -V

### Pipeline Filtering

    $ cd ~/training-data-analyst/courses/data_analysis/lab2/python
    $ nano grep.py
    
    import apache_beam as beam
    import sys

    def my_grep(line, term):
       if line.startswith(term):
          yield line

    if __name__ == '__main__':
       p = beam.Pipeline(argv=sys.argv)
       input = '../javahelp/src/main/java/com/google/cloud/training/dataanalyst/javahelp/*.java'
       output_prefix = '/tmp/output'
       searchTerm = 'import'

       # find all lines that contain the searchTerm
       (p
          | 'GetJava' >> beam.io.ReadFromText(input)
          | 'Grep' >> beam.FlatMap(lambda line: my_grep(line, searchTerm) )
          | 'write' >> beam.io.WriteToText(output_prefix)
       )

       p.run().wait_until_finish()

### Execute Pipeline Locally

    $ cd ~/training-data-analyst/courses/data_analysis/lab2/python
    $ python3 grep.py
    $ ls -al /tmp
    $ cat /tmp/output-*

### Execute Pipeline in the Cloud

    $ gsutil cp ../javahelp/src/main/java/com/google/cloud/training/dataanalyst/javahelp/*.java gs://$BUCKET/javahelp

    $ echo $DEVSHELL_PROJECT_ID
    $ echo $BUCKET

Editor > Open > /training-data-analyst/courses/data_analysis/lab2/python/grepc.py

    #!/usr/bin/env python

    import apache_beam as beam

    def my_grep(line, term):
       if line.startswith(term):
          yield line

    PROJECT='qwiklabs-gcp-01-9a5bf01c7342'
    BUCKET='qwiklabs-gcp-01-9a5bf01c7342'

    def run():
       argv = [
          '--project={0}'.format(PROJECT),
          '--job_name=examplejob2',
          '--save_main_session',
          '--staging_location=gs://{0}/staging/'.format(BUCKET),
          '--temp_location=gs://{0}/staging/'.format(BUCKET),
          '--region=us-central1',
          '--runner=DataflowRunner'
       ]

       p = beam.Pipeline(argv=argv)
       input = 'gs://{0}/javahelp/*.java'.format(BUCKET)
       output_prefix = 'gs://{0}/javahelp/output'.format(BUCKET)
       searchTerm = 'import'

       # find all lines that contain the searchTerm
       (p
          | 'GetJava' >> beam.io.ReadFromText(input)
          | 'Grep' >> beam.FlatMap(lambda line: my_grep(line, searchTerm) )
          | 'write' >> beam.io.WriteToText(output_prefix)
       )

       p.run()

    if __name__ == '__main__':
       run()

Save

    $ python3 grepc.py
    
gcp > Dataflow > job  

![Job Progress](../../../img/gcp_datflow_19.png)

    $ gsutil cp gs://$BUCKET/javahelp/output* .
    $ cat output*
