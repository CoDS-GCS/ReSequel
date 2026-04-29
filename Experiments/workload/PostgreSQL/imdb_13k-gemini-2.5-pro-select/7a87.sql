
SELECT COUNT(*)
FROM title AS t
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_keyword AS mk ON t.id = mk.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE t.kind_id IN
    (SELECT id
     FROM kind_type
     WHERE kind IN ('episode',
                   'movie'))
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info_type_id IN ('11',
                  '4')
  AND mi1.info IN ('Dutch',
                    'English',
                    'French',
                    'German',
                    'Italian',
                    'Japanese',
                    'Portuguese',
                    'Russian',
                    'Spanish')
  AND mii1.info_type_id = '100'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii1.info::float BETWEEN 5000.0 AND 500000.0
  AND mii2.info_type_id = '101'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
  AND mii2.info::float BETWEEN 3.0 AND 7.0
  AND ci.role_id IN
    (SELECT id
     FROM role_type
     WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer'))
  AND (ci.note IN ('(executive producer)',
                   '(overall in charge of promotion)',
                   '(producer)',
                   '(supervising producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND (n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'C5321',
                           'C6231',
                           'C6235',
                           'J6362',
                           'R1634',
                           'R5316',
                           'S3152')
       OR n.name_pcode_nf IS NULL)
  AND pi1.info_type_id IN ('25');