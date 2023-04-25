{{
    config(
        materialized='table',
        tags = 'customers',
        schema = 'dbt_example'
    )
}}

select
    id as customer_id,
    first_name,
    last_name
from {{ source('jaffle_shop','customers') }}