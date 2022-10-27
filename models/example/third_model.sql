{{ config (
    materialized="table"
)}} 


with firModel as (
select *
from {{ref('my_first_dbt_model')}}
),

secModel as (
select *
from {{ref('second_model')}}
),

final as(

select firModel.movieId, secModel.Rank_No
from firModel
inner join secModel
on firModel.title = secModel.title
)

select * from final
limit 100