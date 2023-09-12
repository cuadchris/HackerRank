--https://www.hackerrank.com/challenges/sql-projects/problem

WITH sd AS (
    SELECT start_date,
        ROW_NUMBER() OVER (
            ORDER BY start_date
        ) AS row_num
    FROM projects
    WHERE start_date NOT IN (
            SELECT end_date
            FROM projects
        )
),
enddates AS (
    SELECT end_date,
        ROW_NUMBER() OVER (
            ORDER BY end_date
        ) AS row_num
    FROM projects
    WHERE end_date NOT IN (
            SELECT start_date
            FROM projects
        )
),
start_end_diff as (
    select sd.start_date,
        ed.end_date,
        datediff(day, sd.start_date, ed.end_date) as diff
    from sd
        join enddates ed on ed.row_num = sd.row_num
)
select start_date,
    end_date
from start_end_diff
order by diff,
    start_date