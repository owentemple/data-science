--QUERY PROJECT

SELECT DISTINCT year FROM movies;


SELECT DISTINCT year FROM movies ORDER BY year;

SELECT * FROM movies WHERE genre = 'drama';

SELECT * FROM movies WHERE name LIKE "%bride%";

SELECT * FROM movies WHERE year BETWEEN 2000 AND 2015;

SELECT * FROM movies WHERE year = 1995 OR imdb_rating = 9.0;

SELECT name, imdb_rating FROM movies WHERE year > 2009 ORDER BY name;

SELECT name, imdb_rating FROM movies WHERE imdb_rating = 7.0 LIMIT 3;

SELECT name, imdb_rating FROM movies WHERE imdb_rating > 6.0 AND genre = "comedy" AND year > 1995 ORDER BY imdb_rating DESC LIMIT 10;

SELECT name FROM movies WHERE name = "Cast Away";

SELECT name FROM movies WHERE imdb_rating <> 7.0;

SELECT name FROM movies WHERE genre = 'horror' AND imdb_rating < 6.0;

SELECT * FROM movies WHERE imdb_rating > 8.0 ORDER BY genre LIMIT 10;

SELECT * FROM movies WHERE name LIKE '%King%';

SELECT * FROM movies WHERE name LIKE '%Out';

SELECT * FROM movies WHERE name LIKE 'The%' ORDER BY imdb_rating DESC;

SELECT * FROM movies;

SELECT id, name FROM movies WHERE id > 125;

SELECT * FROM movies WHERE name LIKE 'X-Men%';

SELECT * FROM movies ORDER BY name DESC LIMIT 10;

SELECT id,name,genre FROM movies WHERE genre LIKE 'romance';

SELECT * FROM movies WHERE name LIKE '%Twilight%' ORDER BY year DESC;

SELECT * FROM movies WHERE genre LIKE 'comedy' AND year = 2012;

