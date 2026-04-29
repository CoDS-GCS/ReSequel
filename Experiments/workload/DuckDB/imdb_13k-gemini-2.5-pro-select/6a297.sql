
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
WHERE kt.kind IN ('movie')
  AND t.production_year BETWEEN 1875 AND 1975
  AND mi1.info IN ('Comedy',
                    'Crime',
                    'Documentary',
                    'Drama',
                    'Romance',
                    'Short',
                    'Western')
  AND it1.id IN ('13',
                  '3')
  AND it3.id = '100'
  AND it4.id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 1000.0 AND 10000.0
  AND (n.gender IN ('m')
       OR n.gender IS NULL)
  AND n.name_pcode_nf IN ('A4253',
                           'A5352',
                           'A5362',
                           'C6423',
                           'C6424',
                           'C6425',
                           'C6426',
                           'E6523',
                           'F6524',
                           'F6525',
                           'R1632')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor')
  AND it5.id IN ('22');