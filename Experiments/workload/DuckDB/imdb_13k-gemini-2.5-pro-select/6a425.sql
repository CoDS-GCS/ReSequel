
SELECT COUNT(*)
FROM
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1875 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode'))) AS t
JOIN
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('18')
     AND info IN ('Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA')) AS mi1 ON t.id = mi1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 1000.0) AS mii1 ON t.id = mii1.movie_id
JOIN
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 3.0 AND 7.0) AS mii2 ON t.id = mii2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A4163',
                           'A5352',
                           'B6161',
                           'B6563',
                           'D1316',
                           'F6521',
                           'F6523',
                           'J3261',
                           'J525',
                           'J5262',
                           'P3616',
                           'R3565')) AS n ON ci.person_id = n.id
JOIN
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('31')) AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'));