{{ config (
    materialized="table"
)}} 





SELECT movieId, title from {{ source('data', 'movies') }}

