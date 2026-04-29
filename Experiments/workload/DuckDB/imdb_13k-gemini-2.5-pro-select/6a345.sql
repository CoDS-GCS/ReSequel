
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
WHERE kt.kind IN ('movie')
  AND t.production_year BETWEEN 1925 AND 1975
  AND mi1.info IN ('Black and White',
                    'Color',
                    'OFM:35 mm',
                    'PFM:35 mm')
  AND it1.id IN ('2',
                  '7',
                  '9')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 0.0 AND 8.0
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND n.gender IN ('f',
                    'm')
  AND (n.name_pcode_nf IN ('A4163',
                           'A4253',
                           'A5352',
                           'A5362',
                           'E6523',
                           'F6521',
                           'F6525',
                           'R1632')
       OR n.name_pcode_nf IS NULL)
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND rt.role IN ('actor',
                   'actress')
  AND it5.id IN ('19');