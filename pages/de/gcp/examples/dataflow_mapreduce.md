# MapReduce in Dataflow

## Initialize

    $ gcloud auth list
    $ gcloud config list project

## Clone Repo

    $ git clone https://github.com/GoogleCloudPlatform/training-data-analyst
    $ cd training-data-analyst/courses/data_analysis/lab2/python

## View Code

gcp > Editor > open > /training-data-analyst/courses/data_analysis/lab2/python/is_popular.py

    #!/usr/bin/env python3

    import apache_beam as beam
    import argparse

    def startsWith(line, term):
       if line.startswith(term):
          yield line

    def splitPackageName(packageName):
       """e.g. given com.example.appname.library.widgetname
               returns com
                 com.example
                       com.example.appname
          etc.
       """
       result = []
       end = packageName.find('.')
       while end > 0:
          result.append(packageName[0:end])
          end = packageName.find('.', end+1)
       result.append(packageName)
       return result

    def getPackages(line, keyword):
       start = line.find(keyword) + len(keyword)
       end = line.find(';', start)
       if start < end:
          packageName = line[start:end].strip()
          return splitPackageName(packageName)
       return []

    def packageUse(line, keyword):
       packages = getPackages(line, keyword)
       for p in packages:
          yield (p, 1)

    if __name__ == '__main__':
       parser = argparse.ArgumentParser(description='Find the most used Java packages')
       parser.add_argument('--output_prefix', default='/tmp/output', help='Output prefix')
       parser.add_argument('--input', default='../javahelp/src/main/java/com/google/cloud/training/dataanalyst/javahelp/', help='Input directory')

       options, pipeline_args = parser.parse_known_args()
       p = beam.Pipeline(argv=pipeline_args)

       input = '{0}*.java'.format(options.input)
       output_prefix = options.output_prefix
       keyword = 'import'

       # find most used packages
       (p
          | 'GetJava' >> beam.io.ReadFromText(input)
          | 'GetImports' >> beam.FlatMap(lambda line: startsWith(line, keyword))
          | 'PackageUse' >> beam.FlatMap(lambda line: packageUse(line, keyword))
          | 'TotalUse' >> beam.CombinePerKey(sum)
          | 'Top_5' >> beam.transforms.combiners.Top.Of(5, key=lambda kv: kv[1])
          | 'write' >> beam.io.WriteToText(output_prefix)
       )

       p.run().wait_until_finish()

## Execute Pipeline

    $ sudo ./install_packages.sh
    $ pip3 -V
    $ python3 ./is_popular.py
    $ cat /tmp/output-*
    
## Use Command-Line Parameters

    $ python3 ./is_popular.py --output_prefix=/tmp/myoutput
    $ ls -lrt /tmp/myoutput*
