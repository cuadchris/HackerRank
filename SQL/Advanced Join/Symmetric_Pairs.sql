--https://www.hackerrank.com/challenges/symmetric-pairs/problem

with row_nums as 
(
    select x, y, row_number() over(order by x, y) as row_num
    from functions f
)

select distinct rn.x, rn.y
from row_nums rn
join row_nums rn2 on rn.x = rn2.y
and rn2.x = rn.y
and rn.row_num <> rn2.row_num
where rn.x <= rn.y
order by x, y