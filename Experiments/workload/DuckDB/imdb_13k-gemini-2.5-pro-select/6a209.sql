WITH filtered_persons AS
  (SELECT n.id AS person_id
   FROM name AS n
   JOIN aka_name AS an ON n.id = an.person_id
   JOIN person_info AS pi1 ON n.id = pi1.person_id
   WHERE (n.gender IN ('m')
          OR n.gender IS NULL)
     AND n.name_pcode_nf IN ('A4163',
                           'A4236',
                           'D5234',
                           'G6256',
                           'J1626',
                           'J2165',
                           'J23',
                           'M2463',
                           'M6232',
                           'M6261',
                           'M6262',
                           'O4161',
                           'T6235')
     AND pi1.info_type_id IN ('34'))
SELECT COUNT(*)
FROM filtered_persons AS fp
JOIN cast_info AS ci ON fp.person_id = ci.person_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN title AS t ON ci.movie_id = t.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
WHERE (ci.note IN ('(voice)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor')
  AND kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info_type_id IN ('18',
                  '6',
                  '97')
  AND mi1.info IN ('Dolby Digital',
                    'Dolby SR',
                    'Dolby',
                    'Los Angeles, California, USA',
                    'New York City, New York, USA',
                    'Stereo')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 1000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0;