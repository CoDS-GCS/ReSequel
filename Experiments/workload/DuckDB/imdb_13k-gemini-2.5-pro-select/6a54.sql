WITH filtered_t AS
  (SELECT id
   FROM title
   WHERE production_year BETWEEN 1925 AND 1975
     AND kind_id IN
       (SELECT id
        FROM kind_type
        WHERE kind IN ('episode'))),
     filtered_n AS
  (SELECT id
   FROM name
   WHERE gender IN ('f',
                    'm')
     AND name_pcode_nf IN ('A5352',
                           'B6161',
                           'B6563',
                           'D1316',
                           'F6521',
                           'F6523',
                           'F6524',
                           'J3261',
                           'J5216',
                           'J525',
                           'J5262',
                           'P3616',
                           'R1635',
                           'R3565',
                           'W4362')),
     filtered_mi1 AS
  (SELECT movie_id
   FROM movie_info
   WHERE info_type_id IN ('13',
                  '16',
                  '8')
     AND info IN ('UK')),
     filtered_mii1 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 10000.0),
     filtered_mii2 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 3.0 AND 7.0),
     filtered_pi1 AS
  (SELECT person_id
   FROM person_info
   WHERE info_type_id IN ('31'))
SELECT COUNT(*)
FROM cast_info AS ci
JOIN filtered_t t ON ci.movie_id = t.id
JOIN filtered_n n ON ci.person_id = n.id
JOIN aka_name an ON ci.person_id = an.person_id
JOIN filtered_pi1 pi1 ON ci.person_id = pi1.person_id
JOIN filtered_mi1 mi1 ON ci.movie_id = mi1.movie_id
JOIN filtered_mii1 mii1 ON ci.movie_id = mii1.movie_id
JOIN filtered_mii2 mii2 ON ci.movie_id = mii2.movie_id
WHERE ci.note IS NULL
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'));