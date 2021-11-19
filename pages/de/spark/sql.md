# Spark SQL
## Load Data
	# Load trainsched.txt
	df = spark.read.csv("trainsched.txt", header=True)

	# Create temporary table called table1
	df.createOrReplaceTempView('table1')
	
	# Inspect the columns in the table df
	spark.sql("describe schedule").show()
	
## Window Functions
	# Add col running_total that sums diff_min col in each group
	query = """
	SELECT train_id, station, time, diff_min,
	SUM(diff_min) OVER (PARTITION BY train_id ORDER BY time) AS running_total
	FROM schedule
	"""

	# Run the query and display the result
	spark.sql(query).show()
	
	<script.py> output:
    +--------+-------------+-----+--------+-------------+
    |train_id|      station| time|diff_min|running_total|
    +--------+-------------+-----+--------+-------------+
    |     217|       Gilroy|6:06a|     9.0|          9.0|
    |     217|   San Martin|6:15a|     6.0|         15.0|
    |     217|  Morgan Hill|6:21a|    15.0|         30.0|
    |     217| Blossom Hill|6:36a|     6.0|         36.0|
    |     217|      Capitol|6:42a|     8.0|         44.0|
    |     217|       Tamien|6:50a|     9.0|         53.0|
    |     217|     San Jose|6:59a|    null|         53.0|
    |     324|San Francisco|7:59a|     4.0|          4.0|
    |     324|  22nd Street|8:03a|    13.0|         17.0|
    |     324|     Millbrae|8:16a|     8.0|         25.0|
    |     324|    Hillsdale|8:24a|     7.0|         32.0|
    |     324| Redwood City|8:31a|     6.0|         38.0|
    |     324|    Palo Alto|8:37a|    28.0|         66.0|
    |     324|     San Jose|9:05a|    null|         66.0|
    +--------+-------------+-----+--------+-------------+
		
## .Dot Notation
### Example 1
	# Give the identical result in each command
	spark.sql('SELECT train_id, MIN(time) AS start FROM schedule GROUP BY train_id').show()
	df.groupBy('train_id').agg({'time':'min'}).withColumnRenamed('min(time)', 'start').show()

	# Print the second column of the result
	spark.sql('SELECT train_id, MIN(time), MAX(time) FROM schedule GROUP BY train_id').show()
	result = df.groupBy('train_id').agg({'time':'min', 'time':'max'})
	result.show()
	print(result.columns[1])
	
### Example 2
	# dot notation:
	from pyspark.sql.functions import min, max, col
	expr = [min(col("time")).alias('start'), max(col("time")).alias('end')]
	dot_df = df.groupBy("train_id").agg(*expr)
	dot_df.show()
	
	# Write a SQL query giving a result identical to dot_df
	query = "SELECT train_id, min(time) as start, max(time) as end FROM schedule group by train_id"
	sql_df = spark.sql(query)
	sql_df.show()

### Example 3
	df = spark.sql("""
	SELECT *, 
	LEAD(time,1) OVER(PARTITION BY train_id ORDER BY time) AS time_next 
	FROM schedule
	""")
	
	# Obtain the identical result using dot notation 
	dot_df = df.withColumn('time_next', lead('time', 1)
					.over(Window.partitionBy('train_id')
					.orderBy('time')))
					
### Example 4
	window = Window.partitionBy('train_id').orderBy('time')
	dot_df = df.withColumn('diff_min', 
	(unix_timestamp(lead('time', 1).over(window),'H:m') 
	- unix_timestamp('time', 'H:m'))/60)

	# Create a SQL query to obtain an identical result to dot_df 
	query = """
	SELECT *, 
	(UNIX_TIMESTAMP(LEAD(time, 1) OVER (PARTITION BY train_id ORDER BY time),'H:m') 
	 - UNIX_TIMESTAMP(time, 'H:m'))/60 AS diff_min 
	FROM schedule 
	"""
	sql_df = spark.sql(query)
	sql_df.show()
	
	+--------+-------------+-----+--------+
	|train_id|      station| time|diff_min|
	+--------+-------------+-----+--------+
	|     217|       Gilroy|6:06a|     9.0|
	|     217|   San Martin|6:15a|     6.0|
	|     217|  Morgan Hill|6:21a|    15.0|
	|     217| Blossom Hill|6:36a|     6.0|
	|     217|      Capitol|6:42a|     8.0|
	|     217|       Tamien|6:50a|     9.0|
	|     217|     San Jose|6:59a|    null|
	|     324|San Francisco|7:59a|     4.0|
	|     324|  22nd Street|8:03a|    13.0|
	|     324|     Millbrae|8:16a|     8.0|
	|     324|    Hillsdale|8:24a|     7.0|
	|     324| Redwood City|8:31a|     6.0|
	|     324|    Palo Alto|8:37a|    28.0|
	|     324|     San Jose|9:05a|    null|
	+--------+-------------+-----+--------+
