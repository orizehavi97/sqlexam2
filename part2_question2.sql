-- a
SELECT genre, count(*) FROM movies GROUP BY genre

-- b
SELECT year, sum(revenue) FROM movies GROUP BY year

-- c
SELECT genre, avg(revenue) FROM movies GROUP BY genre

-- d
SELECT language, genre, avg(revenue) FROM movies GROUP BY language, genre

-- e
SELECT language, count(movie_name) AS movie_count FROM movies GROUP BY language ORDER BY movie_count ASC LIMIT 1

-- f
SELECT country, count(movie_name) AS movie_count FROM movies GROUP BY country ORDER BY movie_count DESC LIMIT 1

-- g
SELECT genre, COUNT(*) AS movie_count FROM movies GROUP BY genre HAVING movie_count >= 2

-- h
SELECT year, sum(revenue) AS year_revenue FROM movies GROUP BY year HAVING year_revenue > 1000

-- i
SELECT language, COUNT(*) AS movie_count FROM movies GROUP BY language HAVING movie_count >= 3

