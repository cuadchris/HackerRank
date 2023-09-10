--https: / / www.hackerrank.com / challenges / asian - population / problem

SELECT SUM(city.population)
FROM city
    JOIN country ON countrycode = code
WHERE continent = 'Asia'