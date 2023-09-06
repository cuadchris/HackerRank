https://www.hackerrank.com/challenges/the-report/problem

select case
        when grade >= 8 then name
        else NULL
    end,
    grade,
    marks
from students
    join grades on marks between min_mark and max_mark
order by grade desc,
    name