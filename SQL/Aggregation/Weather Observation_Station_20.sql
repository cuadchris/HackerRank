/*
https://www.hackerrank.com/challenges/weather-observation-station-20/problem


A median is defined as a number separating the higher half of a data set from the lower half. Query the median
of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

SELECT TOP 1
CAST(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY LAT_N)
OVER (PARTITION BY NULL) AS DECIMAL(10, 4))
FROM STATION;