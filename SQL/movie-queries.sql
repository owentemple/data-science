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


--AGGREGATE PROJECT

SELECT COUNT(*) FROM fake_apps;

SELECT name, category, price, MAX(downloads) FROM fake_apps;

SELECT category, COUNT(*) FROM fake_apps GROUP BY category;

SELECT name, category, MAX(downloads) FROM fake_apps;

SELECT name, category, MIN(downloads) FROM fake_apps;

SELECT category, ROUND(AVG(price),0) FROM fake_apps GROUP BY category;

SELECT category, ROUND(AVG(price),2) FROM fake_apps GROUP BY category;

SELECT name, MAX(price) FROM fake_apps;

SELECT name, MIN(downloads) FROM fake_apps;

SELECT SUM(downloads) FROM fake_apps WHERE category LIKE 'games';

SELECT COUNT(*) FROM fake_apps WHERE price = 0;

SELECT COUNT(*) FROM fake_apps WHERE price = 14.99;

SELECT SUM(downloads) FROM fake_apps WHERE category LIKE 'music';

SELECT SUM(downloads) FROM fake_apps WHERE category LIKE 'business';

SELECT category, COUNT(*) FROM fake_apps GROUP BY category;

SELECT price, AVG(downloads) FROM fake_apps GROUP BY price;

SELECT price, ROUND(AVG(downloads),0) FROM fake_apps GROUP BY price;

SELECT name, category, MAX(price) FROM fake_apps GROUP BY category;

SELECT COUNT(*) FROM fake_apps WHERE name LIKE 'A%';

SELECT category, SUM(downloads) FROM fake_apps WHERE category LIKE '%sports%' OR '%health%';

SELECT SUM(downloads) FROM fake_apps WHERE category IN ('Sports','Health & Fitness');



