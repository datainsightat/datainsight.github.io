# Recommendation

## Load Movielens Data

    $ bq --location=EU mk --dataset movies
    
    $  bq load --source_format=CSV \
    --location=EU \
    --autodetect movies.movielens_ratings \
    gs://dataeng-movielens/ratings.csv
    
    $  bq load --source_format=CSV \
    --location=EU   \
    --autodetect movies.movielens_movies_raw \
    gs://dataeng-movielens/movies.csv

## Explore Data

gcp > BigQuery

    SELECT
      COUNT(DISTINCT userId) numUsers,
      COUNT(DISTINCT movieId) numMovies,
      COUNT(*) totalRatings
    FROM
      movies.movielens_ratings;
    
    SELECT
      *
    FROM
      movies.movielens_movies_raw
    WHERE
      movieId < 5;
    
    CREATE OR REPLACE TABLE
      movies.movielens_movies AS
    SELECT
      * REPLACE(SPLIT(genres, "|") AS genres)
    FROM
      movies.movielens_movies_raw;
    
## Evaluate Model Collaborative Filtering

    SELECT * FROM ML.EVALUATE(MODEL `cloud-training-prod-bucket.movies.movie_recommender`);

|Row|mean_absolute_error|mean_squared_error|mean_squared_log_error|median_absolute_error|r2_score|explained_variance|
|-|-|-|-|-|-|-|
|1|0.6533554699235755|0.7363615617766038|0.05216607535798224|0.5212922266313722|0.32841175494436314|0.32841472627669144|

## Make Recommendations

    SELECT
      *
    FROM
      ML.PREDICT(MODEL `cloud-training-prod-bucket.movies.movie_recommender`,
        (
        SELECT
          movieId,
          title,
          903 AS userId
        FROM
          `movies.movielens_movies`,
          UNNEST(genres) g
        WHERE
          g = 'Comedy' ))
    ORDER BY
      predicted_rating DESC
    LIMIT
      5;
      
    SELECT
      *
    FROM
      ML.PREDICT(MODEL `cloud-training-prod-bucket.movies.movie_recommender`,
        (
        WITH
          seen AS (
          SELECT
            ARRAY_AGG(movieId) AS movies
          FROM
            movies.movielens_ratings
          WHERE
            userId = 903 )
        SELECT
          movieId,
          title,
          903 AS userId
        FROM
          movies.movielens_movies,
          UNNEST(genres) g,
          seen
        WHERE
          g = 'Comedy'
          AND movieId NOT IN UNNEST(seen.movies) ))
    ORDER BY
      predicted_rating DESC
    LIMIT
    5;

## Apply Customer Targeting

    SELECT
      *
    FROM
      ML.PREDICT(MODEL `cloud-training-prod-bucket.movies.movie_recommender`,
        (
        WITH
          allUsers AS (
          SELECT
            DISTINCT userId
          FROM
            movies.movielens_ratings )
        SELECT
          96481 AS movieId,
          (
          SELECT
            title
          FROM
            movies.movielens_movies
          WHERE
            movieId=96481) title,
          userId
        FROM
          allUsers ))
    ORDER BY
      predicted_rating DESC
    LIMIT
      100;

## Batch Predictions

    SELECT
      *
    FROM
      ML.RECOMMEND(MODEL `cloud-training-prod-bucket.movies.movie_recommender`)
    LIMIT 
      100000;


    

    
