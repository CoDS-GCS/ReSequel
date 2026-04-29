WITH base_movies AS
  (SELECT mii1.movie_id
   FROM movie_info_idx AS mii1
   JOIN movie_info_idx AS mii2 ON mii1.movie_id = mii2.movie_id
   WHERE mii1.info_type_id = '100'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii1.info::float BETWEEN 0.0 AND 1000.0
     AND mii2.info_type_id = '101'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
     AND mii2.info::float BETWEEN 7.0 AND 11.0)
SELECT COUNT(*)
FROM base_movies AS bm
JOIN title AS t ON bm.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('2',
                  '8')
  AND mi1.info IN ('Belgium',
                    'Denmark',
                    'Greece',
                    'Hong Kong',
                    'Ireland',
                    'Netherlands',
                    'Philippines',
                    'Portugal',
                    'South Korea',
                    'Soviet Union',
                    'Sweden',
                    'West Germany')
  AND (ci.note IN ('(production assistant)')
       OR ci.note IS NULL)
  AND rt.role IN ('actress',
                   'costume designer',
                   'miscellaneous crew')
  AND (n.gender IN ('f')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A5236',
                           'A5352',
                           'B6163',
                           'C6235',
                           'C6456',
                           'H4521',
                           'J5245',
                           'S1524',
                           'S2516',
                           'S5362')
  AND pi1.info_type_id IN ('22');