# Spark NLP Endword Prediction
	# Import the lit function
	from pyspark.sql.functions import lit

	# Select the rows where endword is 'him' and label 1
	df_pos = df.where("endword = 'him'")\
						 .withColumn('label', lit(1))

	# Select the rows where endword is not 'him' and label 0
	df_neg = df.where("endword <> 'him'")\
						 .withColumn('label', lit(0))

	# Union pos and neg in equal number
	df_examples = df_pos.union(df_neg.limit(df_pos.count()))
	print("Number of examples: ", df_examples.count())
	df_examples.where("endword <> 'him'").sample(False, .1, 42).show(5)
	
	# Split the examples into train and test, use 80/20 split
	df_trainset, df_testset = df_examples.randomSplit((0.80,0.20), 42)

	# Print the number of training examples
	print("Number training: ", df_trainset.count())

	# Print the number of test examples
	print("Number test: ", df_testset.count())
	
## Train Model
	# Import the logistic regression classifier
	from pyspark.ml.classification import LogisticRegression

	# Instantiate logistic setting elasticnet to 0.0
	logistic = LogisticRegression(maxIter=100, regParam=0.4, elasticNetParam=0.0)

	# Train the logistic classifer on the trainset
	df_fitted = logistic.fit(df_trainset)

	# Print the number of training iterations
	print("Training iterations: ", df_fitted.summary.totalIterations)
	
## Score Model
	# Score the model on test data
	testSummary = df_fitted.evaluate(df_testset)

	# Print the AUC metric
	print("\ntest AUC: %.3f" % testSummary.areaUnderROC)
	
## Predict Data
# Apply the model to the test data
predictions = df_fitted.transform(df_testset).select(fields)

# Print incorrect if prediction does not match label
	for x in predictions.take(8):
			print()
			if x.label != int(x.prediction):
					print("INCORRECT ==> ")
			for y in fields:
					print(y,":", x[y])
          
# Spark NLP Sherlock Holmes
## Load Data
	# Load the dataframe
	df = spark.read.load('sherlock_sentences.parquet')

	# Filter and show the first 5 rows
	df.where('id > 70').show(5, truncate=False)

## Transform Text
	# Split the clause column into a column called words 
	split_df = clauses_df.select(split('clause', ' ').alias('words'))
	split_df.show(5, truncate=False)

	# Explode the words column into a column called word 
	exploded_df = split_df.select(explode('words').alias('word'))
	exploded_df.show(10)

	# Count the resulting number of rows in exploded_df
	print("\nNumber of rows: ", exploded_df.count())

## Window Function
	# Word for each row, previous two and subsequent two words
	query = """
	SELECT
	part,
	LAG(word, 2) OVER(PARTITION BY part ORDER BY id) AS w1,
	LAG(word, 1) OVER(PARTITION BY part ORDER BY id) AS w2,
	word AS w3,
	LEAD(word, 1) OVER(PARTITION BY part ORDER BY id) AS w4,
	LEAD(word, 2) OVER(PARTITION BY part ORDER BY id) AS w5
	FROM text
	"""
	spark.sql(query).where("part = 12").show(10)
	
## Partition Text
	# Repartition text_df into 12 partitions on 'chapter' column
	repart_df = text_df.repartition(12, 'chapter')

	# Prove that repart_df has 12 partitions
	repart_df.rdd.getNumPartitions()
	
## Create Word Tuples
### Find the top 10 sequences of five words
	query = """
	SELECT w1, w2, w3, w4, w5, COUNT(*) AS count FROM (
		 SELECT word AS w1,
		 LEAD(word,1) OVER(PARTITION BY part ORDER BY id ) AS w2,
		 LEAD(word,2) OVER(PARTITION BY part ORDER BY id ) AS w3,
		 LEAD(word,3) OVER(PARTITION BY part ORDER BY id ) AS w4,
		 LEAD(word,4) OVER(PARTITION BY part ORDER BY id ) AS w5
		 FROM text
	)
	GROUP BY w1, w2, w3, w4, w5
	ORDER BY count DESC
	LIMIT 10
	""" 
	df = spark.sql(query)
	df.show()

	<script.py> output:
			+-----+---------+------+-------+------+-----+
			|   w1|       w2|    w3|     w4|    w5|count|
			+-----+---------+------+-------+------+-----+
			|   in|      the|  case|     of|   the|    4|
			|    i|     have|    no|  doubt|  that|    3|
			| what|       do|   you|   make|    of|    3|
			|  the|   church|    of|     st|monica|    3|
			|  the|      man|   who|entered|   was|    3|
			|dying|reference|    to|      a|   rat|    3|
			|    i|       am|afraid|   that|     i|    3|
			|    i|    think|  that|     it|    is|    3|
			|   in|      his| chair|   with|   his|    3|
			|    i|     rang|   the|   bell|   and|    3|
			+-----+---------+------+-------+------+-----+
		
### Subqueries
#   Most frequent 3-tuple per chapter
	query = """
	SELECT chapter, w1, w2, w3, count FROM
	(
		SELECT
		chapter,
		ROW_NUMBER() OVER (PARTITION BY chapter ORDER BY count DESC) AS row,
		w1, w2, w3, count
		FROM ( %s )
	)
	WHERE row = 1
	ORDER BY chapter ASC
	""" % subquery

	spark.sql(query).show()

# Spark NLP Shakespeare
Load unstructered data. Transform text to words, filter keywords and count word occurencies.

## Create Base RDD
	# Create a baseRDD from the file path
	baseRDD = sc.textFile(file_path)

	# Split the lines of baseRDD into words
	splitRDD = baseRDD.flatMap(lambda x: x.split())

	# Count the total number of words
	print("Total number of words in splitRDD:", splitRDD.count())
	
Total number of words in splitRDD: 904061

## Transform
	# Convert the words in lower case and remove stop words from stop_words
	splitRDD_no_stop = splitRDD.filter(lambda x: x.lower() not in stop_words)

	# Create a tuple of the word and 1 
	splitRDD_no_stop_words = splitRDD_no_stop.map(lambda w: (w, 1))

	# Count of the number of occurences of each word
	resultRDD = splitRDD_no_stop_words.reduceByKey(lambda x, y: x + y)

## Analyse
	# Display the first 10 words and their frequencies
	for word in resultRDD.take(10):
		print(word)

	# Swap the keys and values 
	resultRDD_swap = resultRDD.map(lambda x: (x[1], x[0]))

	# Sort the keys in descending order
	resultRDD_swap_sort = resultRDD_swap.sortByKey(ascending=False)

	# Show the top 10 most frequent words and their frequencies
	for word in resultRDD_swap_sort.take(10):
		print("{} has {} counts". format(word[1], word[0]))
