
SELECT COUNT(*)
FROM movie_info_idx AS mii1
JOIN movie_info_idx AS mii2 ON mii1.movie_id = mii2.movie_id
JOIN title AS t ON mii1.movie_id = t.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 7.0 AND 11.0)
  AND t.production_year BETWEEN 1925 AND 1975
  AND t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('movie'))
  AND mi1.info_type_id IN ('3')
  AND mi1.info IN ('Action',
                    'Adventure',
                    'Family',
                    'Musical',
                    'Thriller',
                    'War')
  AND (ci.note IN ('(uncredited)')
       OR ci.note IS NULL)
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('actor',
                   'actress'))
  AND n.gender IN ('f',
                    'm')
  AND (n.name_pcode_nf IN ('A4163',
                           'A4253',
                           'A5362',
                           'E6523',
                           'F6525',
                           'R1632')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('37');