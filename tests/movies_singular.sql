


select
    
    sum(movieId) as posID
from {{ ref('third_model' )}}

having not(posID >= 0)



