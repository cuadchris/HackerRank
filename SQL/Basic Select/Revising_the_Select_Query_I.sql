--https://www.hackerrank.com/challenges/revising-the-select-query/problem

SELECT *
from CITY
WHERE POPULATION > 100000
    AND COUNTRYCODE = 'USA';