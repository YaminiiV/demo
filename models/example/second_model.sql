{{ config (
    materialized="table"
)}} 


with a as (
select *
from {{ref('my_first_dbt_model')}}
),



b as (
select * from {{ref('movie')}}
),


final as(

select a.title , b.genres,
RANK () OVER (ORDER BY a.title) AS Rank_No 
from a
inner join b                                                                                                                                                                                               
on a.title = b.title
group by title

)

select * from final
