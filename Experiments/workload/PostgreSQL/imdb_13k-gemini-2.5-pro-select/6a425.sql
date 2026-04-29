
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode')
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Desilu Studios - 9336 W. Washington Blvd., Culver City, California, USA')
  AND mi1.info_type_id IN ('18')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 7.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float >= 3.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float >= 0.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 1000.0
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4163',
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
                           'R3565')
  AND ci.note IS NULL
  AND rt.role IN ('actor',
                   'actress')
  AND pi1.info_type_id IN ('31');