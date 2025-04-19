{{
    config(
        materialized='table',
        schema='raw'
    )
}}

-- Transform logic here, selecting from raw.amazon_reviews_raw

SELECT *
FROM raw.amazon_reviews_raw
where price is not null -- Reference the raw model to ensure it is built first