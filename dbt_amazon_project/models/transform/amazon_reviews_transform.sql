{{ config(
    materialized='table',
    schema='transform'
) }}

with appliances_data as (
    select *
    from {{ ref('amazon_reviews_raw') }}
    where main_category = 'Appliances'
      and price is not null
),

appliances_data_extracted as (
    select
        main_category,
        title,
         {{ clean_text('title') }} as cleaned_title,
        average_rating,
        description as raw_description,
         {{ clean_text('description') }} as cleaned_description,
        price,
        details
    from appliances_data
    where description is not null and description != '[]'
)

select * from appliances_data_extracted
