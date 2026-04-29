
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
WHERE kt.kind IN ('movie')
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info_type_id IN ('17',
                  '6')
  AND mi1.info IN ('Mono')
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 5000.0 AND 500000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 3.0 AND 7.0)
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('B6563',
                           'E3632',
                           'F4652',
                           'F6362',
                           'F6532',
                           'G6216',
                           'H6163',
                           'S2534',
                           'V4356',
                           'W4362')
  AND pi1.info_type_id IN ('31')
  AND rt.role IN ('actor',
                   'actress',
                   'producer')
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL);