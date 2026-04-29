
SELECT COUNT(*)
FROM title AS t
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN aka_name AS an ON n.id = an.person_id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
JOIN role_type AS rt ON ci.role_id = rt.id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1925 AND 2015
  AND mi1.info IN ('Action',
                    'Animation',
                    'Comedy',
                    'Crime',
                    'Drama',
                    'Family',
                    'Horror')
  AND it1.id IN ('102',
                  '11',
                  '3')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 7.0 AND 11.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 0.0 AND 10000.0
  AND n.gender IN ('m')
  AND (n.name_pcode_nf IN ('B6216',
                           'B6341',
                           'C6424',
                           'E3635',
                           'F4241',
                           'J253',
                           'J5232',
                           'J5261',
                           'J5351',
                           'K52',
                           'L216',
                           'R2634',
                           'R5352',
                           'S5362')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(head writer)',
                   '(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'writer')
  AND it5.id IN ('19');