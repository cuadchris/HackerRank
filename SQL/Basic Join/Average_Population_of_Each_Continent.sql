--https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

select continent,
    floor(avg(city.population))
from country
    join city on countrycode = code
group by continent