--https://www.hackerrank.com/challenges/placements/problem

/*
STUDENTS -> id, name
FRIENDS -> id, friend_id
PACKAGES -> id, salary

OUTPUT:
student_whose_best_friend_higher
order by friend_higher_salary
*/

with student_and_their_salary as 
(
    select s.id, name, salary
    from students s
    join packages p on s.id = p.id
)

select ss.name
from student_and_their_salary ss
join friends f on f.id = ss.id
join student_and_their_salary ss2 on ss2.id = f.friend_id
where ss2.salary > ss.salary
order by ss2.salary