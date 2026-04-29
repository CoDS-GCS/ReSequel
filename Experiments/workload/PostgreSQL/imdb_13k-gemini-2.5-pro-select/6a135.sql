WITH filtered_ci AS
  (SELECT movie_id,
          person_id
   FROM cast_info AS ci
   WHERE (ci.note IN ('(deviser)',
                   '(executive producer)',
                   '(overall in charge of promotion)',
                   '(producer)',
                   '(production assistant)')
          OR ci.note IS NULL)
     AND ci.role_id IN
       (SELECT id
        FROM role_type
        WHERE ROLE IN ('cinematographer',
                   'composer',
                   'director',
                   'miscellaneous crew',
                   'producer',
                   'writer')))
SELECT COUNT(*)
FROM filtered_ci
JOIN title AS t ON filtered_ci.movie_id = t.id
JOIN name AS n ON filtered_ci.person_id = n.id
WHERE t.production_year BETWEEN 1975 AND 2015
  AND n.gender IS NULL
  AND (n.name_pcode_nf IN ('A5362',
                           'A6532',
                           'C5321',
                           'C6235',
                           'J6362',
                           'M6216',
                           'R1634')
       OR n.name_pcode_nf IS NULL)
  AND EXISTS
    (SELECT 1
     FROM kind_type AS kt
     WHERE kt.id = t.kind_id
       AND kt.kind IN ('episode',
                   'movie'))
  AND EXISTS
    (SELECT 1
     FROM aka_name AS an
     WHERE an.person_id = n.id)
  AND EXISTS
    (SELECT 1
     FROM person_info AS pi1
     WHERE pi1.person_id = n.id
       AND pi1.info_type_id IN ('22'))
  AND EXISTS
    (SELECT 1
     FROM movie_info AS mi1
     WHERE mi1.movie_id = t.id
       AND mi1.info_type_id IN ('1',
                  '108')
       AND mi1.info IN ('100',
                    '11',
                    '13',
                    '14',
                    '16',
                    '17',
                    '22',
                    '3',
                    '45',
                    '95',
                    'USA:30'))
  AND EXISTS
    (SELECT 1
     FROM movie_info_idx AS mii1
     WHERE mii1.movie_id = t.id
       AND mii1.info_type_id = '100'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 10000.0)
  AND EXISTS
    (SELECT 1
     FROM movie_info_idx AS mii2
     WHERE mii2.movie_id = t.id
       AND mii2.info_type_id = '101'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 3.0 AND 7.0);