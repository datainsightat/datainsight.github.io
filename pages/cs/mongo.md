# MongoDB
JSON Objects = Python Dictionaries

JSON <> Python <> MongoDB

	# Connect to the "nobel" database
	db = client.nobel

	# Retrieve sample prize and laureate documents
	prize = db.prizes.find_one()
	laureate = db.laureates.find_one()

	# Print the sample prize and laureate documents
	print(prize)
	print(laureate)
	print(type(laureate))

	# Get the fields present in each type of document
	prize_fields = list(prize.keys())
	laureate_fields = list(laureate.keys())

	print(prize_fields)
	print(laureate_fields)

## Finding Documents

	db.laureates.count_documents({"born": {"$lt": "1900"}})

	# Create a filter for Germany-born laureates who died in the USA and with the first name "Albert"
	criteria = {'diedCountry': 'USA', 
							'bornCountry': 'Germany', 
							'firstname': 'Albert'}

	# Save the count
	count = db.laureates.count_documents(criteria)
	print(count)
	
## Dot Notation
	
### Operators

$lt = less than
$gte = greater than or equal
$exists
$ne = "Not Exists"
$in
$nin = "Not In"
$elemMatch = Multiple Conditions

### count_documents() method
	
	# Filter for laureates born in Austria with non-Austria prize affiliation
	criteria = {"bornCountry": "Austria", 
							"prizes.affiliations.country": {"$ne": "Austria"}}

	# Count the number of such laureates
	count = db.laureates.count_documents(criteria)
	print(count)
	
	# Filter for documents without a "born" field
	criteria = {"born": {"$exists": False}}

	# Save count
	count = db.laureates.count_documents(criteria)
	print(count)
	
### find_one() method
	
	# Filter for laureates with at least three prizes
	criteria = {"prizes.2": {"$exists": True}}

	# Find one laureate with at least three prizes
	doc = db.laureates.find_one(criteria)

	# Print the document
	print(doc)

### distinct() method
	
	# Countries recorded as countries of death but not as countries of birth
	countries = set(db.laureates.distinct("diedCountry")) - set(db.laureates.distinct("bornCountry"))
	print(countries)
	
	# The number of distinct countries of laureate affiliation for prizes
	count = len(db.laureates.distinct("prizes.affiliations.country"))
	print(count)
	
	# In which countries have USA-born laureates had affiliations for their prizes?
	db.laureates.distinct("prizes.affiliations.country",{"bornCountry":"USA"})

	# Save a filter for prize documents with three or more laureates
	criteria = {"laureates.2": {"$exists": True}}

	# Save the set of distinct prize categories in documents satisfying the criteria
	triple_play_categories = set(db.prizes.distinct("category", criteria))
	assert set(db.prizes.distinct("category")) - triple_play_categories == {"literature"}
	
### Complex Queries

	# Save a filter for laureates with unshared prizes
	unshared = {
			"prizes": {"$elemMatch": {
					"category": {"$nin": ["physics", "chemistry", "medicine"]},
					"share": "1",
					"year": {"$gte": "1945"},
			}}}

	# Save a filter for laureates with shared prizes
	shared = {
			"prizes": {"$elemMatch": {
					"category": {"$nin": ["physics", "chemistry", "medicine"]},
					"share": {"$ne": "1"},
					"year": {"$gte": "1945"},
			}}}

	ratio = db.laureates.count_documents(unshared) / db.laureates.count_documents(shared)
	print(ratio)
	
## Regular Expressions

## Projection
