
SELECT COUNT(*)
FROM kind_type AS kt
JOIN title AS t ON t.kind_id = kt.id
JOIN movie_info_idx AS mii1 ON t.id = mii1.movie_id
JOIN movie_info_idx AS mii2 ON t.id = mii2.movie_id
JOIN movie_info AS mi1 ON t.id = mi1.movie_id
JOIN cast_info AS ci ON t.id = ci.movie_id
JOIN role_type AS rt ON ci.role_id = rt.id
JOIN name AS n ON ci.person_id = n.id
JOIN person_info AS pi1 ON n.id = pi1.person_id
JOIN aka_name AS an ON n.id = an.person_id
WHERE kt.kind IN ('episode',
                   'movie')
  AND t.production_year BETWEEN 1975 AND 2015
  AND mii1.info_type_id = '100'
  AND (mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii1.info::float BETWEEN 0.0 AND 10000.0)
  AND mii2.info_type_id = '101'
  AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$'
       AND mii2.info::float BETWEEN 3.0 AND 7.0)
  AND mi1.info_type_id IN ('110',
                  '12',
                  '4')
  AND mi1.info IN ('Dutch',
                    'English',
                    'French',
                    'Hindi',
                    'Italian',
                    'Portuguese',
                    'Russian')
  AND rt.role IN ('actor',
                   'producer')
  AND (ci.note IN ('(executive producer)',
                   '(producer)')
       OR ci.note IS NULL)
  AND n.gender IN ('m')
  AND n.name_pcode_nf IN ('A2351',
                           'B6512',
                           'B6534',
                           'D5162',
                           'E6236',
                           'I2315',
                           'L6521',
                           'M24',
                           'P4252',
                           'R1632',
                           'S2325')
  AND pi1.info_type_id IN ('26');