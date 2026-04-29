
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
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('10',
                    '12',
                    '15',
                    '30',
                    '5',
                    '6',
                    '60',
                    '7',
                    '8',
                    '9',
                    'Argentina:60',
                    'Black and White',
                    'Color')
  AND it1.id IN ('1',
                  '13',
                  '2')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float <= 11.0
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float >= 7.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float >= 1000.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float <= 10000.0
  AND rt.role IN ('actor')
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A6543',
                           'B6352',
                           'D1315',
                           'D2564',
                           'D5456',
                           'E3634',
                           'L2165',
                           'L6524',
                           'M2463',
                           'R5262',
                           'T5232',
                           'T532')
  AND ci.note IS NULL
  AND it5.id IN ('37');