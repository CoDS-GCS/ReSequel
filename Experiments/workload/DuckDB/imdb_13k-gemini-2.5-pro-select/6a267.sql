
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN info_type AS it3 ON mii1.info_type_id = it3.id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN info_type AS it4 ON mii2.info_type_id = it4.id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year <= 1990
  AND t.production_year >= 1950
  AND mi1.info IN ('New York City, New York, USA',
                    'Paramount Studios - 5555 Melrose Avenue, Hollywood, Los Angeles, California, USA')
  AND it1.id IN ('18',
                  '98')
  AND it3.id = '100'
  AND it4.id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 4.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 0.0 <= mii2.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND 0.0 <= mii1.info::float
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 1000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND (n.name_pcode_nf IN ('A5351',
                           'A5352',
                           'C6231',
                           'C6421',
                           'J5253',
                           'M2426',
                           'P3616',
                           'R1632',
                           'R1634',
                           'S3152',
                           'V4356')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(producer)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'composer',
                   'producer')
  AND it5.id IN ('26');