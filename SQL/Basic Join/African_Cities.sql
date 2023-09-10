--https://www.hackerrank.com/challenges/african-cities/problem

select city.name
from city
    join country on countrycode = code
where continent = 'Africa'