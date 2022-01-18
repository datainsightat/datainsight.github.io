# Dataflow Streaming Data

## Batch vs Streaming

Out order Stream.

![Data Stream](../../img/gcp_dataflow_68.jpg)

## Windows

* Windowing divides data into time-based finite chunks.
* Required when doing aggregations over unbound data using Beam primitives (GroupByKey, Combiners).
<a/>

### Two Dimensions of Time

* Processing Time
* Event Time
<a/>

![Time Dimensions](../../img/gcp_dataflow_69.jpg)

### Types of Windows

![Types of Windows](../../img/gcp_dataflow_70.jpg)

## Watermarks

### Latency Problem. When to close the Window?

![Latency](../../img/gcp_dataflow_71.jpg)  

![Watermark](../../img/gcp_dataflow_72.jpg)  

### Time Lag

Data is only late when it exceeds the watermark.  

![Time Lag](../../img/gcp_dataflow_73.jpg)  

![Watermark](../../img/gcp_dataflow_74.jpg)  

### Observe Watermark

* Data Freshness: The amount of time between real time and the output watermark.
* System Latency: System latency is the current maximum duration that an item of data has been processing.

![Data Freshness](../../img/gcp_dataflow_75.jpg)  

![Adjust Data Freshness](../../img/gcp_dataflow_76.jpg)  

## Triggers

Decide when to close window, even if late data has not arrived.

* Event Time (After Watermark)
* Processing Time (After Processing Time)
* Composite
* Data-driven (After Count)
<a/>

### Custom Triggers

![After Watermark](../../img/gcp_dataflow_77.jpg)

### Accumulate Mode

* Accumulate: Calculation is repeated including late messages
* Discard: Calculate only new messages
<a/>

#### Accumulate

![Accumulate](../../img/gcp_dataflow_78.jpg)

    pcollection | Windowinto(
      SlidingWindows(60,5),
      trigger=AfterWatermark(
        early=AfterProcessingTime(delay=30),
        late=AfterCount(1))
      accumulation_mode=AccumulationMode.ACCUMULATING)

#### Discard

![Discard](../../img/gcp_dataflow_79.jpg)

    pcollection | WindowInto(
      FixedWindow(60),
      trigger=Repeatedly(
        AfterAny(
          AfterCound(100),
          AfterProcessingTime(1*60))),
      accumulation_mode=AccumulationMode.DISCARDING,
      allowed_lateness=Duration(seconds=2*24*60*60))
