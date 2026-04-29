
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('100',
                    '16',
                    '18',
                    '22',
                    '23',
                    '24',
                    '45',
                    '75',
                    '80',
                    '85',
                    '92',
                    '95',
                    'USA:30')
  AND it1.id IN ('1')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 8.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float >= 0.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float >= 0.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 1000.0
  AND rt.role IN ('actor',
                   'actress')
  AND n.gender IN ('f',
                    'm')
  AND n.name_pcode_nf IN ('A5351',
                           'A5354',
                           'C6416',
                           'C6432',
                           'F6325',
                           'I5263',
                           'J5325',
                           'J62',
                           'M6243',
                           'O4162',
                           'R2635',
                           'S3162')
  AND ci.note IS NULL
  AND it5.id IN ('25');