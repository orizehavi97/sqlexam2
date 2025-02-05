-- In most queries I could have chosen which fields to display but I chose to prioritize readability

-- a
SELECT * FROM tourists t INNER JOIN countries c on t.country_id=c.id

-- b
SELECT * FROM tourists t1 INNER JOIN tours t2 on t1.tour_id=t2.id

-- c
SELECT * FROM tourists t1 LEFT JOIN tours t2 on t1.tour_id=t2.id

-- d
SELECT * FROM tourists t1 FULL JOIN tours t2 on t1.tour_id=t2.id

-- e
SELECT t1.* FROM tourists t1 LEFT JOIN tours t2 on t1.tour_id=t2.id WHERE t2.id is NULL -- both ways work
SELECT * FROM tourists WHERE tour_id is NULL -- both ways work

DELETE FROM tourists
WHERE id IS 3;

-- f
SELECT t1.* FROM tours t1 LEFT JOIN tourists t2 on t2.tour_id=t1.id WHERE t2.tour_id is NULL

UPDATE tours SET end_date = DATE(end_date, '+1 year') WHERE id IN (SELECT t1.id FROM tours t1 LEFT JOIN tourists t2 on t2.tour_id=t1.id WHERE t2.tour_id is NULL);

-- g
SELECT count(*) AS empty_tours FROM tours t1 LEFT JOIN tourists t2 on t2.tour_id=t1.id WHERE t2.tour_id is NULL

-- h
SELECT * FROM tourists t1 CROSS JOIN tours t2


