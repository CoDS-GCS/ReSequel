
SELECT COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON t.kind_id = kt.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 5000.0 AND 500000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 7.0 AND 11.0)
  AND mi1.info_type_id IN ('6')
  AND mi1.info IN ('Dolby Digital',
                    'Mono',
                    'Stereo')
  AND rt.role IN ('actor',
                   'writer')
  AND (ci.note IN ('(writer)')
       OR ci.note IS NULL)
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('C6416',
                           'E6241',
                           'E6245',
                           'J2136',
                           'J6145',
                           'L2125',
                           'M265',
                           'P435',
                           'P45',
                           'R1426',
                           'T25',
                           'T5452')
  AND pi1.info_type_id IN ('22');