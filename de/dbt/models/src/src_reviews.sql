with raw_reviews as (
    select * from {{source('airbnb','reviews')}}--AIRBNB.RAW.RAW_REVIEWS
)

select
    listing_id,
    date as review_date,
    reviewer_name,
    comments as review_text,
    sentiment as review_seniment
from
    raw_reviews