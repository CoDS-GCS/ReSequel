
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
AND kt.kind IN ('episode',
                   'movie')
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
AND mi1.info_type_id IN ('4')
AND mi1.info IN ('Arabic',
                    'Cantonese',
                    'Filipino',
                    'Greek',
                    'Korean',
                    'Malayalam',
                    'Mandarin',
                    'Swedish',
                    'Tagalog',
                    'Turkish')
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
AND mii1.info_type_id = '100'
AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
AND mii1.info::float BETWEEN 5000.0 AND 500000.0
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
AND mii2.info_type_id = '101'
AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
AND mii2.info::float BETWEEN 0.0 AND 8.0
JOIN cast_info AS ci ON t.id = ci.movie_id
AND (ci.note IN ('(executive producer)')
     OR ci.note IS NULL)
JOIN role_type AS rt ON ci.role_id = rt.id
AND rt.role IN ('actor',
                   'actress',
                   'producer')
JOIN name AS n ON ci.person_id = n.id
AND (n.gender IN ('f',
                    'm')
     OR n.gender IS NULL)
AND n.name_pcode_nf IN ('A5136',
                           'A5235',
                           'C6426',
                           'D252',
                           'G4652',
                           'J2124',
                           'J5153',
                           'M25',
                           'M26',
                           'M5412',
                           'P435',
                           'R2635',
                           'S3153')
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
AND pi1.info_type_id IN ('22')
WHERE t.production_year BETWEEN 1975 AND 2015;