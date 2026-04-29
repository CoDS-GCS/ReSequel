
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
WHERE kt.kind IN ('movie')
  AND t.production_year BETWEEN 1875 AND 1975
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 0.0 AND 4.0)
  AND mi1.info_type_id IN ('5')
  AND mi1.info IN ('Finland:K-16',
                    'USA:Approved',
                    'USA:Passed')
  AND rt.role IN ('actor',
                   'actress',
                   'producer')
  AND (ci.note IN ('(producer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A6362',
                           'B6563',
                           'C6426',
                           'E4213',
                           'F6362',
                           'F6523',
                           'F6524',
                           'F6526',
                           'G6216',
                           'R2632',
                           'S2534',
                           'V4356')
  AND pi1.info_type_id IN ('19');