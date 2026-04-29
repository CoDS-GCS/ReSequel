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
   WHERE (gender IN ('f',
                    'm')
          OR gender IS NULL)
     AND name_pcode_nf IN ('A4163',
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
     filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info
   WHERE note IS NULL
     AND role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('actor',
                   'actress'))),
     filtered_mii1 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '100'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 0.0 AND 1000.0),
     filtered_mii2 AS
  (SELECT movie_id
   FROM movie_info_idx
   WHERE info_type_id = '101'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND info::float BETWEEN 2.0 AND 5.0)
SELECT COUNT(*)
FROM filtered_t t
JOIN filtered_ci ci ON t.id = ci.movie_id
JOIN filtered_n n ON ci.person_id = n.id
JOIN filtered_mii1 mii1 ON t.id = mii1.movie_id
JOIN filtered_mii2 mii2 ON t.id = mii2.movie_id
JOIN movie_info mi1 ON t.id = mi1.movie_id
JOIN person_info pi1 ON n.id = pi1.person_id
JOIN aka_name an ON n.id = an.person_id
WHERE mi1.info_type_id IN ('103',
                  '8',
                  '94')
  AND mi1.info IN ('UK')
  AND pi1.info_type_id IN ('25');