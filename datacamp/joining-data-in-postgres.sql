--In this exercise, you'll need to get the country names and other 2015 data in the economies table and the countries table for Central American countries with an official language.
--
--INSTRUCTIONS
--100XP
--Select unique country names. Also select the total investment and imports fields.
--Use a left join with countries on the left. (An inner join would also work, but please use a left join here.)
--Match on code in the two tables AND use a subquery inside of ON to choose the appropriate languages records.
--Order by country name ascending.
--Use table aliasing but not field aliasing in this exercise.


SELECT DISTINCT name, total_investment, imports
FROM countries
LEFT JOIN economies
ON countries.code = economies.code AND countries.code IN
    (SELECT code FROM languages WHERE official = true)
WHERE region = 'Central America' AND year = 2015
ORDER BY 1;



--Let's ease up a bit and calculate the average fertility rate for each region in 2015.
--
--INSTRUCTIONS
--100XP
--Include the name of region, its continent, and average fertility rate aliased as avg_fert_rate.
--Sort based on avg_fert_rate ascending.
--Remember that you'll need to GROUP BY all fields that aren't included in the aggregate function of SELECT.

-- choose fields
SELECT region, continent, AVG(fertility_rate) AS avg_fert_rate
-- left table
FROM countries
-- right table
INNER JOIN populations
-- join conditions
ON code=country_code
-- specific records matching a condition
WHERE year = 2015
-- aggregated for each what?
GROUP BY region, continent
-- how should we sort?
ORDER BY 3 ASC;



--You are now tasked with determining the top 10 capital cities in Europe and the Americas in terms of a calculated percentage using city_proper_pop and metroarea_pop in cities.
--
--INSTRUCTIONS
--100XP
--Select the city name, country code, city proper population, and metro area population.
--Calculate the percentage of metro area population composed of city proper population for each city in cities, aliased as city_perc.
--Focus only on capital cities in Europe and the Americas in a subquery.
--Make sure to exclude records with missing data on metro area population.
--Order the result by city_perc descending.
--Then determine the top 10 capital cities in Europe and the Americas in terms of this city_perc percentage.
--Do not use table aliasing in this exercise.





SELECT name, country_code, city_proper_pop, metroarea_pop,
      city_proper_pop / metroarea_pop * 100 AS city_perc
FROM cities
WHERE name IN
  (SELECT capital
   FROM countries
   WHERE (continent = 'Europe'
      OR continent LIKE '%America'))
     AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;





