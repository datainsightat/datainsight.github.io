# Comprehent

## Initiate Client

    comprehend = boto3.client('comprehend'
    ,
    region_name=
    'us-east-1'
    ,
    aws_access_key_id=AWS_KEY_ID,
    aws_secret_access_key=AWS_SECRET)

## Detect Language

	# For each dataframe row
	for index, row in dumping_df.iterrows():
			# Get the public description field
			description =dumping_df.loc[index, 'public_description']
			if description != '':
					# Detect language in the field content
					resp = comprehend.detect_dominant_language(Text=description)
					# Assign the top choice language to the lang column.
					dumping_df.loc[index, 'lang'] = resp['Languages'][0]['LanguageCode']

	# Count the total number of spanish posts
	spanish_post_ct = len(dumping_df[dumping_df.lang == 'es'])
	# Print the result
	print("{} posts in Spanish".format(spanish_post_ct))
	
## Detect Sentiment
	for index, row in dumping_df.iterrows():
			# Get the translated_desc into a variable
			description = dumping_df.loc[index, 'public_description']
			if description != '':
					# Get the detect_sentiment response
					response = comprehend.detect_sentiment(
						Text=description, 
						LanguageCode='en')
					# Get the sentiment key value into sentiment column
					dumping_df.loc[index, 'sentiment'] = response['Sentiment']
	# Preview the dataframe
	dumping_df.head()
