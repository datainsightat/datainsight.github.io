# Apache Beam

## Introduction

Unified programming model for efficient and portable Big data processing pipelines. Beam is able to process batch and  streaming data (Batch + Stream = Beam). A Beam pipeline can be created in any language like Java, Python, Go etc and be able to run on any of the execution frameworks like Spark, Flink, Apex, Cloud DataFlow.  

### Evolution BigData Framworks

![Beam](../img/beam_1.jpg)

### Architecture

![Beam](../img/beam_2.jpg)

### Flow of Beam Programming Model

Input > Transform > PCollection > Transform > PCollection > Transform > Output

#### Example

Input > Read > P1 > Filter > P2 > GroupBy > P3 > Sum > Output

    import apache_beam as beam
    
    p1 = beam.Pipeline()
    
    attendance_count = (
    
      p1
        | beam.io.REadFromText('dept_data.txt'=
        | beam.Map(lamda record: record.split(','))
        | beam.Filter(lambda record: record[3] == 'accounts')
        | beam.Map(lambda record: (record[1],1))
        | beam.CombinePerKey(sum)
        | beam.io.writeToText('data/output_new_final')
      )

    p1.run()
    
### Basic Terminology

* Pipeline: Encapsulates entire data processing task, from start to finish
* PCollection: Equivalent to RDD in Spark. Represents a distributed data set
  * Immutability: PCollections are immutable in nature
  * Element Type: The elements in a PCollection may be of any type, but all must be of the same type
  * Operation Type: PCollections does not support graned operations.
  * TimeStamp: Each Element in a PCollection has an associated timestamp with it.
* PTransform: Represents a data processing operations: ParDo, Filter, Flatten, Combine ...
<a/>

### Installation

Google Colab: https://colab.research.google.com/?utm_source=scs-index
    
