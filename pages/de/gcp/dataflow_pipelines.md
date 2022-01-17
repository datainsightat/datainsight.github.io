# Dataflow Pipelines

Start Dataflow Pipeline
* Launch Template
* Authoring Pipeline using Apache Beam SDK
* Writing a SQL Statement
<a/>

## Beam Basics (Beam = Batch + Stream)

![Beam Components](../../img/gcp_dataflow_58.jpg)

## Transforms

* ParDo
* Combine
* GroupByKey
* CoGroupByKey
* Flatten
* Partition
<a/>

## DoFn

![Do Functions](../../img/gcp_dataflow_59.jpg)

### Data Bundles

![Data Bundles](../../img/gcp_dataflow_60.jpg)

### Methods of DoDn

    class MyDoFn(bean.DoFn):
      def setup(self):
        pass
      def start_bundle(self):
        pass
      def process(self,element):
        pass
      def finish_bundle(self):
        pass
      def teardown(self):
        pass
        
### Lifecycle

![Lifecycle](../../img/gcp_dataflow_61.jpg)

