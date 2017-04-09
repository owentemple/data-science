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


-- JOIN

CREATE TABLE tracks (id INTEGER PRIMARY KEY, title TEXT, album_id INTEGER);

INSERT INTO tracks VALUES (1, 'Smooth Criminal', 8);

INSERT INTO tracks VALUES (2, 'Blue Christmas', 7);

SELECT * FROM tracks;

SELECT * FROM albums;

--Combine the albums and tracks tables using an INNER JOIN. Order the query by album_id.

SELECT * FROM albums
INNER JOIN tracks
ON tracks.album_id=albums.id
ORDER BY tracks.album_id;

--Combine the albums and artists table using a LEFT OUTER JOIN. Let albums be the left table.

SELECT * FROM albums
LEFT OUTER JOIN artists
ON albums.artist_id=artists.id;

--Combine the albums and artists table using a LEFT OUTER JOIN. Let artists be the left table.

SELECT * FROM artists
LEFT OUTER JOIN albums
ON albums.artist_id=artists.id;

--Use any join you like to combine the albums and tracks table. Rename the album_id column to Albums.

SELECT albums.id, albums.name, tracks.album_id AS Albums FROM tracks
INNER JOIN albums
ON albums.artist_id=tracks.album_id;

