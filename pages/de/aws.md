# S3

## Reporting System

### Read Files

	df_list = [] 

	# Load each object from s3
	for file in request_files:
			s3_day_reqs = s3.get_object(Bucket='gid-requests', 
																	Key=file['Key'])
			# Read the DataFrame into pandas, append it to the list
			day_reqs = pd.read_csv(s3_day_reqs['Body'])
			df_list.append(day_reqs)

	# Concatenate all the DataFrames in the list
	all_reqs = pd.concat(df_list)

	# Preview the DataFrame
	all_reqs.head()
	
### Upload Aggregated Files

	# Write agg_df to a CSV and HTML file with no border
	agg_df.to_csv('./feb_final_report.csv')
	agg_df.to_html('./feb_final_report.html', border=0)

	# Upload the generated CSV to the gid-reports bucket
	s3.upload_file(Filename='./feb_final_report.csv', 
		Key='2019/feb/final_report.html', Bucket='gid-reports',
			ExtraArgs = {'ACL': 'public-read'})

	# Upload the generated HTML to the gid-reports bucket
	s3.upload_file(Filename='./feb_final_report.html', 
		Key='2019/feb/final_report.html', Bucket='gid-reports',
			ExtraArgs = {'ContentType': 'text/html', 
									 'ACL': 'public-read'})
									 
### Generate Index Page

	# List the gid-reports bucket objects starting with 2019/
	objects_list = s3.list_objects(Bucket='gid-reports', Prefix='2019/')

	# Convert the response contents to DataFrame
	objects_df = pd.DataFrame(objects_list['Contents'])

	# Create a column "Link" that contains Public Object URL
	base_url = "http://gid-reports.s3.amazonaws.com/"
	objects_df['Link'] = base_url + objects_df['Key']

	# Preview the resulting DataFrame
	objects_df.head()

### Clickable Links

	# Write objects_df to an HTML file
	objects_df.to_html('report_listing.html',
			# Set clickable links
			render_links=True,
		# Isolate the columns
			columns=['Link', 'LastModified', 'Size'])

	# Overwrite index.html key by uploading the new file
	s3.upload_file(
		Filename='./report_listing.html', Key='index.html', 
		Bucket='gid-reports',
		ExtraArgs = {
			'ContentType': 'text/html', 
			'ACL': 'public-read'
		})

# SNS

## Create Topic
	# Initialize boto3 client for SNS
	sns = boto3.client('sns', 
										 region_name='us-east-1', 
										 aws_access_key_id=AWS_KEY_ID, 
										 aws_secret_access_key=AWS_SECRET)

	# Create the city_alerts topic
	response = sns.create_topic(Name="city_alerts")
	c_alerts_arn = response['TopicArn']
	
## List Topics
	# Get the current list of topics
	topics = sns.list_topics()['Topics']

	for topic in topics:
		# For each topic, if it is not marked critical, delete it
		if "critical" not in topic['TopicArn']:
			sns.delete_topic(TopicArn=topic['TopicArn'])

	# Print the list of remaining critical topics
	print(sns.list_topics()['Topics'])
	
## Subscribe Topic
	# Subscribe Elena's phone number to streets_critical topic
	resp_sms = sns.subscribe(
		TopicArn = str_critical_arn, 
		Protocol='sms', Endpoint="+16196777733")

	# Print the SubscriptionArn
	print(resp_sms['SubscriptionArn'])

	# Subscribe Elena's email to streets_critical topic.
	resp_email = sns.subscribe(
		TopicArn = str_critical_arn, 
		Protocol='email', Endpoint="eblock@sandiegocity.gov")

	# Print the SubscriptionArn
	print(resp_email['SubscriptionArn'])
	
## List Subscriptions
	# For each email in contacts, create subscription to street_critical
	for email in contacts['Email']:
		sns.subscribe(TopicArn = str_critical_arn,
									# Set channel and recipient
									Protocol = 'email',
									Endpoint = email)

	# List subscriptions for streets_critical topic, convert to DataFrame
	response = sns.list_subscriptions_by_topic(
		TopicArn = str_critical_arn)
	subs = pd.DataFrame(response['Subscriptions'])

	# Preview the DataFrame
	subs.head()

## Publish
	if vcounts['water'] > 100:
		# If over 100 water violations, publish to water_critical
		sns.publish(
			TopicArn = dept_arns['water_critical'],
			Message = "{} water issues".format(vcounts['water']),
			Subject = "Help fix water violations NOW!")

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
	
# Recognition

## Initiate Client

	rekog = boto3.client(
	'rekognition'
	,
	region_name=
	'us-east-1'
	,
	aws_access_key_id=AWS_KEY_ID,
	aws_secret_access_key=AWS_SECRET)

## Labels

### Detect Labels
	# Use Rekognition client to detect labels
	image1_response = rekog.detect_labels(
			# Specify the image as an S3Object; Return one label
			Image=image1, MaxLabels=1)

	# Print the labels
	print(image1_response['Labels'])

### Iterate Instances

	# Create an empty counter variable
	cats_count = 0
	# Iterate over the labels in the response
	for label in response['Labels']:
			# Find the cat label, look over the detected instances
			if label['Name'] == 'Cat':
					for instance in label['Instances']:
							# Only count instances with confidence > 85
							if (instance['Confidence'] > 85):
									cats_count += 1
	# Print count of cats
	print(cats_count)
	
## Text

### Detect Text
	response = rekog.detect_text(
		Image={'S3Object':
			{
				'Bucket': 'datacamp-img'
				,
				'Name': 'report.jpg'
			}
		}
	)

### Iterate Words
	# Create empty list of words
	words = []
	# Iterate over the TextDetections in the response dictionary
	for text_detection in response['TextDetections']:
			# If TextDetection type is WORD, append it to words list
			if text_detection['Type'] == 'WORD':
					# Append the detected text
					words.append(text_detection['DetectedText'])
	# Print out the words list
	print(words)

# Translate

## Initate Client

	translate = boto3.client('translate'
	,
	region_name=
	'us-east-1'
	,
	aws_access_key_id=AWS_KEY_ID, aws_secret_access_key=AWS_SECRET)

## Translate Text

	for index, row in dumping_df.iterrows():
			# Get the public_description into a variable
			description = dumping_df.loc[index, 'public_description']
			if description != '':
					# Translate the public description
					resp = translate.translate_text(
							Text=description, 
							SourceLanguageCode='auto', TargetLanguageCode='en')
					# Store original language in original_lang column
					dumping_df.loc[index, 'original_lang'] = resp['SourceLanguageCode']
					# Store the translation in the translated_desc column
					dumping_df.loc[index, 'translated_desc'] = resp['TranslatedText']
	# Preview the resulting DataFrame
	dumping_df = dumping_df[['service_request_id', 'original_lang', 'translated_desc']]
	dumping_df.head()
