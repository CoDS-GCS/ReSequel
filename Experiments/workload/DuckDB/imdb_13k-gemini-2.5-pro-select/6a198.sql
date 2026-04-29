
SELECT COUNT(*)
FROM cast_info AS ci
JOIN title AS t ON ci.movie_id = t.id
JOIN name AS n ON ci.person_id = n.id
JOIN kind_type AS kt ON t.kind_id = kt.id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN info_type AS it1 ON mi1.info_type_id = it1.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN info_type AS it5 ON pi1.info_type_id = it5.id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mi1.info IN ('Adventure',
                    'Fantasy',
                    'History',
                    'Music',
                    'Musical',
                    'Sci-Fi',
                    'Sport',
                    'War')
  AND it1.id IN ('104',
                  '3',
                  '97')
  AND mii1.info_type_id = '100'
  AND mii2.info_type_id = '101'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 1000.0)
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 2.0 AND 5.0)
  AND rt.role IN ('cinematographer',
                   'director',
                   'editor',
                   'miscellaneous crew',
                   'producer',
                   'writer')
  AND (ci.note IN ('(deviser)',
                   '(overall in charge of promotion)',
                   '(producer)',
                   '(production assistant)',
                   '(senior producer)',
                   '(supervising producer)',
                   '(writer)')
       OR ci.note IS NULL)
  AND n.gender IS NULL
  AND n.name_pcode_nf IN ('A4253',
                           'A5362',
                           'A6532',
                           'C6231',
                           'C6235',
                           'J6362',
                           'R1634',
                           'R516',
                           'R5316',
                           'S3152')
  AND it5.id IN ('22');