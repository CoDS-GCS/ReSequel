
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
  AND t.production_year BETWEEN 1950 AND 1990
  AND mi1.info_type_id IN ('18',
                  '9')
  AND mi1.info IN ('New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 7.0 AND 11.0)
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A4236',
                           'A4253',
                           'A5361',
                           'B6165',
                           'F6524',
                           'J5163',
                           'J5214',
                           'M6216',
                           'S3541',
                           'V2362')
  AND pi1.info_type_id IN ('22')
  AND rt.role IN ('actor',
                   'actress')
  AND (ci.note IN ('(voice)')
       OR ci.note IS NULL);