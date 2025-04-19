{{
    config(
        materialized='table',
        schema='consumption'
    )
}}

-- Transform logic here, selecting from raw.amazon_reviews_raw

SELECT *
FROM {{ref('amazon_reviews_transform')}} 