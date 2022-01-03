# Introduction

![Stream 1](../../img/gcp_stream1.png)

* Streaming data from farious processes
* Distributing notifications
* Scale to handle volume
* Reliable

# Pub/Sub

Streaming data architecture

![Stream 2](../../img/gcp_stream2.png)

Decoupling sources and workers

![Stream 3](../../img/gcp_stream3.png)

|Pipeline Design|Implementation|
|-|-|
|Is the code compatible with streaming and batch data|How much maintenance|
|Does the SDK support transformations|Infrastructure|
|Are there existing solutions|Scaling|
||Vendor Lock|

# Pipeline

## Apache Beam

* Unified: Batch and Streaming
* Portable: Multible Environments
* Extensible: Write and share Objects

![Stream 4](../../img/gcp_stream4.png)

## Cloud Dataflow

* Serverless
* Build ond Apache Beam
* Autoscale

![Stream 5](../../img/gcp_stream5.png)  
![Stream 6](../../img/gcp_stream6.png)

# Data Studio

Visualization

![Stream 7](../../img/gcp_stream7.png)

