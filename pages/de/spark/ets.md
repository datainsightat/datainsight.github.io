# Spark ETS (Extract Transform Select)
## UDF (User Defined Function)
	from pyspark.sql.functions import udf
	from pyspark.sql.types import BooleanType, StringType, IntegerType, FloatType, ArrayType

	# Returns true if the value is a nonempty vector
	nonempty_udf = udf(lambda x:  
			True if (x and hasattr(x, "toArray") and x.numNonzeros())
			else False, BooleanType())

	# Returns first element of the array as string
	s_udf = udf(lambda x: str(x[0]) if (x and type(x) is list and len(x) > 0)
			else '', StringType())
			
	# Show the rows where doc contains the item '5'
	df_before.where(array_contains('doc', '5')).show()

	# UDF removes items in TRIVIAL_TOKENS from array
	rm_trivial_udf = udf(lambda x:
											 list(set(x) - TRIVIAL_TOKENS) if x
											 else x,
											 ArrayType(StringType()))

	# Remove trivial tokens from 'in' and 'out' columns of df2
	df_after = df_before.withColumn('in', rm_trivial_udf('in'))\
											.withColumn('out', rm_trivial_udf('out'))

	# Show the rows of df_after where doc contains the item '5'
	df_after.where(array_contains('doc','5')).show()
	
## Extract Data for Classification

	# Selects the first element of a vector column
	first_udf = udf(lambda x:
							float(x.indices[0]) 
							if (x and hasattr(x, "toArray") and x.numNonzeros())
							else 0.0,
							FloatType())

	# Apply first_udf to the output column
	df.select(first_udf("output").alias("result")).show(5)

	# Add label by applying the get_first_udf to output column
	df_new = df.withColumn('label', get_first_udf('output'))

	# Show the first five rows 
	df_new.show(5)
	
	# Transform df using model
result = model.transform(df.withColumnRenamed('in', 'words'))\
        .withColumnRenamed('words', 'in')\
        .withColumnRenamed('vec', 'invec')
result.drop('sentence').show(3, False)

	# Add a column based on the out column called outvec
	result = model.transform(result.withColumnRenamed('out', 'words'))\
					.withColumnRenamed('words', 'out')\
					.withColumnRenamed('vec', 'outvec')
	result.select('invec', 'outvec').show(3, False)	
