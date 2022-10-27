{% macro customised_generic(model, column_name) %}

with validation as (

    select
        {{ column_name }} as pos_field

    from {{ model }}

),

validation_errors as (

    select
        pos_field

    from validation
    
    where (pos_field >= 0)

)

select *
from validation_errors

{% endmacro %}