
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
       AND mii2.info::float BETWEEN 0.0 AND 8.0)
  AND mi1.info_type_id IN ('2',
                  '5',
                  '90')
  AND mi1.info IN ('Argentina:16',
                    'Australia:MA',
                    'Canada:PG',
                    'France:U',
                    'Germany:12',
                    'Germany:16',
                    'Iceland:16',
                    'Iceland:L',
                    'India:U',
                    'Netherlands:16',
                    'Netherlands:AL',
                    'South Korea:15',
                    'Sweden:Btl',
                    'UK:U',
                    'USA:PG',
                    'USA:PG-13',
                    'USA:TV-PG',
                    'USA:X',
                    'West Germany:12',
                    'West Germany:16')
  AND rt.role IN ('actor',
                   'director',
                   'producer')
  AND (ci.note IN ('(executive producer)',
                   '(voice)')
       OR ci.note IS NULL)
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('B6352',
                           'B6545',
                           'C6242',
                           'D2425',
                           'E3261',
                           'E5626',
                           'J2325',
                           'J5352',
                           'R1425',
                           'R2632')
  AND pi1.info_type_id IN ('32');