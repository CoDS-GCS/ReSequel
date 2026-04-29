
SELECT COUNT(*)
FROM name AS n
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
JOIN cast_info AS ci ON n.id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('8')
  AND mi1.info IN ('Belgium',
                    'Finland',
                    'Hong Kong',
                    'Ireland',
                    'Portugal',
                    'South Korea',
                    'Soviet Union')
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 0.0 AND 8.0)
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A3651',
                           'A4216',
                           'C6231',
                           'D5242',
                           'E3636',
                           'E6214',
                           'G4652',
                           'J5231',
                           'J6145',
                           'J6262',
                           'S524',
                           'S5265')
  AND pi1.info_type_id IN ('19')
  AND rt.role IN ('actor',
                   'writer')
  AND (ci.note IN ('(voice)',
                   '(writer)')
       OR ci.note IS NULL);